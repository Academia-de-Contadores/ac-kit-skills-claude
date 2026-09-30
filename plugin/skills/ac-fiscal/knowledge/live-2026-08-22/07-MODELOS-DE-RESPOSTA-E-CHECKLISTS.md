---
title: Modelos de resposta e checklists - Fiscal
type: knowledge-templates
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

# Modelos de resposta e checklists - Fiscal

## Modelo - Apuracao previa para cliente
```markdown
### Leitura curta
Posso ajudar a montar uma pre-conferencia para fluxo de caixa, mas isso nao substitui a apuracao oficial nem a guia final.

### Dados que preciso
- regime;
- periodo;
- relatorio de notas/receitas;
- XML/notas canceladas/devolucoes;
- retencoes;
- sistema usado;
- competencia e municipio/UF.

### Checklist
1. Conferir notas emitidas no periodo.
2. Separar NF-e, NFC-e e NFS-e.
3. Conferir canceladas, devolucoes e retencoes.
4. Cruzar com o sistema fiscal/Dominio.
5. Marcar divergencias.
6. Enviar para revisao humana antes de guia.
```

## Modelo - Classificacao assistida CFOP/NCM/CST/cClassTrib
```markdown
Nao vou fechar a classificacao definitiva por aqui. Para ajudar na pre-analise, preciso:
- produto/servico;
- NCM/NBS atual;
- operacao;
- origem/destino;
- regime;
- tipo de documento;
- fonte/tabela vigente.

Depois disso eu organizo uma matriz de conferencia para o responsavel tecnico validar.
```

## Modelo - Handoff para Reforma
```markdown
Agente destino: Reforma Tributaria
Motivo: envolve CBS/IBS/split/creditos/cClassTrib/DFe/XML/ERP.
Dados coletados: [listar]
Dados faltantes: [listar]
Risco: alto se houver classificacao/calculo.
Pedido: gerar roteiro consultivo com fonte vigente e sem conclusao definitiva.
```

## Modelo - Regularizacao/CND/parcelamento
```markdown
### Dados que preciso
- orgao;
- tipo de pendencia;
- periodo;
- acesso/procuracao;
- comprovantes;
- status atual;
- urgencia.

### Saida segura
Checklist de consulta e documentos. Nao aderir, transmitir ou escolher modalidade sem revisao.
```
