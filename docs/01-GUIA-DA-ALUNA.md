# Instalar as skills da Academia de Contadores no Claude

Guia para alunas da Mentoria Master • pacote 1.3.1 • 07/10/2026

## O resultado esperado

Ao terminar, você terá dez skills disponíveis (nove especialistas e uma de instalação) na sua conta, para usar em novas conversas. Elas funcionam como especialistas que o Claude consulta conforme a tarefa. Não são contas separadas nem novos GPTs e não executam obrigações contábeis sozinhas.

O pacote foi preparado e validado estruturalmente. A instalação e o teste em sua conta ainda precisam ser feitos. Um comando pode conduzir a instalação, mas não garante que o Claude possa mudar permissões ou salvar plugins sozinho: os cliques nativos de consentimento e importação, quando exigidos, são feitos por você.

## 1. Arquivos recebidos

- `academia-skills-contabeis.zip`: plugin com as dez skills especialistas e ac-instalar-skills. É o arquivo principal.
- `02-COMANDO-PARA-COLAR-NO-CLAUDE.txt`: pedido completo para conduzir a configuração e verificar a instalação.
- `skills-individuais/`: dez ZIPs alternativos, para contas que não ofereçam importação de plugin. Use o plugin OU os ZIPs individuais, evitando duplicatas.
- `03-TESTE-EM-CONVERSA-NOVA.txt`: teste final de persistência.

Se recebeu `KIT-ALUNAS-CLAUDE.zip`, extraia esse kit no Windows (botão direito > Extrair tudo). Não extraia o ZIP do plugin antes de enviá-lo no importador. Não envie o kit inteiro como se fosse uma skill.

## 2. Preparação no Windows

1. Abra o Claude Desktop atualizado e entre na SUA conta.
2. Confirme que usa o mesmo login quando acessa o Claude pelo navegador.
3. Abra Configurações > Capacidades e verifique se Execução de código e criação de arquivos está ligada. Se faltar essa opção ou estiver bloqueada em conta organizacional, o administrador precisa verificar a política.
4. Comece uma tarefa Cowork. Em versões que integram Chat e Cowork, comece a conversa e confira se as ferramentas necessárias estão disponíveis. Não é necessário instalar Claude Code para usar este pacote na conta.
5. Se precisar fornecer uma pasta, crie `Documentos/Academia-Skills` e selecione somente ela. Importar o ZIP pela interface não exige liberar todo o computador.

## 3. Permissões: configuração recomendada

| Controle | O que selecionar | Para que serve |
|---|---|---|
| Execução de código e criação de arquivos | Ligado | Permite o ambiente que carrega e usa skills |
| Aprovação da tarefa | Aprovar automaticamente, se disponível | Reduz as interrupções com revisão automática das ações |
| Se o modo automático não existir | Aprovar manualmente | A instalação ainda pode ser concluída com os cliques solicitados |
| Pasta local, se necessária | Apenas Academia-Skills | Acesso aos arquivos usados nesta instalação |
| Rede para a skill RAG | Verificar acesso ao domínio específico quando necessário | Permite tentar a consulta externa |

Não é necessário selecionar “Ignorar todas as aprovações”. Essa opção remove a revisão automática e as pausas usuais; não torna a instalação permanente. Aprovar automaticamente também não garante ausência total de perguntas. A disponibilidade dos controles depende do plano e da versão.

As regras das próprias skills continuam distinguindo preparar um rascunho de enviar, protocolar, emitir, pagar, alterar sistemas ou transmitir obrigações. O pacote não liga Domínio, eSocial, WhatsApp, Drive ou outros sistemas automaticamente. Conectar esses serviços é uma configuração separada.

## 4. Instalação guiada por comando

1. Anexe `academia-skills-contabeis.zip` à conversa ou disponibilize-o na pasta autorizada.
2. Abra `02-COMANDO-PARA-COLAR-NO-CLAUDE.txt`, copie TODO o texto e envie ao Claude.
3. Se o Claude apresentar um cartão nativo para adicionar o plugin, confira o nome e conclua a instalação.
4. Se ele disser que só consegue ler os arquivos nesta conversa, siga a instalação pela interface abaixo. Isso não exige trocar de conta nem liberar todas as permissões.

## 5. Instalação pela interface, quando o comando não consegue concluir

### Opção A — plugin único

1. Abra Personalização > Plugins.
2. Procure a opção de adicionar/enviar um plugin personalizado. O nome do botão pode variar com a versão.
3. Selecione `academia-skills-contabeis.zip` e conclua o fluxo de importação.
4. Confirme que `academia-skills-contabeis` está instalado e habilitado.
5. Abra Personalização > Habilidades/Skills > Meus e confira as dez skills. Algumas versões agrupam as skills dentro do plugin.

Se a interface não oferecer importação de plugin, ou rejeitar esse formato, use a Opção B e anote o erro para a Mentoria. Não trate uma rejeição como instalação concluída.

### Opção B — dez skills individuais

1. Abra Personalização > Habilidades/Skills.
2. Use Adicionar habilidade > Criar skill > Enviar uma skill, ou a opção equivalente de upload da sua versão.
3. Envie os dez ZIPs de `skills-individuais`, UM POR VEZ.
4. Ative cada skill e confira seu nome na lista.
5. Não envie o ZIP do plugin no importador de UMA skill: são estruturas diferentes.

Se já instalou uma das rotas, não repita a outra. Se já possui uma skill com o mesmo nome, confira a versão antes de substituir qualquer coisa.

## 6. Quais especialistas você pode chamar

| Especialista | Nome da skill | Para que usar |
|---|---|---|
| Fiscal | `ac-fiscal` | Triagem fiscal, notas/XML, matriz de conferência e pré-apuração revisável. |
| Departamento Pessoal | `ac-dp` | Admissão, folha, ponto, férias, afastamentos, rescisão, eSocial, SST e pró-labore: checklists e simulações revisáveis. |
| Societário | `ac-societario` | Abertura, alteração, baixa, viabilidade, documentos e minutas para revisão. |
| Processos do Escritório | `ac-processos-escritorio` | Transforma uma rotina real em processo, checklist, matriz de responsabilidades e plano de teste. |
| Conteúdo D.A.I. | `ac-estrategista-conteudo-dai` | Rascunhos completos de carrosséis, Reels, anúncios, sequências, CTAs e revisão de promessas. |
| Reforma com consulta à base Day | `ac-reforma-tributaria-rag` | Consulta o corpus Day quando a rede e o serviço estão disponíveis; apresenta fontes, lacunas e apoio local quando necessário. |
| Concierge do Combo da Reforma Sem Surto | `ac-concierge-combo-reforma-sem-surto` | Explicação prática de IBS/CBS/IS, adequação, documentos fiscais, ERP e comunicação com clientes. |
| Entrada de Clientes (beta) | `ac-entrada-clientes` | Cliente novo e transferência de contabilidade: checklist por departamento, acessos, riscos e handoffs. |
| Gestão no Notion | `notion-home-negocio` | Clientes, onboarding, tarefas do time e pergunta do dia no template Home do Negócio 2.0. Exige o Notion conectado. |
| Instalação e atualização | `ac-instalar-skills` | Conduz futuras instalações por link, confere compatibilidade, duplicatas e persistência na conta. |

## 7. Comandos prontos para o dia a dia

Você pode chamar pelo nome, em português, sem decorar comandos com barra. Nos plugins, o Claude pode apresentar nomes com prefixo, como `academia-skills-contabeis:ac-fiscal`. Se a sua interface oferecer `/`, selecione a skill que aparecer na lista. Um modo como `/pre-apuracao` citado dentro de uma skill não é necessariamente um comando global do aplicativo.

### Fiscal

> Use a skill ac-fiscal para montar um checklist de pré-apuração mensal. Liste documentos, conferências e pendências; não calcule imposto sem dados.

### Departamento Pessoal

> Use a skill ac-dp para organizar a admissão de um empregado fictício. Monte documentos, etapas, responsáveis e pontos que dependem da CCT.

### Societário

> Use a skill ac-societario para preparar um checklist de alteração de endereço. Informe os dados de UF e município necessários e o que depende de validação local.

### Processos do Escritório

> Use a skill ac-processos-escritorio. Minha rotina é: receber documentos por e-mail, conferir uma lista e pedir faltantes. Transforme essas etapas em um processo com responsável e evidência. Marque lacunas sem inventar prazo.

### Conteúdo D.A.I.

> Use a skill ac-estrategista-conteudo-dai para criar um carrossel de 6 slides sobre organização do escritório contábil, sem prometer resultado garantido.

### Concierge do Combo da Reforma Sem Surto

> Use a skill ac-concierge-combo-reforma-sem-surto para preparar uma explicação introdutória da Reforma do Consumo para um cliente. Separe regra confirmada de ponto a validar.

### Reforma com consulta à base Day

> Use a skill ac-reforma-tributaria-rag. Consulte a base para listar dados necessários à análise de créditos de CBS. Informe se a consulta ocorreu e suas lacunas. Não use dados reais de cliente.

### Usar duas especialidades em sequência

> Use ac-fiscal para listar as conferências desta rotina. Depois, use ac-processos-escritorio para organizar essas conferências em etapas, responsáveis e evidências. Separe o que foi informado do que precisa de validação.

### Entrada de Clientes (beta)

> Use a skill ac-entrada-clientes. Um cliente fictício de comércio e serviços, com 2 funcionários, vem de outra contabilidade. Monte o checklist por departamento, os acessos pendentes e os handoffs. Não peça senhas.

### Gestão no Notion

Exige o Notion conectado em Configurações > Conectores e uma cópia do template Home do Negócio 2.0.

> Use a skill notion-home-negocio. Esta é a Home da minha cópia: [link]. Identifique onde ficam clientes, onboarding, tarefas do time e os controles de DP, Fiscal, Contábil e Legalização. Me mostre os links e o que não conseguiu confirmar. Não altere nada.

Se uma skill citar Contábil, Captação ou Guia de Operação, isso pode ser um encaminhamento previsto no conteúdo. Esses agentes NÃO fazem parte deste pacote. Não considere que foram instalados apenas porque apareceram na resposta.

## 8. Teste obrigatório em outra conversa

1. Termine a instalação.
2. Abra uma conversa nova, na mesma conta, sem anexar o pacote novamente.
3. Cole o conteúdo de `03-TESTE-EM-CONVERSA-NOVA.txt`.
4. Confira a lista da conta e, quando a interface mostrar, a leitura/ativação da skill durante a execução. Uma resposta “instalei” sozinha não serve como comprovação.

Critério de conclusão: dez skills visíveis/ativas na conta ou dentro do plugin habilitado; uma skill carregada e usada em conversa nova; RAG marcada separadamente como consulta externa testada ou pendente. A leitura de um ZIP na conversa original comprova apenas acesso ao arquivo.

## 9. Teste da Reforma RAG

A skill contém as instruções e os schemas da consulta, mas não instala uma Action do ChatGPT nem um servidor MCP. Ela pode usar HTTP quando o ambiente permitir.

Domínio: `day-rag-chroma-actions.onrender.com`.

Peça ao Claude para seguir o contrato empacotado, testar `/health` e uma consulta pública em `/rag/search`. Nenhum dado de cliente é necessário para o teste. Uma liberação de rede não corrige serviço fora do ar ou retorno inválido. Se o plano apresentar lista de domínios permitidos e esse for o bloqueio, ajuste apenas o domínio necessário. Em conta organizacional, o administrador pode precisar fazer o ajuste.

Se falhar: as demais skills continuam utilizáveis; a RAG deve registrar a indisponibilidade e oferecer o apoio local permitido pelo contrato, sem alegar que consultou a base. Reavalie fatos normativos atuais em fonte oficial. Uma estimativa de cenário, como CBS de 9,21% no acervo, não é automaticamente uma alíquota oficial nem carga efetiva.

## 10. Problemas comuns

| Situação | Próxima ação |
|---|---|
| “Só consigo usar neste chat” | Concluir importação nativa da conta; não basta anexar |
| “Repositório exige login” | Conferir se o endereço é um dos oito do comando; para o pacote anexo, GitHub não é necessário |
| “SKILL.md não encontrado” | Usar um ZIP individual no importador de skill, ou o plugin no importador de plugin |
| Habilidade desativada/cinza | Verificar execução de código, ativação e política da organização |
| Não aparece upload | Conferir Personalização, versão e política da conta; usar a rota compatível disponível |
| “Instalado em .claude/skills” | Essa localização é do ambiente local; conferir separadamente a instalação na conta |
| RAG com erro/timeout | Registrar erro; distinguir rede, serviço e contrato; não reinstalar todas as skills |
| Limite de uso atingido | Aguardar a renovação do plano ou avaliar as opções da própria conta; mudar permissões não remove limites |
| Skill menciona outro agente | Confirmar se esse agente realmente está instalado; encaminhamento não é instalação |

Ao pedir ajuda à Mentoria, envie o nome da skill, o texto exato do erro e um print de Personalização com a lista. Não envie senha, token nem documentos reais de clientes para diagnosticar a instalação.

## 11. Instalar outros agentes no futuro, só com o link

A skill `ac-instalar-skills` fica instalada junto das demais. Quando a Academia disponibilizar outro repositório, abra uma conversa e cole o comando do arquivo `04-INSTALAR-NOVAS-SKILLS-POR-LINK.txt`, substituindo o campo pelo link.

Pedido curto: “Use ac-instalar-skills e instale na minha conta esta skill: [link]. Confira se aparece na conta e me dê um teste em conversa nova.”

O Claude inspecionará o repositório e conduzirá o fluxo que suas ferramentas permitirem. Um clique de importação/consentimento pode continuar necessário. Não precisa reinstalar o pacote inicial para adicionar uma skill independente. Se o nome já existir, peça atualização preservando personalizações. Um repositório sem SKILL.md ou plugin compatível não pode ser tratado como pronto.

O nome comercial “agente” pode corresponder a uma skill, plugin, aplicação ou GPT. Este procedimento cobre skills e plugins compatíveis com Claude. Links de GPT não viram automaticamente skills instaláveis. Futuras integrações podem exigir permissões específicas novas; não é possível pré-autorizar agora todo acesso futuro.

## Referências de configuração

- [Usar skills no Claude](https://support.claude.com/en/articles/12512180-use-skills-in-claude)
- [Criar e empacotar skills](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills)
- [Instalar plugins na conta](https://support.claude.com/en/articles/13837440-use-plugins-in-claude)
- [Permissões do Cowork](https://support.claude.com/en/articles/13345190-get-started-with-claude-cowork)
- [Execução de código e rede](https://support.claude.com/en/articles/12111783-create-and-edit-files-with-claude)

Os endereços de origem e commits usados estão no arquivo FONTES.json do plugin. O pacote é uma cópia versionada; atualizações dos repositórios não se propagam automaticamente para este ZIP.
