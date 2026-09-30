# Como usar este repositório canônico

## Visão geral

Este repositório canônico separa o núcleo do agente — objetivos, identidade e
instruções — de suas capacidades, Knowledge, integrações e traduções para
plataformas. O Git é a fonte de verdade: a plataforma de execução recebe uma
reconstrução do conteúdo versionado, nunca o contrário sem revisão.

## Usar a skill 0.2.0 validada

Invoque `$ac-reforma-tributaria` com a pergunta técnica. O perfil padrão
`restored-technical` usa o acervo local e entrega explicações, triagem, cenários
condicionais e próximos passos. A seleção implícita está habilitada em
`agents/openai.yaml`. A skill não precisa de Action para ser útil.

Para reproduzir o GPT online, peça explicitamente `current-closed`; a saída será
o aviso de acesso encerrado e o link exato de Lucas. O online tinha zero anexos e
zero Actions na auditoria de 2026-09-21. Pedir cálculo nesse perfil não ativa a
restauração. Para voltar ao trabalho técnico local, solicite `restored-technical`.

`legacy-action` é opcional e histórico. Leia `references/retrieval-contract.md`
antes de tentar a integração: são necessários runtime real, schema compatível e
health check observado. Os schemas não documentam rota de saúde; não invente
uma. Se o runtime ou health check não puder ser verificado, use o acervo local e
declare que não houve retrieval. Disponibilidade do endpoint não comprova Action
configurada no GPT. Este pacote não instala MCP nem contém segredos.

## Instalação seletiva no Codex

1. Escolha a pasta de destino `ac-reforma-tributaria` dentro do diretório de skills
   configurado no Codex. Verifique se existe instalação anterior antes de copiar,
   preservando alterações locais em vez de sobrescrevê-las silenciosamente.
2. Copie da raiz deste repositório **somente** `SKILL.md`, `agent.yaml`, `agents/`,
   `profiles/`, `references/`, `instructions/`, `knowledge/`, `connectors/`,
   `identity/` e `objectives/`, mantendo a estrutura e os bytes originais. Os
   caminhos de runtime são relativos à raiz da skill instalada.
3. Exclua da cópia `.git`, `.superpowers/`, avaliações, relatórios, governança,
   testes, scripts de validação, documentação de manutenção e `.gitkeep`.
   Use arquivos reais: a instalação deve funcionar fora da worktree sem symlinks.
4. Execute `quick_validate.py` da skill `skill-creator` contra o destino. Compare
   inventário e hashes dos arquivos distribuíveis, confirmando oito originais,
   vinte source-package e dois schemas. Verifique ausência de symlinks.
5. Teste a invocação no Codex a partir do destino. Registre perfil, fontes,
   lacunas e resultados integrais dos casos. A release `0.2.0` já está
   `validated`; mudanças futuras que possam alterar comportamento exigem nova
   avaliação independente, não apenas validação estrutural.

`agent.yaml` acompanha o pacote como manifesto de proveniência. Suas referências
em `source_capture` e `evaluations` apontam para evidências do repositório que são
deliberadamente excluídas da instalação; não são dependências de runtime.
As instruções de operação partem de `SKILL.md` e seus perfis/referências.

## Estado dos gates e publicação

A release `0.2.0` concluiu instalação seletiva 53/53, forward test local 7/7,
Gate A 2/2, Gate B 5/5, verificação de fontes/originais e revisão independente
sem achados Critical/Important. Esses gates sustentam o lifecycle `validated` e
estão documentados em `evaluations/parity/`.

Publicação e distribuição são gates externos: use somente um commit validado que
esteja em `main` ou em uma tag/release aprovada, e confira o hash após instalar.
O estado `validated` não afirma que a branch já foi publicada ou integrada a
`main`.

## Manutenção do pacote

Abra uma branch, altere o entrypoint, perfil ou referência responsável e preserve
as capturas em `instructions/`, `knowledge/` e schemas históricos. Atualize
versão, avaliações e documentação e siga `governance/CONTRIBUTING.md` para revisão.

## Criar um agente novo

Para iniciar um agente novo, crie um repositório a partir do template canônico e
então siga este fluxo no novo repositório canônico. Substitua os exemplos em
`objectives/`, `identity/` e `instructions/` antes de criar capabilities. O prompt
principal fica em `instructions/system.md`; regras de segurança, limites e
aprovações ficam em `instructions/guardrails.md`. Registre cada componente
utilizado em `agent.yaml` e mantenha o primeiro escopo pequeno e avaliável.

## Importar um agente existente

Converta o prompt atual para `instructions/system.md` e separe regras permanentes
em `instructions/guardrails.md`. Inventarie anexos, procedimentos, Actions e
configurações, eliminando segredos e dados operacionais. Importe conteúdo usado
pelo modelo para `knowledge/`, procedimentos repetíveis para `skills/` e schemas
de integrações para `connectors/`; só publique após uma avaliação de regressão.

## Alterar o comportamento

Classifique a mudança como editorial, funcional ou crítica. Edite o componente
canônico responsável: objetivo não é identidade, regra geral não é skill e
integração não é adapter. Atualize avaliações antes de mudanças comportamentais,
a versão e o changelog quando exigidos pela política, e peça revisão humana para
mudanças críticas.

## Adicionar Knowledge

`knowledge/` recebe conteúdo curado que o modelo poderá consultar: `.md`, `.txt`,
`.pdf`, `.csv`, JSON de referência, imagens e planilhas. Para cada fonte, mantenha
um manifesto versionado com fonte, data, licença e hash; o manifesto descreve o
material sem incluir credenciais ou dados proibidos. Não coloque aqui manuais de
manutenção, conversas, logs, dados de clientes, corpora brutos ou índices RAG.
Avalie a resposta e a segurança quando o conteúdo puder alterar comportamento ou
risco.

## Adicionar uma skill

Esta distribuição tem seu entrypoint em `SKILL.md` na raiz, com frontmatter
`name` e `description`, e metadados de interface em `agents/openai.yaml`.
Capacidades adicionais só devem virar outra skill quando houver necessidade
própria; registre-as em `agent.yaml` e acrescente avaliações pertinentes.

## Adicionar um connector ou Action

Um conector descreve o acesso a um sistema externo, sem conter seu segredo. Para
uma Action, versione o OpenAPI em `connectors/actions/<nome>/openapi.yaml`, junto
com exemplos sintéticos, permissões, fallback e avaliações de indisponibilidade.
Endpoints privados e credenciais existem somente no runtime por variáveis de
ambiente; registre apenas seus nomes e o contrato público de uso.

## Criar profiles e adapters

Profiles selecionam o comportamento fechado ou restaurado; adapters traduzem o
agente para uma plataforma. Cada `profile.yaml` e `adapter.yaml` declara
`canonical_agent_version` igual a `agent.version`. Nesta skill, adaptações da
expiração e da obrigação histórica de Action estão explicitadas em
`references/profile-routing.md`, sem alterar a instrução original. Não misture
o aviso de encerramento às respostas técnicas restauradas.

## Testar e validar

Execute sempre:

```bash
bash tests/validate-agent-repo.test.sh
bash scripts/validate-agent-repo.sh
git diff --check
```

Acrescente avaliações de cenário, segurança, regressão ou conector conforme o
risco. O primeiro comando prova os casos negativos do validador; o segundo valida
o repositório que será publicado.

## Publicar uma mudança

Revise o diff, atualize `CHANGELOG.md` e `agent.yaml` se houver versão nova, e
sincronize profiles/adapters. Crie uma branch, faça commits claros, abra PR com
classe, riscos e evidências de avaliação, e obtenha a revisão humana exigida. Use
squash merge; não publique diretamente em `main`.

## Recriar em outra plataforma

Parta de `agent.yaml`, copie o núcleo canônico e conecte skills, Knowledge e
contratos suportados pelo destino. Traduza limitações em `adapters/<plataforma>/`,
sem mudar o comportamento central. Injete credenciais no runtime, execute as
avaliações e registre qualquer diferença material como adapter, decisão ou risco.

## Segurança e arquivos que não entram no Git

Nunca versione segredo, `.env`, chave privada, credencial, conversa, dado de
cliente, log, exportação operacional, corpus ou índice RAG. O validador também
bloqueia artefatos vetoriais e arquivos maiores que 5 MB. Em caso de exposição,
pare a publicação, revogue e rotacione o segredo e siga
`governance/DATA-AND-SECRETS.md`.

## Onde encontrar ajuda

Use `docs/REPOSITORY-STRUCTURE.md` para decidir o destino de um arquivo,
`governance/CONTRIBUTING.md` para o processo, e as políticas em `governance/` para
dados, mudanças, release e riscos. Quando o impacto não estiver claro, registre a
lacuna no pull request e peça decisão ao owner antes de alterar o núcleo.
