# Captura da Action configurada no GPT Builder

## Estado ao vivo — 2026-09-20

- **Editor:** https://chatgpt.com/gpts/editor/g-6a1b93a521b4819189fda957bcf00115
- **versão OpenAPI:** `0.1.0`
- **operações:** `POST /rag/search`
  (`search_day_rag_corpus_rag_search_post`) e `GET /health`
  (`health_health_get`)
- **autenticação observada:** nenhuma
- **servidor:** `https://day-rag-chroma-actions.onrender.com`
- **política de privacidade:** `https://day-rag-chroma-actions.onrender.com/privacy`
- **schema ativo:** `openapi.live-2026-09-20.json`, extraído diretamente do
  campo `Schema` do Builder, SHA-256
  `1622c2bd0c889aa412cdda9c6256cec71db46d924eeb51a7491c15b1920769b0`.

`SearchResponse` exige `answer_summary`, `citations`, `retrieved_chunks`,
`source_status` e `gaps`. Esta é a única versão marcada como ativa.

## Estado ao vivo — 2026-08-22

- **Editor:** https://chatgpt.com/gpts/editor/g-6a1b93a521b4819189fda957bcf00115
- **operação:** `search_day_rag_corpus_rag_search_post`
- **autenticação observada:** nenhuma
- **servidor:** `https://day-rag-chroma-actions.onrender.com`
- **política de privacidade:** `https://day-rag-chroma-actions.onrender.com/privacy`
- **schema histórico:** `openapi.live-2026-08-22.json`, extraído diretamente
  do campo `Schema` do Builder, SHA-256 bruto
  `c12e3e92584766d696ee57411d4ebb21931fa45c99b2284ce2fd336ad5435fec`.

O bloco abaixo permanece como captura histórica da cópia privada de
2026-08-07.

## Captura histórica — 2026-08-07

- **capturada em:** 2026-08-07
- **operação:** `searchDayRagCorpus`
- **autenticação observada:** nenhuma
- **servidor:** `https://day-rag-chroma-actions.onrender.com`
- **política de privacidade:** `https://day-rag-chroma-actions.onrender.com/privacy`
- **SHA-256 do schema:** `72c5a23b8e0c24abe06726124c5f544d573cbcaccc206ffd1d47a65bfa7e8890`

`openapi.builder-capture.yaml` preserva exatamente o schema visível na cópia
privada. `openapi.yaml` permanece como candidato de produção, não como schema
configurado no GPT.
