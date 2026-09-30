# Skills da Academia de Contadores para Claude

Kit público para alunas da Mentoria Master: **oito especialistas contábeis + um assistente para instalar e atualizar outras skills por link**.

**[BAIXAR KIT COMPLETO](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/KIT-ALUNAS-CLAUDE.zip)** · **[BAIXAR SÓ O PLUGIN](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/academia-skills-contabeis.zip)** · **[ÚLTIMA VERSÃO](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest)**

## Só quero mandar um link ao Claude

Abra uma tarefa Cowork e cole:

> Quero instalar na minha conta o kit da Academia: https://github.com/Academia-de-Contadores/ac-kit-skills-claude . Leia o README e docs/02-COMANDO-PARA-COLAR-NO-CLAUDE.txt. Baixe o plugin da última versão publicada e conduza a instalação persistente das nove skills. Oriente a seleção de Aprovar automaticamente, se disponível, pedindo o clique de consentimento exigido. Não selecione Ignorar todas as aprovações. Se não tiver ferramenta para instalar na conta, indique exatamente o upload que devo fazer. Não considere download ou uso nesta conversa como instalação. Termine conferindo as skills e me dando um teste em conversa nova.

O comando pode conduzir o processo, mas **o Claude pode exigir que você clique para importar ou autorizar**. O pacote não concede permissões a si mesmo. Não precisa fornecer senha do GitHub para baixar este kit público.

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
| `ac-reforma-tributaria-sem-surto` | Explicação prática da Reforma e comunicação ao cliente |
| `ac-reforma-tributaria-rag` | Consulta à base Day, quando serviço e rede estiverem disponíveis |
| `ac-reforma-tributaria` | Trabalho com acervo técnico restaurado, distinguindo histórico de fonte atual |
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
