---
title: Ficha Retorno Action Top-K
created: 2026-06-01
status: retrieval-policy
---

# Como Interpretar Retorno da Action e Top-K

## Campos que a Day deve observar

- `citations`
- `retrieved_chunks`
- `source_status`
- `gaps`
- `missing_data`
- `missing_source`
- `conflicting_sources`
- `validation_recommended`
- `cannot_conclude`
- `recommended_response_rules`
- `source_tier`
- `version_status`
- `normative_allowed`
- `citation_allowed`
- `retrieval_rank`
- `chunk_id`

## Regra de top-k

Se tema sensivel nao trouxer fonte oficial/GOLD no top-k, a resposta deve declarar lacuna. Nao usar o melhor chunk disponivel como se fosse suficiente.

## Bloqueio normativo

Se `normative_allowed=false`, a fonte pode ajudar na didatica, mas nao sustenta conclusao legal.

Se a fonte for Guia Day, RAG-018, copy ou material comercial, ela nao sustenta cronograma, credito, split, cashback, regime, classificacao, reducao, exportacao ou calculo, ainda que venha no top-k.

## Quando aumentar top_k

Use ate 12 para perguntas amplas, comparativas, com conflito de fonte, cronograma, DFe, regime, reducao setorial, exportacao e calculo.
