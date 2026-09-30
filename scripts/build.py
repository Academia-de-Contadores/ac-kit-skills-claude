#!/usr/bin/env python3
"""Validate and package the curated snapshot; no network or code from skills is executed."""
from pathlib import Path
import hashlib, json, os, re, shutil, subprocess, zipfile
import yaml
ROOT = Path(__file__).resolve().parents[1]
PLUGIN = ROOT / "plugin"
OUT = ROOT / "dist"
manifest = json.loads((PLUGIN / ".claude-plugin/plugin.json").read_text())
assert re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", manifest["name"])
assert re.fullmatch(r"\d+\.\d+\.\d+", manifest["version"])
for forbidden in ["hooks", "settings", "mcpServers"]:
    assert forbidden not in manifest, f"Unexpected execution/permission component: {forbidden}"
for name in ["hooks", "settings.json", ".mcp.json", "bin"]:
    assert not (PLUGIN / name).exists(), f"Unexpected plugin component: {name}"
catalog = []
for folder in sorted((PLUGIN / "skills").iterdir()):
    assert folder.is_dir() and not folder.is_symlink()
    entry = folder / "SKILL.md"
    text = entry.read_text()
    assert text.startswith("---\n"), entry
    header = yaml.safe_load(text.split("---", 2)[1])
    assert header["name"] == folder.name
    assert re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", folder.name)
    assert isinstance(header["description"], str) and header["description"].strip()
    for link in re.findall(r"\]\(([^)]+)\)", text):
        if "://" not in link and not link.startswith("#"):
            target = (folder / link.split("#")[0]).resolve()
            assert target.is_relative_to(folder.resolve()) and target.exists(), (entry, link)
    catalog.append({"name": folder.name, "description": header["description"]})
for path in PLUGIN.rglob("*"):
    assert not path.is_symlink(), path
    assert path.name not in [".env", ".DS_Store"] and path.suffix not in [".pem", ".key"], path
assert catalog and any(s["name"] == "ac-instalar-skills" for s in catalog)
commit = os.environ.get("GITHUB_SHA") or subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
version = {"version": manifest["version"], "commit": commit, "skills_count": len(catalog), "skills": [s["name"] for s in catalog], "student_account_test": "required"}
OUT.mkdir(exist_ok=True)
# Only the dedicated generated output directory is replaced.
stage = OUT / "kit"
if stage.exists(): shutil.rmtree(stage)
stage.mkdir()
for path in (ROOT / "docs").iterdir():
    if path.is_file(): shutil.copy2(path, stage / path.name)
(stage / "version.json").write_text(json.dumps(version, ensure_ascii=False, indent=2) + "\n")
(stage / "catalogo.json").write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + "\n")
def pack(root, destination, prefix="", extra=None):
    with zipfile.ZipFile(destination, "w", zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(root.rglob("*")):
            if path.is_file(): archive.write(path, str(Path(prefix) / path.relative_to(root)))
        if extra:
            for name, value in extra.items(): archive.writestr(name, value)
    with zipfile.ZipFile(destination) as archive:
        assert archive.testzip() is None
        assert all(not Path(n).is_absolute() and ".." not in Path(n).parts for n in archive.namelist())
pack(PLUGIN, stage / "academia-skills-contabeis.zip", extra={"VERSION.json": json.dumps(version, indent=2)})
individual = stage / "skills-individuais"
individual.mkdir()
for folder in sorted((PLUGIN / "skills").iterdir()):
    pack(folder, individual / (folder.name + ".zip"), folder.name)
(stage / "SHA256.json").write_text(json.dumps({str(p.relative_to(stage)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(stage.rglob("*.zip"))}, indent=2))
pack(stage, OUT / "KIT-ALUNAS-CLAUDE.zip")
for name in ["academia-skills-contabeis.zip", "version.json", "catalogo.json"]:
    shutil.copy2(stage / name, OUT / name)
(OUT / "SHA256SUMS.txt").write_text("".join(hashlib.sha256((OUT / n).read_bytes()).hexdigest() + "  " + n + "\n" for n in ["KIT-ALUNAS-CLAUDE.zip", "academia-skills-contabeis.zip", "version.json", "catalogo.json"]))
print(json.dumps(version, ensure_ascii=False))
