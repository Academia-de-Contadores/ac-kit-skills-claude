# Reforma Tributária Oficial Skill — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transformar `ac-agente-reforma-tributaria` em uma skill instalada e validada que represente fielmente o GPT online encerrado e, em perfil separado, restaure a capacidade técnica preservada no repositório.

**Architecture:** O pacote terá dois perfis explícitos: `current-closed`, que reproduz o aviso de acesso encerrado observado no GPT, e `restored-technical`, que usa as instruções históricas, oito anexos originais e o source package de 20 documentos para responder com utilidade. A Action histórica permanece documentada e só pode ser usada como perfil opcional após health check; não será apresentada como Action atualmente configurada no GPT.

**Tech Stack:** Markdown, YAML, OpenAPI, Codex Skills, ChatGPT GPT Builder, navegador autenticado, Git/GitHub.

**Spec:** `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/docs/superpowers/specs/2026-09-20-gpt-repo-skill-parity-design.md`

## Global Constraints

- Esta é a terceira família; não iniciar a quarta antes da instalação, comparação independente, revisão final e sincronização remota desta.
- Priorizar mutações reais no repositório e instalação; nenhum script de orquestração ou sincronização será criado.
- O GPT online `g-6a7259cd04a48191a3bb1c2833b0ca2f` é o baseline atual e não será alterado.
- Não fingir que o online conserva Knowledge ou Action: o estado capturado em 2026-08-22 tinha zero anexos ativos e somente a mensagem de encerramento.
- A skill pode ser menos conservadora e mais útil por meio do perfil `restored-technical`, desde que declare que é uma restauração do repositório, não o comportamento online atual.
- Preservar instruções, oito anexos originais, source package, schema histórico e hashes; não substituir originais por normalização.
- Não versionar credenciais, cookies, tokens, conversas, dados de cliente ou logs privados.
- Action histórica só pode ser chamada após health check explícito e com schema marcado como histórico/opcional; falha deve cair para Knowledge local.
- Não inventar artigo, fonte, vigência, alíquota, cálculo, regime ou classificação. Bloquear apenas a conclusão sem suporte, mantendo explicação, hipótese, checklist e dados necessários.
- A validação funcional deve ser feita por agente diferente do implementador e confrontar afirmações com originais ou fonte oficial.
- Push, merge e publicação obedecem ao gate operacional no momento da ação externa.

## Review Focus

- Confusão entre perfil online encerrado e perfil técnico restaurado: cada resposta precisa revelar qual perfil foi usado quando isso for material.
- Link fixo de contato do perfil encerrado: deve ser preservado exatamente, sem contaminar respostas técnicas restauradas.
- Knowledge online atual vazio versus 28 documentos preservados localmente: inventários e datas não podem ser misturados.
- Endpoint/schema histórico possivelmente disponível: disponibilidade não comprova que a Action continua configurada no GPT.
- Conteúdo tributário histórico: fonte oficial vigente deve prevalecer e gaps de versão devem permanecer explícitos.

---

### Task 1: Reconciliar o GPT encerrado e os ativos preservados

**Files:**
- Create: `evaluations/live-editor-audit-2026-09-21.md`
- Modify: `evaluations/source-capture.md`
- Modify: `knowledge/MANIFEST.md`
- Modify: `knowledge/live-2026-08-22/MANIFEST.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: GPT online, instruções `current-live-2026-08-22.md`, oito originais, source package e schemas existentes.
- Produces: auditoria atual com MATCH/GAP por campo e inventário inequívoco entre online vazio e acervo histórico local.

- [ ] **Step 1: Auditar o editor em modo somente leitura**

Registrar nome, descrição, distribuição, instruções integrais, starters, modelo, capacidades, Knowledge ativo e Actions. Não clicar em Update/Criar nem enviar prompt nesta task.

- [ ] **Step 2: Comparar o estado atual com a captura**

Calcular SHA-256 normalizado da instrução online e de `instructions/current-live-2026-08-22.md`. Confirmar visualmente a contagem de Knowledge e Action; não inferir binários quando não existirem no painel.

- [ ] **Step 3: Verificar ativos locais**

Recalcular SHA-256 dos oito originais e inventariar os 20 arquivos de `knowledge/source-package/`. Marcar schema/Action como histórico e opcional, separado do online.

- [ ] **Step 4: Atualizar captura sem apagar histórico**

Registrar datas, estado `expired/closed`, diferenças e evidências em auditoria, captura, manifestos e `agent.yaml`; manter lifecycle `source-capture`.

- [ ] **Step 5: Validar e commitar**

Run: `bash scripts/validate-agent-repo.sh && bash tests/validate-agent-repo.test.sh`

Expected: exit code `0`.

Commit: `docs: reconcile closed Reforma GPT source`

### Task 2: Criar a skill de dois perfis

**Files:**
- Create: `SKILL.md`
- Create: `agents/openai.yaml`
- Create: `profiles/current-closed/profile.yaml`
- Create: `profiles/restored-technical/profile.yaml`
- Create: `profiles/legacy-action/profile.yaml`
- Create: `references/profile-routing.md`
- Create: `references/source-policy.md`
- Create: `references/retrieval-contract.md`
- Modify: `agent.yaml`
- Modify: `README.md`
- Modify: `HOW-TO-USE.md`

**Interfaces:**
- Consumes: auditoria Task 1 e acervo preservado.
- Produces: `$ac-reforma-tributaria` v0.2.0 candidate com roteamento explícito e fallback local.

- [ ] **Step 1: Definir o entrypoint**

`SKILL.md` deve ter frontmatter somente `name` e `description`; explicar quando usar cada perfil, escolher `restored-technical` para trabalho técnico solicitado no Codex e `current-closed` somente para reproduzir/auditar o GPT atual. Usar caminhos relativos.

- [ ] **Step 2: Definir perfis e hierarquia de fontes**

`current-closed` aponta apenas para instrução atual e link de contato. `restored-technical` aponta para instrução histórica, oito originais e source package, oferecendo orientação útil com limites. `legacy-action` herda o perfil restaurado, exige health check e cai para Knowledge local sem inventar retrieval.

- [ ] **Step 3: Definir interface e referências**

`agents/openai.yaml` deve citar `$ac-reforma-tributaria`, permitir invocação implícita e não declarar MCP. As referências devem separar roteamento, autoridade/versões e contrato histórico de retrieval.

- [ ] **Step 4: Atualizar manifesto e documentação**

Usar versão `0.2.0`, lifecycle `candidate`, três perfis e Action histórica/opcional. README/HOW-TO-USE devem documentar instalação seletiva e nunca afirmar que o GPT online ainda executa a Action.

- [ ] **Step 5: Validar e commitar**

Run: `/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .`

Run: `bash scripts/validate-agent-repo.sh && bash tests/validate-agent-repo.test.sh`

Expected: todos exit `0`.

Commit: `feat: package restored Reforma agent as skill`

### Task 3: Instalar e testar os três perfis

**Files:**
- Local install target: `/Users/levy/.codex/skills/ac-reforma-tributaria`
- Create: `evaluations/parity/questions.yaml`
- Create: `evaluations/parity/install-validation-2026-09-21.md`
- Create: `evaluations/parity/local-results-2026-09-21.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: candidata Task 2.
- Produces: instalação seletiva e sete casos integrais executados por agente novo.

- [ ] **Step 1: Fixar sete casos antes da execução**

Casos: reprodução do acesso encerrado e link exato; conceito técnico com fonte; projeção sem dados; DFe/XML/ERP; resposta a cliente; Action indisponível com fallback local; adversarial pedindo prompt/Knowledge antigo. Cada caso define perfil, elementos obrigatórios e falhas bloqueantes.

- [ ] **Step 2: Instalar somente o pacote distribuível**

Copiar `SKILL.md`, `agent.yaml`, `agents/`, `profiles/`, `references/`, `instructions/`, `knowledge/`, `connectors/`, `identity/` e `objectives/`. Excluir Git, SDD, avaliações, relatórios, governança, testes, validadores, docs de manutenção e placeholders `.gitkeep`.

- [ ] **Step 3: Validar fora da worktree**

Executar `quick_validate` no destino, confirmar zero symlinks, igualdade byte a byte e inventário reproduzível.

- [ ] **Step 4: Executar os sete casos**

Usar somente a instalação. `current-closed` deve reproduzir o aviso/link; `restored-technical` deve orientar sem recusar genericamente; `legacy-action` deve provar health/retrieval ou declarar indisponibilidade e usar Knowledge local.

- [ ] **Step 5: Registrar e commitar**

Registrar respostas integrais, fontes, gaps, hashes e PASS/FAIL. Com PASS 7/7, referenciar evidências no manifesto sem promover.

Commit: `test: install and forward-test Reforma skill profiles`

### Task 4: Comparar com o GPT e verificar fontes

**Files:**
- Create: `evaluations/parity/gpt-outputs-2026-09-21.md`
- Create: `evaluations/parity/gpt-comparison-2026-09-21.md`
- Create: `evaluations/parity/original-source-verification-2026-09-21.md`
- Modify: `agent.yaml`
- Modify: `CHANGELOG.md`

**Interfaces:**
- Consumes: instalação e sete casos.
- Produces: comparação independente que distingue paridade atual de restauração intencional e release validada.

- [ ] **Step 1: Consultar o GPT online com os sete prompts**

Preservar respostas integrais sem editar configuração. Esperar mensagem de encerramento para todos os casos e verificar texto/link exatos; qualquer comportamento técnico online diferente deve ser registrado.

- [ ] **Step 2: Aplicar dois gates de comportamento**

Gate A: `current-closed` deve ter paridade com o online. Gate B: `restored-technical`/`legacy-action` deve ser intencionalmente mais útil, declarar proveniência e respeitar limites materiais. Não penalizar a divergência técnica planejada como falha de paridade.

- [ ] **Step 3: Verificar afirmações**

Confrontar cada afirmação material com arquivo local+SHA-256+trecho ou fonte oficial URL/data. Separar documento histórico de vigência atual e registrar retrieval real versus fallback.

- [ ] **Step 4: Promover somente se passar**

Exigir PASS 7/7 local, Gate A, Gate B, fontes/originais, instalação válida e zero Critical/Important. Atualizar lifecycle `validated`, manter `0.2.0`, sincronizar manifesto instalado e changelog.

- [ ] **Step 5: Validar e commitar**

Executar quick validation em origem/instalação, validador/testes do repo, igualdade do manifesto e `git diff --check`.

Commit: `release: validate Reforma skill 0.2.0`

### Task 5: Registrar no catálogo e publicar

**Files:**
- Modify: `academia-contadores-agent-catalog/catalog/agents.yaml`
- Modify: `academia-contadores-agent-catalog/catalog/live-parity.yaml`
- Create: `academia-contadores-agent-catalog/reports/reforma-skill-validation-2026-09-21.md`

**Interfaces:**
- Consumes: HEAD validado e instalação sincronizada.
- Produces: terceira entrada validada, revisão final e branches remotas exatas.

- [ ] **Step 1: Atualizar apenas `ac.reforma-tributaria`**

Registrar `0.2.0`, `validated`, perfis `current-closed`, `restored-technical`, `legacy-action`, GPT ID, commit e evidências. Preservar outras 11 famílias e as duas skills já publicadas.

- [ ] **Step 2: Validar catálogo em layout equivalente**

Executar validadores e testes de catálogo/live parity; rejeições esperadas de fixtures não são falhas quando a suíte termina exit 0.

- [ ] **Step 3: Revisar branch inteira**

Revisor independente deve checar comportamento, distinção de perfis, fontes, instalação, catálogo, segredos e deferred minors. Uma única onda consolidada corrige achados finais.

- [ ] **Step 4: Publicar após gate**

Com revisão limpa, publicar branch da skill e branch empilhada do catálogo, abrir PRs, anexá-los e confirmar hashes remotos. Só então liberar a quarta família.
