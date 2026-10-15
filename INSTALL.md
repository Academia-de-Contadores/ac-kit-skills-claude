# Instalar o kit da Academia no aplicativo atual

Este procedimento acompanha o pedido de instalação feito pela pessoa. Não amplia permissões nem autoriza ações fora dessa instalação. Inspecione o pacote antes de executar scripts.

## 1. Identifique o ambiente, sem pedir informação já disponível

- **Codex local (app/CLI/IDE com acesso a arquivos):** rota A.
- **Claude Chat, Desktop ou Cowork:** rota B. Não confunda seu terminal isolado com o computador da pessoa.
- **Claude Code:** rota C.
- Ambiente remoto/temporário: informe o alcance; não declare que gravou na conta ou no computador da pessoa.

O repositório público correto, em uma linha, é:
https://github.com/Academia-de-Contadores/ac-kit-skills-claude

Não use GitHub Search para encontrá-lo. Se a mensagem quebrou o endereço depois de `Academia-de-`, recomponha o endereço acima. Se a página não abrir, tente a fonte de texto:
https://raw.githubusercontent.com/Academia-de-Contadores/ac-kit-skills-claude/main/INSTALL.md

Use requisição HTTP/download direto para os arquivos. Se houver falha, informe URL e status observado, e tente uma alternativa direta. 404 na busca, bloqueio do navegador, 403/429 ou falha de proxy não comprovam repositório privado. Não repita buscas, não solicite login/senha/token e não tente contornar controles de rede. Se as rotas permitidas falharem, entregue o link direto do pacote e explique a etapa pendente.

## A. Codex local — instalar e verificar arquivos persistentes

Pré-requisito: Python 3.9+ no ambiente local do Codex. O agente executa os comandos; a aluna não precisa abrir um terminal. Se Python não estiver disponível, use o skill-installer nativo do Codex para as dez pastas `plugin/skills/<nome>` e preserve os recursos.

1. Confira as skills já existentes em `~/.agents/skills` e `$CODEX_HOME/skills` (padrão `~/.codex/skills`). Não crie outra cópia de uma skill já carregada numa raiz diferente. Preserve personalizações.
2. Baixe `install.py` da última release para uma pasta temporária e leia o código. O instalador não executa scripts das skills, não usa Git, não altera conectores nem permissões. Download: https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/install.py
3. Execute o arquivo salvo:

```sh
python3 /caminho/temporario/install.py --target codex
```

O padrão é `~/.agents/skills`; se as skills do kit já estiverem apenas em `$CODEX_HOME/skills`, o instalador reutiliza essa raiz. Se houver skills nas duas raízes, interrompe para evitar duplicatas. Se o ambiente confirmar outra raiz de usuário, use `--dest /caminho/confirmado/skills`. Não use um projeto/Vault como destino. No Windows, use o Python disponível (por exemplo `py -3`) e o caminho correspondente.

O instalador resolve uma única release, baixa o plugin e o SHA-256 dessa mesma versão, valida caminhos e copia todas as pastas `skills/<nome>` com seus recursos. Ele compara o conteúdo salvo. Repetir com arquivos iguais não duplica. Se encontrar uma skill diferente, interrompe **antes de escrever qualquer skill**, informa o caminho e preserva a instalação anterior. Para atualizar, compare as alterações e faça backup fora das pastas descobertas como skills; não apague personalizações para forçar sucesso.

Alternativa sem acesso à API do GitHub: baixe o plugin pelo link abaixo, confira seu SHA-256 contra `SHA256SUMS.txt` da mesma release e execute `python3 install.py --target codex --archive /caminho/academia-skills-contabeis.zip`. O modo `--archive` pressupõe arquivo previamente inspecionado; não busca/verifica checksum remoto.

Relate destino físico, versão/commit, dez nomes e integridade dos arquivos. A instalação é local para este usuário, não sincronização na conta da OpenAI. Abra uma conversa nova para verificar carregamento; se necessário, reinicie o aplicativo.

## B. Claude Chat / Desktop / Cowork — instalação nativa na conta

1. Se houver ferramenta nativa de instalação de plugin, use-a e apresente o cartão de instalação. Não invente uma ferramenta nem alegue que um download instalou o plugin.
2. Se houver controle da interface, abra **Personalizar (Customize) > Plugins > Adicionar (Add) > Adicionar marketplace**. Informe `https://github.com/Academia-de-Contadores/ac-kit-skills-claude`. O catálogo chama-se `academia-de-contadores`; selecione e instale `academia-skills-contabeis`. Peça somente os cliques de consentimento exigidos pelo produto. Adicionar o catálogo sozinho não instala o plugin.
3. Se não houver esse controle ou o catálogo não for aceito, use **Adicionar > Enviar plugin** com este arquivo:
https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/academia-skills-contabeis.zip
4. Se o assistente tiver download/criação de arquivos mas não controle da interface, baixe e entregue o ZIP como arquivo clicável na conversa, pronto para importar; indique apenas o passo de upload pendente. Não mande a aluna procurar o repositório ou navegar pela busca do GitHub.
5. Se a conta só aceitar skills individuais, baixe o kit completo, extraia `skills-individuais/` e forneça os dez ZIPs. Oriente upload de uma skill por vez no controle real de Skills/Habilidades. Não importe o plugin e as individuais em paralelo.
https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/KIT-ALUNAS-CLAUDE.zip
6. Confira plugin instalado/habilitado e dez skills. Se não puder observar a lista, marque **aguardando conferência** e descreva o controle que precisa ser conferido.

Os nomes dos menus e a disponibilidade dependem da versão/plano/admin. Confira a interface ou a documentação oficial quando houver divergência. Não mande instalar Claude Code para concluir uma instalação no Claude Chat. Não grave arquivos nas pastas internas do aplicativo nem extraia credenciais. `~/.claude/skills`, `/mnt/skills`, `/mnt/data`, anexos e pastas da VM não comprovam instalação na conta.

Não mude o modo de aprovação. Execução de código só é necessária se a rota escolhida realmente precisar dela; não faça disso um bloqueio antes de tentar a importação nativa. Não prometa zero cliques: a conta pode exigir uma confirmação da pessoa.

## C. Claude Code — comandos nativos

Execute no Claude Code, em diretório físico fora de qualquer Vault:

```sh
claude plugin marketplace add Academia-de-Contadores/ac-kit-skills-claude
claude plugin install academia-skills-contabeis@academia-de-contadores --scope user
claude plugin list
```

Se o catálogo/plugin já existir, confira a versão e use a atualização nativa em vez de duplicar. Verifique o inventário e o carregamento em nova sessão. Não afirme que isso instalou também no Claude Chat; confira cada superfície separadamente.

## As dez skills esperadas

- ac-fiscal
- ac-dp
- ac-societario
- ac-processos-escritorio
- ac-estrategista-conteudo-dai
- ac-reforma-tributaria-rag
- ac-concierge-combo-reforma-sem-surto
- ac-entrada-clientes
- notion-home-negocio
- ac-instalar-skills

## Critério de conclusão

Informe: aplicativo e alcance | versão/commit | destino ou plugin na conta | dez skills presentes | teste em nova conversa | pendências.

Teste em conversa nova, sem anexar ou baixar o pacote: “Use ac-entrada-clientes para preparar o checklist de entrada de um cliente fictício de serviços, sem acessar sistemas externos. Informe qual skill carregou.” Confira a skill carregada quando observável; uma resposta genérica não prova instalação. Notion e Reforma RAG exigem conexão/rede próprias e não bloqueiam a instalação das outras skills.

## Fontes oficiais

- Codex: https://developers.openai.com/codex/skills
- Plugins no Claude: https://support.claude.com/en/articles/13837440-use-plugins-in-claude
- Catálogo Claude: https://code.claude.com/docs/en/plugin-marketplaces
