# Reforma Tributária RAG Skill — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Tornar `ac-agente-reforma-tributaria-rag` uma skill realmente instalável e aprovada por comparação independente com o GPT personalizado online.

**Architecture:** O próprio repositório será o pacote da skill, com `SKILL.md` na raiz e metadados em `agents/openai.yaml`. Primeiro reconciliamos a fonte online atual; depois instalamos a skill em um ambiente Codex limpo e um agente diferente do implementador compara seu comportamento com o GPT online e com o endpoint RAG.

**Tech Stack:** Markdown, YAML, OpenAPI 3.1, Codex Skills, ChatGPT GPT Builder, API HTTP do Day RAG, Git/GitHub.

**Spec:** `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/docs/superpowers/specs/2026-09-20-gpt-repo-skill-parity-design.md`

## Global Constraints

- Executar uma família por vez; nenhuma outra skill começa antes desta passar pelo gate independente.
- Priorizar mutações no repositório, instalação e teste reais; não criar scripts de orquestração, geração de relatórios ou sincronização.
- Scripts novos só são permitidos quando forem uma capacidade necessária da própria skill e forem chamados pelo `SKILL.md`.
- Preservar instruções e anexos originais; normalização nunca substitui a captura bruta.
- Não versionar credenciais, cookies, tokens, logs privados ou conteúdo sensível.
- O GPT online autenticado é a verdade operacional; o repositório deve convergir para o estado observado e aprovado.
- Não considerar igualdade temática como paridade; comparar instruções, Knowledge, ferramentas, Action e comportamento.
- Não exigir ranking exato do retrieval; exigir fonte adequada, cobertura, citação verificável, tratamento de lacunas e ausência de afirmações sem suporte.
- A validação deve ser feita por um agente diferente do implementador.
- Não apagar histórico nem o perfil legado.
- Push para branch compartilhada e publicação só ocorrem após a confirmação exigida no momento da ação externa.

## Review Focus

- Schema online mudou, mas o repo continua apontando para captura histórica: a skill deve usar o contrato realmente configurado hoje.
- Endpoint indisponível ou resposta sem fontes: a skill deve declarar a falha e não responder tecnicamente de memória.
- Pergunta sem dados suficientes para cálculo: a skill deve pedir os dados e separar hipótese de conclusão.
- Resultado de retrieval com ordem diferente: a comparação deve aceitar variação de ranking sem aceitar perda de autoridade ou cobertura.
- Instalação em ambiente limpo: a skill não pode depender de caminhos absolutos do computador de origem.

---

### Task 1: Reconciliar o GPT online e o repositório

**Files:**
- Create: `evaluations/live-editor-audit-2026-09-20.md`
- Create: `connectors/actions/searchDayRagCorpus/openapi.live-2026-09-20.json`
- Modify: `connectors/actions/searchDayRagCorpus/README.md`
- Modify: `connectors/actions/searchDayRagCorpus/BUILDER-CAPTURE.md`
- Modify: `knowledge/MANIFEST.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: GPT `g-6a1b93a521b4819189fda957bcf00115`, os oito anexos já preservados e a Action `https://day-rag-chroma-actions.onrender.com`.
- Produces: captura corrente com hashes, inventário de Knowledge reconciliado e um único schema marcado como ativo.

- [ ] **Step 1: Capturar o estado online atual**

No navegador autenticado, registrar nome, descrição, starters, texto integral das instruções, ferramentas, oito nomes de Knowledge, domínio da Action, autenticação e schema OpenAPI. Não clicar em `Update` e não alterar o GPT.

- [ ] **Step 2: Comprovar paridade das instruções e do Knowledge**

Comparar SHA-256 do texto normalizado com `instructions/system.md`. Comparar os oito anexos online com `knowledge/original/`; se a UI não permitir obter novamente o binário, registrar claramente que o último hash binário comprovado é de 2026-09-09 e que nomes/contagem foram reconfirmados em 2026-09-20.

- [ ] **Step 3: Preservar o schema ativo**

Salvar exatamente o schema lido do Builder em `openapi.live-2026-09-20.json`, calcular seu SHA-256 e marcar as versões anteriores como históricas. O arquivo ativo precisa declarar `/rag/search`, `/health` e os campos obrigatórios observados no Builder.

- [ ] **Step 4: Atualizar a identidade da captura**

Em `agent.yaml`, atualizar `captured_at`, `record`, lifecycle e referências sem remover as avaliações existentes. Em `knowledge/MANIFEST.md`, registrar os oito nomes originais, seus hashes conhecidos, a data de comprovação binária e a data da nova confirmação visual.

- [ ] **Step 5: Validar e commitar**

Run: `bash scripts/validate-agent-repo.sh`

Expected: exit code `0` e nenhuma referência inexistente.

Commit: `docs: reconcile current RAG GPT source`

### Task 2: Transformar o repositório na skill utilizável

**Files:**
- Create: `SKILL.md`
- Create: `agents/openai.yaml`
- Create: `profiles/current/profile.yaml`
- Create: `profiles/legacy/profile.yaml`
- Create: `references/retrieval-contract.md`
- Modify: `agent.yaml`
- Modify: `HOW-TO-USE.md`
- Modify: `README.md`

**Interfaces:**
- Consumes: captura reconciliada da Task 1, endpoint e schema ativo.
- Produces: skill `$ac-reforma-tributaria-rag` autocontida, com perfil atual padrão e perfil legado explícito.

- [ ] **Step 1: Definir o comportamento acionável em `SKILL.md`**

O frontmatter deve conter apenas `name` e `description`. O corpo deve orientar quando usar a skill, como escolher o perfil, quando consultar o retrieval, como interpretar fontes e gaps, como responder com segurança e como agir quando o serviço estiver indisponível. O texto deve apontar para os arquivos relativos do próprio repositório, nunca para caminhos absolutos.

- [ ] **Step 2: Definir a apresentação em `agents/openai.yaml`**

Usar strings entre aspas, `display_name` claro, descrição entre 25 e 64 caracteres, `default_prompt` citando explicitamente `$ac-reforma-tributaria-rag` e `allow_implicit_invocation: true`. Não declarar MCP inexistente nem inventar dependências.

- [ ] **Step 3: Materializar os dois perfis**

`profiles/current/profile.yaml` deve apontar para o GPT principal, oito anexos atuais e schema ativo. `profiles/legacy/profile.yaml` deve representar as duas instâncias equivalentes do RAG legado/Reforma Oficial e marcar seus anexos e schema como históricos, sem duplicar os binários.

- [ ] **Step 4: Documentar o contrato de retrieval**

`references/retrieval-contract.md` deve registrar requisição, resposta, campos obrigatórios, política de citação, tratamento de `gaps`, health check e fallback seguro. Deve distinguir o contrato configurado no GPT do candidato futuro existente em `openapi.yaml`.

- [ ] **Step 5: Tornar o manifesto distribuível**

Atualizar `agent.yaml` para lifecycle `candidate`, versão `0.2.0`, skill `SKILL.md`, perfis `current` e `legacy`, e Action ativa. Atualizar `README.md` e `HOW-TO-USE.md` com invocação real e limites.

- [ ] **Step 6: Validar e commitar**

Run: `python3 /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .`

Expected: `Skill is valid!`

Run: `bash scripts/validate-agent-repo.sh`

Expected: exit code `0`.

Commit: `feat: package RAG agent as installable skill`

### Task 3: Executar o gate funcional local

**Files:**
- Create: `evaluations/parity/questions.yaml`
- Create: `evaluations/parity/local-results-2026-09-20.md`
- Modify: `agent.yaml`

**Interfaces:**
- Consumes: skill candidata da Task 2 e endpoint ativo.
- Produces: conjunto de perguntas fixo, evidência de saúde/retrieval e versão candidata validada localmente.

- [ ] **Step 1: Fixar cinco perguntas concretas**

Criar perguntas para: dúvida legal com citação; explicação simples a cliente; projeção sem dados suficientes; caso DFe/XML/ERP; e falha simulada do retrieval. Cada caso deve declarar fontes ou categorias esperadas, elementos obrigatórios e falhas bloqueantes.

- [ ] **Step 2: Verificar o serviço real**

Consultar `/health` e `/rag/search` com pelo menos as quatro perguntas que usam retrieval. Registrar corpus, coleção, modo, fontes retornadas e gaps. Não exigir ordem idêntica dos chunks.

- [ ] **Step 3: Exercitar a skill candidata**

Executar as cinco perguntas usando as instruções da skill em contexto limpo. Registrar respostas, fontes, cobertura, lacunas e qualquer afirmação sem suporte em `local-results-2026-09-20.md`.

- [ ] **Step 4: Aplicar o gate**

Falhar se a skill inventar fonte, omitir indisponibilidade, fechar cálculo sem dados, tratar material não normativo como lei ou depender de caminho local. Passar somente se as cinco perguntas atenderem aos critérios.

- [ ] **Step 5: Atualizar o manifesto e commitar**

Se aprovado, marcar em `agent.yaml` a avaliação local correspondente sem promover para `production`.

Commit: `test: validate RAG skill against live retrieval`

### Task 4: Instalar a skill de verdade

**Files:**
- Local install target: `/Users/levy/.codex/skills/ac-reforma-tributaria-rag`
- Create: `evaluations/parity/install-validation-2026-09-20.md`

**Interfaces:**
- Consumes: repositório candidato aprovado pela Task 3.
- Produces: skill instalada no Codex e evidência de que carrega sem depender do workspace original.

- [ ] **Step 1: Confirmar que o destino está livre**

Run: `test ! -e /Users/levy/.codex/skills/ac-reforma-tributaria-rag`

Expected: exit code `0`. Se existir, inspecionar e atualizar de forma não destrutiva; não sobrescrever silenciosamente.

- [ ] **Step 2: Instalar a partir do repositório candidato**

Copiar para `/Users/levy/.codex/skills/ac-reforma-tributaria-rag` somente `SKILL.md`, `agent.yaml`, `agents/`, `profiles/`, `references/`, `instructions/`, `knowledge/` e `connectors/`. Não instalar `.git`, `.github`, caches, SDD, relatórios, avaliações, governança, documentação de manutenção, testes ou validadores do repositório. Como esta skill não precisa de executável próprio, nenhum diretório `scripts/` será instalado.

- [ ] **Step 3: Validar fora do workspace**

Run: `python3 /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria-rag`

Expected: `Skill is valid!`

- [ ] **Step 4: Registrar a instalação e commitar**

Registrar origem, commit, destino, arquivos excluídos da cópia e resultado do validador em `install-validation-2026-09-20.md`.

Commit: `docs: record clean RAG skill installation`

### Task 5: Comparar independentemente com o GPT personalizado

**Files:**
- Create: `evaluations/parity/gpt-comparison-2026-09-20.md`
- Modify: `agent.yaml`
- Modify: `CHANGELOG.md`

**Interfaces:**
- Consumes: skill instalada, perguntas da Task 3, GPT online e serviço real.
- Produces: veredito independente PASS/FAIL e, se PASS, release candidata pronta para sincronização remota.

- [ ] **Step 1: Delegar a validação a um agente novo**

O agente revisor não pode ser o implementador. Ele deve iniciar após a instalação, invocar `$ac-reforma-tributaria-rag`, consultar o GPT online com as mesmas cinco perguntas e preservar as duas saídas.

- [ ] **Step 2: Comparar por comportamento e evidência**

Para cada pergunta, comparar fontes, autoridade, cobertura dos pontos essenciais, explicitação de premissas, tratamento de gaps e próxima ação segura. Diferença de redação ou ordem de chunks não é falha isoladamente.

- [ ] **Step 3: Emitir o veredito breve**

`gpt-comparison-2026-09-20.md` deve conter tabela das cinco perguntas, PASS/FAIL por critério, diferenças relevantes e veredito global. Qualquer achado crítico ou importante retorna à implementação antes de prosseguir.

- [ ] **Step 4: Promover somente se passar**

Com PASS global, atualizar `agent.yaml` para lifecycle `validated`, manter versão `0.2.0` e registrar as três evidências: captura online, instalação e comparação. Atualizar `CHANGELOG.md`.

- [ ] **Step 5: Validar e commitar**

Run: `python3 /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .`

Run: `bash scripts/validate-agent-repo.sh`

Expected: ambos com exit code `0`.

Commit: `release: validate RAG skill 0.2.0`

### Task 6: Preparar sincronização remota e liberar a próxima skill

**Files:**
- Modify: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/catalog/agents.yaml`
- Modify: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/catalog/live-parity.yaml`
- Create: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/academia-contadores-agent-catalog/reports/rag-skill-validation-2026-09-20.md`

**Interfaces:**
- Consumes: commit final e veredito PASS da Task 5.
- Produces: catálogo apontando para a skill validada e autorização técnica para começar a próxima família.

- [ ] **Step 1: Atualizar o catálogo real**

Registrar versão `0.2.0`, lifecycle `validated`, perfis `current` e `legacy`, ID do GPT principal, commit do repositório e caminhos das evidências.

- [ ] **Step 2: Validar o catálogo**

Run: `bash scripts/validate-catalog.sh`

Run: `bash scripts/validate-live-parity.sh`

Expected: ambos com exit code `0`.

- [ ] **Step 3: Committar o catálogo**

Commit: `catalog: register validated RAG skill 0.2.0`

- [ ] **Step 4: Solicitar confirmação somente para o push**

Apresentar os commits exatos que serão enviados. Após a confirmação necessária para a ação externa, fazer push do repositório da skill e do catálogo, confirmar que os remotos apontam para os mesmos commits e encerrar a família.

- [ ] **Step 5: Avançar imediatamente**

Começar a próxima família somente depois de: skill instalada, comparação independente PASS, validadores verdes e repositório/catálogo sincronizados. A próxima ordem é `ac-reforma-tributaria-sem-surto`; repetir o mesmo gate, adaptando apenas capacidades e testes da família.
