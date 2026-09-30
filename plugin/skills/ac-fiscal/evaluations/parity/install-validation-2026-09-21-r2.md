# Verificação independente da instalação — 2026-09-21, r2

## Escopo e proveniência

- Fonte auditada: `59b9970e53dcad291ee32366d4bd4e71cf240cd7`.
- Origem: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-fiscal/.worktrees/fiscal-skill-ready`.
- Destino instalado: `/Users/levy/.codex/skills/ac-fiscal`.
- Pacote independente reconstruído: `/tmp/ac-fiscal-package-r2.9iq1I2/rebuilt`.
- Backup recuperável pré-instalação: `/tmp/ac-fiscal-install-backup-r2.0MVOYI/ac-fiscal`.
- `agent.yaml` permanece em `0.2.0 candidate`.

Esta rodada registra a validação corretiva P4; não alterou runtime, lifecycle,
catálogo, GPT nem remoto.

## Inventário e igualdade byte a byte

A allowlist de `skill_runtime.package` foi aplicada ao pacote independente e à
instalação. Cada um contém 23 arquivos regulares, 10 arquivos Knowledge, 0
links simbólicos e 0 arquivos `.gitkeep`. O conjunto da allowlist é exato e os
23/23 arquivos são byte-equal à origem.

| Raiz | Hash do inventário ordenado |
| --- | --- |
| Backup prévio | `fa6ac4b0e6e7f73ed09a04ad98d68359a270966ba3a369fcdfff9d3e968768b0` |
| Pacote reconstruído | `36d992391a18a87e17e90ce9cd2207f30a4e5485f0dc615d8b09744463969ad4` |
| Instalação | `36d992391a18a87e17e90ce9cd2207f30a4e5485f0dc615d8b09744463969ad4` |

O hash é calculado como inventário ordenado de hashes e caminhos relativos:

```sh
find . -type f -exec shasum -a 256 {} + | LC_ALL=C sort -k 2 | shasum -a 256
```

O delta entre backup e pacote contém somente os três arquivos abaixo:

| Caminho | SHA-256 anterior | SHA-256 posterior |
| --- | --- | --- |
| `SKILL.md` | `c634384fb96441841f84a7aa05aae9a86746e5d80c755e3fa33c769dd51f046f` | `ed43f81dad3443b8daa7a9ef5935ac8a7761d5cdf4aab1131de898e7b23ebcd8` |
| `references/approval-policy.md` | `4f83eb0e4b74eeb9b822be20a960b73ba7804375077c103f1f2e0a7dd3679b70` | `3b9bcd86bf3f168d87a4a4fb9b59220600c0f8e22d5c003c9e67fc0b9b1c62d6` |
| `references/fiscal-outputs.md` | `996b637b87e964e82b6f9ecc6c9bc044ac61270f55f2d086a10a509189221c3d` | `33443aa25c46f5532233b652b261d1130e77b2c5dd79927167f0bba1aed1bc1b` |

## Validações registradas

| Comando | Resultado |
| --- | --- |
| `bash tests/validate-agent-repo.test.sh` | PASS |
| `bash scripts/validate-agent-repo.sh` | PASS |
| `bash tests/validate-fiscal-skill.test.sh` | PASS |
| `ruby scripts/validate-fiscal-skill.rb` | PASS |
| `quick_validate.py .` | PASS |
| `quick_validate.py /Users/levy/.codex/skills/ac-fiscal` | PASS |
| gates comportamentais finais | PASS, 6/6 casos qualificam |

Os dois `quick_validate.py` foram executados contra origem e instalação. A
igualdade byte a byte e a allowlist são provas de empacotamento; a qualificação
comportamental está registrada separadamente na matriz r2.
