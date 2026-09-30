# Validação do reteste r2 — 2026-09-20

Resultado: **todos os validadores exigidos passaram, exit code 0**. Os comandos foram executados após a promoção de `agent.yaml` para `validated`, sem alterar a versão 0.2.0.

## quick_validate — repositório

Diretório de execução: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-reforma-tributaria-rag/.worktrees/rag-skill-ready`.

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python3 /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .
```

Saída real:

```text
Skill is valid!
```

Exit code: `0`.

## quick_validate — instalação, fora do workspace

Diretório de execução: `/tmp`.

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python3 /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria-rag
```

Saída real:

```text
Skill is valid!
```

Exit code: `0`.

## Validação do repositório

Diretório de execução: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-reforma-tributaria-rag/.worktrees/rag-skill-ready`.

```sh
bash scripts/validate-agent-repo.sh
```

Saída real:

```text
agent repository validation passed
```

Exit code: `0`.

## Suíte de regressão do validador

Diretório de execução: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-reforma-tributaria-rag/.worktrees/rag-skill-ready`.

```sh
bash tests/validate-agent-repo.test.sh
```

Saída real:

```text
agent repository validation passed
validate-agent-repo tests passed
```

Exit code: `0`.

## Checagens adicionais

- P1–P4: JSON válido; presença e tipos dos campos obrigatórios de SearchResponse, Citation, RetrievedChunk e SourceStatus; tipos dos metadados opcionais presentes e recommended_response_rules. Verificação com `jq -e`: quatro resultados `true`, exit code 0. Trata-se de uma checagem explícita dos campos usados, não de certificação de cobertura jurídica.
- Health: campos obrigatórios com tipos esperados e coleção/database iguais ao perfil current. `jq -e`: `true`, exit code 0.
- P5: `TRANSPORT_UNAVAILABLE`, `http_request_attempted=false`, `retrieval_evidence=null`. `jq -e`: `true`, exit code 0.
- Perguntas P1–P4, question_type, needs_current_source e top_k conferidos contra a rubrica; somente texto público/sintético.
- Fontes, artigos, versões e URLs citados nas respostas conferidos manualmente contra os chunks do próprio caso.
- Instalação antes da promoção: `diff -qr` dos oito itens autorizados contra o candidato, exit code 0 e nenhuma diferença.
- Integridade: `git diff --exit-code HEAD -- SKILL.md references/retrieval-contract.md instructions knowledge connectors profiles evaluations/parity/questions.yaml evaluations/parity/task-5-evidence-2026-09-20 evaluations/parity/gpt-comparison-2026-09-20.md`, exit code 0.
- `git diff --check`: exit code 0.

Os testes existentes criam e removem somente uma cópia temporária de validação; não foram criados scripts nesta rodada. Nenhum push, alteração de GPT ou reinstalação foi realizado.
