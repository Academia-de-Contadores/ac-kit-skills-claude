---
title: Escopo e roteamento - Onboarding Cliente / Transicao
type: knowledge-routing
status: draft
produto: Desafio Contadora CEO com IA
pilar: agentes
departamento: Onboarding Cliente
fonte_tipo: curadoria
origem: agents/knowledge/onboarding-cliente
data_criacao: 2026-07-04
data_consulta: 2026-07-04
entra_no_rag: reference_only
confiabilidade: interna_curada
tags:
  - academia-contadores/dcceo/agentes
---

# Escopo e roteamento - Onboarding Cliente / Transicao

## Tese operacional
Onboarding nao e boas-vindas. Onboarding e a etapa que transforma promessa comercial em operacao contábil executável.

Se a entrada vem torta, todos os departamentos sofrem: Fiscal parametriza errado, DP fecha folha sem base, Contabil fecha com buracos, Societario corre atras de documento e a dona do escritorio vira central de WhatsApp.

## Escopo central
- cliente novo;
- transferencia de contabilidade;
- documentos;
- acessos;
- certificados;
- procuracoes;
- ERP/emissor;
- Dominio;
- prefeitura;
- SEFAZ;
- e-CAC;
- Portal Nacional NFS-e;
- Simples Nacional;
- eSocial/FGTS Digital;
- Notion/Gestao;
- handoffs para Fiscal, DP, Contabil e Societario.

## Fora do escopo
- definir regime final;
- abrir empresa sozinho;
- protocolar ato societario;
- transmitir obrigação;
- emitir guia final;
- decidir CNAE, CFOP, NCM, CST ou cClassTrib definitivos;
- garantir prazo ou deferimento.

## Checklist macro - cliente novo
| Etapa | Bloco | Dados/acao | Responsavel tecnico | Risco se faltar |
|---|---|---|---|---|
| 1 | Origem comercial | diagnostico, escopo vendido, promessa, urgencia, plano contratado | Comercial | promessa desalinhada contamina a operacao |
| 2 | Identificacao | CNPJ/CPF anonimizados se necessario, razao, atividade, UF, municipio, socios, contatos | Onboarding | cadastro errado contamina todos os departamentos |
| 3 | Modelo de operacao | servico/produto, B2B/B2C, ecommerce/marketplace, ERP, emissor, bancos, funcionarios | Onboarding | agente errado se faltar contexto |
| 4 | Acessos | gov.br, e-CAC, SEFAZ, prefeitura, Portal Nacional NFS-e, Simples, eSocial, FGTS Digital, certificado/procuracao | Onboarding + departamentos | rotina trava sem acesso |
| 5 | Domínio e sistemas | cadastro empresa, regime, parametros fiscais, folha, contabil, integracoes | Fiscal/DP/Contabil | parametrizacao mal feita gera erro recorrente |
| 6 | Fiscal | notas, XML, CFOP/NCM/CST/cClassTrib quando aplicavel, regime, guias, CND/parcelamentos | Fiscal | apurar ou emitir com base ruim |
| 7 | DP | funcionarios, pro-labore, CCT/ACT, beneficios, jornada, folha anterior, eventos | DP | folha/eSocial/DCTFWeb errados |
| 8 | Contabil | balancete, extratos, documentos, saldos, integracoes, contador anterior | Contabil | fechamento com buracos |
| 9 | Societario | contrato, CNPJ, inscricoes, alvaras, CNAEs, evento em andamento | Societario | ato/cadastro desalinhado |
| 10 | Gestao | tarefas, prazos, responsaveis, evidencias, status, pendencias do cliente | Notion/Gestao | dona vira gargalo |

## Transferencia de contabilidade
| Frente | O que levantar | Saida esperada |
|---|---|---|
| Contador anterior | balancetes, diario/razao, obrigações entregues, guias, parcelamentos, folha, eventos, acessos | pedir lista de documentos e lacunas |
| Fiscal | ultimas apuracoes, XMLs, SPED/EFD quando aplicavel, notas, regime, CND, pendencias | handoff Fiscal |
| DP | folhas anteriores, eventos eSocial, DCTFWeb, FGTS Digital, CCT, empregados ativos, ferias/rescisoes pendentes | handoff DP |
| Contabil | balancete, saldos, extratos, documentos suporte, conciliacoes pendentes | handoff Contabil |
| Societario | contrato, alterações, inscricoes, alvaras, procuracoes, certificado | handoff Societario |

## Handoffs obrigatorios
| Destino | Entrada minima | Saida esperada | Risco operacional |
|---|---|---|---|
| Fiscal | regime atual/pretendido, UF, municipio, atividade, notas emitidas, ERP/emissor, acessos SEFAZ/prefeitura/Portal Nacional, certificado/procuracao, historico XML | parametrizacao fiscal, conferencia de notas/XML, guia/apuracao apenas com revisao | cadastro fiscal errado, nota emitida em portal errado, XML ausente, CFOP/NCM/CST pendente |
| DP | tem funcionarios, socios/pro-labore, CCT/ACT, jornada, beneficios, eSocial, folha anterior, eventos pendentes, acesso Dominio Folha | checklist DP, admissao/folha/rescisao/ferias com revisao | CCT ausente, folha parametrizada errado, eSocial/DCTFWeb/FGTS Digital sem evidencia |
| Contabil | balancetes anteriores, razao, diario, extratos, contas, saldos, relatorios do contador anterior, integracoes fiscal/DP | mapa de lacunas contabeis e rotina de fechamento | historico incompleto, conciliacao falha, fechamento mensal contaminado |
| Societario | contrato social, CNPJ, QSA, inscricoes, alvaras, CNAEs, evento societario, documentos dos socios, assinaturas | triagem de abertura/alteracao/baixa/transferencia | documento incompleto, CNAE/natureza juridica sem revisao, protocolo incorreto |
| Notion/Gestao | tarefas, responsaveis, vencimentos, evidencias, status, pendencias do cliente | quadro operacional e relatorio de pendencias | ninguém sabe quem ficou responsavel, prazo sem dono, guia sem prova de envio |

## Quando encaminhar
- Se a pergunta pedir nota, XML, NCM, CFOP, guia ou apuracao: Fiscal.
- Se envolver empregado, folha, CCT, eSocial, DCTFWeb ou FGTS Digital: DP.
- Se envolver abertura, alteração, baixa, CNAE, contrato ou REDESIM/Junta: Societario.
- Se envolver balancete, conciliacao, documentos contabeis ou fechamento: Contabil.
- Se envolver tarefa, prazo, responsavel, evidencia ou status: Notion/Gestao.
- Se envolver proposta, escopo vendido ou promessa comercial: Comercial.

## Saida padrao do Onboarding
1. tipo de entrada: novo cliente ou transferencia;
2. mapa de dados coletados;
3. dados faltantes por departamento;
4. acessos pendentes;
5. riscos operacionais;
6. handoffs;
7. proxima acao segura.
