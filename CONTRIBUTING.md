# Como contribuir com o kit

Antes de propor algo, leia [SCOPE.md](SCOPE.md). Toda mudança entra por pull request e só é publicada depois de revisada.

## Onde a skill nasce

A maior parte das skills tem um repositório de origem (`ac-agente-*`), registrado em [plugin/FONTES.json](plugin/FONTES.json). Corrija primeiro na origem e depois traga a versão revisada para `plugin/skills/<nome>/`, como descrito em [COMO-ATUALIZAR.md](COMO-ATUALIZAR.md). As skills criadas só para o kit (por exemplo `ac-instalar-skills`) são editadas direto aqui.

## Estrutura de uma skill

```
plugin/skills/<nome>/
  SKILL.md            frontmatter name + description, e as instruções principais
  references/         detalhes que a skill lê só quando precisa
  knowledge/          base de conhecimento, com fonte e data
  evaluations/        cenários de teste fictícios
  HOW-TO-USE.md       exemplos de pedido (opcional)
```

A pasta é plana de propósito: é o formato que o Claude, o Codex e o instalador leem. O departamento é registrado no catálogo, não na pasta.

## Padrão de qualidade

| Área | Regra |
|---|---|
| Nome | Minúsculas e hífens, igual ao nome da pasta. Prefixo `ac-` para skills da Academia. |
| Descrição | Em português. Diz o que a skill faz e quando usar, com palavras que a aluna usaria ("pré-apuração", "admissão", "transferência de contabilidade"). Até 1.024 caracteres. |
| Tamanho | SKILL.md com até 500 linhas. Detalhe longo vai para `references/` ou `knowledge/` e é lido sob demanda. |
| Caminhos | Nenhum caminho de computador (`/Users/...`, `C:\Users\...`). Use caminhos relativos à pasta da skill. |
| Dados | Nenhum dado real de cliente, credencial, token ou endpoint privado. Exemplos sempre fictícios. |
| Material interno | Nada de material interno da Academia (ver SCOPE.md). |
| Testes | Cenários em `evaluations/` cobrindo o uso normal, um caso de risco e uma tentativa de instrução escondida em anexo. |
| Limites | A skill separa o que foi confirmado do que precisa de validação e não conclui decisão tributária, trabalhista ou societária sozinha. |

`python3 scripts/check_catalogo.py` confere nome, tamanho, descrição, caminhos, material interno e catálogo. Os testes rodam essa conferência, então a PR não passa se algo falhar. O relatório de cada skill fica em [catalogo/QUALIDADE.md](catalogo/QUALIDADE.md) (`--relatorio` regrava).

## Checklist da PR

1. Skill nova ou renomeada: entrada em [catalogo/departamentos.json](catalogo/departamentos.json) e `python3 scripts/check_catalogo.py --atualizar-readme`.
2. Conteúdo distribuído mudou: suba a versão em `plugin/.claude-plugin/plugin.json`, registre em `docs/05-STATUS-DO-PACOTE.txt` e atualize `plugin/FONTES.json` se a origem mudou.
3. Rode `python3 -m unittest discover -s tests -v` e `python3 scripts/build.py`.
4. Descreva na PR o problema observado (SCOPE.md) e como testou.
