# P1 — GPT online

Data: 2026-09-20. Modelo mostrado na UI: GPT-5.5 Thinking.
Conversa nova: https://chatgpt.com/g/g-6a1b93a521b4819189fda957bcf00115-agente-reforma-tributaria-day-consulta-rag/c/6ab064f7-54ac-83e9-b915-fa305a3fb056
Pergunta enviada integralmente conforme questions.yaml. A UI exibiu a Action search_day_rag_corpus_rag_search_post, a pergunta original, question_type=factual, needs_current_source=true, top_k=6 e topics=Array(6). A consulta pública foi autorizada no botão Permitir. O JSON de resposta da Action não foi exposto na UI disponível; não se presume igualdade com o JSON local. Texto final preservado pelo botão Copiar resposta:

---

No regime regular, a **LC 214/2025** adota a não cumulatividade como lógica central do IBS e da CBS: o contribuinte apura débitos nas operações de saída e pode apropriar créditos nas aquisições, desde que cumpridas as condições legais.

## Fonte recuperada

**Fonte principal recuperada:**
**RAG-030 — LC 214/2025 compilada**
Autoridade: **Planalto / norma primária**
Status: **CURRENT**
Nível: **GOLD**
Uso normativo: **permitido**
URL limpa: [https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm)
Versão/data no RAG: **v2.0**

Também foi recuperada a **Resolução CGIBS nº 6/2026**, fonte GOLD/CURRENT, que regulamenta o IBS, mas para responder “o que a LC 214/2025 estabelece”, a base legal principal é a própria LC 214/2025.

## 1. Regra geral de não cumulatividade

A LC 214/2025 prevê que, no **regime regular**, a apuração do IBS e da CBS considera, em cada período, a diferença entre:

**a)** os débitos de IBS e CBS das operações realizadas; e
**b)** os créditos apropriados no mesmo período, inclusive créditos presumidos e saldos a recuperar de períodos anteriores.

A apuração é **mensal** e deve ser feita de forma consolidada por contribuinte, abrangendo todos os estabelecimentos, com pagamento e pedido de ressarcimento centralizados em um único estabelecimento.

Em linguagem prática: a empresa não olha apenas o imposto devido nas vendas. Ela também precisa auditar as compras, os documentos fiscais e os créditos que podem ser apropriados.

## 2. IBS e CBS são separados

A LC 214/2025 exige apuração separada de IBS e CBS. A fonte recuperada indica que os créditos e débitos devem ser tratados separadamente: **crédito de IBS não compensa CBS, e crédito de CBS não compensa IBS**.

Então, na rotina contábil, a empresa precisará manter controles separados para:

| Controle        | Aplicação                            |
| --------------- | ------------------------------------ |
| Débitos de IBS  | Saídas/operações tributadas pelo IBS |
| Créditos de IBS | Aquisições que geram crédito de IBS  |
| Débitos de CBS  | Saídas/operações tributadas pela CBS |
| Créditos de CBS | Aquisições que geram crédito de CBS  |

## 3. Direito a créditos

A fonte recuperada aponta que o contribuinte sujeito ao regime regular pode apropriar créditos vinculados às aquisições, desde que a operação esteja permitida pela lei e seja comprovada por **documento fiscal idôneo**.

A Resolução CGIBS nº 6/2026, recuperada como fonte GOLD/CURRENT, reforça para o IBS que o crédito depende da extinção dos débitos relativos às operações em que o contribuinte seja adquirente e da comprovação por documento fiscal idôneo. Ela também confirma a apropriação segregada entre IBS e CBS e a vedação de compensar crédito de IBS com CBS.

## 4. Principais limites e cuidados antes de aplicar em uma empresa

Para aplicar a regra a uma empresa concreta, não basta dizer que “toda compra gera crédito”. É preciso verificar, no mínimo:

**1. Regime tributário da empresa**
A regra tratada aqui é do **regime regular**. Empresas do Simples Nacional, MEI, regimes específicos ou regimes diferenciados podem ter tratamento próprio.

**2. Natureza da aquisição**
A aquisição precisa estar vinculada a operação que permita crédito. A fonte recuperada menciona exceção para itens de **uso ou consumo pessoal** e outras hipóteses previstas na legislação/regulamento.

**3. Documento fiscal idôneo**
Sem documento fiscal correto, o crédito fica em risco. O XML/documento precisa refletir corretamente a operação, o fornecedor, os tributos destacados/extintos e a classificação fiscal aplicável.

**4. Extinção do débito na etapa anterior**
A regra recuperada relaciona a apropriação do crédito à extinção do débito da operação anterior, por uma das modalidades legais. Isso será especialmente relevante com split payment, compensações, recolhimentos e apuração assistida.

**5. Separação entre IBS e CBS**
A empresa não pode misturar os créditos. O controle deve demonstrar crédito de IBS e crédito de CBS separadamente.

**6. Operações com alíquota zero, isenção, imunidade ou redução**
Essas hipóteses têm regras próprias. A fonte de referência recuperada alerta que alíquota zero, isenção, imunidade e Simples podem afetar manutenção, limitação ou anulação de créditos.

**7. Fornecedor no Simples Nacional**
A fonte recuperada indica que há regra própria para aquisições de optantes pelo Simples. Antes de apropriar crédito, é necessário verificar se o fornecedor está no Simples, se recolhe IBS/CBS dentro ou fora do regime regular e qual valor efetivamente permite crédito.

**8. Cadastro fiscal e classificação**
Na prática, será necessário conferir NCM, NBS, CST, cClassTrib, natureza da operação e parametrização do ERP/emissor. Erro cadastral pode gerar crédito indevido ou bloqueio de crédito.

## Próximos passos para uma empresa

**Em 7 dias:** levantar fornecedores, tipos de compras, XMLs e documentos fiscais que hoje compõem a base de crédito.

**Em 30 dias:** criar uma matriz de créditos esperados por tipo de aquisição, separando IBS e CBS, fornecedor regular, fornecedor Simples, uso operacional, uso pessoal, ativo, insumos, serviços, fretes e despesas.

**Em 90 dias:** parametrizar ERP, revisar cadastros fiscais, criar relatório mensal de “crédito esperado x crédito apropriado” e definir evidências para compensação ou ressarcimento.

**Limite da resposta:** com a fonte recuperada, é seguro afirmar a regra geral da não cumulatividade e do direito a créditos no regime regular. Para aplicar a uma empresa específica, ainda faltam dados como regime atual, atividade/CNAE, tipo de operação, fornecedores, XMLs, CST/cClassTrib, NCM/NBS, natureza das aquisições, uso dos bens/serviços e parametrização do ERP.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
