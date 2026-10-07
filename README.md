# Skills da Academia de Contadores para Claude

Kit público para alunas da Mentoria Master: **nove especialistas (contábeis, Concierge do Combo da Reforma Sem Surto, Entrada de Clientes e gestão no Notion) + um assistente para instalar e atualizar outras skills por link**.

**[BAIXAR KIT COMPLETO](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/KIT-ALUNAS-CLAUDE.zip)** · **[BAIXAR SÓ O PLUGIN](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/academia-skills-contabeis.zip)** · **[ÚLTIMA VERSÃO](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest)**

## Instalar só com o link

Abra uma conversa nova no Claude (de preferência uma tarefa Cowork no Claude Desktop) e mande:

> Instala na minha conta o kit da Academia: https://github.com/Academia-de-Contadores/ac-kit-skills-claude

O Claude lê as instruções abaixo e conduz o resto. Você só faz os cliques que o próprio aplicativo exigir, como ligar a execução de código ou confirmar a importação. Não precisa de login no GitHub nem de senha.

## Pelo navegador (claude.ai): skill por skill

Se o aplicativo estiver lento no seu computador, use o Claude no navegador. As skills e o conector do Notion funcionam igual; a diferença é que você envia **uma skill por vez**, sem descompactar o ZIP, em **Personalização > Habilidades/Skills > Adicionar habilidade > Enviar uma skill** (em algumas contas, Configurações > Capacidades > Skills). Passo a passo e solução de erros: [docs/07-VERSAO-WEB-SKILL-POR-SKILL.txt](docs/07-VERSAO-WEB-SKILL-POR-SKILL.txt).

| Ordem | Skill | Baixar |
|---|---|---|
| 1 | Notion (aula de gestão; exige o conector) | [notion-home-negocio.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/notion-home-negocio.zip) |
| 2 | Processos do Escritório (aula de gestão) | [ac-processos-escritorio.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-processos-escritorio.zip) |
| 3 | Entrada de Clientes, beta (aula de gestão) | [ac-entrada-clientes.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-entrada-clientes.zip) |
| 4 | Fiscal | [ac-fiscal.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-fiscal.zip) |
| 5 | Departamento Pessoal | [ac-dp.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-dp.zip) |
| 6 | Societário | [ac-societario.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-societario.zip) |
| 7 | Reforma Tributária — RAG | [ac-reforma-tributaria-rag.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-reforma-tributaria-rag.zip) |
| 8 | Concierge do Combo da Reforma Sem Surto | [ac-concierge-combo-reforma-sem-surto.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-concierge-combo-reforma-sem-surto.zip) |
| 9 | Estrategista de Conteúdo D.A.I. | [ac-estrategista-conteudo-dai.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-estrategista-conteudo-dai.zip) |
| 10 | Instalador (opcional no navegador) | [ac-instalar-skills.zip](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/ac-instalar-skills.zip) |

Já instalou pelo aplicativo? Não repita: a conta é a mesma e as skills aparecem nos dois.

## Instruções para o Claude que recebeu este link

Você foi chamado para instalar este kit na conta da pessoa que enviou o link. Siga nesta ordem, em português, um passo por vez:

1. **Capacidade obrigatória.** Confira se "Execução de código e criação de arquivos" está ligada. Se não estiver, peça à pessoa para abrir **Configurações > Capacidades** (Settings > Capabilities) e ligar essa opção, e espere a confirmação. Skills e plugins exigem plano Pro, Max, Team ou Enterprise; no Team/Enterprise o administrador pode ter bloqueado a opção.
2. **Baixe o plugin publicado:** https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/academia-skills-contabeis.zip . Use somente esse arquivo da release, nunca o "Download ZIP" do repositório. Se a rede do seu ambiente bloquear o download, entregue o link à pessoa, peça que ela clique, baixe e anexe o arquivo aqui.
3. **Instale na conta.** Use a ferramenta nativa de instalação de plugin ou skill, se você tiver uma, e mostre o cartão de Adicionar/Instalar. Sem essa ferramenta, guie o upload: **Personalizar > Plugins > enviar plugin** com `academia-skills-contabeis.zip`. Se a conta não aceitar plugin, ou se a pessoa estiver no navegador (claude.ai), siga a seção "Pelo navegador": entregue os links diretos de cada skill da tabela e guie o envio de um ZIP por vez em **Personalização > Habilidades/Skills > Adicionar habilidade > Enviar uma skill** (ou Configurações > Capacidades > Skills), sem descompactar. Escolha uma rota só, para não duplicar.
4. **Confira as dez skills** na lista da conta: `ac-fiscal`, `ac-dp`, `ac-societario`, `ac-processos-escritorio`, `ac-estrategista-conteudo-dai`, `ac-reforma-tributaria-rag`, `ac-concierge-combo-reforma-sem-surto`, `ac-entrada-clientes`, `notion-home-negocio` e `ac-instalar-skills`. Ler ou baixar o ZIP nesta conversa não é instalação.
5. **Termine com um teste em conversa nova**, sem reenviar o arquivo: entregue o texto de [docs/03-TESTE-EM-CONVERSA-NOVA.txt](docs/03-TESTE-EM-CONVERSA-NOVA.txt).
6. **Avise sobre os dois extras, sem configurar nada:** `notion-home-negocio` só funciona com o Notion conectado em **Configurações > Conectores > Notion**; `ac-reforma-tributaria-rag` consulta `day-rag-chroma-actions.onrender.com` e pode precisar desse domínio liberado na rede da execução de código.

Não peça senha, token ou certificado. Não selecione "Ignorar todas as aprovações". Não altere outros conectores ou permissões. O pacote não concede permissões a si mesmo: os cliques de consentimento são da pessoa.

## Instalação com download

1. Baixe o kit pelo botão acima e extraia `KIT-ALUNAS-CLAUDE.zip`.
2. Abra o Claude Desktop na sua conta. Confira execução de código/criação de arquivos em Configurações > Capacidades.
3. Na tarefa Cowork, selecione **Aprovar automaticamente**, se disponível. O modo manual também permite instalar, com suas aprovações.
4. Anexe `academia-skills-contabeis.zip` e cole [o comando completo](docs/02-COMANDO-PARA-COLAR-NO-CLAUDE.txt).
5. Conclua a importação nativa. Se necessário, use Personalização > Plugins e a opção de enviar plugin; se indisponível, há ZIPs individuais de cada skill no kit.
6. Confira o plugin/skills na conta e faça [o teste em conversa nova](docs/03-TESTE-EM-CONVERSA-NOVA.txt), sem reenviar os arquivos.

Use o download da release. **Code > Download ZIP baixa o projeto de manutenção**, que tem outra estrutura e não deve ser enviado como uma skill.

## Especialistas incluídas

| Skill | Uso |
|---|---|
| `ac-fiscal` | Conferência fiscal, notas/XML e pré-apuração revisável |
| `ac-dp` | Admissão, folha, férias, rescisão e rotinas de DP |
| `ac-societario` | Abertura, alteração, baixa e documentos societários |
| `ac-processos-escritorio` | Etapas, responsabilidades, checklists e evidências das rotinas |
| `ac-estrategista-conteudo-dai` | Conteúdo, carrosséis, Reels, anúncios e revisão de promessas |
| `ac-reforma-tributaria-rag` | Consulta à base Day, quando serviço e rede estiverem disponíveis |
| `ac-concierge-combo-reforma-sem-surto` | Concierge do Combo da Reforma Sem Surto: explicação prática de IBS/CBS/IS, adequação, DFe/ERP e comunicação com clientes |
| `ac-entrada-clientes` | Entrada de cliente novo e transferência: documentos, acessos, riscos e handoffs por departamento (beta) |
| `notion-home-negocio` | Gestão do escritório no Notion (template Home do Negócio 2.0): clientes, onboarding, tarefas, pergunta do dia (exige o conector do Notion) |
| `ac-instalar-skills` | Instalação e atualização de skills/plugins por link, com verificação de persistência |

Veja [o guia detalhado e exemplos de pedidos](docs/01-GUIA-DA-ALUNA.md). As skills apoiam a profissional responsável e não integram automaticamente sistemas externos. Agentes apenas citados em encaminhamentos não estão necessariamente instalados.

## Novas skills e atualizações

**Novo repositório:** “Use ac-instalar-skills e instale na minha conta esta skill: [link]. Confira o resultado e me dê um teste em conversa nova.”

**Atualizar este kit:** “Use ac-instalar-skills para conferir a última versão do kit em https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest e atualizar minha instalação, preservando personalizações.”

As atualizações publicadas ficam no mesmo link de download. **O ZIP já importado na conta não é atualizado automaticamente pelo GitHub.** Uma nova publicação precisa ser aplicada na conta. Não precisa remover o kit para acrescentar uma skill independente.

## Permissões e limites do pacote

O fluxo pede **Aprovar automaticamente**. A seleção pertence ao Claude, pode depender do plano/admin e pode exigir um clique da titular. O plugin não contém configuração que elimine essa etapa. Não usa “Ignorar todas as aprovações”. Novas integrações podem exigir novos consentimentos.

A Reforma RAG tem teste separado de instalação: a presença da skill não prova que houve consulta externa. O kit não instala a Action do ChatGPT nem um MCP. O guia explica o teste HTTP e o fallback.

## Validação e publicação

Cada alteração publicada na branch `main` executa validação e gera uma release com ZIPs, catálogo, versão/commit e SHA-256. Se a validação falhar, os links da última release continuam entregando a versão anterior. O código de `main` pode estar à frente do pacote publicado durante a execução.

A validação de estrutura não comprova instalação ou comportamento na conta de uma aluna. O teste em nova conversa continua necessário.

Manutenção: [COMO-ATUALIZAR.md](COMO-ATUALIZAR.md). Origem das skills: [plugin/FONTES.json](plugin/FONTES.json).

Referências: [plugins no Claude](https://support.claude.com/en/articles/13837440-use-plugins-in-claude), [permissões do Cowork](https://support.claude.com/en/articles/13345190-get-started-with-claude-cowork), [links estáveis de releases](https://docs.github.com/en/repositories/releasing-projects-on-github/linking-to-releases).
