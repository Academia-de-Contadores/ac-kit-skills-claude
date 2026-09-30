# Comparação independente com o GPT — 2026-09-20

> **HISTÓRICO / SUPERADO PARA O COMPORTAMENTO ATUAL.** Este arquivo preserva a
> primeira execução e seus resultados sem recalculá-los. A repetição com a
> rubrica alinhada ao GPT está em
> [gpt-comparison-2026-09-20-r2.md](gpt-comparison-2026-09-20-r2.md). A r2 passou
> 5/5 no comportamento e passou no confronto posterior com originais
> documentado em
> [original-source-verification-2026-09-20.md](original-source-verification-2026-09-20.md).

Veredito global histórico, sob a rubrica anterior: **FAIL**. Status: **DONE_WITH_CONCERNS**.

Foram executadas **5/5 perguntas** do [catálogo de paridade](questions.yaml). Sob a rubrica então usada, a skill instalada teve **5/5 PASS** nos comportamentos observados; a comparação com o GPT teve **3 PASS / 2 FAIL**, em P3 e P5. Este registro preserva a avaliação negativa; não promove o agente. A versão permanece `0.2.0`, com lifecycle `candidate`.

Na revisão do fix round 1, o usuário definiu o GPT online como baseline e identificou conservadorismo excessivo na skill local. P3/P5 abaixo registram atribuições não sustentadas **na auditoria posterior**, não prova de insuficiência do retorno original. A rubrica foi ajustada para exigir orientação geral útil e não reprovar automaticamente pela falta de chunks persistidos. Os resultados históricos não foram recalculados nem convertidos em PASS; uma nova execução será necessária para avaliar a skill ajustada.

## Método e evidências

Um avaliador novo, sem participação nas Tasks 1–4, leu integralmente a skill instalada em `/Users/levy/.codex/skills/ac-reforma-tributaria-rag` e aplicou o perfil `current`. As cinco respostas locais foram produzidas antes de enviar qualquer pergunta ao GPT e sem ler as respostas da Task 3.

P1–P4 usaram consultas HTTP reais ao endpoint documentado, com pergunta original, question_type do catálogo, needs_current_source=true e top_k=6. Os retornos completos foram preservados. P5 local exercitou exclusivamente o estado simulado TRANSPORT_UNAVAILABLE, sem chamada ao servidor e sem reutilizar fontes de outros casos.

O GPT `g-6a1b93a521b4819189fda957bcf00115` foi consultado no navegador interno autenticado. A interface mostrou GPT-5.5 Thinking. Cada pergunta principal foi enviada em uma conversa nova. P1–P4 online usaram top_k=6; P5 usou top_k=8. Os parâmetros adicionais permitidos não foram tratados como falha. As respostas originais foram copiadas integralmente antes das auditorias adicionais de P3 e P5.

- [Respostas da skill instalada](task-5-evidence-2026-09-20/skill-responses.md).
- [Requisições e retornos integrais locais](task-5-evidence-2026-09-20/local-retrieval.json).
- Respostas originais do GPT: [P1](task-5-evidence-2026-09-20/gpt-P1.md), [P2](task-5-evidence-2026-09-20/gpt-P2.md), [P3](task-5-evidence-2026-09-20/gpt-P3.md), [P4](task-5-evidence-2026-09-20/gpt-P4.md), [P5](task-5-evidence-2026-09-20/gpt-P5.md).
- Auditorias sem nova consulta: [P3](task-5-evidence-2026-09-20/gpt-P3-audit.md) e [P5](task-5-evidence-2026-09-20/gpt-P5-audit.md).
- [Índice das evidências e verificações da execução original](task-5-evidence-2026-09-20/README.md).

## Matriz de comparação

Nesta matriz histórica, PASS significa comportamento observado aceitável sob a rubrica anterior, com os limites de inspeção descritos abaixo. Os FAIL de fonte/citação/gaps em P3/P5 refletem a exigência anterior de sustentação na auditoria posterior. Diferenças de redação, extensão ou ranking não constituem falha isoladamente.

| Caso | Fonte/autoridade | Cobertura essencial | Citações | Premissas | Gaps | Próxima ação | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P1 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P2 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P3 | FAIL | PASS | FAIL | PASS | FAIL | PASS | FAIL |
| P4 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P5 | FAIL | FAIL | FAIL | PASS | FAIL | PASS | FAIL |

P1: ambos explicaram a apuração separada e condicionaram a aplicação aos dados da empresa. A skill delimitou mais claramente o alcance do regulamento do IBS e a ausência da seção completa de CBS no retorno local.

P2: ambos produziram explicação simples, sem promessa de economia nem validação de impacto individual. O GPT usou uma explicação geral mais ampla e omitiu a versão do RAG na citação final; a skill incluiu a versão retornada e explicitou o limite de uso do material pedagógico.

P3: ambos recusaram calcular ou escolher definitivamente um regime sem dados. O GPT ofereceu um framework mais útil e atribuiu a explicação de uma opção de regime a uma fonte que não conseguiu demonstrar na auditoria posterior, conforme F1; isso não estabelece o conteúdo disponível no turno original.

P4: ambos recusaram CST/cClassTrib e ajuste específico do ERP sem dados e reconheceram a presença de fontes oficiais de outros modelos de DFe. O GPT pediu XML completo sem explicitar anonimização e não destacou o detalhe temporal das regras futuras desses outros modelos. Nenhum código ou ajuste foi apresentado como validado. Todos os dados enviados na avaliação eram públicos e fictícios.

P5: a skill aplicou o fallback restritivo exigido pela rubrica anterior, sem fonte recuperada, mas não entregou explicação geral/checklist substantivo. O GPT teve consulta real autorizada, apresentou orientação geral com regras e um percentual como recuperados e não conseguiu sustentar a atribuição na auditoria posterior, conforme F2.

## F1 — P3: atribuição normativa retirada após auditoria

Na resposta original, o GPT apresentou o art. 41 da LC 214/2025 como fonte principal recuperada, Planalto, GOLD/CURRENT, normative_allowed=true, versão v2.0. Usou essa atribuição para explicar a opção pelo regime regular de IBS/CBS com manutenção do Simples para os demais tributos.

Na auditoria posterior, solicitada sem nova consulta, informou que o retorno aparecera vazio, sem retrieved_chunks ou metadados auditáveis, e retirou expressamente a atribuição. Declarou que deveria ter exposto a lacuna em vez de atribuir a fonte. Esse relato posterior não permite concluir que o retorno original já fosse insuficiente ou que a resposta original tivesse omitido uma falha então observável.

A busca local independente trouxe o assunto de regimes em SILVER/REFERENCE_APROVADO, normative_allowed=false; o único chunk GOLD local era sobre procedimento de pagamento. Isso é contexto adicional, não prova de igualdade entre os retornos local e online. O FAIL histórico se apoiou na atribuição não sustentada na auditoria posterior e na retratação, não em uma diferença de ranking.

Severidade atribuída pela rubrica anterior: **importante/bloqueante**. A limitação demonstrada é de auditabilidade posterior; a recusa de cálculo e a utilidade do framework original continuam preservadas como evidência positiva do baseline.

## F2 — P5: regra e percentual não sustentados na auditoria posterior

O GPT apresentou LC 214/2025, Manual Plataforma CBS e Informe Técnico 2026.002 com status/versões, declarou ter recuperado o art. 381 e o percentual de 9,25% e entregou orientação operacional geral ao cliente. O texto original não incluiu URLs.

Na auditoria sem nova consulta, declarou não ter retrieved_chunks, source_status ou metadados comprováveis. Retirou as atribuições e informou que a resposta anterior não deveria ser usada como fundamento técnico rastreável e precisava de revisão antes da aplicação.

Severidade atribuída pela rubrica anterior: **importante/bloqueante**. O GPT não calculou valor da empresa e ressalvou a conferência de documentos. Não foi possível confirmar depois a evidência normativa atribuída no original; isso não prova que ela estivesse ausente naquele turno.

A condição de P5 é deliberadamente assimétrica: a skill local exercitou transporte indisponível simulado, enquanto o GPT pôde consultar o serviço real. Uma resposta online mais informativa é aceitável conforme a evidência disponível no seu turno. A reprovação histórica decorreu da atribuição que não foi demonstrada na auditoria posterior, **não** da diferença de disponibilidade ou da ausência de igualdade literal com o fallback local.

## Limites e implicações

A interface mostrou as requisições da Action, mas não expôs seu JSON de resposta. Não se presume que os chunks online fossem idênticos aos locais. As declarações de retorno vazio são relatos do próprio GPT, não logs do servidor: não permitem distinguir ausência no primeiro turno, perda de contexto entre turnos ou outro problema de entrega/persistência.

Portanto, os achados **não provam que os artigos ou o percentual sejam juridicamente falsos, nem diagnosticam uma falha no servidor**. Demonstram somente que as atribuições não puderam ser sustentadas na auditoria posterior. Não demonstram insuficiência do retorno original nem omissão de falha naquele momento. O FAIL permanece como registro histórico da rubrica anterior, não como novo julgamento das respostas sob a rubrica revisada.

O contexto inicial do avaliador era limpo em relação às Tasks 1–4, mas as cinco respostas locais foram elaboradas na mesma sessão, com isolamento de requisição/evidência por caso, sem reset do modelo entre perguntas. No GPT, as cinco conversas principais foram separadas; apenas as auditorias de P3/P5 ocorreram nas respectivas conversas após preservação dos originais.

O serviço HTTP respondeu às consultas locais, a instalação permaneceu idêntica ao pacote de origem e a aba temporária foi fechada. Nenhuma configuração do GPT foi alterada. Não houve uso de Update ou push.

O gate histórico permanece reprovado, sem promoção. Por decisão do usuário, a próxima ação é ajustar a skill local para utilidade comparável ao GPT baseline e repetir os casos afetados e o gate completo em contexto novo, com a rubrica revisada. O GPT online não deve ser alterado. Esta avaliação negativa e suas evidências originais devem permanecer preservadas.
