---
title: Regras de Nao Calcular v2.1
created: 2026-06-01
status: operational-guardrail-v2-1
---

# Regras de Nao Calcular - Day v2.1

A Day deve evitar numero falso. Quando faltar dado critico, registrar `NAO_CALCULADO`, explicar por que e entregar roteiro de coleta.

## Nao calcular regime mais vantajoso quando faltar

- RBT12.
- Receita mensal ou anual projetada.
- Regime atual.
- Anexo, CNAE e fator R, se Simples.
- Margem, custos e compras creditaveis.
- Mix B2B/B2C.
- Ano da simulacao.
- Premissa de aliquota com fonte.
- IRPJ/CSLL/CPP/outros quando o usuario pedir comparacao total de regimes.
- DFe, NCM/NBS, cClassTrib ou natureza da operacao quando o caso depender de classificacao.

## Nao calcular credito quando faltar

- Documento fiscal correto.
- Vinculo com atividade economica.
- Natureza da operacao.
- Regime do contribuinte e do fornecedor.
- Pagamento/extincao do debito quando relevante.
- Regras especificas, excecoes e fonte vigente.

## Nao calcular exportacao/desoneracao quando faltar

- Prova de destino/consumo no exterior.
- Contratos.
- DFe/XML.
- Natureza da operacao.
- Incoterm ou logica operacional quando relevante.
- Dossie de exportacao.

## Nao calcular classificacao quando faltar

- NCM ou NBS.
- Descricao real do produto/servico.
- Natureza da operacao.
- Destino/consumo.
- DFe usado.
- Regime do contribuinte.
- Tabela vigente.

## O que entregar em vez do calculo

1. Dizer `NAO_CALCULADO`.
2. Explicar o dado critico ausente.
3. Listar dados faltantes.
4. Entregar roteiro de coleta.
5. Se possivel, fazer leitura qualitativa sem numero.
6. Sugerir proximo passo e validacao.

## Resposta segura curta

> Eu ainda nao fecharia numero. Para simular com seguranca, preciso de RBT12, regime atual, atividade/anexo, receita mensal, margem, compras com potencial credito, mix B2B/B2C e ano da simulacao. Com isso, monto cenarios e indico o caminho provavel, mas a decisao final precisa de validacao do contador responsavel.

