# Verificação independente da instalação — 2026-09-21, r4

## Escopo e proveniência histórica

- Fonte auditada: `e682cdc20a459732b316d8e9b63d843563f116ea` (`lifecycle: validated`).
- Origem executada: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-fiscal/.worktrees/fiscal-skill-ready`.
- Pacote temporário: `/tmp/ac-fiscal-r4-package.eGIqmI/ac-fiscal`.
- Backup recuperável pré-instalação: `/tmp/ac-fiscal-r4-backup.i3epNP/ac-fiscal`.

## Inventário e igualdade byte a byte

O pacote e a instalação contêm exatamente 23 arquivos regulares, 10 arquivos
Knowledge, 0 links simbólicos e 0 arquivos `.gitkeep`. A allowlist foi igual
em caminho e bytes **23/23**. O hash de inventário de ambas as raízes é
`b5a57d7a87fe2baf5ab1bc528245b81fad36408535cf55e9c4cada1ee4bb22cd`.

| Raiz | Arquivos regulares | Knowledge | Symlinks | .gitkeep | Igualdade | Hash do inventário |
| --- | ---: | ---: | ---: | ---: | --- | --- |
| Pacote temporário | 23 | 10 | 0 | 0 | 23/23 | `b5a57d7a87fe2baf5ab1bc528245b81fad36408535cf55e9c4cada1ee4bb22cd` |
| Instalação | 23 | 10 | 0 | 0 | 23/23 | `b5a57d7a87fe2baf5ab1bc528245b81fad36408535cf55e9c4cada1ee4bb22cd` |

## Validações

| Verificação | Resultado |
| --- | --- |
| `quick_validate.py` no pacote | PASS |
| `quick_validate.py` na instalação | PASS |
| Forward test P1–P6 | PASS de release: 6/6; 70/72; 36/36 gates; C/I/M 0/0/2 |

O commit posterior de evidência adiciona somente documentação e outputs de
avaliação fora de `skill_runtime.package`. Portanto não altera nenhum dos 23
arquivos do pacote auditado e a instalação permanece byte-equal ao pacote final.
