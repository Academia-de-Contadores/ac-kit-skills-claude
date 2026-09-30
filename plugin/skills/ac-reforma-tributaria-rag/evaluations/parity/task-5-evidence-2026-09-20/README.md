# Evidências independentes da Task 5 — 2026-09-20

> **HISTÓRICO / SUPERADO PARA O COMPORTAMENTO ATUAL.** Este índice preserva a
> primeira execução e seus resultados sem recalculá-los. A nova execução com a
> rubrica alinhada ao GPT está em
> [gpt-comparison-2026-09-20-r2.md](../gpt-comparison-2026-09-20-r2.md) e passou
> 5/5 no comportamento e no confronto posterior com os originais.

Veredito global histórico, sob a rubrica anterior: **FAIL**. Status da Task:
**DONE_WITH_CONCERNS**. Execução histórica: **5/5 perguntas**, skill local
**5/5 PASS**, comparação observada **3 PASS / 2 FAIL** (P3 e P5). Naquela
rodada não houve promoção de lifecycle, mudança de versão, commit de release ou
push.

## Evidências

- [Respostas da skill instalada](skill-responses.md), produzidas antes da consulta ao GPT.
- [Requisições e retornos integrais do serviço para P1–P4](local-retrieval.json); P5 local contém somente a simulação TRANSPORT_UNAVAILABLE.
- Respostas originais do GPT: [P1](gpt-P1.md), [P2](gpt-P2.md), [P3](gpt-P3.md), [P4](gpt-P4.md), [P5](gpt-P5.md).
- Auditorias adicionais que não substituem as respostas originais: [P3](gpt-P3-audit.md) e [P5](gpt-P5-audit.md).

## Resultado por critério

PASS abaixo significa comportamento observado aceitável para o escopo do caso; não significa inspeção do JSON interno da Action, que a UI não expôs.

| Caso | Fontes/autoridade | Cobertura essencial | Citações | Premissas | Gaps | Próxima ação | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P1 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P2 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P3 | FAIL | PASS | FAIL | PASS | FAIL | PASS | FAIL |
| P4 | PASS | PASS | PASS | PASS | PASS | PASS | PASS com ressalvas |
| P5 | FAIL | FAIL | FAIL | PASS | FAIL | PASS | FAIL |

Em P3 o GPT afirmou recuperar o art. 41 da LC 214/2025 como GOLD/CURRENT, normative_allowed=true, mas depois retirou a atribuição: disse que o retorno estava vazio e que não tinha chunks/metadados auditáveis. A consulta local desse caso trouxe o assunto de regimes em SILVER/REFERENCE_APROVADO sem permissão normativa; o único chunk GOLD local tratava de pagamento, não do art. 41.

Em P5 o GPT apresentou o art. 381, o percentual de 9,25% e fontes GOLD/CURRENT, sem URLs. Na auditoria sem nova consulta, declarou não ter retrieved_chunks, source_status ou metadados comprováveis, retirou a atribuição e disse que a orientação precisava de revisão antes de aplicação.

Sob a rubrica anterior, esses achados foram classificados como falhas de
sustentação/rastreabilidade posterior. Eles **não estabelecem que a resposta
original omitiu uma lacuna observável naquele turno**, não provam que o conteúdo
da lei ou o percentual sejam falsos e não diagnosticam falha no servidor. O
serviço respondeu normalmente às consultas HTTP locais; a UI mostrou os pedidos
da Action, mas não seu JSON de resposta. Pode haver limitação de
disponibilização/persistência do retorno entre turnos; essa hipótese requer
investigação.

P5 não é reprovada por diferir da resposta local: a skill exercitou indisponibilidade de transporte simulada, enquanto o GPT teve consulta real autorizada. A reprovação online decorre da evidência que não conseguiu sustentar, não dessa diferença de disponibilidade.

Ressalvas não bloqueantes dos casos aprovados: P1 local delimita mais claramente o alcance da fonte de IBS frente à CBS; P2 GPT omite a versão v2.0 na citação e usa explicação mais ampla; P4 GPT pede XML completo sem instrução explícita de anonimização e não explicita o detalhe temporal das regras futuras de outros modelos. Como todos os casos enviados foram públicos e fictícios, não houve transmissão de dados reais de clientes. P4 não escolheu código nem validou alteração de ERP.

## Validação estrutural e limpeza

- quick_validate.py, com Python 3.10.13 indicado: exit 0, `Skill is valid!`.
- `bash scripts/validate-agent-repo.sh`: exit 0, `agent repository validation passed`.
- Comparação `diff -qr` dos oito itens instalados: exit 0, nenhuma divergência.
- Aba IAB temporária 1 fechada após preservar as respostas. Nenhuma configuração do GPT alterada; Update não foi utilizado.

Relatório completo local (ignorado pelo Git): `.superpowers/sdd/2026-09-20-rag-skill-ready/task-5-report.md`.
