# P4 — resposta nova da skill instalada

Base desta resposta: consulta própria de P4, preservada em `P4-response.json`, e checklist do Knowledge `current`.

## Resposta

Sem XML, retorno da rejeição e dados da operação, não consigo determinar CST, cClassTrib nem qual configuração do ERP deve ser alterada. Uma rejeição do grupo IBS/CBS pode envolver versão de leiaute, regra de validação ou parametrização da operação; os dados disponíveis não distinguem essas hipóteses.

A consulta trouxe um roteiro operacional de NF-e/NFC-e: identificar ERP e versão, testar em homologação, conferir o XML real e confrontar a parametrização por item. Fonte: `RAG-042-F5.8-nfe-nfce-layout-rtc.md`, caminho `rag/v2.2-prod-candidate/02_SILVER/RAG-042-F5.8-nfe-nfce-layout-rtc.md`, autoridade `Portal NF-e / Receita Federal / Documentos Fiscais`, versão do chunk `v2.0`, `SILVER/CURRENT`, citação permitida e `normative_allowed=false`, com [URL limpa de orientações da Receita Federal](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-2026). A ficha menciona a NT 2025.002 v1.40, mas registra como pendência verificar versões posteriores. Não é confirmação de que essa versão seja a aplicável hoje.

Para diagnosticar, reúna:

- Documento e modelo exato, data de emissão, UF/autorizador e ambiente de homologação ou produção.
- Nome e versão do ERP/emissor, versão do leiaute e pacote de schemas/NT implementado.
- XML completo anonimizado e retorno completo da rejeição, incluindo código/cStat, mensagem/xMotivo e item indicado, quando presentes.
- Regime/CRT do emitente; natureza da operação, CFOP, NCM/NBS pertinente, finalidade e eventuais tratamentos específicos.
- CST e cClassTrib tentados; IndOp/cIndOp quando aplicável; dados e regra fiscal do item que gerou a rejeição.

Use então este roteiro de investigação, sem alterar produção antes do diagnóstico:

1. Reproduzir o caso em homologação com dados anonimizados e guardar o XML e o retorno.
2. Identificar a regra associada ao código real da rejeição na NT de NF-e aplicável ao ambiente e à data.
3. Conferir na tabela vigente da NF-e a existência e compatibilidade dos códigos tentados e a relação com a operação; não escolher códigos apenas para fazer a nota passar.
4. Confrontar a regra com a documentação do ERP para localizar se a divergência está no cadastro, na regra fiscal ou na geração do XML.
5. Preparar a correção específica com o suporte/contador, testar o mesmo cenário e validar o resultado antes de aplicar.

O retorno inclui documentos GOLD de outros modelos, como [NF3e NT 2025.001 v1.14a](https://dfe-portal.svrs.rs.gov.br/NF3E/DownloadArquivoEstatico/?sistema=NF3E&tipoArquivo=3&nomeArquivo=NF3e_Nota_Tecnica_2025_001_RTC_v1.14a.pdf), `HG-023`, [NFCom NT 2025.001 v1.14a](https://dfe-portal.svrs.rs.gov.br/NFCOM/DownloadArquivoEstatico/?sistema=NFCOM&tipoArquivo=3&nomeArquivo=NFCom_Nota_Tecnica_2025_001_RTC_v1.14a.pdf), `HG-021`, e [CT-e NT 2025.001 v1.14b](https://dfe-portal.svrs.rs.gov.br/CTE/DownloadArquivoEstatico/?sistema=CTE&tipoArquivo=3&nomeArquivo=CTe_Nota_Tecnica_2025_001_RTC_v1.14b.pdf), `HG-017`. A autoridade retornada é `Portal DFe / Documentos Fiscais`, os metadados dizem `CURRENT`, uso normativo/citação permitidos e versão do chunk `v1.14`; os nomes identificam os sufixos a/b. Essas fontes ilustram validações de existência e compatibilidade de códigos, mas suas regras e códigos de rejeição não são transferidos para a NF-e. Há inclusive linhas de implementação futura dentro desses documentos correntes; isso não autoriza afirmar obrigatoriedade imediata na NF-e.

Apesar de `gaps=[]` e da indicação global de fonte oficial corrente, não veio a NT primária específica da NF-e nem a tabela vigente completa necessária para esse caso. Não houve chunk com lifecycle `FUTURE_EFFECTIVE` ou `ANNOUNCED_PENDING_ACT`; isso não elimina a ressalva temporal das regras individuais. Falta confirmar a versão aplicável no portal oficial e na documentação do ERP. O Knowledge local [04 — DFe, ERP e classificação](../../../knowledge/live-2026-08-22/04-dfe-erp-classificacao.md) sustenta a coleta de dados e a exigência de tabela vigente, sem classificar a operação.

O próximo passo é enviar ao contador/suporte esse conjunto de evidências e o código real da rejeição. Até isso ser analisado, nenhum CST, cClassTrib ou ajuste específico está validado.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
