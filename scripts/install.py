#!/usr/bin/env python3
"""Install published Academia skills for the local Codex user. Python 3.9+, no dependencies."""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import sys
import tempfile
from urllib.request import Request, urlopen
import zipfile

REPO = 'Academia-de-Contadores/ac-kit-skills-claude'
ASSET = 'academia-skills-contabeis.zip'


def fingerprint(folder):
    result = {}
    for p in sorted(folder.rglob('*')):
        if p.is_symlink():
            raise ValueError(f'Link simbólico não permitido: {p}')
        if p.is_file():
            result[p.relative_to(folder).as_posix()] = hashlib.sha256(p.read_bytes()).hexdigest()
    return result


def extract(archive, destination):
    with zipfile.ZipFile(archive) as z:
        if sum(i.file_size for i in z.infolist()) > 100 * 1024 * 1024:
            raise ValueError('Pacote excede 100 MB descompactados.')
        for i in z.infolist():
            p = PurePosixPath(i.filename)
            if p.is_absolute() or '..' in p.parts or '\\' in i.filename or ':' in i.filename or stat.S_ISLNK(i.external_attr >> 16):
                raise ValueError(f'Caminho inválido no ZIP: {i.filename}')
        z.extractall(destination)


def install(source, destination):
    source, destination = Path(source), Path(destination)
    if source.is_symlink() or destination.is_symlink():
        raise ValueError('A origem e o destino não podem ser links simbólicos.')
    destination = destination.resolve()
    folders = sorted(source.iterdir())
    if not folders:
        raise ValueError('Nenhuma skill encontrada.')
    pending, expected = [], {}
    # Validate every source and conflict before writing anything.
    for folder in folders:
        if folder.is_symlink() or not folder.is_dir() or not re.fullmatch(r'[a-z0-9]+(?:-[a-z0-9]+)*', folder.name):
            raise ValueError(f'Skill inválida: {folder}')
        entry = folder / 'SKILL.md'
        text = entry.read_text(encoding='utf-8')
        header = text.split('---', 2)
        if not text.startswith('---\n') or len(header) < 3 or not re.search(r'^name:\s*[\'"]?' + re.escape(folder.name) + r'[\'"]?\s*$', header[1], re.M) or not re.search(r'^description:\s*\S', header[1], re.M):
            raise ValueError(f'Frontmatter inválido: {entry}')
        expected[folder.name] = fingerprint(folder)
        target = destination / folder.name
        if target.is_symlink():
            raise ValueError(f'Skill existente é um link: {target}')
        if target.exists():
            if not target.is_dir() or fingerprint(target) != expected[folder.name]:
                raise ValueError(f'Skill existente diferente, preservada: {target}. Compare e faça backup antes de atualizar.')
        else:
            pending.append(folder)
    destination.mkdir(parents=True, exist_ok=True)
    created = []
    try:
        for folder in pending:
            target = destination / folder.name
            target.mkdir()  # Never merge or overwrite a concurrent installation.
            created.append(target)
            shutil.copytree(folder, target, dirs_exist_ok=True)
        for folder in folders:
            if fingerprint(destination / folder.name) != expected[folder.name]:
                raise ValueError(f'Falha na verificação: {folder.name}')
    except Exception:
        for target in reversed(created):
            shutil.rmtree(target)
        raise
    return {'status': 'installed_local', 'destination': str(destination.resolve()),
            'skills': [f.name for f in folders], 'new': len(created),
            'new_conversation_test': 'pending', 'cloud_account_installation': False}


def fetch(url):
    accept = 'application/vnd.github+json' if url.startswith('https://api.github.com/') else 'application/octet-stream'
    request = Request(url, headers={'User-Agent': 'Academia-Skills-Installer', 'Accept': accept})
    with urlopen(request, timeout=60) as response:
        return response.read()


def download_release(destination):
    # Resolve latest once: ZIP and checksums must belong to the same release.
    release = json.loads(fetch(f'https://api.github.com/repos/{REPO}/releases/latest'))
    assets = {a['name']: a['browser_download_url'] for a in release['assets']}
    for name in [ASSET, 'SHA256SUMS.txt']:
        if name not in assets or not assets[name].startswith(f'https://github.com/{REPO}/releases/download/'):
            raise ValueError(f'Asset ausente ou origem inválida: {name}')
    checksums = dict((line.split()[1], line.split()[0]) for line in fetch(assets['SHA256SUMS.txt']).decode().splitlines() if line.strip())
    data = fetch(assets[ASSET])
    if hashlib.sha256(data).hexdigest() != checksums.get(ASSET):
        raise ValueError('SHA-256 divergente. Nenhum arquivo foi instalado.')
    archive = destination / ASSET
    archive.write_bytes(data)
    return archive, release['tag_name']


def choose_destination(source, home, legacy):
    roots = list(dict.fromkeys([Path(home) / '.agents/skills', Path(legacy)]))
    names = [p.name for p in Path(source).iterdir()]
    occupied = [r for r in roots if any((r / name).exists() or (r / name).is_symlink() for name in names)]
    if len(occupied) > 1:
        raise ValueError('Skills do kit já existem em duas raízes. Confira duplicatas antes de instalar: ' + ', '.join(map(str, occupied)))
    return occupied[0] if occupied else roots[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--target', required=True, choices=['codex'])
    parser.add_argument('--dest', type=Path, help='Destino de teste ou diretório de skills confirmado pelo Codex')
    parser.add_argument('--archive', type=Path, help='Plugin ZIP local já inspecionado; sem consulta à rede')
    args = parser.parse_args()
    # This is local persistence, never a write to a Claude/ChatGPT cloud account.
    legacy = Path(os.environ.get('CODEX_HOME', str(Path.home() / '.codex'))) / 'skills'
    with tempfile.TemporaryDirectory(prefix='academia-skills-') as temp:
        stage = Path(temp)
        archive, release = (args.archive, 'local-archive') if args.archive else download_release(stage)
        extract(archive, stage / 'plugin')
        source = stage / 'plugin/skills'
        destination = args.dest or choose_destination(source, Path.home(), legacy)
        result = install(source, destination)
        result['release'] = release
        version_file = stage / 'plugin/VERSION.json'
        if version_file.exists():
            result['version'] = json.loads(version_file.read_text())
        print(json.dumps(result, ensure_ascii=False, indent=2))
        print('Arquivos verificados. Abra uma conversa nova para confirmar o carregamento das skills.')


if __name__ == '__main__':
    try:
        main()
    except Exception as exc:
        print(f'Instalação não concluída: {exc}', file=sys.stderr)
        sys.exit(1)
