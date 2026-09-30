# Auditoria do editor ao vivo — 2026-08-22

## Fonte e escopo

- **Editor:** https://chatgpt.com/gpts/editor/g-6a1b93a521b4819189fda957bcf00115
- **Nome exibido:** Agente Reforma Tributária Day - Consulta RAG
- **Distribuição exibida:** Ao vivo; qualquer pessoa com o link.
- **Última edição exibida:** 2026-08-21.
- **Método:** leitura direta e autenticada dos campos visíveis do GPT Builder;
  nenhuma alteração foi feita no GPT.

## Configuração observada

- **Instruções:** `instructions/current-live-2026-08-22.md`.
- **Knowledge:** oito anexos baixados e registrados com SHA-256 em
  `knowledge/live-2026-08-22/MANIFEST.md`.
- **Modelo recomendado:** Thinking 5.5.
- **Busca na web, Canvas, geração de imagens e intérprete de código:** ativos.
- **Action:** sem autenticação; servidor
  `https://day-rag-chroma-actions.onrender.com`; política de privacidade
  `https://day-rag-chroma-actions.onrender.com/privacy`.
- **Operação da Action:** `search_day_rag_corpus_rag_search_post` em
  `POST /rag/search`; schema exato em
  `connectors/actions/searchDayRagCorpus/openapi.live-2026-08-22.json`.

## Diferença em relação à captura histórica

A captura de 2026-08-07 preservou oito anexos de uma cópia privada e a
operação `searchDayRagCorpus`. O editor ao vivo usa novos nomes de anexos,
novas instruções e uma operação com identificador diferente. Os oito anexos
atuais foram preservados nesta auditoria como uma versão separada, sem
substituir a captura histórica.
