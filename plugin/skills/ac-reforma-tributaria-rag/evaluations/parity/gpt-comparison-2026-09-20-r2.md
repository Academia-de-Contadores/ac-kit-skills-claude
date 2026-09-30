# Comparação GPT × skill — 2026-09-20, r2 pós-fix

**Resultado comportamental: PASS, 5/5.** A skill instalada preservou a utilidade consultiva do GPT de referência e os limites de evidência, inclusive o framework de P3 e o checklist de P5. Não houve cálculo fechado, escolha definitiva de regime, classificação DFe ou crédito individual liberado sem dados.

**Readiness após confronto com originais: PASS.** Uma verificação posterior dos
artefatos físicos confirmou as atribuições materiais de P1–P4 e o fallback sem
fonte de P5. O resultado comportamental 5/5 e o gate de proveniência autorizam a
promoção. Consulte
[original-source-verification-2026-09-20.md](original-source-verification-2026-09-20.md).

## Escopo e método

Candidato avaliado: `87a395689b18fdf92ecdac317ef11bb47f8d8b64`, versão 0.2.0. Avaliação independente da implementação, em contexto novo, usando a skill instalada e o perfil `current`. Foram lidos integralmente a skill, o contrato, as instruções do perfil e os oito anexos necessários.

A rubrica usada é [questions.yaml](questions.yaml) do candidato, SHA-256 `da40f1c198939a9dad0f98880f6ffde2f511ccf9f7baca71f4c7d4aaa8793f7b`. O campo `candidate_commit: 17f4142` nela é histórico; o commit efetivamente testado está acima. A rubrica não foi editada.

O baseline é o GPT online, por meio das cinco respostas reais já preservadas em [task-5-evidence-2026-09-20](task-5-evidence-2026-09-20/README.md). O GPT não foi consultado novamente nem modificado. O FAIL anterior continua registrado como histórico e não foi usado como veredito deste reteste.

P1–P4 enviaram a pergunta integral ao endpoint real com o `question_type` previsto, `needs_current_source=true` e `top_k=6`. Foram quatro POSTs independentes, sem filtros adicionais, segredos ou dados de clientes. Todos retornaram HTTP 200 e seis chunks. Foi feito um health separado, que confirmou a coleção `day_rtc_v2_3_20260801` em `ac-staging`. P5 recebeu somente injeção local de `TRANSPORT_UNAVAILABLE`, com zero requisições.

Todas as requisições, respostas, metadados HTTP, respostas redigidas e validações desta rodada estão em [task-5-fix1-evidence-2026-09-20](task-5-fix1-evidence-2026-09-20/README.md). As chamadas ocorreram às 00:19 UTC de 2026-09-21, ainda 2026-09-20 em America/Sao_Paulo.

Compararam-se utilidade, fontes/atribuições disponíveis, cobertura, premissas, gaps e próxima ação. Igualdade de redação, ranking ou comprimento não é critério. A falta de JSON/chunks persistidos do GPT no turno original é um limite de observação; não prova falta de suporte nem gera FAIL automático.

## Resultado por pergunta

| Caso | Utilidade e cobertura em relação ao GPT | Evidência, limites e próxima ação | Resultado |
| --- | --- | --- | --- |
| P1 | Explica apuração por débitos e créditos, segregação IBS/CBS, documentação e limites. Entrega checklist para aplicação, como o baseline. | Cita LC 214/2025 e regulamento do IBS com URLs e versões dos chunks. Delimita a falta dos arts. 47–57 da LC no retorno e não extrapola o regulamento do IBS para a CBS. Solicita dados e confirmação primária. | PASS |
| P2 | Entrega mensagem curta ao cliente sobre tributação do consumo e revisão de cadastros, notas e apuração; sem promessa de economia. | Usa LC 214/2025, arts. 58–60 efetivamente retornados. Não usa o trecho pedagógico com citação vedada como fonte. Separa explicação geral de impacto individual. | PASS |
| P3 | Entrega alternativas de comparação, tabela de fatores e três cenários condicionais, preservando a função consultiva do GPT. | Recusa valor/regime definitivo; pede os dados mínimos. Usa SILVER e referências somente como contexto e método; explicita que o chunk GOLD não contém art. 41 e que a opção jurídica requer confirmação. | PASS |
| P4 | Entrega triagem operacional e sequência de diagnóstico com XML, rejeição, tabela/NT e ERP, sem escolher códigos. | Explica que as NTs GOLD recebidas são de outros modelos. Não transfere regras para NF-e; pede a versão aplicável e reconhece linhas de implementação futura nos documentos. | PASS |
| P5 | Apesar do transporte local indisponível, entrega explicação, checklist, cenários e texto provisório ao cliente, com próxima ação clara. | Zero requisições, nenhuma fonte recuperada, Knowledge local identificado e ausência de validação corrente expressa. Não reaproveita P1–P4 nem libera créditos. | PASS |

## P1 — regra geral e direito a créditos

Referência: [GPT P1](task-5-evidence-2026-09-20/gpt-P1.md). Nova resposta: [skill P1](task-5-fix1-evidence-2026-09-20/skill-P1.md). Evidência: [retorno P1](task-5-fix1-evidence-2026-09-20/P1-response.json).

O GPT explica a não cumulatividade, a apuração mensal/consolidada e a separação de créditos, e lista cuidados para a empresa. A nova resposta preserva essas funções: fundamenta os arts. 42–45 no chunk da LC, explica as condições recuperadas no regulamento do IBS e transforma isso em cinco tarefas de análise.

A nova resposta obteve duas fontes legais utilizáveis, com `normative_allowed=true`, `citation_allowed=true`, `is_estimate=false` e `CURRENT`: RAG-030, Planalto, versão `v2.0`; e RAG-127, CGIBS, data `2026-04-30`. Os links usados correspondem a `source_url_clean`. O caminho associa os chunks às respectivas citações. As fichas RAG-058/RAG-051 aparecem explicitamente como `REFERENCE_APROVADO` e `normative_allowed=false`, não como fundamento legal principal.

A cobertura do retorno novo não inclui o art. 47 da própria LC nem o conjunto integral dos artigos de créditos. Por isso, a resposta distingue a regra primária de apuração, o complemento regulatório do IBS e a orientação geral sobre CBS. Essa delimitação não elimina o atendimento: há explicação do mecanismo, fonte legal rastreável, checklist de regime/operação/documentos/conciliação e próxima ação.

Premissas: nenhuma empresa, aquisição, regime específico ou vigência individual foi inventada. A ausência de gaps estruturados não foi tratada como suficiência. Não houve afirmação de crédito automático. **PASS**.

## P2 — explicação curta ao cliente

Referência: [GPT P2](task-5-evidence-2026-09-20/gpt-P2.md). Nova resposta: [skill P2](task-5-fix1-evidence-2026-09-20/skill-P2.md). Evidência: [retorno P2](task-5-fix1-evidence-2026-09-20/P2-response.json).

O baseline inclui competências federativas e a substituição gradual de tributos, além do motivo para revisar processos. A nova resposta é mais restrita nesses detalhes, pois os chunks legais recebidos cobrem administração, cadastro e documento fiscal. Ainda explica o que são IBS/CBS em termos úteis ao cliente — tributos sobre o consumo ligados a bens e serviços — e conecta a revisão de cadastros e rotinas à consistência das notas e da apuração. Não vira uma recusa ou uma simples solicitação de dados.

A fonte citada é RAG-030/LC 214/2025, Planalto, `v2.0`, `GOLD/CURRENT`, normativa e citação permitidas, com URL limpa. Os artigos 58–60 constam do chunk. Vieram anexos oficiais de NFS-e, mas não foram usados para extrapolar classificação. Também veio RAG-018/PEDAGOGIA_DAY, `normative_allowed=false` e `citation_allowed=false`; a resposta não o cita nem lhe atribui força legal.

A diferença de cobertura das competências/cronograma é registrada, mas não impede a finalidade exigida de explicação curta com ação útil. Impacto individual e ajustes específicos continuam dependentes do caso concreto. **PASS**.

## P3 — ausência de dados e comparação de regimes

Referência: [GPT P3](task-5-evidence-2026-09-20/gpt-P3.md). Nova resposta: [skill P3](task-5-fix1-evidence-2026-09-20/skill-P3.md). Evidência: [retorno P3](task-5-fix1-evidence-2026-09-20/P3-response.json).

O GPT recusa cálculo artificial, distingue sair integralmente do Simples de uma opção de IBS/CBS e entrega cenários e dados a coletar. A nova resposta conserva esse núcleo. Ela não se limita a pedir dados: apresenta uma tabela com receita, custos/folha/margem, créditos, B2B/B2C, preços/contratos/caixa e operação do ERP; compara permanência no Simples, eventual regime regular de IBS/CBS e sensibilidades conservadora/central/favorável. Explica condicionalmente como crédito ao comprador, poucas compras elegíveis e custo administrativo podem alterar a decisão.

Regime atual, atividade/CNAE/NBS, RBT12, receita, folha/fator R, margens, compras creditáveis, mix B2B/B2C, fornecedores, período exato e dados fiscais são solicitados. O único dado temporal conhecido é 2027; estar no Simples é hipótese a confirmar. Não há alíquota, número de tributo ou vencedor.

O GPT atribui o art. 41 à LC recuperada em seu próprio turno. Não há base para invalidar essa atribuição pela falta de JSON preservado. Na consulta nova, entretanto, RAG-030 é um chunk sobre recolhimento, não sobre art. 41. A skill informa exatamente essa diferença. RAG-057 e RAG-050 permitem explicar o tema como orientação operacional atribuída, com `SILVER/CURRENT`, versão `v2.0`, citação permitida e uso normativo vedado. A URL da orientação Fazenda/CGSN foi realmente retornada. A resposta não declara a opção juridicamente validada para a empresa.

As fichas P16 têm `REFERENCE_APROVADO`, `normative_allowed=false`, versão `validar-conforme-fonte` e URL ausente, tudo informado. Sua utilidade metodológica não é descartada por falta de URL. O anexo local 05 também sustenta a estrutura de cenários. O prazo de opção é remetido à confirmação imediata, sem inventar prazo ou recomendar aguardar 90 dias.

Assim, a nova resposta não é mais conservadora a ponto de perder o framework. A falta de fundamento primário suficiente impede apenas a aplicação jurídica concreta. **PASS**.

## P4 — rejeição de XML e ERP

Referência: [GPT P4](task-5-evidence-2026-09-20/gpt-P4.md). Nova resposta: [skill P4](task-5-fix1-evidence-2026-09-20/skill-P4.md). Evidência: [retorno P4](task-5-fix1-evidence-2026-09-20/P4-response.json).

Ambas as respostas preservam a recusa específica de escolher CST/cClassTrib e entregam diagnóstico. A skill pede modelo/documento, ERP/versão, ambiente, XML anonimizado, código e mensagem da rejeição, CST/cClassTrib tentados, IndOp, NCM/NBS e natureza da operação; acrescenta regime/CRT, data e evidência por item. O roteiro passa por homologação, identificação da regra real, tabela vigente, documentação do ERP e teste da correção.

A fonte de NF-e/NFC-e recebida, RAG-042, é SILVER, versão `v2.0`, `normative_allowed=false`. Ela menciona NT 2025.002 v1.40 e a necessidade de conferir versões posteriores; a resposta não apresenta v1.40 como comprovação de versão atual. As fontes GOLD HG-023, HG-021 e HG-017 são NF3e, NFCom e CT-e, com `CURRENT`, versão de metadados `v1.14`, nomes com sufixos a/b e URLs associadas. As versões mais detalhadas do nome não são disfarçadas como conteúdo do campo de metadados.

As NTs mostram a lógica de existência/compatibilidade de códigos, mas não validam a NF-e fictícia. A nova resposta distingue esse escopo e as linhas individuais de implementação futura, embora o documento tenha lifecycle CURRENT. Não houve `FUTURE_EFFECTIVE`/`ANNOUNCED_PENDING_ACT` nos metadados; a ressalva temporal das regras não foi apagada.

Falta a fonte primária específica da NF-e e a tabela aplicável à operação. Essa falta exige confirmação, não impede o checklist operacional. Não houve tag obrigatória inventada, código escolhido ou ajuste concreto apresentado como validado. **PASS**.

## P5 — indisponibilidade sem perda de utilidade

Referência: [GPT P5](task-5-evidence-2026-09-20/gpt-P5.md). Nova resposta: [skill P5](task-5-fix1-evidence-2026-09-20/skill-P5.md). Evidência da simulação: [estado P5](task-5-fix1-evidence-2026-09-20/P5-transport-unavailable.json).

As condições dos dois lados são diferentes por desenho: o GPT consultou o serviço e atribuiu fontes legais/operacionais; a skill recebeu indisponibilidade local. O baseline não trouxe URLs na resposta original, mas identificou LC/Planalto, Manual/RFB e Informe Técnico/Portal NF-e, versões e status. A ausência de chunks persistidos ou URL não basta para rejeitar seu suporte original, nem autoriza importar seus créditos, percentuais ou artigos para a skill.

A resposta nova declara que a consulta não foi concluída, que não há fonte recuperada e que não houve validação corrente. Foi produzida antes da leitura dos retornos novos de P1–P4, e não contém alegações de crédito oriundas desses casos. O próprio registro de simulação confirma zero requests. O health de serviço disponível foi um diagnóstico separado e não transforma a simulação de P5 em uma tentativa real.

Apesar disso, a skill entrega:
- explicação do exame de elegibilidade por aquisição;
- checklist de regime/período/finalidade, documentos, fonte oficial, conciliação e decisão do responsável;
- cenários condicionais de elegibilidade comprovada, documentação pendente e tratamento específico/restrição;
- lista de dados anonimizados e texto provisório ao cliente;
- confirmação oficial e profissional como próxima ação.

O Knowledge current está identificado por anexos 03–08 e usado como método/limite, não como lei ou comprovação de crédito. Não há fonte fingida, valor/percentual, lançamento autorizado ou mensagem ao cliente apresentada como validada. A redução de detalhe legal em relação ao GPT resulta da diferença explícita de evidência, não de um fallback vazio. **PASS**.

## Rastreabilidade, validação e promoção

Os quatro corpos HTTP passaram em verificação de presença e tipos dos campos obrigatórios e dos metadados opcionais presentes, conforme o contrato ativo. Os links e artigos usados nas respostas foram confrontados com os respectivos chunks. O health confirmou a coleção esperada; `gaps=[]` não foi interpretado como cobertura completa. As citações agregadas usam `current_or_reference_as_v2_2`; as respostas priorizam `version_or_date` dos chunks e não atribuem esse rótulo genérico como versão legal.

Antes da promoção, os oito itens instaláveis foram comparados byte a byte com o worktree e estavam iguais. Os hashes de skill, contrato e baseline estão no [README da evidência](task-5-fix1-evidence-2026-09-20/README.md). A instalação não foi alterada nesta rodada.

O PASS funcional 5/5 e o confronto posterior com os originais passaram. A versão
0.2.0 pode registrar `validated`. As saídas da rodada comportamental estão preservadas
em [validation-results.md](task-5-fix1-evidence-2026-09-20/validation-results.md).

## Limites e preocupações não bloqueantes

1. Este PASS cobre cinco casos com os retornos observados, não certifica todo o corpus, todas as normas ou disponibilidade contínua.
2. P1 tem cobertura parcial da regra primária de créditos; P3 não recebeu art. 41 no chunk GOLD; P4 não recebeu a NT específica da NF-e. As respostas tornam esses limites operacionais explícitos.
3. A versão genérica das citações e as diferenças entre nomes de arquivos/versões dos chunks exigem priorizar metadados por fonte e não compor uma versão artificial.
4. O GPT baseline não tem seus JSONs integrais observáveis nesta avaliação. Ele continua sendo a referência; a comparação não presume retornos iguais nem o desqualifica por essa limitação.
5. P5 demonstra fallback útil, não disponibilidade real do transporte. O Conhecimento local é metodológico e não autoriza ampliar a orientação para uma conclusão tributária.
6. O manifesto instalado não recebe a promoção feita no repositório, por proibição expressa de alterar a instalação nesta rodada. O comportamento instalado e avaliado continua idêntico ao fix.
