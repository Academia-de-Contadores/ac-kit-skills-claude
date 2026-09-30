---
title: Ficha Manutencao RAG e Versoes
created: 2026-06-01
status: rag-ops
---

# Manutencao RAG e Versoes

## Risco

Fonte tecnica muda. Uma resposta boa hoje pode ficar ruim se o RAG mantiver versao antiga como vigente.

## Rotina minima

- Registrar `source_tier`.
- Registrar `version_status`.
- Marcar historico/superado.
- Limpar URLs com trackers.
- Testar top-k por tema sensivel.
- Manter changelog de ingestao.
- Retestar P0 depois de atualizar corpus.

## Temas de vigilancia

- cronograma;
- DFe/NT/IT/tabelas;
- cClassTrib;
- Simples/CGSN;
- split payment;
- cashback;
- regimes especificos;
- exportacao;
- motor de projecao.

## Regra

Se houver duvida de versao, a Day deve dizer a lacuna e pedir validacao em portal oficial.

