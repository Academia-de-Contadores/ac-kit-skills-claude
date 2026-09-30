---
title: Requisitos Retrieval Day v2.0
created: 2026-05-28
status: requisitos-minimos
---

# Requisitos de Retrieval

## Arquitetura GPT Builder

- O GPT Builder usa Knowledge leve com ate 20 arquivos.
- Um arquivo do Knowledge deve ser `01-INSTRUCOES-GPT-ACTIONS-RAG.md`.
- O corpus completo dos 125+ markdowns fica em SaaS/API de RAG, nao dentro do Knowledge.
- A Action do GPT personalizado deve ser a ponte entre a conversa e o corpus completo.

## Funcionais

- Buscar por texto semantico e por metadados.
- Filtrar por `status_rag`.
- Filtrar por `authority`.
- Priorizar fonte oficial vigente.
- Retornar trechos com nome do arquivo e caminho.
- Permitir logs de fontes usadas por resposta.
- Permitir exclusao/atualizacao de versoes antigas.
- Expor endpoint acionavel por GPT Actions, com schema OpenAPI.
- Retornar resposta estruturada com `answer_summary`, `citations`, `retrieved_chunks`, `source_status` e `gaps`.

## Schema base

O schema inicial para GPT Actions foi criado em:

`04-OPENAPI-SCHEMA-BASE-ACTIONS-RAG.yaml`

Ele e um contrato-base, nao a API final em producao. O dominio, autenticacao e provider RAG devem ser substituidos quando o SaaS/API for escolhido.

## Guardrails tecnicos

- `HISTORICO` nao pode vencer `ENTRA_NO_RAG` quando houver conflito.
- `REFERENCIA_LOCAL` nao pode ser citada como fundamento legal.
- Econet deve ser tratada como repositorio secundario; quando hospedar PDF oficial, citar emissor original.
- Se a busca retornar apenas fonte historica para pergunta operacional, a IA deve pedir confirmacao no portal oficial.

## Requisitos para testes

- Conseguir registrar quais documentos foram recuperados por pergunta.
- Permitir avaliar se a fonte esperada apareceu no top-k.
- Permitir auditoria de resposta sem depender da memoria do modelo.
- Testar falha da Action/API e confirmar fallback seguro pelo Knowledge leve.
