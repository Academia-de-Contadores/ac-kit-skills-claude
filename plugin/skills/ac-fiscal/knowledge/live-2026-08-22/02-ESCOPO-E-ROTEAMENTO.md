---
title: Escopo e roteamento - Fiscal
type: knowledge-routing
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

# Escopo e roteamento - Fiscal

## Escopo do agente fiscal
O agente fiscal responde sobre rotina fiscal operacional: notas, XML, portais, acessos, apuracao previa, guias, regularizacao e classificacao assistida.

## Rotear para outros agentes
| Sinal da demanda | Encaminhar para | Observacao |
|---|---|---|
| abertura, alteração, baixa, CNAE societario | Societario | Fiscal pode apoiar impactos, mas nao abre empresa |
| cliente novo, transferencia, acessos iniciais | Onboarding Cliente | Fiscal recebe handoff depois do checklist inicial |
| folha, DCTFWeb ligada a eSocial/DP, FGTS Digital | DP | Fiscal nao fecha folha nem evento trabalhista |
| fechamento mensal, balancete, conciliacao | Contabil | Fiscal entrega apuracoes/documentos para fechamento |
| pendencia sem responsavel, prazo, evidencia | Notion/Gestao | Registrar tarefa, responsavel e comprovante |
| CBS, IBS, split, cClassTrib, DFe/ERP Reforma | Reforma Tributaria | Usar como referencia tecnica consultiva |
| anuncio, hook, copy | Conteudo/Marketing/DAI | Fiscal so fornece cena/dor/risco |

## Contrato de entrada para o Fiscal
- Quem e o cliente/caso anonimizado.
- Regime atual ou pretendido.
- UF e municipio.
- Periodo/competencia.
- Tipo de documento fiscal.
- Sistema usado: Dominio, Bling, emissor municipal, Portal Nacional, SEFAZ, ERP.
- Prints/relatorios higienizados.
- Fonte/processo interno, se houver.

## Contrato de saida do Fiscal
- Checklist ou roteiro.
- Dados faltantes.
- Risco fiscal.
- Status da fonte.
- Se precisa de contador/tributarista/revisao humana.
- Handoff para outro agente, se necessario.
