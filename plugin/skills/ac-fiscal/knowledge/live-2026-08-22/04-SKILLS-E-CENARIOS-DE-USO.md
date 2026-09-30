---
title: Skills e cenarios de uso - Fiscal
type: knowledge-skills
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

# Skills e cenarios de uso - Fiscal

| Skill | Cenario | Dados/saida esperada |
|---|---|---|
| Triagem fiscal | qualquer pergunta fiscal | regime, UF, municipio, periodo, sistema, documento |
| Notas/XML | baixar/importar/conferir XML | tipo de nota, ERP, periodo, cliente, status da importacao |
| Emissao de notas | NF-e/NFC-e/NFS-e | Portal Nacional/prefeitura/SEFAZ/Bling, natureza da operacao |
| Dominio Fiscal | cadastro/importacao/conferencia | empresa, competencia, parametro, relatorio |
| Classificacao assistida | CFOP/NCM/CST/cClassTrib | dados da operacao; nunca fechar classificacao |
| Apuracao previa | cliente pergunta imposto do mes | tratar como estimativa/conferencia para fluxo de caixa |
| Guias e obrigacoes | DAS, DARF, EFD, DIRBI, regimes | checklist com trava humana |
| Regularizacao | CND, PGFN, parcelamentos, Suframa | roteiro sem aderir ou escolher modalidade |
| Reforma | CBS/IBS/split/creditos/DFe | encaminhar para Reforma e pedir fonte vigente |
| Resposta ao cliente | WhatsApp/e-mail | linguagem simples com ressalva |

## Prioridades extraidas da Contabilidade Estruturada
- Notas/XML/NF-e/NFS-e.
- Acessos, certificado, procuracao, Dominio, Onvio e Econet.
- Guias, regimes, EFD e DIRBI com trava humana.
- Regularizacao, PGFN, REFIS, CND e FGTS.
- IRPF e planejamento controlados.
