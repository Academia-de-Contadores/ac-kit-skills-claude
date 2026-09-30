---
title: Mapa DFe XML ERP
created: 2026-05-28
status: auditoria-inicial-fechada-com-gaps
subagente: Especialista DFe/XML
---

# Mapa DFe / XML / ERP

## Veredito

A base tem cobertura ampla para DFe, mas nao deve ser considerada fechada para respostas operacionais definitivas enquanto as versoes vigentes de todos os portais oficiais nao forem reconciliadas.

## Cobertura por documento

| Documento | Cobertura local | Status | Acao antes dos 240 testes |
|---|---|---|---|
| NF-e/NFC-e | Base original v1.34; Econet v1.20/v1.30; Deep Search menciona v1.40; web em 28/05/2026 indicou NT 2025.002 v1.36 no Portal NF-e | Gap critico de versao | Baixar/verter NT 2025.002 v1.36 oficial antes de teste operacional definitivo |
| NFS-e | NT 005 original e historica; Deep Search aponta NTs novas/Anexo VI | Gap medio/alto | Conferir Portal NFS-e e anexos vigentes |
| CT-e/CT-e OS | Econet tem NTs RTC; portal SVRS indica atualizacoes 2025.001 | Coberto parcialmente | Validar versao vigente no SVRS |
| BP-e/BP-e TM | Econet tem NTs RTC; portal SVRS indica atualizacoes | Coberto parcialmente | Validar versao vigente no SVRS |
| NFCom | Econet tem NTs RTC; portal SVRS indica atualizacoes | Coberto parcialmente | Validar versao vigente no SVRS |
| NF3e | Econet tem NTs RTC; portal SVRS indica atualizacoes | Coberto parcialmente | Validar versao vigente no SVRS |
| DeRE | RFB disponibilizou manuais/leiautes em fevereiro/2026 | Gap relevante | Baixar manual/leiautes DeRE para corpus se a IA responder regimes especificos |
| XML NFe novembro/2025 | RFB lista documento XML NFe nos manuais RTC | Gap util | Avaliar ingestao como apoio tecnico XML |

## Regras para a Day

- Se o usuario perguntar sobre versao de NT, a IA deve citar data e portal oficial ou pedir confirmacao.
- Se houver conflito entre v1.34, v1.36, v1.40 ou qualquer versao, a IA deve dizer que fonte oficial vigente vence.
- Para CST/cClassTrib/IndOp, a IA deve pedir NCM/NBS, descricao real, natureza da operacao, documento fiscal, destino/consumo, regime e tabela vigente.
- Para ERP, a IA deve orientar homologacao, XML, logs de rejeicao, ambiente e fornecedor do emissor.
