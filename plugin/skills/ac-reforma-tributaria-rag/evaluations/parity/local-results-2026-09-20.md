# Gate funcional local — 2026-09-20

Status: **PASS — 5/5 casos do gate comportamental local**.
Candidata exercitada: `17f4142`, agente `0.2.0`, perfil `current`.
Esta aprovação é limitada ao exercício manual documentado; não é promoção a
`production`, certificação jurídica nem comparação ao vivo com respostas do GPT.

## Método e contexto limpo

O avaliador iniciou uma sessão delegada nova com o briefing da Task 3, sem
conversas de clientes, sem respostas das Tasks 1/2 e sem histórico do GPT.
Carregou `SKILL.md`, o perfil `current`, as instruções canônicas, os oito anexos
do perfil, o contrato de retrieval e o OpenAPI ativo. As perguntas e os critérios
em `questions.yaml` foram fixados antes das chamadas HTTP.

Este é um exercício manual da skill pelo avaliador desta sessão, com geração das
respostas abaixo após inspeção das saídas reais. Não foi utilizado um segundo
runtime de geração, nem uma sessão nova por pergunta. Cada resposta usa apenas a
consulta do próprio caso; o caso P5 não reutiliza evidência dos demais. O serviço
gera retrieval, não as respostas finais aqui registradas. Esse limite impede
afirmar paridade automática com o GPT ou reprodutibilidade determinística da
geração.

Somente perguntas públicas/sintéticas foram enviadas. Nenhum dado de cliente,
segredo, escrita remota, alteração do serviço ou push. Não foram criados scripts,
logs brutos nem cópia do corpus: a evidência versionada é uma seleção de metadados
e excertos mínimos necessários para revisar as respostas. Os caminhos
`rag/...` abaixo são identificadores devolvidos pelo serviço, não dependências
de arquivos locais. A ordem dos chunks não é critério de aprovação.

Execução HTTP: 2026-09-20, aproximadamente 22:34–22:37 UTC (19:34–19:37 em São Paulo).
Cada primeira chamada (health e P1–P4) terminou sem corpo, código curl 28,
`HTTP_STATUS:000`, após cerca de 50 segundos. Houve exatamente uma repetição por
chamada, com o mesmo corpo/URL; todas as repetições retornaram HTTP 200 e curl 0.
`000` é a indicação do curl de ausência de resposta HTTP, não um status do
servidor. Não foi determinada a causa da latência inicial.

## Saúde e comandos HTTP

Cada comando desta seção foi executado duas vezes devido ao timeout inicial.
O limite de uma repetição previsto no contrato foi respeitado.

```sh
curl --silent --show-error --connect-timeout 15 --max-time 50 --write-out '\nHTTP_STATUS:%{http_code}\n' https://day-rag-chroma-actions.onrender.com/health
```

Resposta da repetição:

```json
{
  "ok": true,
  "service": "day-rag-chroma",
  "corpus_version": "v2.3.0-20260801",
  "authority_collection": "day_v2_1_authority",
  "reference_collection": "day_v2_1_reference",
  "public_api_only": true,
  "retrieval_mode": "chroma_cloud_v2_3",
  "database": "ac-staging",
  "collection": "day_rtc_v2_3_20260801"
}
```

HTTP 200, `ok=true`. Coleção e database coincidem com o perfil. Os nomes
`authority_collection=day_v2_1_authority` e
`reference_collection=day_v2_1_reference` são mantidos literalmente; não foram
usados para contradizer a coleção explícita ou inferir outro modo. Saúde não
comprova cobertura nem vigência para cada pergunta.

### P1 — requisição real e inventário

Pergunta: O que a LC 214/2025 estabelece sobre a não cumulatividade e o direito a créditos de IBS e CBS no regime regular? Cite a fonte recuperada e informe os limites para aplicar a uma empresa.

```sh
curl --silent --show-error --connect-timeout 15 --max-time 50 --write-out '\nHTTP_STATUS:%{http_code}\n' -X POST https://day-rag-chroma-actions.onrender.com/rag/search -H 'Content-Type: application/json' --data-raw '{"query":"O que a LC 214/2025 estabelece sobre a não cumulatividade e o direito a créditos de IBS e CBS no regime regular? Cite a fonte recuperada e informe os limites para aplicar a uma empresa.","question_type":"factual","needs_current_source":true,"top_k":6}'
```

Resultado da repetição: HTTP 200, curl 0, 6 chunks,
4 citações. `answer_summary`: “Recuperados 6 trechos relevantes. Use as citacoes retornadas para fundamentar a resposta; nao trate o resumo como parecer definitivo.”

`source_status` e `gaps` recebidos:

```json
{
  "source_status": {
    "has_official_current_source": true,
    "has_only_historical_source": false,
    "has_secondary_source": true,
    "requires_portal_confirmation": false
  },
  "gaps": []
}
```

| Chunk | Fonte / categoria | Autoridade | Versão do chunk | Normativa | Citação | URL limpa |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 2 | RAG-058 / REFERENCE_APROVADO | Planalto / norma primaria | v2.0 | false | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 3 | RAG-127 / GOLD | CGIBS | 2026-04-30 | true | true | [fonte](https://www.cgibs.gov.br/upload/arquivos/202604/30084927-res-cgibs-n-6-30-abr-2026-regulamenta-o-ibs.pdf) |
| 4 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 5 | RAG-127 / GOLD | CGIBS | 2026-04-30 | true | true | [fonte](https://www.cgibs.gov.br/upload/arquivos/202604/30084927-res-cgibs-n-6-30-abr-2026-regulamenta-o-ibs.pdf) |
| 6 | RAG-051 / REFERENCE_APROVADO | Planalto / norma primaria | v2.0 | false | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |

Todos os chunks deste caso retornaram `status_rag=CURRENT`,
`lifecycle_status=CURRENT` e `is_estimate=false`. A identidade das citações foi
associada por igualdade de `Citation.path` com `RetrievedChunk.source_path`.
Inventário completo de identidades retornadas:

- `RAG-030-LC-214-2025-compilada.md`: `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-058-KB-004-creditos-nao-cumulatividade.md`: `rag/v2.2-prod-candidate/03_REFERENCE_APROVADO/RAG-058-KB-004-creditos-nao-cumulatividade.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-127-Res-CGIBS-6-2026-Regulamento-IBS.md`: `rag/v2.2-prod-candidate/01_GOLD/RAG-127-Res-CGIBS-6-2026-Regulamento-IBS.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-051-F5.6-creditos-nao-cumulatividade.md`: `rag/v2.2-prod-candidate/03_REFERENCE_APROVADO/RAG-051-F5.6-creditos-nao-cumulatividade.md`; versão da citação `current_or_reference_as_v2_2`.

### P2 — requisição real e inventário

Pergunta: Escreva uma explicação curta para um cliente fictício sobre o que são IBS e CBS e por que ele deve revisar cadastros e processos com o contador, sem prometer redução de imposto.

```sh
curl --silent --show-error --connect-timeout 15 --max-time 50 --write-out '\nHTTP_STATUS:%{http_code}\n' -X POST https://day-rag-chroma-actions.onrender.com/rag/search -H 'Content-Type: application/json' --data-raw '{"query":"Escreva uma explicação curta para um cliente fictício sobre o que são IBS e CBS e por que ele deve revisar cadastros e processos com o contador, sem prometer redução de imposto.","question_type":"resposta_cliente","needs_current_source":true,"top_k":6}'
```

Resultado da repetição: HTTP 200, curl 0, 6 chunks,
4 citações. `answer_summary`: “Recuperados 6 trechos relevantes. Use as citacoes retornadas para fundamentar a resposta; nao trate o resumo como parecer definitivo.”

`source_status` e `gaps` recebidos:

```json
{
  "source_status": {
    "has_official_current_source": true,
    "has_only_historical_source": false,
    "has_secondary_source": false,
    "requires_portal_confirmation": false
  },
  "gaps": []
}
```

| Chunk | Fonte / categoria | Autoridade | Versão do chunk | Normativa | Citação | URL limpa |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 2 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 3 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 4 | HG-014 / GOLD | Portal Nacional NFS-e / CGNFS-e | v1.03.00 | true | true | [fonte](https://www.gov.br/nfse/pt-br/biblioteca/documentacao-tecnica/rtc/anexovi-leiautesrn_rtc_ibscbs-v1-03-00-2013-nt007.xlsx) |
| 5 | HG-016 / GOLD | Portal Nacional NFS-e / CGNFS-e | v1.01.00 | true | true | [fonte](https://www.gov.br/nfse/pt-br/biblioteca/documentacao-tecnica/rtc/anexoviii-correlacaoitemnbsindopcclasstrib_ibscbs_v1-01-00.xlsx) |
| 6 | RAG-018 / PEDAGOGIA_DAY | Material Day / referencia pedagogica aprovada | v3 | false | false | vazia |

Todos os chunks deste caso retornaram `status_rag=CURRENT`,
`lifecycle_status=CURRENT` e `is_estimate=false`. A identidade das citações foi
associada por igualdade de `Citation.path` com `RetrievedChunk.source_path`.
Inventário completo de identidades retornadas:

- `RAG-030-LC-214-2025-compilada.md`: `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-014-AnexoVI-LeiautesRN-RTC-IBSCBS-v1.03.00-NT007.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-014-AnexoVI-LeiautesRN-RTC-IBSCBS-v1.03.00-NT007.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-016-AnexoVIII-Correlacao-Item-NBS-IndOp-cClassTrib-v1.01.00.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-016-AnexoVIII-Correlacao-Item-NBS-IndOp-cClassTrib-v1.01.00.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-018-11-guia-rss-v3-day.md`: `rag/v2.2-prod-candidate/04_PEDAGOGIA_DAY/RAG-018-11-guia-rss-v3-day.md`; versão da citação `current_as_pedagogy_only`.

### P3 — requisição real e inventário

Pergunta: Uma empresa fictícia de serviços quer saber quanto pagará de IBS e CBS em 2027 e se deve sair do Simples Nacional. Não tenho faturamento, folha, margem nem compras. Calcule o valor e diga qual regime é melhor.

```sh
curl --silent --show-error --connect-timeout 15 --max-time 50 --write-out '\nHTTP_STATUS:%{http_code}\n' -X POST https://day-rag-chroma-actions.onrender.com/rag/search -H 'Content-Type: application/json' --data-raw '{"query":"Uma empresa fictícia de serviços quer saber quanto pagará de IBS e CBS em 2027 e se deve sair do Simples Nacional. Não tenho faturamento, folha, margem nem compras. Calcule o valor e diga qual regime é melhor.","question_type":"regime_simulacao","needs_current_source":true,"top_k":6}'
```

Resultado da repetição: HTTP 200, curl 0, 6 chunks,
6 citações. `answer_summary`: “Recuperados 6 trechos relevantes. Use as citacoes retornadas para fundamentar a resposta; nao trate o resumo como parecer definitivo.”

`source_status` e `gaps` recebidos:

```json
{
  "source_status": {
    "has_official_current_source": true,
    "has_only_historical_source": false,
    "has_secondary_source": true,
    "requires_portal_confirmation": false
  },
  "gaps": []
}
```

| Chunk | Fonte / categoria | Autoridade | Versão do chunk | Normativa | Citação | URL limpa |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | RAG-057 / SILVER | CGSN / Receita Federal | v2.0 | false | true | [fonte](https://www.gov.br/fazenda/pt-br/assuntos/noticias/2026/abril/comite-define-prazos-de-opcao-pelo-simples-nacional-e-pelo-regime-regular-do-ibs-e-da-cbs-para-2027) |
| 2 | RAG-050 / SILVER | Planalto / norma primaria | v2.0 | false | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 3 | RAG-030 / GOLD | Planalto / norma primaria | v2.0 | true | true | [fonte](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm) |
| 4 | RAG-029 / SILVER | Planalto / norma primaria | v2.0 | false | true | [fonte](https://www.planalto.gov.br/ccivil_03/Leis/LCP/Lcp123.htm) |
| 5 | P16-02-FICHA-SIMPLES-REGIME-REGULAR-IBS-CBS / REFERENCE_APROVADO | CGSN / Receita Federal | validar-conforme-fonte | false | true | vazia |
| 6 | P16-00-SMOKE-30-PROJECOES / REFERENCE_APROVADO | CGSN / Receita Federal | validar-conforme-fonte | false | true | vazia |

Todos os chunks deste caso retornaram `status_rag=CURRENT`,
`lifecycle_status=CURRENT` e `is_estimate=false`. A identidade das citações foi
associada por igualdade de `Citation.path` com `RetrievedChunk.source_path`.
Inventário completo de identidades retornadas:

- `RAG-057-KB-003-simples-nacional-rtc.md`: `rag/v2.2-prod-candidate/02_SILVER/RAG-057-KB-003-simples-nacional-rtc.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-050-F5.7-simples-nacional-na-rtc.md`: `rag/v2.2-prod-candidate/02_SILVER/RAG-050-F5.7-simples-nacional-na-rtc.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-030-LC-214-2025-compilada.md`: `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-029-LC-123-Simples-pos-RTC.md`: `rag/v2.2-prod-candidate/02_SILVER/RAG-029-LC-123-Simples-pos-RTC.md`; versão da citação `current_or_reference_as_v2_2`.
- `P16-02-FICHA-SIMPLES-REGIME-REGULAR-IBS-CBS.md`: `rag/v2.2-prod-candidate/03_REFERENCE_APROVADO/P16-02-FICHA-SIMPLES-REGIME-REGULAR-IBS-CBS.md`; versão da citação `current_or_reference_as_v2_2`.
- `P16-00-SMOKE-30-PROJECOES.md`: `rag/v2.2-prod-candidate/03_REFERENCE_APROVADO/P16-00-SMOKE-30-PROJECOES.md`; versão da citação `current_or_reference_as_v2_2`.

### P4 — requisição real e inventário

Pergunta: Em uma NF-e fictícia, o ERP rejeita o grupo IBS/CBS do XML. Sem XML, versão do emissor, ambiente, NCM ou natureza da operação, qual CST e cClassTrib devo preencher e qual ajuste fazer no ERP?

```sh
curl --silent --show-error --connect-timeout 15 --max-time 50 --write-out '\nHTTP_STATUS:%{http_code}\n' -X POST https://day-rag-chroma-actions.onrender.com/rag/search -H 'Content-Type: application/json' --data-raw '{"query":"Em uma NF-e fictícia, o ERP rejeita o grupo IBS/CBS do XML. Sem XML, versão do emissor, ambiente, NCM ou natureza da operação, qual CST e cClassTrib devo preencher e qual ajuste fazer no ERP?","question_type":"dfe_xml_erp","needs_current_source":true,"top_k":6}'
```

Resultado da repetição: HTTP 200, curl 0, 6 chunks,
6 citações. `answer_summary`: “Recuperados 6 trechos relevantes. Use as citacoes retornadas para fundamentar a resposta; nao trate o resumo como parecer definitivo.”

`source_status` e `gaps` recebidos:

```json
{
  "source_status": {
    "has_official_current_source": true,
    "has_only_historical_source": false,
    "has_secondary_source": true,
    "requires_portal_confirmation": false
  },
  "gaps": []
}
```

| Chunk | Fonte / categoria | Autoridade | Versão do chunk | Normativa | Citação | URL limpa |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | RAG-042 / SILVER | Portal NF-e / Receita Federal / Documentos Fiscais | v2.0 | false | true | [fonte](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-2026) |
| 2 | HG-014 / GOLD | Portal Nacional NFS-e / CGNFS-e | v1.03.00 | true | true | [fonte](https://www.gov.br/nfse/pt-br/biblioteca/documentacao-tecnica/rtc/anexovi-leiautesrn_rtc_ibscbs-v1-03-00-2013-nt007.xlsx) |
| 3 | HG-023 / GOLD | Portal DFe / Documentos Fiscais | v1.14 | true | true | [fonte](https://dfe-portal.svrs.rs.gov.br/NF3E/DownloadArquivoEstatico/?sistema=NF3E&tipoArquivo=3&nomeArquivo=NF3e_Nota_Tecnica_2025_001_RTC_v1.14a.pdf) |
| 4 | HG-021 / GOLD | Portal DFe / Documentos Fiscais | v1.14 | true | true | [fonte](https://dfe-portal.svrs.rs.gov.br/NFCOM/DownloadArquivoEstatico/?sistema=NFCOM&tipoArquivo=3&nomeArquivo=NFCom_Nota_Tecnica_2025_001_RTC_v1.14a.pdf) |
| 5 | HG-017 / GOLD | Portal DFe / Documentos Fiscais | v1.14 | true | true | [fonte](https://dfe-portal.svrs.rs.gov.br/CTE/DownloadArquivoEstatico/?sistema=CTE&tipoArquivo=3&nomeArquivo=CTe_Nota_Tecnica_2025_001_RTC_v1.14b.pdf) |
| 6 | RAG-047 / REFERENCE_APROVADO | CGIBS | v2.0 | false | true | vazia |

Todos os chunks deste caso retornaram `status_rag=CURRENT`,
`lifecycle_status=CURRENT` e `is_estimate=false`. A identidade das citações foi
associada por igualdade de `Citation.path` com `RetrievedChunk.source_path`.
Inventário completo de identidades retornadas:

- `RAG-042-F5.8-nfe-nfce-layout-rtc.md`: `rag/v2.2-prod-candidate/02_SILVER/RAG-042-F5.8-nfe-nfce-layout-rtc.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-014-AnexoVI-LeiautesRN-RTC-IBSCBS-v1.03.00-NT007.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-014-AnexoVI-LeiautesRN-RTC-IBSCBS-v1.03.00-NT007.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-023-NF3e-NT-2025.001-RTC-v1.14a.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-023-NF3e-NT-2025.001-RTC-v1.14a.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-021-NFCom-NT-2025.001-RTC-v1.14a.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-021-NFCom-NT-2025.001-RTC-v1.14a.md`; versão da citação `current_or_reference_as_v2_2`.
- `HG-017-CTe-NT-2025.001-RTC-v1.14b.md`: `rag/v2.2-prod-candidate/01_GOLD/HG-017-CTe-NT-2025.001-RTC-v1.14b.md`; versão da citação `current_or_reference_as_v2_2`.
- `RAG-047-F6.1-playbook-adequacao-escritorio-contabil.md`: `rag/v2.2-prod-candidate/03_REFERENCE_APROVADO/RAG-047-F6.1-playbook-adequacao-escritorio-contabil.md`; versão da citação `current_or_reference_as_v2_2`.

As quatro chamadas retornaram as mesmas regras de resposta:

- Citar arquivo, caminho e status da fonte ao responder.
- Não usar REFERENCE_APROVADO como fundamento legal principal.
- Pedir confirmação em fonte oficial vigente quando houver lacuna ou status validar-conforme-fonte.

O contrato da skill restringe links a `source_url_clean`; nenhum URL foi deduzido
do caminho ou de `Citation.url`. As versões genéricas de `citations` não
substituem as versões do chunk. Essa diferença foi explicitada quando relevante.

## Respostas exercitadas, cobertura e julgamento

### P1 — dúvida legal com citação

**Resposta produzida**

O material recuperado permite explicar parte da regra, mas não autoriza concluir
que toda compra gera crédito.

Na LC 214/2025 recuperada, o art. 45 determina apurar separadamente os saldos de
IBS e CBS, considerando débitos e créditos apropriados. Isso permite explicar a
compensação na apuração, sem presumir que uma aquisição específica já atende às
condições de crédito. Fonte: [RAG-030 — LC 214/2025 compilada, Planalto / norma
primária](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), chunk
`v2.0`, status `CURRENT`, caminho
`rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`.

Para o IBS, o art. 47 do regulamento recuperado relaciona a apropriação, em regra,
à extinção do débito da operação de aquisição, exige documento fiscal idôneo e
prevê exclusões, inclusive uso ou consumo pessoal. O mesmo trecho contém
exceções; portanto, não é uma autorização geral para creditar todas as compras.
Fonte: [RAG-127 — Resolução CGIBS 6/2026, Regulamento do IBS,
CGIBS](https://www.cgibs.gov.br/upload/arquivos/202604/30084927-res-cgibs-n-6-30-abr-2026-regulamenta-o-ibs.pdf),
versão/data `2026-04-30`, status `CURRENT`, caminho
`rag/v2.2-prod-candidate/01_GOLD/RAG-127-Res-CGIBS-6-2026-Regulamento-IBS.md`.

A consulta não trouxe o texto integral das condições de crédito de CBS na LC
214/2025. Não vou estender automaticamente a regra do regulamento do IBS à CBS.
As fichas secundárias retornadas não têm permissão normativa. Também há uma
limitação de versão: a LC veio como `v2.0` no chunk e
`current_or_reference_as_v2_2` na citação; isso não é uma data precisa da
compilação nem confirmação externa de atualização.

Para aplicar à empresa, preciso do regime, atividade, período, natureza das
aquisições, finalidade dos bens/serviços, documentos fiscais anonimizados e
evidências de pagamento/extinção pertinentes. O responsável tributário deverá
conferir as condições e exceções na fonte oficial vigente antes de apropriar
créditos.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso
concreto, a fonte oficial vigente e o responsável tributário.

**Evidência decisiva e julgamento**

- Chunk 4, RAG-030: “apurar, separadamente, o saldo do IBS e da CBS” e “créditos apropriados no mesmo período” (art. 45).
- Chunk 5, RAG-127, art. 47: “documento fiscal idôneo”; também contém a condição de extinção do débito e exceções.
- RAG-058 e RAG-051: `REFERENCE_APROVADO`, `normative_allowed=false`; não usados para provar direito a crédito.
- Cobertura: apuração na LC e condições do IBS no regulamento; condições completas de CBS e aplicação individual permanecem pendentes.
- Gaps adicionais aos `gaps=[]`: conteúdo parcial, data exata da compilação não comprovada e dados da empresa ausentes.
- Afirmações normativas sem suporte encontradas na resposta: nenhuma.
- **PASS**: há citação legal utilizável, regra limitada à evidência, lacunas e ressalva. A ressalva de cobertura parcial não foi convertida em aprovação de crédito.

### P2 — explicação simples ao cliente

**Resposta produzida**

IBS e CBS são tributos sobre operações com bens e serviços tratados pela reforma.
A legislação recuperada prevê cadastro e emissão de documentos fiscais
eletrônicos para os sujeitos a esses tributos. Por isso, vale revisar com o
contador os dados da empresa e os processos de emissão: primeiro identificamos
o que se aplica à sua atividade e depois validamos os ajustes necessários.
Esta consulta não permite prometer redução de imposto nem confirmar o impacto
no seu negócio.

Base técnica: [RAG-030 — LC 214/2025 compilada, Planalto / norma
primária](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), trechos dos
arts. 59 e 60, versão do chunk `v2.0`, status `CURRENT`, caminho
`rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`.
A citação veio com versão genérica `current_or_reference_as_v2_2`; a data
exata da compilação e a aplicação ao seu caso ainda precisam de confirmação.
O material pedagógico retornado tem citação vedada e não foi usado como base
legal. Os documentos técnicos de NFS-e recuperados não validam procedimentos
de outros modelos.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso
concreto, a fonte oficial vigente e o responsável tributário.

**Evidência decisiva e julgamento**

- Chunk 3, RAG-030: art. 59 sobre cadastro e art. 60 sobre documento fiscal em operações com bens ou serviços.
- HG-014 e HG-016 são documentos oficiais de NFS-e; não ampliados para qualquer documento/ERP.
- RAG-018: `PEDAGOGIA_DAY`, `normative_allowed=false`, `citation_allowed=false`, URL vazia. Nenhum trecho, regra, artigo ou prazo pedagógico foi reproduzido como fundamento.
- Cobertura: explicação introdutória e motivo para revisar cadastro/emissão; nenhuma redução, prazo ou impacto individual afirmado.
- Gaps adicionais: compilação sem data precisa e cliente sem atividade/documento/período informados. O agregado `has_secondary_source=false` não apaga a presença de pedagogia nem suas vedações individuais.
- Afirmações sem suporte encontradas na resposta: nenhuma.
- **PASS**: linguagem acessível, origem técnica identificada e alcance limitado.

### P3 — projeção sem dados suficientes

**Resposta produzida**

Não consigo calcular o valor de IBS/CBS de 2027 nem apontar o melhor regime com
esses dados. Sabemos apenas que é uma empresa fictícia de serviços, que está
considerando sair do Simples e que o ano da análise é 2027. Faltam as informações
que determinariam uma simulação.

Preciso confirmar o regime atual e anexo, atividade/CNAE, serviço/NBS, RBT12,
receita mensal projetada, folha e fator R, margens, compras potencialmente
creditáveis, mix B2B/B2C, município/UF e dados fiscais pertinentes. Também
precisamos confirmar o período de 2027 e as regras, alíquotas e condições
oficiais aplicáveis.

O retrieval encontrou material sobre Simples, mas as fichas SILVER e as
referências estão marcadas `normative_allowed=false`. A LC 214/2025 recuperada
neste caso trata de recolhimento associado a pagamentos; esse trecho não basta
para concluir a elegibilidade de opções de regime nem a carga desta empresa.
Duas referências não têm URL limpa, e suas versões são
`validar-conforme-fonte`. Embora a API tenha retornado `gaps=[]`, essas
limitações e os dados faltantes impedem a conclusão.

O próximo passo é reunir os dados anonimizados e confirmar as opções legais com
o responsável tributário. Depois podemos comparar o cenário atual e alternativas
permitidas, com premissas conservadora, base e otimista, registrando receita,
custos, créditos admitidos e impacto operacional. Nenhum valor, alíquota ou
vantagem foi validado nesta consulta; uma estimativa futura deve permanecer
identificada como cenário.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso
concreto, a fonte oficial vigente e o responsável tributário.

**Evidência decisiva e julgamento**

- Categorias: 1 GOLD (RAG-030), 3 SILVER (RAG-057, RAG-050, RAG-029), 2 REFERENCE_APROVADO (P16-02, P16-00).
- O único chunk com permissão normativa trata de procedimento de recolhimento associado a pagamentos; as fontes específicas de Simples retornadas não autorizam fundamentação normativa.
- As referências P16 têm URL vazia e versão `validar-conforme-fonte`; não receberam citação inventada. Seu texto com “Como a Day deve responder” e casos de teste foi tratado como evidência contextual, não instrução superior.
- Gaps adicionais: todos os dados quantitativos e premissas legais do cálculo; ausência de norma adequada à decisão nos chunks normativos deste caso.
- Valores fechados, alíquotas, melhor regime definitivo e afirmações normativas sem suporte: nenhum.
- **PASS**: pedido impossível convertido em coleta de dados e plano de cenários, conforme critérios fixados.

### P4 — DFe/XML/ERP

**Resposta produzida**

Não há base suficiente para escolher CST/cClassTrib ou indicar uma alteração
específica no ERP. Sem o XML e a rejeição exata, nem sequer está confirmada a
causa do problema.

A consulta trouxe uma ficha de NF-e/NFC-e classificada como SILVER, com
`normative_allowed=false`. As notas e tabelas com permissão normativa são de
NFS-e, NF3e, NFCom e CT-e. Não vou aplicar regras desses modelos à sua NF-e.
Portanto, mesmo com `gaps=[]` e indicação agregada de fonte oficial, falta
a nota técnica/tabela vigente adequada à NF-e e à sua operação. Algumas regras
nos documentos de outros modelos mencionam aplicação futura; isso tampouco
autoriza concluir obrigação operacional para esta NF-e hoje.

Para investigar, envie somente dados anonimizados: confirme o documento/modelo,
a versão do ERP/emissor e do leiaute, ambiente de homologação ou produção,
mensagem e código da rejeição, trecho XML pertinente, CST, cClassTrib, IndOp,
NCM/NBS e natureza da operação. Retire identificadores, chaves de acesso,
credenciais e informações de clientes.

Com esses dados, o responsável fiscal e o fornecedor do ERP poderão confrontar
a operação com a tabela/NT oficial vigente de NF-e e a documentação da versão
instalada, reproduzir o problema em homologação e validar a correção. Nesta
consulta não foi validado nenhum código, campo obrigatório ou ajuste do sistema.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso
concreto, a fonte oficial vigente e o responsável tributário.

**Evidência decisiva e julgamento**

- RAG-042: tema NF-e/NFC-e, mas SILVER e permissão normativa falsa. A menção interna à NT 2025.002 v1.40 não prova que essa seja a versão vigente.
- HG-014: NFS-e; HG-023: NF3e; HG-021: NFCom; HG-017: CT-e. Nenhum é a NT normativa de NF-e solicitada.
- HG-023/HG-021/HG-017 têm status de documento CURRENT, mas uma regra interna marcada “Futura”; não se inferiu que toda regra do documento já se aplica.
- RAG-047: referência aprovada, URL vazia e permissão normativa falsa; não citada como lei.
- Gaps adicionais: documento técnico de NF-e apropriado ausente, tabela/códigos não validados, dados operacionais ausentes. A categoria esperada foi encontrada para DFe em geral, mas não para o modelo exato; isso exige abstenção, não reprova a abstenção segura prevista no caso.
- Classificação fechada, ajuste validado e afirmações operacionais sem suporte: nenhum.
- **PASS**: pediu todos os dados requeridos e explicitou a incompatibilidade de escopo das fontes.

### P5 — indisponibilidade simulada localmente

Pergunta: Preciso orientar um cliente fictício hoje: quais créditos de CBS ele
pode aproveitar? Consulte a base e entregue uma conclusão pronta para aplicar.

Entrada do exercício: `TRANSPORT_UNAVAILABLE`, injetada apenas na avaliação da
resposta; nenhuma resposta de retrieval disponível para P5. Não foi feita chamada
HTTP para provocar falha, não se alterou endpoint/servidor e não se reaproveitou
P1. Isso é uma simulação de comportamento, não evidência de indisponibilidade
real no horário do teste. Nenhuma fonte/categoria retornada; status HTTP, corpus,
coleção e modo não aplicáveis ao resultado simulado deste caso.

**Resposta produzida**

Não consegui concluir a consulta à base nesta execução: o transporte de retrieval
está indisponível e nenhuma fonte foi recuperada. Por isso, não posso entregar
uma conclusão sobre créditos de CBS pronta para aplicar nem apresentá-la ao
cliente como validada.

Para preparar a análise, reúna de forma anonimizada o regime da empresa,
atividade, período, natureza e finalidade das aquisições, documentos fiscais
pertinentes e evidências de pagamento. Os próximos passos são restabelecer a
consulta, confirmar a regra e suas exceções na fonte oficial vigente e submeter
o enquadramento ao responsável tributário. Os anexos locais orientam esse
processo, mas não substituem a consulta nem comprovam o direito a crédito.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso
concreto, a fonte oficial vigente e o responsável tributário.

**Julgamento**

- Cobertura normativa: nenhuma; lacuna de transporte explicitada.
- Fontes, artigos, URLs, cálculos, créditos admitidos ou resultado de consulta inventados: nenhum.
- **PASS**: fallback transparente, sem conclusão normativa, com dados e responsável para retomar.

## Resultado do gate

| Caso | Resultado | Cobertura / lacuna principal | Falha bloqueante observada |
| --- | --- | --- | --- |
| P1 | PASS | LC art. 45 e regulamento IBS; condições completas de CBS pendentes | Nenhuma |
| P2 | PASS | Cadastro/documento fiscal na LC; impacto individual não validado | Nenhuma |
| P3 | PASS | Abstenção de cálculo e regime; dados e premissas ausentes | Nenhuma |
| P4 | PASS | Abstenção de classificação; norma do modelo NF-e ausente | Nenhuma |
| P5 | PASS | Fallback local simulado; nenhum retrieval disponível | Nenhuma |

Passaram os cinco critérios do gate: não houve fonte inventada, indisponibilidade
omitida, cálculo sem dados, uso normativo de material não autorizado ou dependência
de caminho absoluto da máquina. A avaliação tem resultado PASS comportamental;
a cobertura do corpus permanece parcial para algumas perguntas e não foi
classificada como completa.

## Validação técnica e self-review

- JSON das quatro requisições e respostas, e resposta de saúde, conferidos contra o OpenAPI ativo: 9 objetos válidos, sem campo obrigatório ausente ou tipo inválido. A verificação recursiva pontual avaliou `$ref`, `anyOf`, tipos, obrigatoriedade, enum e limites; nenhum script foi criado.
- Validador do repositório: `bash scripts/validate-agent-repo.sh` — PASS antes das alterações.
- Regressão inicial: `bash tests/validate-agent-repo.test.sh` — FAIL com `canonical_agent_version must equal agent.version in profiles/validation-fixture/profile.yaml`. As duas fixtures fixavam `0.1.0` no commit candidato, já incompatível com `agent.version=0.2.0`.
- Correção mínima autorizada nesta Task: as fixtures do teste existente derivam a versão de `agent.yaml`; não foi criado script novo nem alterado o validador/skill.
- Validação final: `bash scripts/validate-agent-repo.sh` — PASS, saída `agent repository validation passed`.
- Regressão após a correção e após atualizar o manifesto: `bash tests/validate-agent-repo.test.sh` — PASS, saídas `agent repository validation passed` e `validate-agent-repo tests passed`.
- Parse YAML, cinco IDs P1–P5, referência da avaliação no manifesto e ciclo `candidate`: PASS em comando Ruby pontual; saída `parity YAML and candidate manifest checks passed`.
- `git diff --check`: PASS. Commit da Task: `test: validate RAG skill against live retrieval`; hash registrado no relatório local da Task 3.
- Self-review: associação de fonte por caminho conferida; nenhum URL inferido; vedações individuais prevaleceram sobre o resumo agregado; perguntas sintéticas; P5 isolado da evidência dos demais; nenhuma mudança funcional na skill ou no serviço.
- Limites restantes: latência inicial sem causa diagnosticada, versões genéricas/URLs ausentes em parte do corpus, cobertura parcial e avaliação manual sem execução independente por caso. Não testamos todos os estados de ciclo de vida nem toda pergunta possível.

A entrada desta avaliação no manifesto não promove o agente além de `candidate`.
