import importlib.util
import json
import hashlib
from unittest.mock import patch
from pathlib import Path
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('installer', ROOT / 'scripts/install.py')
installer = importlib.util.module_from_spec(spec)
spec.loader.exec_module(installer)

class InstallTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.source = self.root / 'source'
        for name in ['ac-one', 'ac-two']:
            folder = self.source / name
            folder.mkdir(parents=True)
            (folder / 'SKILL.md').write_text(f'---\nname: {name}\ndescription: Test skill\n---\n# Test\n')
            (folder / 'reference.txt').write_text('keep all resources')
        self.dest = self.root / 'dest'

    def test_install_and_repeat(self):
        installer.install(self.source, self.dest)
        before = installer.fingerprint(self.dest)
        installer.install(self.source, self.dest)
        self.assertEqual(before, installer.fingerprint(self.dest))
        self.assertEqual((self.dest / 'ac-one/reference.txt').read_text(), 'keep all resources')

    def test_conflict_preflight_no_partial_install(self):
        self.dest.mkdir()
        existing = self.dest / 'ac-two'
        existing.mkdir()
        (existing / 'SKILL.md').write_text('personalized')
        with self.assertRaises(ValueError):
            installer.install(self.source, self.dest)
        self.assertFalse((self.dest / 'ac-one').exists())
        self.assertEqual((existing / 'SKILL.md').read_text(), 'personalized')

    def test_reject_symlink(self):
        (self.source / 'ac-one/link').symlink_to(self.root)
        with self.assertRaises(ValueError):
            installer.install(self.source, self.dest)
        self.assertFalse(self.dest.exists())

    def test_reject_traversal_zip(self):
        archive = self.root / 'bad.zip'
        with zipfile.ZipFile(archive, 'w') as z:
            z.writestr('../escape', 'bad')
        with self.assertRaises(ValueError):
            installer.extract(archive, self.root / 'unpacked')
        self.assertFalse((self.root / 'escape').exists())

    def test_existing_legacy_root_is_reused(self):
        legacy = self.root / '.codex/skills'
        (legacy / 'ac-one').mkdir(parents=True)
        self.assertEqual(installer.choose_destination(self.source, self.root, legacy), legacy)

    def test_two_existing_roots_are_not_duplicated(self):
        legacy = self.root / '.codex/skills'
        (legacy / 'ac-one').mkdir(parents=True)
        (self.root / '.agents/skills/ac-two').mkdir(parents=True)
        with self.assertRaises(ValueError):
            installer.choose_destination(self.source, self.root, legacy)

    def test_release_checksum_rejected_before_install(self):
        url = f'https://github.com/{installer.REPO}/releases/download/v1/'
        release = json.dumps({'tag_name': 'v1', 'assets': [
            {'name': name, 'browser_download_url': url + name}
            for name in [installer.ASSET, 'SHA256SUMS.txt']]}).encode()
        with patch.object(installer, 'fetch', side_effect=[release, b'wrong  academia-skills-contabeis.zip', b'changed']):
            with self.assertRaises(ValueError):
                installer.download_release(self.root)
        self.assertFalse((self.root / installer.ASSET).exists())

    def test_release_download_pins_checksum_and_zip(self):
        url = f'https://github.com/{installer.REPO}/releases/download/v1/'
        data = b'fixture'
        release = json.dumps({'tag_name': 'v1', 'assets': [
            {'name': name, 'browser_download_url': url + name}
            for name in [installer.ASSET, 'SHA256SUMS.txt']]}).encode()
        checks = (hashlib.sha256(data).hexdigest() + '  ' + installer.ASSET).encode()
        with patch.object(installer, 'fetch', side_effect=[release, checks, data]) as fetch:
            path, tag = installer.download_release(self.root)
            self.assertEqual(path.read_bytes(), data)
            self.assertEqual(tag, 'v1')
            self.assertEqual(fetch.call_args_list[1].args[0], url + 'SHA256SUMS.txt')
            self.assertEqual(fetch.call_args_list[2].args[0], url + installer.ASSET)

    def test_marketplace_resolves_plugin(self):
        m = json.loads((ROOT / '.claude-plugin/marketplace.json').read_text())
        p = ROOT / m['plugins'][0]['source'] / '.claude-plugin/plugin.json'
        self.assertEqual(json.loads(p.read_text())['name'], m['plugins'][0]['name'])

if __name__ == '__main__':
    unittest.main()
