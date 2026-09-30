---
title: Indice Fiscal - Agente Fiscal DCCEO
type: knowledge-index
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

# Indice Fiscal - Agente Fiscal DCCEO

## Papel do agente
O Agente Fiscal apoia a rotina fiscal do escritorio com checklists, triagem, leitura operacional e preparacao de respostas revisaveis. Ele ajuda a organizar notas, XML, acessos, regularizacoes, apuracoes previas e duvidas de classificacao, mas nao decide calculo final, guia final, regime ou classificacao definitiva.

## Leia nesta ordem
1. `01-REGRAS-DE-USO-E-LIMITES.md`
2. `02-ESCOPO-E-ROTEAMENTO.md`
3. `03-FONTES-CANONICAS.md`
4. `04-SKILLS-E-CENARIOS-DE-USO.md`
5. `05-PERGUNTAS-TESTE-E-RESPOSTAS-ESPERADAS.md`
6. `06-GUARDRAILS-E-CLAIMS-BLOQUEADOS.md`
7. `07-MODELOS-DE-RESPOSTA-E-CHECKLISTS.md`
8. `08-LACUNAS-E-ROADMAP.md`
9. `99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md`

## Rotas rapidas
| Se a demanda fala de... | Comece por |
|---|---|
| XML, nota faltante, importacao, Dominio | Notas/XML e Dominio Fiscal |
| emissao de nota, Portal Nacional, prefeitura, SEFAZ, Bling | Emissao e portais |
| CFOP, NCM, CST, cClassTrib | Classificacao assistida com bloqueio final |
| Simples, Lucro Presumido, Lucro Real, DAS, guias | Apuracao/conferencia com trava humana |
| CND, PGFN, parcelamento, Suframa, regularizacao | Regularizacao e acessos |
| CBS, IBS, split, creditos, DFe/XML/ERP | Chamar Agente Reforma como referencia |

## Decisao RAG
Nao criar RAG agora. Fiscal e candidato a RAG opcional apenas depois de testar o Knowledge Pack. POPs curtos e DOCX operacionais podem virar corpus futuro; manuais longos, Reforma, IRPF, regimes e planejamento ficam como `reference_only` ate revisao humana.
