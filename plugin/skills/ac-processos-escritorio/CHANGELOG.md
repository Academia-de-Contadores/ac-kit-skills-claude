# Changelog

Todas as mudanças relevantes deste agente serão registradas aqui.

## 0.2.0 — 2026-09-21

- Publica `$ac-processos-escritorio` `0.2.0` como skill validada independente,
  ligada ao GPT canônico e reutilizada pelo alias publicado `copy`.
- Declara allowlist distribuível, interface, políticas de fonte/aprovação,
  proteção contra prompt injection e cinco formatos de saída revisável.
- Usa sem duplicação exatamente os quatro anexos baixados em 2026-08-07 e
  valida nome, tamanho e SHA-256.
- Adiciona seis casos de paridade, rubrica 0–2 em seis dimensões, gates
  obrigatórios, cenários de segurança/regressão e validador reproduzível.
- Reconcilia o editor canônico em modo somente leitura em 2026-09-21.
- Confirma paridade criptográfica das instruções, metadados, quatro starters,
  capacidades, ausência observável de Actions e nomes do Knowledge 4/4.
- Corrige a atribuição histórica de zero anexos: ela pertence à variante
  pública `g-6a6ea5f0985c8191971aa805e5ad759f`, não ao rascunho canônico.
- Mantém explícito o `GAP` de paridade binária atual do Knowledge e trata os
  quatro downloads de 2026-08-07 como baseline documental reversível.
- Resolve os dois registros relacionados do catálogo sem criar repo ou skill
  duplicada: o rascunho é a fonte canônica e a variante publicada é `copy`.
- Registra PASS consolidado em 6/6 casos e 71/72 pontos: P1 a P5 com 12/12 e
  P6 com 11/12, todos com os gates obrigatórios aprovados.
- Instala seletivamente 17 arquivos, incluindo quatro arquivos de Knowledge,
  sem symlinks ou `.gitkeep`, com igualdade byte a byte contra a origem.
- Adiciona manual operacional, referência completa da estrutura e guia de contribuição expandido.
- Torna os documentos operacionais obrigatórios na validação.

- Estrutura inicial do template canônico.
