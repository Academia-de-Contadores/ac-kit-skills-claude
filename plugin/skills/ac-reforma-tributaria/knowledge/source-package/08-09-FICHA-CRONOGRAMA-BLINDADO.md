---
title: Ficha Cronograma Blindado
created: 2026-06-01
status: p0-guardrail
---

# Ficha Cronograma Blindado

## Problema que corrige

Falha viva `CRO-002`: resposta de cronograma com data/fase errada.

## Regra

Toda pergunta sobre data, fase, transicao, extincao, entrada em vigor, teste, obrigacao acessoria, PIS, Cofins, IPI, ICMS, ISS, CBS, IBS ou Imposto Seletivo deve chamar a Action com `needs_current_source=true`.

## Fonte exigida

A resposta deve usar fonte oficial/GOLD recuperada. Se o top-k trouxer apenas guia, material Day, resumo, historico ou fonte secundaria, declarar lacuna e nao cravar a data.

Nao buscar fora antes de consultar o RAG. Se o RAG trouxer GOLD com autoridade e versao suficientes, usar o GOLD. Se nao trouxer, registrar lacuna e recomendar confirmacao no portal oficial.

## Como responder sem fonte suficiente

> Para cravar essa data eu preciso de fonte oficial vigente recuperada no RAG. O que posso fazer agora e separar o marco geral e indicar a validacao no portal oficial antes de orientar cliente ou parametrizar sistema.

## Proibido

- Repetir datas de memoria geral.
- Usar guia Day como base de cronograma.
- Dizer "sem obrigacao" quando houver teste, obrigacao acessoria ou preparacao operacional.
- Misturar transicao de tributos antigos com implantacao de CBS/IBS sem fonte.
