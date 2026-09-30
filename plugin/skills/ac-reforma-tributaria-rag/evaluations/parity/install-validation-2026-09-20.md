# Validação da instalação limpa — 2026-09-20

## Origem e destino

- Repositório: `https://github.com/Academia-de-Contadores/ac-agente-reforma-tributaria-rag.git`
- Worktree de origem: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-reforma-tributaria-rag/.worktrees/rag-skill-ready`
- Branch de origem: `feat/rag-skill-ready`
- Commit-fonte exato: `a1ea42e2ab7019bafe5a9942cbcfa4af9e385b55`
- Destino: `/Users/levy/.codex/skills/ac-reforma-tributaria-rag`
- Estado inicial do destino: ausente (`test ! -e ...` retornou `0`)

## Conteúdo instalado

A instalação foi feita por cópia local seletiva. Somente os itens autorizados foram copiados:

- `SKILL.md`
- `agent.yaml`
- `agents/`
- `profiles/`
- `references/`
- `instructions/`
- `knowledge/`
- `connectors/`

O destino final contém 60 arquivos em 16 diretórios. Uma comparação recursiva com `diff -qr` confirmou paridade byte a byte entre cada item autorizado da origem e sua contraparte instalada.

## Conteúdo excluído

Nenhum outro item do repositório foi instalado. Isso exclui explicitamente `.git`, `.github`, `.superpowers`, caches, `scripts/`, `tests/`, `evaluations/`, `reports/`, `governance/`, `docs/`, documentação de manutenção e os demais diretórios ou arquivos de desenvolvimento na raiz (`adapters/`, `decisions/`, `identity/`, `objectives/`, `skills/`, `.gitignore`, `CHANGELOG.md`, `HOW-TO-USE.md` e `README.md`).

A inspeção do topo do destino encontrou exatamente os oito itens autorizados. Uma busca dedicada também confirmou a ausência de `.git`, `.github`, `.superpowers`, `scripts`, `tests`, `evaluations`, `reports`, `governance`, `docs`, `__pycache__` e `.pytest_cache` em qualquer profundidade.

## Validação fora do workspace

O validador foi executado a partir de `/tmp`, usando o interpretador vinculante com PyYAML:

```text
/Users/levy/.pyenv/versions/3.10.13/bin/python3 \
  /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  /Users/levy/.codex/skills/ac-reforma-tributaria-rag
```

Resultado:

```text
Skill is valid!
```

Assim, a skill instalada carrega pelo destino do Codex sem depender do diretório de trabalho do repositório original.

## Atualização pós-validação — 2026-09-20

Após a validação funcional r2, foi sincronizado somente o manifesto
`agent.yaml` da instalação com o manifesto final da release:

- Commit-fonte exato: `e9d1d164308ffdc8f46359a9a80079ee59405c51`.
- Origem: `agent.yaml` do worktree e branch registrados acima.
- Destino: `/Users/levy/.codex/skills/ac-reforma-tributaria-rag/agent.yaml`.
- Estado final: `agent.lifecycle: validated`, `agent.version: 0.2.0`.
- Referências sincronizadas: validação da instalação, comparação
  `gpt-comparison-2026-09-20-r2.md` e README das evidências fix1.
- SHA-256 do manifesto anterior instalado:
  `307b830a65bef34ff8766827d537a93c603f02cb24f8ffa5176d35f79e63107d`.
- SHA-256 final, idêntico na origem e na instalação:
  `617072f7eac5c3ca34b3ebcadf48c1c54d02485710f1b03bb45138861d5634d8`.

`cmp agent.yaml /Users/levy/.codex/skills/ac-reforma-tributaria-rag/agent.yaml`
terminou sem saída e com exit code 0, confirmando paridade byte a byte.

Antes e depois da sincronização, foram calculados e comparados os caminhos e
SHA-256 dos **59 demais arquivos instalados**. Os inventários foram idênticos:
nenhum outro arquivo instalado foi criado, removido ou alterado. O manifesto
e sua versão/lifecycle no repositório não foram modificados, nem foram
alterados GPT, SKILL.md, contrato, Knowledge, schema ou evidências funcionais.

Comando do inventário, executado no diretório da instalação:

```sh
rg --files --hidden -0 -g '!agent.yaml' | xargs -0 shasum -a 256 | LC_ALL=C sort
```

SHA-256 da saída ordenada idêntica dos dois inventários:
`6dc5310cc8c78f300ffe9de98a22c87c4c278776aed405d2dd3a121d7eca9216`.

### Validação da atualização

Todos os comandos terminaram com exit code 0:

| Verificação | Resultado |
| --- | --- |
| `cmp` do manifesto origem × instalação | Nenhuma saída; conteúdo idêntico. |
| `quick_validate.py` na instalação, executado de `/tmp` com Python 3.10.13 | `Skill is valid!` |
| `bash scripts/validate-agent-repo.sh` | `agent repository validation passed` |
| `bash tests/validate-agent-repo.test.sh` | `agent repository validation passed` e `validate-agent-repo tests passed` |
| `git diff --check` | Nenhuma saída; exit code 0. |

A sincronização não incluiu outros arquivos ou diretórios no pacote instalado.
As referências de avaliação no manifesto apontam para evidências do repositório;
`evaluations/` continua fora da instalação, conforme o escopo original.

## Atualização após confronto com originais — 2026-09-20

O confronto independente entre P1–P5 e os artefatos originais passou. Somente
`agent.yaml` foi novamente sincronizado por cópia seletiva para incluir a nova
evidência:

- lifecycle final: `validated`;
- nova evidência: `evaluations/parity/original-source-verification-2026-09-20.md`;
- SHA-256 anterior do manifesto instalado:
  `617072f7eac5c3ca34b3ebcadf48c1c54d02485710f1b03bb45138861d5634d8`;
- SHA-256 final idêntico na origem e instalação:
  `6e601ac2d05aed50f808abf73a3f8ab774e2051783bb8bffce657e1fa2d36d29`.

O restante dos 59 arquivos distribuídos não foi alterado. A igualdade do
manifesto, o inventário restante e os validadores foram repetidos após esta
sincronização.
