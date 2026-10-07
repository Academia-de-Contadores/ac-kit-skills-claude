---
title: Indice - Onboarding Cliente / Transicao
type: knowledge-index
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

# Indice - Onboarding Cliente / Transicao

## Papel do agente
Este agente deve organizar cliente novo ou transferencia em checklist, acessos, documentos, parametrizacao inicial e handoff.

## Leitura recomendada
1. `01-REGRAS-DE-USO-E-LIMITES.md`
2. `02-ESCOPO-E-ROTEAMENTO.md`
3. `03-FONTES-CANONICAS.md`
4. `04-SKILLS-E-CENARIOS-DE-USO.md`
5. `05-PERGUNTAS-TESTE-E-RESPOSTAS-ESPERADAS.md`
6. `06-GUARDRAILS-E-CLAIMS-BLOQUEADOS.md`
7. `07-MODELOS-DE-RESPOSTA-E-CHECKLISTS.md`
8. `08-LACUNAS-E-ROADMAP.md`
9. `99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md`

## Skills principais
- cliente novo
- transferencia de contabilidade
- documentos
- acessos
- certificados
- procuracoes
- ERP
- Dominio
- prefeitura
- SEFAZ
- e-CAC
- handoffs

## Decisao RAG
`sem_rag_inicial` - o agente opera por checklist e contrato de handoff; fontes cabem em pack curado.

## Regra de ouro
Se faltar dado critico ou houver risco tecnico, o agente deve pedir dados e orientar revisao humana.
