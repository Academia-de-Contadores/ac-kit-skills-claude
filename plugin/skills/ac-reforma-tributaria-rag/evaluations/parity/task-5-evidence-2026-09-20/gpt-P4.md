# P4 — GPT online

Data: 2026-09-20. Modelo mostrado na UI: GPT-5.5 Thinking.
Conversa nova, sem P1/P2/P3: https://chatgpt.com/g/g-6a1b93a521b4819189fda957bcf00115-agente-reforma-tributaria-day-consulta-rag/c/6ab06665-c390-83e9-b200-4087be0636ae
Pergunta enviada integralmente conforme questions.yaml. A UI exibiu a Action search_day_rag_corpus_rag_search_post, com os parâmetros abaixo, copiados diretamente da tela de permissão. A consulta pública foi autorizada no botão Permitir. O JSON de resposta da Action não foi exposto na UI disponível.

```json
{"query":"Em uma NF-e fictícia, o ERP rejeita o grupo IBS/CBS do XML. Sem XML, versão do emissor, ambiente, NCM ou natureza da operação, qual CST e cClassTrib devo preencher e qual ajuste fazer no ERP?","question_type":"dfe_xml_erp","needs_current_source":true,"top_k":6,"filters":{"include_historical":false}}
```

Texto final preservado pelo botão Copiar resposta:

---

**Diagnóstico:** com esses dados, **não dá para indicar CST, cClassTrib nem ajuste específico no ERP**. Preencher “no chute” pode trocar a natureza tributária da operação, gerar rejeição por incompatibilidade ou criar histórico fiscal errado.

A base recuperada indica que, para NF-e/NFC-e, os pontos críticos são justamente **cClassTrib, CST IBS/CBS, destaque por operação, devolução por item, cIndOp e versão do ERP**. A rotina mínima recomendada é identificar ERP e versão, confirmar se o fornecedor implementou a **NT 2025.002 v1.40 ou posterior**, testar em homologação, conferir o **XML real** e montar amostra por produto com **NCM, CST, cClassTrib, benefício, alíquota e crédito**. Fonte: Portal NF-e/Receita Federal/Documentos Fiscais, status CURRENT, fonte SILVER, uso não normativo principal, versão/data indicada como v2.0: [https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-2026](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-2026)

**Por que não posso indicar o código agora:** as regras de validação dos documentos fiscais eletrônicos exigem que o **CST exista na tabela**, que o **cClassTrib exista na tabela**, e que ambos sejam **compatíveis entre si**. Também há validação para impedir cClassTrib não permitido no modelo de DFe e para exigir ou vedar o grupo de informações específicas do IBS/CBS conforme o CST informado. Essas regras aparecem em fontes oficiais de DFe para outros modelos, como NFCom, NF3e e CT-e, com status CURRENT e fonte GOLD; embora não sejam a NT específica da NF-e, confirmam a lógica técnica de validação por item: CST, cClassTrib e grupo IBS/CBS não são campos livres. Fontes: Portal DFe — NFCom NT 2025.001 v1.14a, NF3e NT 2025.001 v1.14a e CTe NT 2025.001 v1.14b:
[https://dfe-portal.svrs.rs.gov.br/NFCOM/DownloadArquivoEstatico/?sistema=NFCOM&tipoArquivo=3&nomeArquivo=NFCom_Nota_Tecnica_2025_001_RTC_v1.14a.pdf](https://dfe-portal.svrs.rs.gov.br/NFCOM/DownloadArquivoEstatico/?sistema=NFCOM&tipoArquivo=3&nomeArquivo=NFCom_Nota_Tecnica_2025_001_RTC_v1.14a.pdf)
[https://dfe-portal.svrs.rs.gov.br/NF3E/DownloadArquivoEstatico/?sistema=NF3E&tipoArquivo=3&nomeArquivo=NF3e_Nota_Tecnica_2025_001_RTC_v1.14a.pdf](https://dfe-portal.svrs.rs.gov.br/NF3E/DownloadArquivoEstatico/?sistema=NF3E&tipoArquivo=3&nomeArquivo=NF3e_Nota_Tecnica_2025_001_RTC_v1.14a.pdf)
[https://dfe-portal.svrs.rs.gov.br/CTE/DownloadArquivoEstatico/?sistema=CTE&tipoArquivo=3&nomeArquivo=CTe_Nota_Tecnica_2025_001_RTC_v1.14b.pdf](https://dfe-portal.svrs.rs.gov.br/CTE/DownloadArquivoEstatico/?sistema=CTE&tipoArquivo=3&nomeArquivo=CTe_Nota_Tecnica_2025_001_RTC_v1.14b.pdf)

**Resposta objetiva:**
Não preencha CST nem cClassTrib sem XML, versão do emissor, ambiente, NCM/NBS, natureza da operação, CRT/regime do emitente, CST tentado, cClassTrib tentado, IndOp quando aplicável e mensagem/cStat da rejeição. O ajuste no ERP também não deve ser “forçar tag” ou “zerar grupo” sem diagnóstico. O caminho correto é:

1. conferir se o ERP/emissor está atualizado para a NT de NF-e/NFC-e aplicável à RTC, especialmente NT 2025.002 v1.40 ou posterior;
2. emitir em **homologação**, não em produção, até validar;
3. capturar o XML rejeitado e o retorno completo da SEFAZ, com cStat, xMotivo e nItem;
4. validar se o CST existe na tabela vigente;
5. validar se o cClassTrib existe e é permitido para NF-e;
6. validar se o CST é compatível com o cClassTrib;
7. verificar se o CST exige, veda ou dispensa o grupo gIBSCBS;
8. conferir NCM, operação, benefício, redução, crédito presumido, alíquotas e campos obrigatórios por item;
9. só depois parametrizar cadastro de produto, regra fiscal, natureza de operação/CFOP e mapeamento do layout XML no ERP.

**Próximo passo prático:** peça ao cliente ou ao suporte do ERP estes itens: XML completo, retorno da rejeição, versão do emissor, ambiente, NCM, CFOP, natureza da operação, CRT/regime, CST e cClassTrib usados, e print da regra fiscal do item. Sem isso, a resposta tecnicamente segura é: **não há base para definir CST, cClassTrib ou ajuste no ERP**.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
