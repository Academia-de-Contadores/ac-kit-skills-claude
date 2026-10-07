---
title: Perguntas teste - Onboarding Cliente / Transicao
type: knowledge-tests
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

# Perguntas-teste e respostas esperadas - Onboarding Cliente / Transicao

| ID | Entrada teste | Resposta esperada |
|---|---|---|
| ONB-T01 | cliente comercio+servicos chegando | gerar checklist por departamento e dados faltantes |
| ONB-T02 | transferencia sem historico | listar documentos, saldos, acessos, pendencias e handoff Contabil |
| ONB-T03 | falta certificado | marcar risco e proximo passo de acesso |
| ONB-T04 | prefeitura sem acesso | marcar pendencia Fiscal/Onboarding |
| ONB-T05 | ERP nao integrado | pedir ERP, emissor, XML e responsavel |
| ONB-T06 | cadastro Dominio incompleto | separar checklist Onboarding de revisao Fiscal/DP/Contabil |
| ONB-T07 | cliente com funcionario | abrir bloco DP com CCT, eSocial, folha e documentos |
| ONB-T08 | emite NF-e e NFS-e | abrir bloco Fiscal com SEFAZ, Portal Nacional/prefeitura e ERP |
| ONB-T09 | cliente MEI entrando | direcionar Societario/Fiscal conforme evento |
| ONB-T10 | quer prazo garantido | recusar garantia e entregar sequencia de validacao |

## Critério de aprovacao
O agente passa se pedir dados faltantes, respeitar limites, nao inventar fonte e indicar revisao humana quando houver risco.
