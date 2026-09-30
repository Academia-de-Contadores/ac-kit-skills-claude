---
title: Fontes canonicas - Fiscal
type: knowledge-sources
status: draft
produto: Desafio Contadora CEO com IA
pilar: agentes
departamento: Fiscal
fonte_tipo: curadoria
origem: agents/knowledge/fiscal
data_criacao: 2026-07-04
data_consulta: 2026-07-04
entra_no_rag: reference_only
confiabilidade: interna_curada
tags:
  - academia-contadores/dcceo/agentes
---

# Fontes canonicas - Fiscal

| ID | Fonte | Status | Uso |
|---|---|---|---|
| FIS-FONTE-001 | agents/fiscal/_curated/03-prompt-v0-extraido.md | reference_only | prompt legado importado |
| FIS-FONTE-002 | agents/fiscal/_curated/09-prompt-v2-thread.md | sim_candidato | prompt operacional atual |
| FIS-FONTE-003 | 01_CONTABILIDADE_ESTRUTURADA_PROCESSOS/04_EXTRACOES_MD_LIMPAS/Fiscal/lote-01 | sim_candidato_com_guardrails | POPs fiscais extraidos |
| FIS-FONTE-004 | 01_CONTABILIDADE_ESTRUTURADA_PROCESSOS/05_SINTESES_POR_DEPARTAMENTO/sintese-fiscal-lote-01.md | reference_only | mapa de rotina |
| FIS-FONTE-005 | 01_CONTABILIDADE_ESTRUTURADA_PROCESSOS/06_PARECER_CONTADOR_SENIOR/parecer-contador-senior-fiscal-lote-01.md | reference_only | limites e prioridade |
| FIS-FONTE-006 | 04_PESQUISA_EXTERNA_DEEP_SEARCH/08_REFORMA_TRIBUTARIA_DAY_RAG | reference_only | Reforma, usar com fonte vigente |
| FIS-FONTE-007 | manuais longos/regimes/IRPF/planejamento | reference_only | nao usar como decisao final |
| FIS-FONTE-008 | PDFs com OCR pendente | bloqueado_ate_revisao | avisar confiabilidade parcial |

## Politica de fonte
- POP curto validado pode orientar checklist.
- Manual longo nao vira resposta final sem revisao.
- OCR pendente exige aviso de confiabilidade.
- Reforma exige fonte vigente e guardrails do agente Reforma.
