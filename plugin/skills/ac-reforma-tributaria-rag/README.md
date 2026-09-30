# Reforma Tributária Day — Consulta RAG

| Campo | Valor |
| --- | --- |
| ID | `ac.reforma-tributaria-rag` |
| Versão | `0.2.1` |
| Lifecycle | `validated` |
| Skill | `$ac-reforma-tributaria-rag` |

## Propósito

Atua como assistente consultivo sobre a Reforma Tributária do Consumo com busca
RAG no corpus Day V2.3 via serviço externo conectado ao Chroma Cloud.

O repositório contém o pacote distribuível da skill e também materiais de
desenvolvimento. O pacote seletivo começa em [SKILL.md](SKILL.md) e usa a
apresentação em [agents/openai.yaml](agents/openai.yaml). A versão está
validada. A base 0.2.0 passou no comportamento P1–P5 e no confronto de suas
citações materiais com os artefatos originais preservados. A correção 0.2.1
acrescenta o cenário contábil explícito para simulações de 2027, sem tratá-lo
como alíquota oficial, e foi testada na regressão correspondente.

## Usar e manter este agente

Após instalar somente os oito itens distribuíveis descritos em
[HOW-TO-USE.md](HOW-TO-USE.md) em uma pasta de skills reconhecida pelo Codex,
invoque:

```text
Use $ac-reforma-tributaria-rag para analisar minha dúvida sobre créditos de CBS,
consultando as fontes e indicando o que falta para concluir.
```

O perfil [current](profiles/current/profile.yaml) é o padrão. Para o RAG
legado/Reforma Oficial ou comparação histórica, solicite explicitamente o
perfil [legacy](profiles/legacy/profile.yaml). Ambos referenciam os anexos
preservados, sem duplicação. O perfil histórico não comprova vigência atual.

Leia [HOW-TO-USE.md](HOW-TO-USE.md) para instalação, transporte HTTP e
manutenção. O [contrato de retrieval](references/retrieval-contract.md) usa o
schema ativo capturado em 2026-09-20; `openapi.yaml` permanece candidato futuro.
A skill não instala a Action ou um MCP: exige ferramenta HTTP/Action disponível
para consultar o serviço externo. Na indisponibilidade ou falta de base,
declara a lacuna e não fecha conclusão normativa. Não envie dados de clientes
ou segredos. Decisões de aplicação exigem validação profissional.

## Guias do repositório

- [Como usar e reconstruir o agente](HOW-TO-USE.md)
- [Estrutura e destino de cada arquivo](docs/REPOSITORY-STRUCTURE.md)
- [Como contribuir](governance/CONTRIBUTING.md)
- [Política de dados e segredos](governance/DATA-AND-SECRETS.md)
- [Política de mudanças](governance/CHANGE-POLICY.md)

## Proteções versionadas e verificáveis

O `.gitignore` reduz o risco de adicionar artefatos locais conhecidos, e
`scripts/validate-agent-repo.sh` rejeita arquivos proibidos, artefatos RAG locais
e arquivos maiores que 5 MB. O workflow `validate` executa esse validador em
pull requests e pushes para `main`. O `CODEOWNERS` solicita revisão para áreas
sensíveis. Workflow e `CODEOWNERS`, isoladamente, não provam bloqueio de merge;
branch protection, rulesets, visibilidade e demais controles devem ser
confirmados na configuração remota. Consulte `reports/task-3-report.md` para a
evidência local e seus limites.
