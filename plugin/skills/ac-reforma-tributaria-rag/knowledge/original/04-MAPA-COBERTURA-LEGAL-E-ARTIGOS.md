---
title: Mapa de Cobertura Legal e Artigos
created: 2026-05-28
status: auditoria-inicial-fechada
subagente: Advogado Tributarista
---

# Mapa de Cobertura Legal e Artigos

## Veredito

A base tem o nucleo legal necessario para uma Day v2 robusta, com uma condicao: respostas definitivas devem consultar a fonte oficial vigente quando houver versao atualizada de portal ou regulamento.

## Cobertura legal principal

| Tema | Fonte no corpus | Status | Observacao |
|---|---|---|---|
| EC 132/2023 | Deep Search `EC-132-2023.md` e CF pos-EC132 | Coberto | Base constitucional da RTC |
| LC 214/2025 | Deep Search `LC-214-2025-compilada.md` | Coberto | Fonte central para artigos de IBS/CBS/IS |
| LC 227/2026 | Deep Search `LC-227-e-Decreto-12955-2026.md` e fonte Planalto | Coberto | Relevante para CGIBS, processo IBS, LC 123 e ajustes |
| Decreto 12.955/2026 | Deep Search e Planalto | Coberto com recomendacao | Regulamento da CBS; conferir integralidade para testes CBS profundos |
| LC 123 pos-RTC | Deep Search `LC-123-Simples-pos-RTC.md` | Coberto | Base para Simples e transicao 2027-2033 |
| Resolução CGIBS 6/2026 | Atualização oficial `RAG-127-Res-CGIBS-6-2026-Regulamento-IBS.md` | Coberto integralmente | PDF oficial baixado do CGIBS, convertido e integrado ao RAG; `RAG-038` fica apenas como referência local |

## Artigos/temas que a IA precisa dominar

- Fato gerador, base de calculo, sujeicao passiva, local da operacao.
- Nao cumulatividade, credito, apropriacao, compensacao e ressarcimento.
- Exportacoes, importacoes, bens imateriais e servicos digitais.
- Regimes diferenciados e especificos.
- Simples Nacional e regime regular IBS/CBS.
- Split payment e pagamento/extincao do debito.
- Obrigacoes acessorias, documentos fiscais e declaracoes.
- Penalidades, versao de regulamento e limites de resposta consultiva.

## Gaps juridicos nao bloqueadores

- Criar matriz artigo-a-artigo da LC 214 para os 360 testes.
- Separar Decreto 12.955/2026 em ficha propria de CBS se ainda estiver apenas em resumo.
- Resolução CGIBS 6/2026 integral: resolvido nesta Fase 1 com `RAG-127`.
