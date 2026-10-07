# Reforma Tributária Sem Surto Skill — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transformar `ac-agente-reforma-tributaria-sem-surto` em uma skill instalada e validada contra o GPT personalizado online, preservando suas fontes e tornando a orientação mais acionável sem reduzir a segurança tributária.

**Architecture:** O repositório continua sendo a fonte canônica da família e passa a conter a interface de skill (`SKILL.md` e `agents/openai.yaml`) sobre as instruções e os seis anexos originais já preservados. O GPT online permanece como baseline comportamental; uma avaliação independente compara as mesmas perguntas no GPT e na skill instalada, e as afirmações materiais são confrontadas com os anexos originais ou fontes oficiais antes da promoção.

**Tech Stack:** Markdown, YAML, Codex Skills, ChatGPT GPT Builder, navegador autenticado, Git/GitHub.

**Spec:** `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/docs/superpowers/specs/2026-09-20-gpt-repo-skill-parity-design.md`

## Global Constraints

- Executar uma família por vez; esta é a segunda família da sequência aprovada.
- Priorizar mutações reais no repositório, instalação e teste; não criar scripts de orquestração, geração de relatório ou sincronização.
- Scripts novos só são permitidos se forem capacidade necessária da própria skill e chamados pelo `SKILL.md`; esta família não prevê script novo.
- Preservar instruções e os seis anexos originais; normalização nunca substitui a captura bruta.
- Não versionar credenciais, cookies, tokens, logs privados, conversas ou dados de clientes.
- O GPT online autenticado é o baseline operacional e não será alterado.
- A skill pode ser menos conservadora e mais acionável que o GPT, combinando instruções e Knowledge para orientar, explicar e propor checklists; não pode inventar fonte, concluir cálculo sem dados, fechar regime, CST, cClassTrib ou IndOp sem suporte e validação necessária.
- Não considerar igualdade temática como paridade; comparar identidade, instruções, Knowledge, capacidades, ausência/presença de Action e comportamento.
- A validação funcional deve ser executada por agente diferente do implementador.
- Cada afirmação material usada para aprovar a skill deve ser verificável no anexo original ou em fonte oficial identificada.
- Não apagar histórico e não promover para `validated` enquanto houver achado Critical ou Important.
- Push, merge e publicação exigem o gate operacional aplicável no momento da ação externa.

## Review Focus

- O nome online contém `(copy)`: confirmar a identidade exibida sem transformar esse sufixo em nome canônico da skill.
- As seis Knowledge files precisam corresponder byte a byte ao último download comprovado ou ser marcadas claramente como reconfirmação visual quando novo download não for possível.
- Busca web, geração de imagem e análise de dados são capacidades do GPT, não dependências fictícias da skill.
- A skill deve entregar diagnóstico e D7/D30/D90 úteis mesmo quando ainda faltam dados, separando hipótese, fato e próxima coleta.
- Fontes secundárias e versões históricas nunca podem ser apresentadas como norma oficial vigente.

---

### Task 1: Reconciliar o GPT online e a captura canônica

**Files:**
- Create: `evaluations/live-editor-audit-2026-09-20.md`
- Modify: `evaluations/source-capture.md`
- Modify: `knowledge/MANIFEST.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: GPT `g-6a725a3feec081919ba9131c9f475341`, captura de 2026-08-06 e seis anexos em `knowledge/original/`.
- Produces: auditoria corrente com hashes e uma decisão explícita de paridade ou gap por instruções, Knowledge, capacidades e Actions.

- [ ] **Step 1: Ler o editor sem alterar o GPT**

No navegador autenticado, registrar nome, descrição, starters, instruções integrais, modelo recomendado, capacidades, nomes dos seis anexos, distribuição e presença ou ausência de Action. Não clicar em `Update`.

- [ ] **Step 2: Comparar instruções e Knowledge**

Calcular SHA-256 do texto online normalizado e de `instructions/system.md`. Para cada anexo, comparar nome, bytes e SHA-256 quando o download estiver disponível; quando não estiver, preservar o hash binário de 2026-08-07 e registrar separadamente a reconfirmação visual de 2026-09-20.

- [ ] **Step 3: Registrar gaps sem inventar equivalência**

Em `live-editor-audit-2026-09-20.md`, usar uma tabela com `campo`, `online`, `repositório`, `evidência` e `resultado MATCH/GAP`. Uma capacidade nativa do GPT não vira conector da skill.

- [ ] **Step 4: Atualizar captura e manifesto**

Atualizar as datas e referências em `source-capture.md`, `knowledge/MANIFEST.md` e `agent.yaml`, preservando o histórico de 2026-08-06/07 e mantendo lifecycle `source-capture` até a aprovação final.

- [ ] **Step 5: Validar e commitar**

Run: `bash scripts/validate-agent-repo.sh`

Expected: `agent repository validation passed` e exit code `0`.

Commit: `docs: reconcile current Sem Surto GPT source`

### Task 2: Empacotar a família como skill acionável

**Files:**
- Create: `SKILL.md`
- Create: `agents/openai.yaml`
- Create: `references/source-policy.md`
- Create: `references/response-modes.md`
- Modify: `agent.yaml`
- Modify: `README.md`
- Modify: `HOW-TO-USE.md`

**Interfaces:**
- Consumes: auditoria da Task 1, `instructions/system.md` e seis anexos originais.
- Produces: skill `$ac-reforma-tributaria-sem-surto` autocontida e instalável, sem dependência de caminho absoluto ou conector inexistente.

- [ ] **Step 1: Criar o entrypoint da skill**

`SKILL.md` deve ter frontmatter apenas com `name` e `description`. O corpo deve orientar escopo, classificação da pergunta, uso do Knowledge, hierarquia de fontes, formatos factual/diagnóstico/cliente/DFe/regime, D7/D30/D90 e limites para cálculo e classificação. Deve apontar apenas para caminhos relativos necessários.

- [ ] **Step 2: Materializar a interface**

`agents/openai.yaml` deve usar strings entre aspas, `display_name` coerente, `short_description` entre 25 e 64 caracteres, `default_prompt` citando `$ac-reforma-tributaria-sem-surto` e `allow_implicit_invocation: true`. Não declarar MCP ou Action.

- [ ] **Step 3: Separar referências condicionais**

`references/source-policy.md` deve dizer quando conferir fonte oficial, como tratar versão histórica/Econet e como citar lacunas. `references/response-modes.md` deve detalhar os modos `/diagnostico`, `/responder-cliente`, `/dfe`, `/classificacao`, `/simular-regime`, `/checklist-erp` e `/fontes` sem duplicar todo o sistema.

- [ ] **Step 4: Tornar a skill útil sem torná-la imprudente**

A skill deve fornecer explicação geral, hipóteses, checklists e dados necessários mesmo quando não puder fechar a conclusão. Deve bloquear somente a conclusão específica sem suporte, não a orientação inteira.

- [ ] **Step 5: Atualizar manifesto e documentação**

Em `agent.yaml`, usar versão `0.2.0`, lifecycle `candidate`, apontar para `SKILL.md`, interface e referências. `README.md` e `HOW-TO-USE.md` devem documentar invocação real e instalação seletiva, não checkout completo como pacote instalado.

- [ ] **Step 6: Validar e commitar**

Run: `/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .`

Expected: `Skill is valid!`

Run: `bash scripts/validate-agent-repo.sh && bash tests/validate-agent-repo.test.sh`

Expected: exit code `0`.

Commit: `feat: package Sem Surto agent as installable skill`

### Task 3: Instalar seletivamente e executar o forward test

**Files:**
- Local install target: `/Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto`
- Create: `evaluations/parity/questions.yaml`
- Create: `evaluations/parity/install-validation-2026-09-20.md`
- Create: `evaluations/parity/local-results-2026-09-20.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: candidata da Task 2.
- Produces: instalação real independente da worktree e seis respostas da skill com evidência preservada.

- [ ] **Step 1: Fixar seis perguntas**

Criar casos para: conceito legal com fonte; diagnóstico de cliente; resposta curta para cliente; DFe/XML/ERP; simulação de regime sem dados suficientes; e pedido adversarial para inventar fonte ou fechar classificação. Cada caso deve declarar pontos obrigatórios, fontes/categorias esperadas e falhas bloqueantes.

- [ ] **Step 2: Instalar somente o pacote distribuível**

Copiar para o destino apenas `SKILL.md`, `agent.yaml`, `agents/`, `references/`, `instructions/`, `knowledge/`, `identity/`, `objectives/` e `connectors/` se houver conteúdo canônico. Não instalar `.git`, `.github`, `.superpowers`, docs de manutenção, relatórios, avaliações, governança, testes ou validadores. Inspecionar destino existente antes de atualizar; não apagar silenciosamente.

- [ ] **Step 3: Validar fora da worktree**

Run: `/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto`

Expected: `Skill is valid!`

- [ ] **Step 4: Executar a skill instalada em contexto limpo**

Um agente novo deve invocar a skill instalada para as seis perguntas e salvar resposta, fontes usadas, lacunas, dados pedidos e decisão segura. A skill falha se depender de caminho da worktree, inventar fonte, tratar Econet como oficial, fechar cálculo/regime/classificação sem dados ou responder apenas com recusa quando poderia orientar.

- [ ] **Step 5: Registrar instalação e resultado local**

Documentar arquivos incluídos/excluídos, hashes do manifesto e do pacote, comandos de validação e resultado por pergunta. Com PASS 6/6, registrar as evidências em `agent.yaml` sem promover lifecycle.

Commit: `test: install and forward-test Sem Surto skill`

### Task 4: Comparar independentemente com o GPT online e os originais

**Files:**
- Create: `evaluations/parity/gpt-comparison-2026-09-20.md`
- Create: `evaluations/parity/original-source-verification-2026-09-20.md`
- Modify: `agent.yaml`
- Modify: `CHANGELOG.md`

**Interfaces:**
- Consumes: skill instalada, seis perguntas, GPT online e anexos originais.
- Produces: veredito independente de paridade, verificação das afirmações materiais e release `validated` ou FAIL explícito.

- [ ] **Step 1: Obter as respostas do GPT baseline**

No navegador autenticado, enviar as mesmas seis perguntas ao GPT personalizado e preservar as saídas. Não editar a configuração. O revisor deve ser diferente do implementador da skill.

- [ ] **Step 2: Comparar comportamento**

Por caso, comparar escopo, fontes, autoridade, cobertura, clareza, utilidade prática, dados faltantes, ressalva e próxima ação. A skill pode ser mais acionável que o GPT; isso é PASS quando preserva os limites materiais.

- [ ] **Step 3: Confrontar afirmações com originais**

Para cada afirmação material usada no veredito, registrar arquivo original, SHA-256, seção/trecho, correspondência e resultado. Se o caso depender de versão atual não existente nos anexos, usar fonte oficial identificada e registrar URL/data; ausência de comprovação é FAIL, não inferência.

- [ ] **Step 4: Promover somente com todos os gates verdes**

Exigir PASS 6/6 funcional, instalação válida, originais verificados e nenhum achado Critical/Important. Então atualizar `agent.yaml` para lifecycle `validated`, manter versão `0.2.0`, sincronizar o manifesto instalado e registrar a release no `CHANGELOG.md`.

- [ ] **Step 5: Validar e commitar**

Run: `/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .`

Run: `bash scripts/validate-agent-repo.sh && bash tests/validate-agent-repo.test.sh`

Run: `cmp agent.yaml /Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto/agent.yaml`

Expected: todos com exit code `0`.

Commit: `release: validate Sem Surto skill 0.2.0`

### Task 5: Registrar no catálogo e preparar publicação

**Files:**
- Modify: `academia-contadores-agent-catalog/catalog/agents.yaml`
- Modify: `academia-contadores-agent-catalog/catalog/live-parity.yaml`
- Create: `academia-contadores-agent-catalog/reports/sem-surto-skill-validation-2026-09-20.md`

**Interfaces:**
- Consumes: commit final, instalação sincronizada e vereditos PASS da Task 4.
- Produces: catálogo apontando para a segunda skill validada e branches exatas prontas para publicação.

- [ ] **Step 1: Atualizar somente a família Sem Surto**

Registrar versão `0.2.0`, lifecycle `validated`, GPT principal, commit do repositório e caminhos das evidências. Preservar integralmente as outras 11 famílias e a entrada RAG já publicada.

- [ ] **Step 2: Validar o catálogo em layout equivalente**

Run: `bash scripts/validate-catalog.sh && bash tests/validate-catalog.test.sh`

Run: `bash scripts/validate-live-parity.sh && bash tests/validate-live-parity.test.sh`

Expected: todos com exit code `0`.

- [ ] **Step 3: Revisar a branch inteira**

Um revisor final independente deve verificar o diff completo da skill e do catálogo, hashes, ausência de segredos, igualdade do pacote instalado e todos os gates. Critical/Important retornam para uma única rodada consolidada de correção.

- [ ] **Step 4: Commitar e preparar ação externa**

Commit da skill: `release: finalize validated Sem Surto skill`

Commit do catálogo: `catalog: register validated Sem Surto skill 0.2.0`

Apresentar hashes e links antes de push/PR conforme o gate operacional, confirmar os remotos após publicação e só então liberar a terceira família.
