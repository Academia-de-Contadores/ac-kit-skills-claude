# Kit da Academia de Contadores — Claude e Codex

Dez skills, um link e um comando. O repositório é público; não precisa de conta no GitHub.

## Copie e cole no aplicativo em que deseja instalar

> Instala o kit da Academia neste aplicativo: https://github.com/Academia-de-Contadores/ac-kit-skills-claude . Leia INSTALL.md, identifique se está no Codex ou no Claude e execute a rota correspondente. Preserve minhas skills existentes e confira as dez skills ao terminar.

Cole o endereço inteiro, sem inserir espaço ou quebra de linha depois de `Academia-de-`.

**Para o assistente que recebeu o pedido:** leia [INSTALL.md](INSTALL.md) e execute a rota do ambiente atual. Não pergunte “Claude ou Codex?” se o ambiente já estiver identificado. Não use a busca do GitHub para achar este repositório. Um erro da busca não indica repositório privado.

| Aplicativo | Como o kit é instalado | Alcance |
|---|---|---|
| Codex local (app, CLI ou IDE) | Instalador com verificação dos arquivos | Usuário deste computador; não sincroniza a conta na nuvem |
| Claude Chat / Desktop / Cowork | Catálogo nativo pelo link ou importação do plugin | Conta do Claude, conforme recursos do plano; pode exigir clique |
| Claude Code | Catálogo e instalação pelo comando nativo | Escopo de usuário do Claude Code |

**O comando conduz o processo, mas não elimina cliques exigidos pelo Claude.** Arquivos baixados, anexos e pastas temporárias não são instalação na conta. Se o assistente não tiver ferramenta nativa ou acesso à interface, ele deve fornecer o arquivo e o único passo de importação pendente.

## Downloads diretos, se o aplicativo precisar

- [Plugin para Claude](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/academia-skills-contabeis.zip)
- [Kit completo com guias e ZIPs individuais](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/KIT-ALUNAS-CLAUDE.zip)
- [Instalador Codex](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest/download/install.py)
- [Versão publicada](https://github.com/Academia-de-Contadores/ac-kit-skills-claude/releases/latest)

O nome antigo `KIT-ALUNAS-CLAUDE.zip` foi mantido para não quebrar links existentes; ele contém as orientações para os dois aplicativos. Não envie o ZIP genérico do repositório como skill.

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


## Atualizar e conferir

Peça: “Confira a versão publicada do kit e atualize minha instalação preservando personalizações.” O instalador Codex aceita repetir a mesma instalação sem duplicar; se encontrar conteúdo diferente, preserva tudo e informa o conflito antes de escrever. Atualizações precisam de comparação e backup. A publicação de uma release não atualiza contas automaticamente.

Confira as dez skills e abra uma conversa nova usando [o teste](docs/03-TESTE-EM-CONVERSA-NOVA.txt). A conexão Notion e a consulta externa da Reforma RAG são verificações separadas.

## Manutenção

[Procedimento de instalação](INSTALL.md) · [Guia da aluna](docs/01-GUIA-DA-ALUNA.md) · [Fontes do conteúdo](plugin/FONTES.json) · [Manutenção](COMO-ATUALIZAR.md)

Os testes verificam estrutura, integridade, conflitos e instalação local. Não comprovam instalação na conta de cada aluna.
