---
title: Lacunas e roadmap - Fiscal
type: knowledge-roadmap
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

# Lacunas e roadmap - Fiscal

## Lacunas atuais
- 31 PDFs fiscais tiveram OCR pendente/candidato na extracao original.
- Manuais longos e materiais de regime exigem revisao humana antes de virar resposta operacional.
- DOCX fiscais e anexos XLSX ainda precisam de pipeline proprio se forem usados profundamente.
- Reforma/cClassTrib/CBS/IBS depende de fonte vigente e agente Reforma.
- Retrieval/RAG fiscal nao deve ser ativado sem teste comparando Knowledge Pack simples vs busca granular.

## Decisao RAG da thread Fiscal
Status: `nao_criar_agora_revisar_em_thread`.

Justificativa:
- O Knowledge Pack fiscal agora cobre as rotas principais.
- O acervo fiscal e grande e tecnicamente sensivel, mas o usuario definiu que RAG so entra se realmente necessario.
- Se houver RAG futuro, comecar apenas por POPs curtos e DOCX operacionais validados.
- Manuais longos, regimes, IRPF, planejamento e Reforma ficam `reference_only` ate revisao.

## Roadmap
1. Rodar testes v2.
2. Conferir se o agente encontra respostas pelo pack simples.
3. Se houver falha recorrente por fonte dispersa, abrir `rag-opcional/` com manifesto.
4. Revisar OCR pendente antes de qualquer corpus ampliado.
5. Validar com Contador Senior Fiscal antes de uso publico.
