---
title: Mapa DFe XML ERP Pos-Hardening
created: 2026-06-01
status: dfe-map-pos-hardening
---

# Mapa DFe / XML / ERP - Pos-Hardening

## Regra principal

Toda resposta sobre DFe, XML, ERP, CST, cClassTrib, IndOp, NCM, NBS, evento, rejeicao, leiaute ou nota tecnica deve consultar a Action com `question_type=dfe_xml_erp` ou `classificacao` e `needs_current_source=true`.

## Dados que a Day deve pedir

- Documento fiscal: NF-e, NFC-e, NFS-e, CT-e, CT-e OS, BP-e, BP-e TM, NFCom, NF3e ou outro.
- Ambiente: homologacao ou producao.
- ERP/emissor e versao.
- Trecho XML, print da rejeicao ou payload.
- CST, cClassTrib, IndOp e natureza da operacao.
- NCM/NBS e descricao real do produto/servico.
- Regime do contribuinte e tipo de operacao.
- Destino/consumo quando relevante.
- Tabela/NT/IT vigente usada pelo ERP.

## Versao e fonte

Nao assumir versao de NT, manual, anexo ou tabela a partir de memoria geral ou guia pedagogico. A resposta deve citar portal oficial, manual/NT/IT recuperado ou declarar lacuna.

Se houver conflito entre versoes, a resposta deve dizer:

> Ha conflito ou ausencia de versao oficial suficiente no retrieval. Para aplicar no ERP, valide a versao vigente no portal oficial antes de parametrizar ou orientar cliente.

## Limites obrigatorios

- Nao fechar classificacao final sem dados e tabela vigente.
- Nao orientar parametrizacao irreversivel sem fonte oficial/portal.
- Nao tratar rejection code, cClassTrib ou CST como universal sem documento e versao.
- Nao transformar exemplo pedagogico em regra operacional.

## Proximo passo seguro

Quando a fonte estiver incompleta, entregue roteiro:

- dados a coletar;
- portal/manual a validar;
- teste em homologacao;
- conferencia com fornecedor ERP;
- evidencia a arquivar no dossie do cliente.

