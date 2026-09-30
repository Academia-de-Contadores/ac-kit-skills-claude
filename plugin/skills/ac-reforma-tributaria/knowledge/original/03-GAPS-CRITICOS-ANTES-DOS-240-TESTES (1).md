---
title: Gaps Criticos Antes dos 240 Testes
created: 2026-05-28
status: aberto-para-proxima-rodada
---

# Gaps Criticos Antes dos 240 Testes

## Bloqueadores ou quase bloqueadores

| Prioridade | Gap | Evidencia | Impacto | Recomendacao |
|---|---|---|---|---|
| P0 | NF-e/NFC-e RTC: reconciliar versao vigente | Web oficial em 28/05/2026 indicou NT 2025.002 v1.36 no Portal NF-e; corpus local tem v1.34/v1.30/v1.20 e mencoes anteriores a v1.40 | Alto para testes DFe/NF-e | Baixar PDF oficial vigente do Portal NF-e, converter e marcar v1.34/v1.30/v1.20 como historicas |
| P0 | DeRE manuais/leiautes | Receita publicou manuais/leiautes da DeRE em fevereiro/2026 | Alto para regimes especificos e apuracao | Baixar pacote DeRE oficial e converter itens principais |
| P1 | Manual Piloto RTC v3 maio/2026 | RFB lista Manual Piloto v3 em 08/05/2026 | Medio para glossario e piloto | Baixar e converter antes da expansao 360 |
| RESOLVIDO | Resolução CGIBS 6/2026 integral | PDF oficial baixado do CGIBS, convertido para Markdown e integrado como `RAG-127` | Reduz risco para respostas IBS | Usar `RAG-127`; manter `RAG-038` apenas como referência local |
| P1 | Decreto 12.955/2026 integral | Fonte oficial existe; verificar granularidade local | Medio/alto para CBS | Conferir se corpus tem texto integral ou ficha |
| P2 | CT-e/BP-e/NFCom/NF3e versoes finais | Econet tem varias NTs; SVRS indica atualizacoes | Medio para DFe especializado | Conferir portal modelo por modelo |

## Nao bloqueadores

- Criar matriz artigo-a-artigo da LC 214 para testes 360.
- Gerar dataset JSONL para provider RAG apos escolha da API.
- Criar testes de retrieval com fonte esperada por pergunta.
