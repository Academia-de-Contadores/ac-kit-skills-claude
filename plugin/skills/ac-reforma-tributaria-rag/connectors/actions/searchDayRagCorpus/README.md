# Action RAG

O schema ativo é `openapi.live-2026-09-20.json`, extraído em modo somente
leitura do GPT Builder. Seu SHA-256 é
`1622c2bd0c889aa412cdda9c6256cec71db46d924eeb51a7491c15b1920769b0`.

A Action não usa autenticação e aponta para
`https://day-rag-chroma-actions.onrender.com`. O contrato ativo expõe:

- `POST /rag/search`, operação `search_day_rag_corpus_rag_search_post`;
- `GET /health`, operação `health_health_get`.

As versões anteriores permanecem somente como referências históricas ou
candidatas, nunca como a configuração ativa:

- `openapi.live-2026-08-22.json`: captura histórica do mesmo editor, SHA-256
  bruto `c12e3e92584766d696ee57411d4ebb21931fa45c99b2284ce2fd336ad5435fec`;
- `openapi.builder-capture.yaml`: cópia privada observada em 2026-08-07,
  SHA-256 `72c5a23b8e0c24abe06726124c5f544d573cbcaccc206ffd1d47a65bfa7e8890`;
- `openapi.yaml`: candidato de produção Day v2.3, SHA-256
  `44dbc7ffd150a7d8527d67080ebece07c0e0b670ee4e1da0cdf0ab1b2d1bb08b`.

Nenhum segredo ou configuração de autenticação é versionado.
