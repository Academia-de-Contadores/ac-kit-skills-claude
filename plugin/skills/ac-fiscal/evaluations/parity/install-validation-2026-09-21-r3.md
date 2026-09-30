# Verificação independente da instalação — 2026-09-21, r3

## Escopo e proveniência histórica

- Fonte auditada: `e656327b3e74ebf4dbd7b74bec69461ccf2338f9` (`lifecycle: validated`).
- Origem executada: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-fiscal/.worktrees/fiscal-skill-ready`.
- Pacote temporário: `/tmp/ac-fiscal-r3-package.43Nr1J/ac-fiscal`.
- Backup recuperável pré-instalação: `/tmp/ac-fiscal-r3-backup.h7XlLg/ac-fiscal`.

A prova de instalação foi produzida antes da indexação r3 em `agent.yaml`.
Portanto, o `source_head` e o hash abaixo descrevem exatamente a execução
histórica; a indexação posterior dos registros não invalida essa prova.

## Inventário e igualdade byte a byte

A instalação e o pacote contêm exatamente 23 arquivos regulares, 10 arquivos
Knowledge, 0 links simbólicos e 0 arquivos `.gitkeep`. A igualdade para a
allowlist foi **23/23**. O hash de inventário de ambos é
`1dbaf695e412120a7dab360b34cdd636fd19c363c323560a2890e3dd0a0446b0`.

| Raiz | Arquivos regulares | Knowledge | Symlinks | .gitkeep | Igualdade | Hash do inventário |
| --- | ---: | ---: | ---: | ---: | --- | --- |
| Pacote temporário | 23 | 10 | 0 | 0 | 23/23 | `1dbaf695e412120a7dab360b34cdd636fd19c363c323560a2890e3dd0a0446b0` |
| Instalação | 23 | 10 | 0 | 0 | 23/23 | `1dbaf695e412120a7dab360b34cdd636fd19c363c323560a2890e3dd0a0446b0` |

## Validações da rodada completa

| Verificação | Resultado |
| --- | --- |
| `quick_validate.py` no pacote | PASS |
| `quick_validate.py` na instalação | PASS |
| Forward test P1–P6 | FAIL de release: 4/6; 64/72; C/I/M 0/2/3 |

O FAIL comportamental não contradiz a igualdade de empacotamento: a primeira
mede o conteúdo e a instalação; a segunda, a aderência observada dos seis
outputs à rubrica.
