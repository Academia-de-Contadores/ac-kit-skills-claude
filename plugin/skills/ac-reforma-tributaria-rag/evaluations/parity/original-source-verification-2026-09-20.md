# Verificação das fontes originais — P1–P5 — 2026-09-20

**Gate de fontes originais: PASS, 5/5.** P1, P2, P3 e P4 tiveram suas
afirmações e atribuições materiais confirmadas nos artefatos originais. P5 não
recuperou fonte e foi corretamente tratado como fallback identificado, sem
validação de citação factual corrente.

## Método e escopo

Foram confrontados os enunciados e as citações das cinco respostas preservadas
em `task-5-fix1-evidence-2026-09-20/` com os artefatos físicos mapeados na árvore
irmã `levy-rag-v2.3-20260801-rev2`. O mapeamento usado foi a planilha inspecionada
`outputs/ragflow-staging-matrices-2026-08-23/rtc-ragflow-staging-matrices-2026-08-23.xlsx.inspect.ndjson`,
abas **Matriz 84**, **Artefatos Evidência** e **Conjuntos Evidência**.

Os SHA-256 abaixo foram recalculados diretamente dos arquivos. HTML foi
inspecionado como texto, mantendo a âncora do artigo; PDF foi extraído com
`pdftotext -layout`, preservando número de página impresso e seção. O confronto
não presume que uma página sobre o mesmo assunto prove o conteúdo de uma ficha
derivada.

## Resultado por caso

| Caso | Originais confrontados | Localização e trecho comprobatório | Resultado |
| --- | --- | --- | --- |
| P1 | LC 214/2025 compilada, HTML, SHA-256 `e898762f6bf554616951398490b84748ab3b4d220e3bbb85621d0b4bcf0cb94c`; Resolução CGIBS nº 6/2026, PDF, SHA-256 `9ed7032ef9c25bbee51bdb5e90f60e1ad01a2bf56cb41a28221c3db7f61d419a` | LC, âncoras `art42`–`art45`: consolidação, período mensal, saldos separados e débitos/créditos. Regulamento, p. 32, art. 47 e § 1º: extinção do débito, documento idôneo, segregação IBS/CBS e vedação da compensação cruzada. | **PASS** |
| P2 | LC 214/2025 compilada, mesmo HTML e SHA de P1 | Âncoras `art58`–`art60`: administração integrada, cadastro com identificação única e emissão de documento fiscal eletrônico. É exatamente o alcance restrito declarado na resposta. | **PASS** |
| P3 | Notícia oficial CGSN de 17/04/2026, HTML, SHA-256 `0f42e2bf080deca0ae280590adfd9934ce4126ad542bdd97d88716befef793e3`; LC 214/2025, mesmo HTML e SHA de P1 | Notícia, título e seção “O que muda na prática”, itens “Escolha do IBS e CBS” e “Decisão sobre IBS/CBS”: escolha entre guia do Simples e regime regular, mantendo o contexto de 2027. LC, âncora `art41`, §§ 2º–4º: optante do Simples pode optar por apurar/recolher IBS e CBS no regime regular. A resposta não inventou prazo nem aplicou a opção ao caso. | **PASS** |
| P4 | Orientações RFB 2026, HTML, SHA-256 `93e69d296889de53585da070ed865e9f45c686df862837e80c609cf21626082a`; lista oficial do Portal NF-e, HTML, SHA-256 `16a904f51b69ef850dcc0cb026518a8f5a150af51c4c9cd835fdfe5d1401d230`; NF3e NT 2025.001 v1.14a, PDF, SHA-256 `6b8204ce9111778333b068ba94d2911bf2f1af7c06bdcb0e0030c194db6edec9`; NFCom NT 2025.001 v1.14a, PDF, SHA-256 `42f6122f10dfd8877de57f17eb0f58ecc26b28f3a735dbd6da60b9e03e222dd8`; CT-e NT 2025.001 v1.14b, PDF, SHA-256 `c664274f51ef2efee5e9bf934fb18cf1a78289592420a6cf3efb2eba2c95ce70` | A página RFB, seção “Obrigações Acessórias”, confirma NF-e/NFC-e com destaque conforme notas técnicas específicas. A lista do Portal NF-e registra a NT 2025.002 v1.40 em “Documentos não vigentes” e versões posteriores v1.50/v1.51, comprovando a versão histórica e a necessidade de conferir atualização. As três NTs, capa/p. 2 e seção 5/p. 9, confirmam modelo, versão, validação de existência/aplicabilidade de CST/cClassTrib e linhas “Futura”. O checklist é síntese operacional identificada como SILVER/não normativa, não citação textual da página. | **PASS** |
| P5 | Nenhum artefato recuperado; `P5-transport-unavailable.json` registra `http_request_attempted: false` e `retrieval_evidence: null` | A resposta declara transporte indisponível, nenhuma fonte recuperada e ausência de validação corrente. O Knowledge identificado é usado como método, não como citação factual vigente. Portanto, não há citação atual a validar nem fonte a fingir. | **PASS (fallback)** |

## Arquivos originais e versões

- P1/P2/P3, LC 214/2025:
  `docs/originals/day_rtc_v2_3_20260801/external-2026-08-22/83382f53eedc3062/lcp214.htm`.
  O arquivo é texto compilado e contém as âncoras dos artigos citados.
- P1, Regulamento do IBS:
  `docs/originals/day_rtc_v2_3_20260801/external-2026-08-22/19705f523c1134dd/30084927-res-cgibs-n-6-30-abr-2026-regulamenta-o-ibs.pdf`,
  Resolução CGIBS nº 6/2026, data declarada 30/04/2026.
- P3, orientação CGSN:
  `docs/originals/day_rtc_v2_3_20260801/supplemental-2026-08-22/44d0919996ce21c6/simples-nacional-noticia-cgsn-186.html`,
  publicada e modificada em 17/04/2026.
- P4, página RFB:
  `docs/originals/day_rtc_v2_3_20260801/external-2026-08-22/c1446ecaa1569100/orientacoes-2026`.
- P4, lista oficial de documentos NF-e:
  `docs/originals/day_rtc_v2_3_20260801/external-2026-08-22/fe5fd051a92f3835/listaConteudo.aspx`.
- P4, notas de outros modelos:
  `docs/originals/day_rtc_v2_3_20260801/external-2026-08-22/e3108740881d1856/NF3e_Nota_Tecnica_2025_001_RTC_v1.14a.pdf`,
  `.../9f43767b9d1bb739/NFCom_Nota_Tecnica_2025_001_RTC_v1.14a.pdf` e
  `.../000f4a628d78e6b0/CTe_Nota_Tecnica_2025_001_RTC_v1.14b.pdf`.

## Detalhamento da verificação de P4

O bundle `EVID-A7C675D40B0E` associa `RAG-042` ao arquivo oficial
`orientacoes-2026`, que confirma a obrigação de observar notas técnicas
específicas. A própria ficha `RAG-042` registra também como fonte o Portal NF-e.
A captura física preservada desse portal lista a NT 2025.002 v1.40, publicada
em 20/05/2026, dentro de “Documentos não vigentes”, além de v1.50 e v1.51.
Portanto, a versão histórica e o alerta de conferir versões posteriores foram
comprovados. O checklist “identificar ERP e versão, testar em homologação,
conferir XML real” é uma síntese operacional da ficha SILVER, explicitamente
marcada como não normativa; não foi atribuído como transcrição literal da RFB.

As notas NF3e, NFCom e CT-e citadas em P4 foram comprovadas nos PDFs originais:
a versão consta da capa; a seção 5 contém regras de validação de existência e
compatibilidade; e a regra 001 aparece como “Futura”. A resposta também separa
corretamente esses modelos da NF-e.

## Decisão de readiness

O gate de fonte original exige que todas as citações materiais sejam
comprováveis e que sínteses internas não sejam apresentadas como norma. Os cinco
casos satisfazem esse critério. O manifesto e a instalação seletiva podem
registrar `validated`, mantendo os limites já declarados: P4 não transfere regras
de outros modelos para NF-e, e P5 não possui validação factual corrente. O GPT
online não foi alterado.
