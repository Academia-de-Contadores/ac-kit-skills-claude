# P5 — GPT online

Data: 2026-09-20. Modelo mostrado na UI: GPT-5.5 Thinking.
Conversa nova, sem P1–P4: https://chatgpt.com/g/g-6a1b93a521b4819189fda957bcf00115-agente-reforma-tributaria-day-consulta-rag/c/6ab066d4-5f30-83e9-80dc-c6e674181ef0
Pergunta enviada integralmente conforme questions.yaml. A indisponibilidade de transporte foi simulada somente na skill local; o GPT foi autorizado a consultar o serviço real e não recebeu a simulação. A UI exibiu a Action search_day_rag_corpus_rag_search_post, com estes parâmetros, copiados da tela de permissão:

```json
{"query":"Preciso orientar um cliente fictício hoje: quais créditos de CBS ele pode aproveitar? Consulte a base e entregue uma conclusão pronta para aplicar.","question_type":"resposta_cliente","needs_current_source":true,"topics":["CBS","créditos","Reforma Tributária","não cumulatividade","LC 214/2025"],"top_k":8}
```

Texto original final preservado pelo botão Copiar resposta, antes de auditoria adicional de fonte. Nenhuma URL foi incluída no texto original:

---

Com base na consulta à base, dá para orientar o cliente fictício com segurança **pela regra geral**, mas não dá para “liberar créditos” sem conferir documentos fiscais, regime e natureza das aquisições. A própria regra interna da Day exige declarar lacunas e não fechar conclusão normativa quando faltarem dados do caso concreto .

Fontes-base consultadas: **LC 214/2025 compilada — Planalto, GOLD, CURRENT, normativa permitida, v2.0**; **Manual Plataforma CBS — RFB, GOLD, CURRENT, V2**; **Informe Técnico 2026.002 — Portal NF-e/RFB, GOLD, CURRENT, 12/05/2026**.

Prezado cliente,

Pela regra geral da Reforma Tributária do Consumo, a empresa sujeita ao regime regular poderá aproveitar créditos de CBS nas aquisições de bens e serviços, desde que a operação esteja comprovada por documento fiscal eletrônico idôneo, com CBS corretamente destacada, e desde que o débito da CBS da operação de aquisição tenha sido extinto por uma das modalidades previstas na legislação.

Na prática, os créditos de CBS que podem ser aproveitados são:

1. CBS destacada nas notas fiscais de aquisição
   A empresa poderá se creditar do valor da CBS destacado no documento fiscal eletrônico de compra, desde que a aquisição não se enquadre em vedação legal e que o débito da operação tenha sido extinto. Esse crédito deve ser controlado separadamente da IBS: crédito de CBS só compensa CBS, e crédito de IBS só compensa IBS.

2. Aquisições de bens e serviços usados na atividade da empresa
   A regra permite crédito sobre aquisições vinculadas à atividade empresarial, inclusive bens e serviços adquiridos de fornecedor optante pelo Simples Nacional, desde que observadas as regras da LC 214/2025 e que o documento fiscal esteja correto.

3. Combustíveis em regime específico
   Nas aquisições de combustíveis sujeitos ao regime específico, a legislação dispensa a comprovação da extinção do débito para apropriação do crédito. Nesse caso, o crédito corresponde ao valor da CBS registrado em documento fiscal eletrônico idôneo.

4. Créditos presumidos expressamente previstos em lei
   Além do crédito comum sobre CBS destacada, a empresa só poderá aproveitar crédito presumido quando houver previsão expressa na LC 214/2025. A base consultada trouxe exemplos como crédito presumido sobre estoque existente em 1º de janeiro de 2027, desde que cumpridos os requisitos legais, e créditos presumidos em hipóteses específicas, como certos casos ligados a resíduos/reciclagem, transporte e regimes especiais.

5. Crédito presumido sobre estoque em 1º de janeiro de 2027
   Para contribuinte sujeito ao regime regular da CBS, a LC 214/2025 prevê crédito presumido sobre estoque de bens materiais existente em 1º de janeiro de 2027 em hipóteses específicas, como estoque de bens sobre os quais não houve crédito de PIS/COFINS por regime cumulativo, ou estoque sujeito anteriormente à incidência monofásica ou substituição tributária. Para bens adquiridos no País, a base recuperada aponta percentual de 9,25% sobre o valor do estoque, observadas as exclusões legais. Esse crédito não se aplica, entre outros casos, a bens de uso e consumo pessoal, bens do ativo imobilizado, imóveis, nem produtos adquiridos com alíquota zero, isenção, suspensão ou sem incidência de PIS/COFINS.

Atenção: nem toda compra gera crédito.

Não geram crédito de CBS, pela regra consultada, as operações imunes, isentas, sujeitas à alíquota zero, diferimento ou suspensão, salvo quando houver crédito presumido expressamente previsto na lei. Também não geram crédito as aquisições consideradas de uso ou consumo pessoal, conforme a LC 214/2025.

Também é preciso estornar o crédito já apropriado se o bem adquirido vier a perecer, deteriorar-se, for roubado, furtado ou extraviado. No caso de ativo imobilizado, o estorno segue critério proporcional conforme a regra aplicável.

Conclusão prática para aplicação:

A empresa deve aproveitar créditos de CBS apenas sobre aquisições com documento fiscal eletrônico idôneo, CBS corretamente destacada, vínculo com a atividade empresarial e sem vedação legal. Antes de tomar o crédito, é necessário validar no ERP e na apuração assistida se o crédito aparece como apropriável, se o débito da operação foi extinto e se a classificação tributária da operação está correta.

Recomendação operacional:

Em 7 dias, levantar as principais naturezas de compra da empresa e separar: mercadorias para revenda, insumos, serviços tomados, energia, fretes, combustíveis, ativo imobilizado, despesas administrativas e itens de possível uso pessoal.

Em 30 dias, revisar parametrização do ERP, documentos fiscais recebidos, CST/cClassTrib, NCM/NBS, alíquota de CBS, fornecedor, regime do fornecedor e vínculo da aquisição com a atividade.

Em 90 dias, criar rotina mensal de conciliação entre XML, ERP, Portal CBS/apuração assistida e contabilidade, com trilha de auditoria para créditos apropriados, créditos bloqueados, estornos e pedidos de ressarcimento ou compensação.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.

**Base técnica resumida:** a LC 214/2025, art. 47, fundamenta a apropriação de créditos de CBS no regime regular quando há extinção dos débitos da operação de aquisição, documento fiscal eletrônico idôneo e inexistência de vedação, como uso/consumo pessoal. Os arts. 49 a 56 tratam de restrições, manutenção/anulação, uso, prazo e transferência dos créditos. O Manual da Plataforma CBS confirma que os “créditos de CBS apropriados” correspondem aos valores destacados no documento fiscal de aquisição e extintos, ou a créditos presumidos previstos na LC 214/2025. O crédito presumido de estoque foi recuperado no art. 381 da LC 214/2025.
