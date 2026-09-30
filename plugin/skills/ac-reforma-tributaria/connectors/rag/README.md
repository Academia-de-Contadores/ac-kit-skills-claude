# Referência histórica do RAG externo

Este README preserva a integração exigida pela instrução histórica para a
Action `searchDayRagCorpus`. Ele não declara que existe runtime ou Action ativa
no ambiente atual. O runtime citado pela captura era externo, em
`Academia-de-Contadores/agente-ia-reforma-com-rag`.

O contrato vigente de preflight, retrieval e fallback desta skill está em
`references/retrieval-contract.md`. O repositório preserva dois schemas com
proveniências diferentes em `connectors/actions/searchDayRagCorpus/`: a captura
do Builder (`openapi.builder-capture.yaml`) e o candidato de produção
(`openapi.yaml`). Nenhum dos dois, isoladamente, comprova integração ativa.

O cenário atual de indisponibilidade no repositório é
`evaluations/regression/C1.md`. Avaliações ficam somente no repositório e não
são dependências de runtime da instalação. Este pacote também não versiona
autenticação, endpoint privado, runtime, corpus, índices, logs ou credenciais.
