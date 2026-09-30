# Evidências da Task 5 — reteste funcional fix1 / r2

Resultado funcional: **PASS, 5/5**, segundo a rubrica atual de `../questions.yaml`.

- Data local: 2026-09-20, America/Sao_Paulo. As chamadas ocorreram em 2026-09-21 UTC; não há alteração da data local da rodada.
- Candidato efetivamente avaliado: `87a395689b18fdf92ecdac317ef11bb47f8d8b64`.
- Avaliador: agente funcional independente, em contexto novo, sem participação na implementação do fix e sem subagentes.
- Skill lida integralmente: instalação existente de `ac-reforma-tributaria-rag`, perfil `current`, instruções, contrato e oito anexos do Knowledge.
- Referência: textos reais já preservados de `../task-5-evidence-2026-09-20/gpt-P1.md` a `gpt-P5.md`. O GPT não foi consultado novamente nem alterado.
- Rubrica: versão de `questions.yaml` presente no commit avaliado, SHA-256 `da40f1c198939a9dad0f98880f6ffde2f511ccf9f7baca71f4c7d4aaa8793f7b`. Seu campo histórico `candidate_commit: 17f4142` não identifica o código deste reteste.
- Não foram alterados skill, contrato, instalação, GPT, Knowledge, schema, rubrica ou evidências históricas nesta rodada.

## Conteúdo preservado

| Arquivos | Conteúdo |
| --- | --- |
| `P1-request.json` a `P4-request.json` | Pergunta integral e parâmetros fixados na rubrica. |
| `P1-response.json` a `P4-response.json` | Corpo JSON real retornado pelo endpoint, com seis chunks em cada caso. Acrescentou-se apenas quebra de linha final ao persistir. |
| `health-response.json` | Corpo real do health, independente de P5. |
| `http-transcript.json` | Endpoint, método, status, tempo total, horário de início quando registrado e horário de coleta. |
| `P5-transport-unavailable.json` | Injeção local, sem chamada HTTP e sem evidência de retrieval. |
| `skill-P1.md` a `skill-P5.md` | Respostas completas produzidas pelo avaliador usando a skill instalada. |
| `validation-results.md` | Saídas dos validadores e checagens de integridade desta rodada. |

As quatro consultas foram independentes e enviadas em paralelo via HTTP, pois a Action nomeada não estava disponível no runtime. Não houve retry: todas retornaram HTTP 200 em aproximadamente 42 segundos. Nenhum dado privado foi enviado. O health respondeu `ok=true`, `database=ac-staging`, `collection=day_rtc_v2_3_20260801` e `retrieval_mode=chroma_cloud_v2_3`. Os campos auxiliares `authority_collection`/`reference_collection` mantêm nomes v2.1; isso não substitui a coleção efetivamente informada.

P5 teve zero requisições. Sua resposta foi escrita antes da leitura dos retornos novos de P1–P4. Somente o método e os limites do Knowledge local foram usados; os resultados dos outros casos e a lista de créditos/artigos do GPT baseline não foram reaproveitados como evidência.

## Identidade da instalação usada

Antes da promoção do manifesto, `diff -qr` confirmou igualdade de cada um dos oito itens instaláveis com o worktree: `SKILL.md`, `agent.yaml`, `agents/`, `profiles/`, `references/`, `instructions/`, `knowledge/` e `connectors/`.

| Arquivo | SHA-256 na origem e na instalação |
| --- | --- |
| `SKILL.md` | `ac7a29ee911c3fd2afca53de6602ed5c1f81f66168fb9a1724bc607fe4ade5a8` |
| `references/retrieval-contract.md` | `28059c170a632f93f3db04a9e1a5e15195bea43f27eca10559c5dcc25f230a90` |

O registro da instalação inicial continua em `../install-validation-2026-09-20.md`. Esta rodada apenas leu e verificou a instalação existente, já contendo o fix; não reinstalou arquivos. A promoção de `agent.yaml` ocorre somente no repositório, conforme o escopo: o manifesto instalado permanece no estado anterior, com a mesma versão 0.2.0 e os mesmos arquivos de comportamento testados.

## Referências de comparação

- Comparação completa e decisão: [gpt-comparison-2026-09-20-r2.md](../gpt-comparison-2026-09-20-r2.md).
- As respostas originais do GPT estão em [task-5-evidence-2026-09-20](../task-5-evidence-2026-09-20/README.md).
- O FAIL de `gpt-comparison-2026-09-20.md` é histórico de outra rubrica. Esta rodada não herda essa decisão.

| Baseline preservado | SHA-256 |
| --- | --- |
| `gpt-P1.md` | `ba9da0b3474aba43504a195a05c943655713e0c440fe3c2cbb4b9674f3fd02fa` |
| `gpt-P2.md` | `1cceda2eb0d466f53014a1aff97932cebc906818dd132afa4f15d0c9b1d08995` |
| `gpt-P3.md` | `193463a1bf6daa5cc2c829f48c86a1584bcd9e70dc95d10c5a6e0c9bd2051752` |
| `gpt-P4.md` | `93edfe018c3f71ed85e0b8bd8e0b7c5c3131369470f2b8d758fd4fbf497389bc` |
| `gpt-P5.md` | `a92f7eeb459eca5b3279ac5d9616b53301915c8f1005cfb2a25101c578f24b52` |
