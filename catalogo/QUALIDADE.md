# Qualidade das skills do kit

Gerado por `python3 scripts/check_catalogo.py --relatorio`. Os critérios estão em [CONTRIBUTING.md](../CONTRIBUTING.md).

| Departamento | Skill | Linhas do SKILL.md | Caracteres da description | Arquivos | Cenários de teste | Observações |
|---|---|---|---|---|---|---|
| Departamento Pessoal | `ac-dp` | 110 | 208 | 93 | sim | description começa em inglês |
| Fiscal | `ac-fiscal` | 101 | 206 | 127 | sim | description começa em inglês |
| Gestão e Processos do Escritório | `ac-entrada-clientes` | 99 | 289 | 27 | sim | description começa em inglês; beta |
| Gestão e Processos do Escritório | `ac-processos-escritorio` | 94 | 145 | 83 | sim | description começa em inglês |
| Gestão e Processos do Escritório | `notion-home-negocio` | 55 | 461 | 8 | não | sem cenários de teste |
| Instalação e Atualização | `ac-instalar-skills` | 77 | 268 | 1 | não | sem cenários de teste |
| Marketing e Conteúdo | `ac-estrategista-conteudo-dai` | 102 | 231 | 115 | sim | description começa em inglês |
| Reforma Tributária | `ac-concierge-combo-reforma-sem-surto` | 59 | 237 | 72 | sim | ok |
| Reforma Tributária | `ac-reforma-tributaria-rag` | 109 | 231 | 146 | sim | ok |
| Societário e Legalização | `ac-societario` | 95 | 198 | 93 | sim | description começa em inglês |

## Erros

Nenhum.

## Avisos (não bloqueiam a publicação)

- ac-dp: description começa em inglês ('Use when...'); padronizar em português
- ac-entrada-clientes: description começa em inglês ('Use when...'); padronizar em português
- ac-estrategista-conteudo-dai: description começa em inglês ('Use when...'); padronizar em português
- ac-fiscal: description começa em inglês ('Use when...'); padronizar em português
- ac-instalar-skills: sem pasta evaluations/ com cenários de teste
- ac-processos-escritorio: description começa em inglês ('Use when...'); padronizar em português
- ac-societario: description começa em inglês ('Use when...'); padronizar em português
- notion-home-negocio: sem pasta evaluations/ com cenários de teste
