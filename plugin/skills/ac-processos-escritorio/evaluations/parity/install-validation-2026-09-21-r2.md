# Validação da reinstalação — rodada corretiva r2

## Identidade congelada

- Repositório: `ac-agente-processos-escritorio`
- Branch: `feat/processos-skill-ready`
- HEAD usado na reinstalação: `39fe62038f1fa885ec2a4776e2391440584279a9`
- Skill: `ac-processos-escritorio`
- Destino: `/Users/levy/.codex/skills/ac-processos-escritorio`
- Versão/lifecycle: `0.2.0 candidate`
- Perguntas P1–P6 preservadas, SHA-256:
  `cda93c59d7c81cd8355fdde299b01594c8675d2d60dc46e026769d3530e8d3f2`
- Outputs GPT online congelados preservados, SHA-256:
  `fe1e6d50d0c7601bef5902eb76e59b1cb3c04e6c9b2226860a6b7786f92d483d`

## Allowlist materializada

Somente os caminhos declarados em `agent.yaml` sob
`skill_runtime.package` foram copiados da origem. A mesma allowlist foi
materializada de forma independente em
`/tmp/ac-processos-package-r2.GFh9gV`.

| Controle | Instalação | Pacote independente |
| --- | ---: | ---: |
| Arquivos regulares | 17 | 17 |
| Arquivos físicos de Knowledge | 4 | 4 |
| Links simbólicos | 0 | 0 |
| `.gitkeep` | 0 | 0 |
| Igualdade byte a byte com a origem | 17/17 | 17/17 |

## Hash reproduzível

O hash foi calculado nos dois diretórios com:

```bash
find . -type f -exec shasum -a 256 {} + \
  | LC_ALL=C sort -k 2 \
  | shasum -a 256
```

| Materialização | SHA-256 |
| --- | --- |
| Instalação anterior preservada em backup recuperável | `8ae4088775c314c8532035a328581131aba4eb25fd5bdc00107bb9c6334fd292` |
| Instalação r2 | `c980398517c63d03edbd5824def0de90df7e43d54e383f563f34281effa1f23f` |
| Pacote independente r2 | `c980398517c63d03edbd5824def0de90df7e43d54e383f563f34281effa1f23f` |

O backup recuperável está em
`/tmp/ac-processos-install-backup.5qkvmR/ac-processos-escritorio`. Nenhum
arquivo da instalação anterior foi apagado.

## Delta físico da instalação

Treze arquivos da allowlist permaneceram idênticos. Quatro arquivos do runtime
mudaram entre a instalação anterior e a r2:

| Caminho | SHA-256 anterior | SHA-256 r2 |
| --- | --- | --- |
| `SKILL.md` | `4094a86e0ab1c9ee5a63ac24c50ee27d42c1558600cede8112b4d0e558e2532c` | `ef081d445e3105a80dc79f48159fb6d4027b09fadfb9d5a3dbe220fd73e66ed0` |
| `references/approval-policy.md` | `d0e235cf06cf9b45308f944b9c131f283c33477e5ef6f9b856073b77704154ff` | `e3603c1f9d6fe4fa7bd220f75da3901be9fe8deac0280f347aea9639dab463b0` |
| `references/process-outputs.md` | `77bdb6319670cbd87b6399745606ff02e5b6dcb8856a17a86e1132524fdc2540` | `771d680e06adfe5d196b24b5832ec9b83f8cd74adee3ec6633c66df350b803af` |
| `references/source-policy.md` | `9379267c0303a6fdbed92e260545dedf5e4620a654ff63f9379d422f5ffefa19` | `5a6ccfbb329b7ab62325658ce04162200942f6b5839ec049ea269028bb6ec355` |

## Validação executada na reinstalação

| Controle | Resultado |
| --- | --- |
| Inventário exato contra `skill_runtime.package` | PASS |
| Igualdade byte a byte com a origem | PASS, 17/17 |
| Hash instalação = hash pacote independente | PASS |
| `quick_validate.py` na origem | PASS |
| `quick_validate.py` na instalação | PASS |

O `quick_validate.py` foi executado com
`/Users/levy/.pyenv/versions/3.10.13/bin/python3.10`. Esta reinstalação não
altera o lifecycle: a skill continua `candidate` até a revisão posterior da
rodada r2.
