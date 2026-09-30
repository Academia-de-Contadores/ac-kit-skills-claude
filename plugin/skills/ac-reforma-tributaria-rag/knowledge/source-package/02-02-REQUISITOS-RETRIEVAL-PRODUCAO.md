---
title: Requisitos Retrieval Day v2.1 Producao Assistida
created: 2026-06-01
status: requisitos-producao
---

# Requisitos de Retrieval - Producao Assistida

## Objetivo

O RAG deve permitir que a Day diferencie fonte oficial vigente, curadoria tecnica, ficha operacional e pedagogia sem precisar inferir pela linguagem do chunk.

O fluxo de producao nao deve fazer websearch antes do RAG. O corpus GOLD local e a fonte primaria recuperavel pela Action. Web/portal oficial e etapa de confirmacao externa quando houver lacuna, conflito ou manutencao de versao.

## Metadados obrigatorios por fonte/chunk

Cada fonte indexada deve ter:

- `source_tier`: `OFICIAL_PRIMARIA`, `OFICIAL_TECNICA`, `GOLD`, `SILVER`, `REFERENCE_APROVADO`, `HISTORICO`, `NAO_USAR_COMO_FONTE_TECNICA`.
- `authority`: emissor original.
- `version_or_date`: versao, data ou vigencia.
- `version_status`: `CURRENT`, `PENDING_CONFIRMATION`, `HISTORICAL`, `SUPERSEDED`, `UNKNOWN`.
- `status_rag`: `ENTRA_NO_RAG`, `HISTORICO`, `REFERENCIA_LOCAL`, `NAO_USAR_COMO_FONTE_TECNICA`.
- `normative_allowed`: booleano.
- `citation_allowed`: booleano.
- `source_url_clean`: URL sem `utm_source`, `utm_medium`, `utm_campaign`, `gclid`, `fbclid` ou trackers.
- `source_path`: caminho interno.
- `chunk_id`: identificador estavel.
- `retrieval_rank`: posicao no top-k.
- `topic_tags`: temas como cronograma, simples, credito, split, cashback, DFe, exportacao, regime, calculo, guardrail.

## Regra especial para Guia Day / RAG-018

O arquivo `RAG-018-11-guia-rss-v3-day.md` e o guia Day equivalente podem ser uteis para linguagem, dor do contador e pedagogia. Eles nao devem fundamentar cronograma, artigo, aliquota, credito, split, cashback, regime, classificacao, reducao, exportacao ou calculo.

Recomendacao de metadata:

- `source_tier=REFERENCE_APROVADO` ou `source_tier=SILVER_PEDAGOGIA`.
- `normative_allowed=false`.
- `citation_allowed=true` apenas para pedagogia/linguagem.
- `topic_tags=pedagogia,linguagem_day,resposta_cliente`.
- `blocked_topics=cronograma,credito,split,cashback,regime,classificacao,reducao,exportacao,calculo,aliquota,artigo`.

Se o RAG retornar `RAG-018` como melhor fonte para pergunta normativa, a Action deve acionar `guide_day_normative_blocked=true` e recomendar lacuna/fonte GOLD.

## Regras de ranking

Para `needs_current_source=true`, o top-k deve priorizar:

1. Fonte oficial primaria vigente.
2. Portal/manual/nota tecnica/instrucao tecnica oficial vigente.
3. Fonte GOLD curada com rastreabilidade.
4. Fonte SILVER operacional.
5. Reference aprovado apenas quando a pergunta for de linguagem, pedagogia ou resposta ao cliente.

`REFERENCE_APROVADO` nao pode vencer fonte oficial/GOLD em pergunta normativa.

## Resposta minima da Action

A Action deve retornar:

- `answer_summary`
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
- `retrieval_audit`

`retrieval_audit` deve registrar:

- query recebida;
- tipo de pergunta;
- `needs_current_source`;
- top-k solicitado e retornado;
- se fonte oficial vigente apareceu no top-k;
- se houve bloqueio de uso normativo;
- se houve fallback por lacuna.

## Falhas que devem virar lacuna explicita

- Tema sensivel sem fonte oficial/GOLD no top-k.
- Fonte historica recuperada sem fonte vigente correspondente.
- Material Day/guia/copy recuperado como melhor fonte para pergunta legal.
- Versoes conflitantes de NT, manual, tabela, cronograma ou cClassTrib.
- Ausencia de chunk com `normative_allowed=true` quando a pergunta pede artigo, prazo, aliquota, classificacao ou regime.

## Aceite

- Cada tema sensivel deve retornar fonte oficial/GOLD ou lacuna explicita.
- A resposta final deve conseguir citar `chunk_id`, `source_tier`, `version_status` e `retrieval_rank`.
- O log deve permitir auditar por que determinada fonte apareceu na resposta.
