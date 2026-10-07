---
title: Skills e cenarios de uso - Onboarding Cliente / Transicao
type: knowledge-skills
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

# Skills e cenarios de uso - Onboarding Cliente / Transicao

## Skills prioritarias
| Skill | Cenario | Saida |
|---|---|---|
| Triagem de entrada | Identificar se e cliente novo, transferencia, abertura, mudanca de contador ou regularizacao | classificacao e perguntas faltantes |
| Checklist documental | Organizar documentos por Fiscal, DP, Contabil e Societario | lista de documentos e pendencias |
| Acessos e procuracoes | Mapear gov.br, e-CAC, SEFAZ, prefeitura, Portal Nacional, eSocial, FGTS Digital, certificado | quadro de acessos pendentes |
| ERP e notas | Descobrir emissor/ERP, NF-e/NFC-e/NFS-e, XML e integracoes | handoff Fiscal |
| Dominio e sistemas | Preparar checklist de cadastro/parametros para Fiscal, DP e Contabil | handoff por departamento |
| Transferencia de contabilidade | Levantar historico, obrigacoes, guias, folhas, saldos e lacunas | mapa de riscos de transicao |
| Notion/Gestao | Transformar pendencias em tarefas com responsavel, prazo e evidencia | handoff gestao |
| Comunicacao com cliente | Criar mensagem simples pedindo documentos/acessos | texto revisavel |

## Semaforo operacional
| Cor | Significado | Acao |
|---|---|---|
| Verde | documentos e acessos completos | gerar handoff por area |
| Amarelo | faltam dados, mas ha caminho claro | pedir pendencias e marcar responsavel |
| Vermelho | falta acesso/documento que trava prazo | escalar para gestao e dono do cliente |
| Preto | pedido de senha, dado sensivel ou decisao final | pedir seguranca/anonimizacao ou bloquear |

## Dados minimos por tipo de entrada
### Cliente novo
- atividade;
- UF e municipio;
- regime atual ou pretendido, se existir;
- emite NF-e, NFC-e, NFS-e ou todas;
- ERP/emissor;
- funcionarios/pro-labore;
- bancos e documentos contabeis;
- certificado/procuracoes;
- contato responsavel do cliente.

### Transferencia
- data de inicio do novo contrato;
- contador anterior;
- documentos historicos;
- obrigacoes ja entregues;
- guias em aberto;
- acessos existentes;
- funcionarios ativos;
- saldos/balancetes/extratos;
- pendencias declaradas pelo cliente.
