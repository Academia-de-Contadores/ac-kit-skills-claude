# Validação da instalação — rodada r3

## Identidade congelada

- Repositório: `ac-agente-processos-escritorio`
- Branch: `feat/processos-skill-ready`
- HEAD-fonte validado: `aa348b1902e5ab99a23efb37e1715818d91b27f1`
- Skill: `ac-processos-escritorio`
- Destino: `/Users/levy/.codex/skills/ac-processos-escritorio`
- Pacote independente: `/private/tmp/ac-processos-r3.VO6LgV/independent-package`
- Backup recuperável da instalação r2:
  `/private/tmp/ac-processos-r3.VO6LgV/ac-processos-escritorio.previous`
- Versão/lifecycle: `0.2.0 candidate`
- Perguntas P1–P6 preservadas, SHA-256:
  `cda93c59d7c81cd8355fdde299b01594c8675d2d60dc46e026769d3530e8d3f2`
- Outputs GPT congelados preservados, SHA-256:
  `fe1e6d50d0c7601bef5902eb76e59b1cb3c04e6c9b2226860a6b7786f92d483d`

## Allowlist materializada

Somente os caminhos declarados em `agent.yaml` sob
`skill_runtime.package` foram materializados na instalação e no pacote
independente.

| Controle | Instalação | Pacote independente |
| --- | ---: | ---: |
| Arquivos regulares | 17 | 17 |
| Arquivos físicos de Knowledge | 4 | 4 |
| Links simbólicos | 0 | 0 |
| `.gitkeep` | 0 | 0 |
| Igualdade byte a byte com a origem | 17/17 | 17/17 |

## Hash reproduzível

O hash foi calculado nos diretórios materializados com:

```bash
find . -type f -exec shasum -a 256 {} + \
  | LC_ALL=C sort -k 2 \
  | shasum -a 256
```

| Materialização | SHA-256 |
| --- | --- |
| Instalação r3 | `911de7a43844791acabbbd5dd5c9a489afdaa89e031133f730f6099494b1eb16` |
| Pacote independente r3 | `911de7a43844791acabbbd5dd5c9a489afdaa89e031133f730f6099494b1eb16` |
| Instalação r2 preservada no backup recuperável | `c980398517c63d03edbd5824def0de90df7e43d54e383f563f34281effa1f23f` |

## Validação executada

| Controle | Resultado |
| --- | --- |
| Inventário exato contra `skill_runtime.package` | PASS |
| Igualdade byte a byte da origem com instalação | PASS, 17/17 |
| Igualdade byte a byte da origem com pacote independente | PASS, 17/17 |
| Hash instalação = hash pacote independente | PASS |
| `quick_validate.py` na origem | PASS |
| `quick_validate.py` na instalação | PASS |

O `quick_validate.py` foi executado com
`/Users/levy/.pyenv/versions/3.10.13/bin/python3.10`. Os validadores do
repositório, a verificação dos hashes e os controles de preservação são
registrados no relatório da rodada.

## Resultado

A instalação e o pacote independente reproduzem fisicamente a allowlist do
HEAD-fonte informado. A instalação r2 anterior continua disponível no backup
recuperável. Esta rodada registra evidência comportamental de P2 e não promove
o lifecycle: a skill permanece `0.2.0 candidate`.
