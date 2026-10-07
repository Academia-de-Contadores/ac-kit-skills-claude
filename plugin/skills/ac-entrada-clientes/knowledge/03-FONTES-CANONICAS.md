---
title: Fontes canonicas - Onboarding Cliente / Transicao
type: knowledge-sources
status: draft
produto: Desafio Contadora CEO com IA
pilar: agentes
departamento: Onboarding Cliente
fonte_tipo: curadoria
origem: agents/knowledge
data_criacao: 2026-07-04
data_consulta: 2026-07-04
entra_no_rag: reference_only
confiabilidade: interna_curada
tags:
  - academia-contadores/dcceo/agentes
---

# Fontes canonicas - Onboarding Cliente / Transicao

## Fontes deste agente
| # | Fonte | Status RAG | Uso |
|---|---|---|---|
| 1 | 01_CONTABILIDADE_ESTRUTURADA_PROCESSOS/05_SINTESES_POR_DEPARTAMENTO | reference_only | fonte para curadoria/operacao |
| 2 | 05_CRUZAMENTO_E_INTELIGENCIA/06_ROTEIRO_DCCEO_IA_AURORA_MIX | reference_only | fonte para curadoria/operacao |
| 3 | 05_CRUZAMENTO_E_INTELIGENCIA/05_RELATORIO_DIA_A_DIA_ESCRITORIO | reference_only | fonte para curadoria/operacao |

## Regra de fonte
- Fonte bruta ZIP/PDF/DOCX: `nao` entra no Git curado.
- Knowledge Pack: base operacional principal.
- Prompt v2: candidato para uso no builder.
- RAG: somente se gate justificar.

## Lacuna padrao
Se a fonte nao existir, estiver duplicada, sem transcricao ou sem revisao humana, marcar como lacuna e nao usar como fundamento final.
