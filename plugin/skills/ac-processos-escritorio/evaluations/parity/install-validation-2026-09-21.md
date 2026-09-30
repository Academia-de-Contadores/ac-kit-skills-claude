# Validação da instalação — 2026-09-21

## Identidade congelada

- Repositório: `ac-agente-processos-escritorio`
- Branch: `feat/processos-skill-ready`
- HEAD instalado: `554b1eadb21aad43a3b7f5eccf0c71358a764a84`
- Skill: `ac-processos-escritorio`
- Destino: `/Users/levy/.codex/skills/ac-processos-escritorio`
- Versão/lifecycle: `0.2.0 candidate`
- SHA-256 das perguntas P1–P6:
  `cda93c59d7c81cd8355fdde299b01594c8675d2d60dc46e026769d3530e8d3f2`

## Instalação seletiva

Somente os caminhos declarados em `agent.yaml` sob
`skill_runtime.package` foram materializados. O resultado observado foi:

| Controle | Resultado |
| --- | ---: |
| Arquivos regulares | 17 |
| Arquivos físicos de Knowledge | 4 |
| Links simbólicos | 0 |
| `.gitkeep` | 0 |
| Igualdade byte a byte com a origem | 17/17 |

O repositório de desenvolvimento, avaliações, testes, relatórios, histórico Git
e placeholders não fazem parte da instalação distribuível.

## Hash reproduzível do pacote

O hash foi calculado exatamente com:

```bash
(cd INSTALL && find . -type f -exec shasum -a 256 {} + | LC_ALL=C sort -k 2 | shasum -a 256)
```

Resultado da instalação:

```text
8ae4088775c314c8532035a328581131aba4eb25fd5bdc00107bb9c6334fd292  -
```

A mesma allowlist foi copiada para o pacote temporário independente
`/tmp/ac-processos-package.GE72kh`. O comando acima produziu novamente:

```text
8ae4088775c314c8532035a328581131aba4eb25fd5bdc00107bb9c6334fd292  -
```

O pacote temporário também continha 17 arquivos, quatro arquivos de Knowledge,
zero links e zero `.gitkeep`.

## Validadores executados

| Validador | Resultado |
| --- | --- |
| `quick_validate.py` na origem | PASS |
| `quick_validate.py` na instalação | PASS |
| `ruby scripts/validate-processos-skill.rb` | PASS |
| `bash scripts/validate-agent-repo.sh` | PASS |
| `bash tests/validate-agent-repo.test.sh` | PASS |

O `quick_validate.py` foi executado com
`/Users/levy/.pyenv/versions/3.10.13/bin/python3.10`, que contém PyYAML. O
`python3` do sistema e o runtime Python geral do Codex não continham o módulo;
isso foi confirmado como diferença ambiental antes da repetição do teste.

## Resultado

A instalação é uma reprodução física e seletiva da allowlist do HEAD informado.
Esta validação não promove o lifecycle; a candidata permanece `candidate` até a
decisão de release da família.
