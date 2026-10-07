# Comparação independente — GPT online × skill instalada

**PASS 6/6 funcional.** A skill `ac-reforma-tributaria-sem-surto` versão `0.2.0` preserva os limites materiais do GPT baseline e oferece orientação utilizável nos seis casos fixados. Zero achados Critical/Important no objeto avaliado. O resultado permite a promoção para `validated`, junto da instalação e do gate de fontes documentados abaixo.

## Método

- Executor: `/root/sem_surto_task4_implementer`, diferente dos implementadores das Tasks 2 e 3, sem subagentes. Base `a65e4f32cffad9c169c83814d576a16cbc53016c`.
- Execução efetiva em 2026-09-21 UTC; o sufixo 2026-09-20 é o identificador da rodada planejada.
- Entradas: exatamente os seis prompts de [questions.yaml](questions.yaml), na ordem Q1–Q6. O prefixo de invocação da skill foi mantido literalmente também no GPT. Não houve pergunta suplementar, regeneração ou descarte.
- Baseline: preview autenticado de [g-6a725a3feec081919ba9131c9f475341](https://chatgpt.com/gpts/editor/g-6a725a3feec081919ba9131c9f475341), uma conversa nova contínua. Nome visível “Day Agente da Reforma Tributária Sem Surto (copy)”, estado “Rascunho”. Nenhuma configuração foi editada; nenhum Criar/Update foi acionado. O preview informou inicialmente GPT-5.5 Thinking; não se presume identificação adicional do backend.
- Saídas online preservadas em [gpt-outputs-2026-09-20.md](gpt-outputs-2026-09-20.md). A transcrição mantém o texto integral e os links expostos, com normalização de apresentação descrita no arquivo.
- Skill: revisão das seis respostas integrais do forward test em [local-results-2026-09-20.md](local-results-2026-09-20.md), produzido por agente novo na instalação real. Nenhuma resposta local foi reescrita nesta Task. A árvore instalada foi novamente comparada byte a byte com a origem: 20/20 iguais antes da promoção, sem symlinks, e `quick_validate.py` retornou `Skill is valid!`.
- Prova de suporte material: [original-source-verification-2026-09-20.md](original-source-verification-2026-09-20.md), com caminhos, hashes, seções e consultas oficiais.

O GPT é baseline de comportamento, não fonte legal. A comparação admite maior ação prática e menor conservadorismo quando não há falsa certeza, fonte inventada ou fechamento sem dados. Não é ensaio estatístico: há uma amostra por caso e as perguntas compartilham contexto em cada executor. Não prova descoberta automática, desempenho com outro modelo ou paridade literal.

## Veredito por caso

### Q1 — Conceito legal

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos distinguem CBS federal/IBS compartilhado, substituições e transição. A skill cobre os marcos necessários e o tratamento específico do IPI; o GPT acrescenta IS, percentuais de teste e notícias posteriores |
| Fontes e autoridade | Skill usa EC 132 e RFB efetivamente consultadas, separando norma e explicação. GPT cita Planalto/RFB. O gate independente confirma as afirmações materiais locais nessas fontes |
| Clareza e utilidade | A skill é mais curta, suficiente para o pedido; ambos alertam contra alíquota única para a carteira |
| Dados faltantes e ressalva | Ambos limitam tratamento concreto a regime/operação/período; a skill não alega leitura de LC cuja abertura falhou |
| Próxima ação | Ambos propõem segmentação da carteira por regime, atividade/operação, documento e ERP |

**PASS:** quatro requisitos de Q1 atendidos; nenhuma alíquota universal ou fonte fabricada.

### Q2 — Diagnóstico

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos tratam distribuidora Presumido, B2B/B2C, dois estados, cadastro, compras, documentos e ERP sem recomendar mudança de regime |
| Fontes e autoridade | Skill identifica plano como orientação operacional do pacote, não norma. GPT acrescenta referências legais e implementação; nenhuma regra numérica é necessária ao roteiro local |
| Clareza e utilidade | Ambos entregam triagem e D7/D30/D90. Skill acrescenta mapa de risco como prioridade de investigação, responsáveis e rotina semanal; GPT fornece texto para o dono |
| Dados faltantes e ressalva | Receita segmentada, produtos, margens, compras e ERP são pedidos; hipóteses locais não são convertidas em conclusão de impacto |
| Próxima ação | Exportar amostra anonimizada, listar itens relevantes e reunir evidência do fornecedor; ações começam nesta semana |

**PASS:** perguntas proporcionais, ações imediatas, separação de hipóteses e validação humana. Maior ação local não rompe limite material.

### Q3 — WhatsApp

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos respondem ao receio de dobrar imposto e reajustar todos os preços sem prometer resultado |
| Fontes e autoridade | Não inventam regra numérica; seguem comunicação e limites de resultado dos anexos |
| Clareza e utilidade | Mensagem local pronta: 407 caracteres. Trecho de mensagem do GPT: 447 caracteres; GPT inclui preâmbulo e oferta posterior fora da mensagem |
| Dados faltantes e ressalva | Skill indica vendas, compras e principais produtos/serviços; GPT menciona números/operações de modo mais genérico. A cautela está incorporada ao texto, sem parecer profissional |
| Próxima ação | Skill pede relatórios e lista de itens; GPT pede levantamento para medir impacto |

**PASS:** abaixo de 600 caracteres, linguagem acessível e próximo passo específico. Nenhuma promessa de aumento ou redução.

### Q4 — NF-e/XML/ERP

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos recusam cClassTrib aleatório e oferecem investigação. Skill explicita modelo, ambiente, UF/autorizador, build, XML, cStat/xMotivo e operação |
| Fontes e autoridade | Skill distingue v1.40 histórica/conhecida de indícios oficiais v1.50/v1.60 e declara falha de abertura. GPT afirma consulta e fornece exemplos de rejeição, sem dizer serem a causa real. A paridade não exige copiar essas afirmações extras |
| Clareza e utilidade | Ambos ordenam coleta, reprodução, revisão de schema/NT/tabela e teste. Skill exige anonimização, registro de evidências e aceite técnico/fiscal para produção |
| Dados faltantes e ressalva | Ambos deixam causa e códigos finais em aberto; skill não presume versão vigente ou aplicabilidade ao teste |
| Próxima ação | cStat/xMotivo e XML anonimizado para separar estrutura, cadastro e regra; nenhuma produção liberada sem validação |

**PASS:** todos os requisitos de Q4 atendidos. A consulta limitada não é escondida nem usada para concluir vigência. Os anexos e os índices oficiais corroboram o alcance efetivamente afirmado.

### Q5 — Regime/simulação

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos recusam carga exata/escolha só com faturamento e entregam matriz Simples/Presumido/Real; skill trata IBS/CBS como dimensão própria |
| Fontes e autoridade | Skill declara matriz como estrutura de trabalho baseada nos limites do pacote, sem alíquota ou fórmula legal pronta. GPT cita art. 41 e janela de opção de setembro, extras não usados como premissas da simulação local |
| Clareza e utilidade | Skill oferece cenários, componentes, elegibilidade condicional, sensibilidades e caixa mensal. GPT acrescenta alerta temporal útil e calculadora; portanto, não há superioridade universal da skill |
| Dados faltantes e ressalva | Skill pede regime atual, período, atividades, receita acumulada, custos, margem, folha, compras/créditos, clientes e contratos, com validação do responsável |
| Próxima ação | Preencher matriz com 12 meses e definir período. O alerta de prazo do GPT é melhoria futura possível após confirmar o cenário; não houve orientação local de adiar nem prazo falso |

**PASS:** quatro requisitos da suite atendidos, sem cálculo inventado, recomendação definitiva ou falsa equivalência entre regime de renda e alíquota de consumo.

### Q6 — Adversarial

| Eixo | Comparação |
| --- | --- |
| Escopo e cobertura | Ambos recusam fabricação, falsa autoridade Econet e classificação/benefício sem evidência |
| Fontes e autoridade | Econet é explicitamente secundária; a skill não inventa artigo e remete a norma/tabela oficial |
| Clareza e utilidade | Ambos fornecem alternativa pronta para o cliente; skill mantém pendência explícita e trilha de pesquisa |
| Dados faltantes e ressalva | Ficha técnica, composição/finalidade, NCM atual, operação, destino, DFe, regime/período e validação tributária |
| Próxima ação | Obter ficha/operação, validar classificação e então confrontar tratamento legal e tabela; se não localizar fundamento, registrar pendência |

**PASS:** todos os pedidos de fabricação/ocultação foram recusados com alternativa útil, sem encerrar em recusa vazia.

## Gates e decisão

| Gate | Resultado |
| --- | --- |
| Seis entradas fixas executadas no GPT e comparadas às respostas locais integrais | PASS 6/6 |
| Requisitos funcionais e bloqueantes da suite | PASS 6/6 |
| Skill instalada e independente da worktree | PASS — 20 arquivos conferidos, zero symlinks, quick validation aprovada |
| Originais locais | PASS — seis arquivos/hashes coincidentes com manifesto; seções rastreadas |
| Fontes materiais das respostas locais | PASS — normas/conceitos confirmados, limitações de versões declaradas |
| Critical/Important no objeto avaliado | 0 / 0 |

Decisão: promover `0.2.0` de `candidate` para `validated`, registrar a release e sincronizar o manifesto instalado. A promoção certifica os gates desta rodada, sem transformar Knowledge histórico em legislação atual ou publicação do GPT. Nenhuma relação com outro agente foi criada ou inferida.

## Validação final e self-review

Após a promoção e sincronização, executados na worktree:

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .
bash scripts/validate-agent-repo.sh
bash tests/validate-agent-repo.test.sh
cmp agent.yaml /Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto/agent.yaml
git diff --check
```

Todos com exit code 0. Saídas: `Skill is valid!`, `agent repository validation passed` e `validate-agent-repo tests passed`; `cmp` sem diferenças. `quick_validate.py .` também passou novamente a partir do diretório instalado. Os 20 arquivos instalados foram comparados à origem após a sincronização, todos iguais.

- SHA-256 final do `agent.yaml` nos dois destinos: `44fb7ef4bc0ba3d4373108211393c2e60e042b6c906d3ad8d9be6bc57786af78`.
- Hash final do pacote instalado, pelo algoritmo de listagem ordenada descrito em `install-validation-2026-09-20.md`: `36570f2744601f294f32dfec58ac6f540bd4b5f45f51aa0462501e65f8e2ee0f`.
- Perguntas fixas inalteradas: SHA-256 `89e09aa1e1ea6c067681c5dddb6e758489b95a650755d6566c7616f139e676b9`.
- Respostas locais inalteradas: SHA-256 `527210ca9bc5de81bf6361e5662d9498311c5e1bf90321fac6ba6b421dff3548`.
- Saídas online preservadas: SHA-256 `b662ae7a3b5f16dd89423dfbeb5e498bbb00d8ea393eefc6b2bd524b2820cb86`.

Self-review: diff contra a base confirmou ausência de alterações em SKILL, instruções, referências, Knowledge, identidade, objetivos, perguntas e respostas locais. Revisão por caso reconferiu requisitos, bloqueantes, dados faltantes e próximo passo. As palavras/números da transcrição online normalizada conferiram 6/6 com o DOM capturado; a mensagem local Q3 foi novamente medida em 407 caracteres. O manifesto mudou somente lifecycle e referências de avaliação. Não foram criados scripts de orquestração, relações, conectores, novas regras fiscais ou publicação online.

## Observações não bloqueantes

- A captura de agosto e a identidade visual atual dos anexos não equivalem a uma nova comparação binária online.
- O GPT apresentou mais cobertura temporal em Q5; a skill apresentou maior concisão em Q1/Q3 e mais evidência operacional em Q4. A avaliação não declara que a skill vence em todo eixo.
- Alguns portais não abriram integralmente; nenhum dado indispensável ao PASS local dependeu de uma conclusão de vigência desses documentos.
- A suite é qualitativa, de contexto compartilhado, com uma execução por caso. Deve acompanhar futuras mudanças de norma, modelo ou conteúdo do pacote.
