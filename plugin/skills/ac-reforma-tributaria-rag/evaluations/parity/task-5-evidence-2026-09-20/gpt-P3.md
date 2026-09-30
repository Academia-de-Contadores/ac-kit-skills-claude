# P3 — GPT online

Data: 2026-09-20. Modelo mostrado na UI: GPT-5.5 Thinking.
Conversa nova, sem P1/P2: https://chatgpt.com/g/g-6a1b93a521b4819189fda957bcf00115-agente-reforma-tributaria-day-consulta-rag/c/6ab065be-cec4-83e9-95a8-5866bf1ebf3d
Pergunta enviada integralmente conforme questions.yaml. A UI exibiu a Action search_day_rag_corpus_rag_search_post, a pergunta original, question_type=regime_simulacao, needs_current_source=true, top_k=6 e topics=Array(7). A consulta pública foi autorizada no botão Permitir. O JSON de resposta da Action não foi exposto na UI disponível. Texto original final preservado pelo botão Copiar resposta, antes de uma pergunta adicional de auditoria de fonte:

---

Não dá para calcular valor de IBS/CBS em 2027 nem dizer “qual regime é melhor” com os dados informados. Fazer isso agora exigiria inventar faturamento, anexo, RBT12, margem, compras creditáveis, perfil de clientes e premissas de alíquota — e a regra de segurança da base é justamente não fechar cálculo ou regime sem esses dados.

## 1) Diagnóstico

Para uma empresa de serviços no Simples Nacional, a pergunta correta não é apenas “sair ou não sair do Simples”. Pela base recuperada, o Simples Nacional não acaba. O ponto técnico é avaliar se, para IBS/CBS, a empresa continuará recolhendo dentro do Simples ou se fará opção pelo regime regular de IBS/CBS, mantendo-se no Simples para os demais tributos.

Fonte principal recuperada: LC 214/2025, art. 41, em fonte Planalto, status `CURRENT`, `GOLD`, `normative_allowed=true`, versão `v2.0`: [https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm). A base também recuperou orientação operacional da Receita/CGSN sobre opção para 2027, com status `CURRENT`, mas `normative_allowed=false`, portanto uso apenas como apoio contextual: [https://www.gov.br/fazenda/pt-br/assuntos/noticias/2026/abril/comite-define-prazos-de-opcao-pelo-simples-nacional-e-pelo-regime-regular-do-ibs-e-da-cbs-para-2027](https://www.gov.br/fazenda/pt-br/assuntos/noticias/2026/abril/comite-define-prazos-de-opcao-pelo-simples-nacional-e-pelo-regime-regular-do-ibs-e-da-cbs-para-2027).

## 2) Por que não posso calcular agora

Faltam dados mínimos:

| Dado necessário            | Por que importa                                          |
| -------------------------- | -------------------------------------------------------- |
| Receita/RBT12              | Define faixa, anexo e base de comparação do Simples      |
| Atividade/CNAE/NBS e Anexo | Serviços podem ter tratamento diferente no Simples       |
| Folha e fator R            | Pode alterar Anexo III/V em serviços                     |
| Margem                     | Mostra capacidade de absorver custo ou reduzir preço     |
| Compras creditáveis        | Afeta apuração no regime regular de IBS/CBS              |
| Mix B2B/B2C                | B2B pode exigir crédito; B2C tende a olhar preço final   |
| Perfil dos clientes        | Compradores Lucro Real/Presumido podem valorizar crédito |
| ERP/documento fiscal       | Regime regular exige maior controle operacional          |
| Ano e período              | Para 2027, há regra específica de opção para IBS/CBS     |

Sem isso, qualquer número seria artificial.

## 3) O que dá para responder com segurança

**Não recomendo afirmar que deve sair do Simples.** A própria base recuperada alerta que a decisão pode ser apenas sobre IBS/CBS, sem exclusão do contribuinte do Simples para os demais tributos.

**Também não recomendo afirmar que deve permanecer no Simples sem análise.** Se a empresa presta serviços para outras empresas que aproveitam crédito, especialmente clientes no Lucro Real ou Presumido, a opção pelo regime regular de IBS/CBS pode ter impacto comercial, porque o comprador pode comparar fornecedores pelo crédito gerado.

**Conclusão segura:** hoje o caso é de triagem, não de cálculo fechado.

## 4) Próximos passos

**Em 7 dias:** levantar RBT12, receita mensal, CNAE/NBS, anexo atual, folha, fator R, clientes B2B/B2C, contratos principais e se os clientes exigem crédito.

**Em 30 dias:** montar três cenários: Simples normal, Simples com regime regular de IBS/CBS e cenário de sensibilidade com variação de margem, preço e crédito ao comprador.

**Em 90 dias:** validar ERP, emissão fiscal, relatórios de apuração, capacidade de conciliação e impacto comercial por cliente relevante.

Resposta ao cliente, em linguagem simples:

Ainda não é possível calcular quanto a empresa pagará de IBS e CBS em 2027 nem afirmar qual regime será melhor, porque faltam dados essenciais: faturamento/RBT12, atividade, anexo do Simples, folha, fator R, margem, compras com direito a crédito e perfil dos clientes.

O Simples Nacional não acaba com a Reforma Tributária. A análise correta é verificar se, para IBS e CBS, compensa permanecer na apuração dentro do Simples ou optar pelo regime regular desses tributos, mantendo o Simples para os demais tributos, quando aplicável.

Essa decisão depende principalmente do perfil da operação. Se a empresa vende para consumidor final, a simplicidade e o preço final tendem a pesar mais. Se vende para empresas que aproveitam crédito, especialmente Lucro Real ou Presumido, a geração de crédito para o comprador pode influenciar a competitividade.

O próximo passo é levantar os dados fiscais e comerciais da empresa e montar uma simulação por cenários antes de qualquer recomendação.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
