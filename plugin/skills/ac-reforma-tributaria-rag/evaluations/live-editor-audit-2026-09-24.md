# Auditoria do GPT online — premissa para 2027 — 2026-09-24

- GPT: [Agente Reforma Tributária Day - Consulta RAG](https://chatgpt.com/gpts/editor/g-6a1b93a521b4819189fda957bcf00115), ID `g-6a1b93a521b4819189fda957bcf00115`.
- Estado após a publicação: `Ao vivo · Qualquer pessoa com um link`; UI exibiu `GPT atualizado` e `Última edição em 24 de set.`.
- Instruções anteriores: `instructions/current-live-2026-08-22.md`, corpo SHA-256 `98a6420fb64c1d1ae1ab3bbe8cf72691200c260b4d5b26c96141f07ba0c0b07a`.
- Instruções publicadas: `instructions/current-live-2026-09-24.md`, corpo SHA-256 `3ee95c2e25425e78f986c240f633e1c00b6e2a16587540915cd4e870735c50cd`.
- A mudança limita 3,65% ao PIS/Cofins cumulativo aplicável em 2026; acrescenta 9,21% como referência estimada da CBS para planejamento de 2027; distingue CBS transitória estimada de 9,11% e IBS de 0,10%, com ressalvas para créditos, regimes, exceções e taxa oficial futura.
- Os oito arquivos de Knowledge continuaram listados no editor: `01-uso-obrigatorio-action.md`, `02-contrato-ciclo-vida.md`, `03-hierarquia-fontes.md`, `04-dfe-erp-classificacao.md`, `05-calculos-e-projecoes.md`, `06-pedagogia-e-resposta-cliente.md`, `07-cronograma-e-lacunas.md` e `08-resposta-segura.md`. Não foram reenviados nem alterados nesta rodada; sua última verificação binária permanece 2026-09-09.
- A Action `day-rag-chroma-actions.onrender.com` continuou configurada. Não foi alterada; o schema ativo segue a captura de 2026-09-20.

## Teste no próprio editor

Pergunta idêntica antes e depois da atualização: simulação apenas da parcela federal para empresa fictícia de serviços, PIS/Cofins cumulativo em 2026, base mensal de R$ 100.000, sem reduções nem créditos; comparação com 2027 e identificação da natureza da taxa.

| Momento | Observação |
| --- | --- |
| Antes | O GPT calculou 2026 a 3,65% (= R$ 3.650), mas deixou 2027 como `X%` e não calculou a projeção. |
| Depois | A Action RAG foi chamada com `needs_current_source=true`. O GPT calculou 2026 a 3,65% (= R$ 3.650). Para 2027, calculou a parcela federal CBS a 9,11% (= R$ 9.110), mostrou IBS de 0,10% (= R$ 100) separado e total nominal CBS+IBS de 9,21% (= R$ 9.210). Identificou a taxa de 2027 como **premissa estimada, não alíquota oficial**, e recomendou validação profissional. |

Resultado: **PASS** para a regressão solicitada. O exemplo não comprova carga real nem valida outros regimes. Fontes oficiais citadas pelo GPT no reteste: [EC 132/2023](https://www.planalto.gov.br/ccivil_03/constituicao/emendas/emc/emc132.htm) e [LC 214/2025](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm). A hipótese contábil de 9,21% não foi apresentada como alíquota oficial.

Teste adicional: para empresa fictícia optante pelo Simples Nacional, sem anexo,
RBT12, atividade ou compras, o GPT consultou a Action e **recusou** aplicar
automaticamente tanto 3,65% quanto 9,21% como carga efetiva. Ofereceu apenas
estrutura de comparação, dados faltantes e ressalva profissional. **PASS**
para o limite de regime e dados insuficientes.
