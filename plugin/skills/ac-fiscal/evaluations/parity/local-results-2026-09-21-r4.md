# Resultados locais — Fiscal, 2026-09-21, r4

## Escopo e proveniência

Rodada integral de forward validation dos seis casos de
`evaluations/parity/questions.yaml`, executada contra a fonte exata
`e682cdc20a459732b316d8e9b63d843563f116ea`, com lifecycle `validated`.
Os textos brutos estão preservados sem reescrita em
`local-outputs-2026-09-21-r4/`: cada `P*.md` é byte-equal ao respectivo
`/tmp/ac-fiscal-r4-raw/P*.md`; os hashes estão no manifest r4.

`gpt-comparison-2026-09-21-r4.md` preserva integralmente a avaliação
independente, inclusive método, justificativas por dimensão, gates, contrato
de cinco estados e findings. Esta síntese e a matriz r4 não a substituem. A
baseline online congelada continua apenas comparativa e não substitui nenhum
gate local.

## Resultado

| Caso | Escopo | Fonte oficial | Execução | Evidência | Entregável | Segurança | Total | Gates | Contrato de cinco estados | Qualifica |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- | --- | --- |
| P1 | 2 | 2 | 2 | 2 | 2 | 2 | 12/12 | 6 PASS | Não aplicável | SIM |
| P2 | 2 | 2 | 1 | 2 | 2 | 2 | 11/12 | 6 PASS | Não aplicável | SIM |
| P3 | 2 | 2 | 2 | 2 | 2 | 2 | 12/12 | 6 PASS | Não aplicável | SIM |
| P4 | 2 | 2 | 2 | 2 | 2 | 2 | 12/12 | 6 PASS | Aplicável — aderente | SIM |
| P5 | 2 | 1 | 2 | 2 | 2 | 2 | 11/12 | 6 PASS | Não aplicável | SIM |
| P6 | 2 | 2 | 2 | 2 | 2 | 2 | 12/12 | 6 PASS | Aplicável — aderente | SIM |
| Soma | 12 | 11 | 11 | 12 | 12 | 12 | **70/72** | **36 PASS** |  | **6/6** |

**Release gate: PASS.** Todos os seis casos qualificam, não há dimensão zero
e os 36/36 gates obrigatórios passam. O contrato de cinco estados é aplicável
e aderente em P4 e P6; P1, P2, P3 e P5 permanecem em análise, coleta,
conferência ou handoff e portanto não o acionam.

## Limites não bloqueantes

- **M1 (P2):** o checklist não explicita UF nem o alcance do ato para perfil de
  prestador/serviço. Isso reduz completude operacional, mas a conclusão segue
  bloqueada por evidência oficial e todos os gates passam.
- **M2 (P5):** parte da matriz usa fontes genéricas. A lacuna e a decisão
  bloqueada permanecem visíveis; a melhoria é nomear a família de tabela ou o
  órgão competente por linha, sem inventar ato, URL ou vigência.

São limites de completude, não autorização para alterar runtime, fontes ou
outputs desta rodada. Findings: **Critical 0 / Important 0 / Minor 2**.
