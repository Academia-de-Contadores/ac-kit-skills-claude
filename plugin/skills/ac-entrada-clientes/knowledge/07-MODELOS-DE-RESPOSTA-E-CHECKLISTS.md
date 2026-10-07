---
title: Modelos de resposta e checklists - Onboarding Cliente / Transicao
type: knowledge-templates
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

# Modelos de resposta e checklists - Onboarding Cliente / Transicao

## Modelo 1 - Diagnostico de entrada
```markdown
### Tipo de entrada
[cliente novo / transferencia / abertura / regularizacao / duvida]

### Leitura curta
[Explique em linguagem simples o que esta acontecendo.]

### Dados ja coletados
- [listar]

### Dados faltantes por area
Fiscal:
- [listar]
DP:
- [listar]
Contabil:
- [listar]
Societario:
- [listar]
Gestao/Notion:
- [listar]

### Acessos pendentes
- e-CAC:
- SEFAZ:
- Prefeitura/Portal Nacional NFS-e:
- Simples Nacional:
- eSocial/FGTS Digital:
- ERP/emissor:
- Dominio:

### Riscos
- [risco operacional]

### Proxima acao segura
[acao de 15 minutos]
```

## Modelo 2 - Checklist de cliente novo
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

## Modelo 3 - Checklist de transferencia
| Frente | O que levantar | Saida esperada |
|---|---|---|
| Contador anterior | balancetes, diario/razao, obrigações entregues, guias, parcelamentos, folha, eventos, acessos | pedir lista de documentos e lacunas |
| Fiscal | ultimas apuracoes, XMLs, SPED/EFD quando aplicavel, notas, regime, CND, pendencias | handoff Fiscal |
| DP | folhas anteriores, eventos eSocial, DCTFWeb, FGTS Digital, CCT, empregados ativos, ferias/rescisoes pendentes | handoff DP |
| Contabil | balancete, saldos, extratos, documentos suporte, conciliacoes pendentes | handoff Contabil |
| Societario | contrato, alterações, inscricoes, alvaras, procuracoes, certificado | handoff Societario |

## Modelo 4 - Handoff Fiscal
```markdown
Agente destino: Fiscal
Contexto: [cliente novo/transferencia]
Atividade: [atividade]
UF/municipio: [dados]
Regime: [se houver]
Notas/documentos: [NF-e/NFC-e/NFS-e/XML]
ERP/emissor: [sistema]
Acessos: [SEFAZ, prefeitura, Portal Nacional, e-CAC, certificado]
Pendencias: [lista]
Risco: [baixo/medio/alto]
Pedido: conferir parametrizacao fiscal e orientar proximas pendencias sem emitir guia final.
```

## Modelo 5 - Handoff DP
```markdown
Agente destino: DP
Contexto: [cliente novo/transferencia]
Tem funcionarios: [sim/nao]
Pro-labore: [sim/nao/pendente]
CCT/ACT: [identificada/pendente]
Sistema folha/Dominio: [status]
Eventos eSocial/DCTFWeb/FGTS Digital: [status]
Pendencias: [lista]
Risco: [baixo/medio/alto]
Pedido: montar checklist DP sem calcular folha/rescisao final.
```

## Modelo 6 - Handoff Contabil
```markdown
Agente destino: Contabil
Contexto: [transferencia/cliente novo]
Periodo inicial: [competencia]
Documentos recebidos: [lista]
Documentos faltantes: [lista]
Saldos/balancetes/extratos: [status]
Integracoes Fiscal/DP: [status]
Risco: [baixo/medio/alto]
Pedido: mapear lacunas de fechamento e conciliacao sem emitir parecer.
```

## Modelo 7 - Handoff Societario
```markdown
Agente destino: Societario
Evento: [abertura/alteracao/baixa/transferencia]
UF/municipio: [dados]
Socios/documentos: [status]
Contrato/alteracoes: [status]
CNAE/natureza juridica: [pendente de revisao]
Assinaturas/procuracoes/certificado: [status]
Risco: [baixo/medio/alto]
Pedido: criar checklist societario sem protocolar nem definir CNAE final.
```

## Modelo 8 - Tarefa para Notion/Gestao
```markdown
Cliente: [nome ou codigo]
Departamento: [Fiscal/DP/Contabil/Societario/Onboarding]
Tarefa: [acao]
Responsavel: [pessoa]
Prazo: [data]
Status: [novo/em andamento/bloqueado/concluido]
Evidencia esperada: [print, protocolo, guia, email, documento]
Risco: [baixo/medio/alto]
Proximo passo: [acao]
```

## Modelo 9 - Mensagem ao cliente pedindo pendencias
```markdown
Oi, [nome]. Para conseguirmos iniciar sua contabilidade com segurança, preciso organizar alguns acessos e documentos.

Pendencias principais:
1. [item]
2. [item]
3. [item]

Esses itens evitam erro de cadastro, atraso em nota/guia/folha e retrabalho no fechamento. Pode me enviar por aqui ou pelo canal combinado?
```
