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

## Por que estas skills existem

Cada skill resolve um ponto que trava o escritório contábil no dia a dia. Elas preparam rascunhos, checklists e análises revisáveis; a decisão final continua com a profissional responsável.

| O que trava | Skill que ajuda |
|---|---|
| A rotina depende de quem sabe de cabeça | `ac-processos-escritorio` transforma a rotina em processo com responsável e evidência; `ac-entrada-clientes` organiza cliente novo e transferência |
| Conferência repetitiva em cada departamento | `ac-fiscal`, `ac-dp` e `ac-societario` montam checklists, matrizes e minutas para revisão |
| A Reforma Tributária muda rápido | `ac-reforma-tributaria-rag` consulta a base Day com fontes e lacunas; `ac-concierge-combo-reforma-sem-surto` explica para o cliente |
| Falta tempo para conteúdo, e promessa exagerada é risco | `ac-estrategista-conteudo-dai` escreve e revisa carrosséis, Reels e anúncios |
| A gestão fica espalhada | `notion-home-negocio` organiza clientes, onboarding e tarefas no template Home do Negócio 2.0 |
| Instalar a próxima skill sem depender de suporte | `ac-instalar-skills` instala e confere por link |

## Catálogo por departamento

As skills ficam juntas em `plugin/skills/` (é o formato que o Claude e o Codex leem). O departamento de cada uma está em [catalogo/departamentos.json](catalogo/departamentos.json), e a tabela abaixo é gerada a partir dele.

<!-- catalogo:inicio -->

### 🧾 Fiscal

Notas, XML, conferências e pré-apuração revisável.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-fiscal` · Fiscal | Triagem fiscal, notas/XML, matriz de conferência e pré-apuração revisável. | — |

<details><summary>Exemplo de pedido para <code>ac-fiscal</code></summary>

> Use a skill ac-fiscal para montar um checklist de pré-apuração mensal. Liste documentos, conferências e pendências; não calcule imposto sem dados.

</details>

### ⚖️ Reforma Tributária

IBS, CBS, IS, documentos fiscais, ERP e comunicação com clientes.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-concierge-combo-reforma-sem-surto` · Concierge do Combo da Reforma Sem Surto | Explicação prática de IBS/CBS/IS, adequação, documentos fiscais, ERP e comunicação com clientes. | — |
| `ac-reforma-tributaria-rag` · Reforma com consulta à base Day | Consulta o corpus Day quando a rede e o serviço estão disponíveis; apresenta fontes, lacunas e apoio local quando necessário. | acesso de rede ao serviço de consulta (ver guia, seção 9) |

<details><summary>Exemplo de pedido para <code>ac-concierge-combo-reforma-sem-surto</code></summary>

> Use a skill ac-concierge-combo-reforma-sem-surto para preparar uma explicação introdutória da Reforma do Consumo para um cliente. Separe regra confirmada de ponto a validar.

</details>

<details><summary>Exemplo de pedido para <code>ac-reforma-tributaria-rag</code></summary>

> Use a skill ac-reforma-tributaria-rag. Consulte a base para listar dados necessários à análise de créditos de CBS. Informe se a consulta ocorreu e suas lacunas. Não use dados reais de cliente.

</details>

### 👥 Departamento Pessoal

Admissão, folha, férias, afastamentos, rescisão e eSocial.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-dp` · Departamento Pessoal | Admissão, folha, ponto, férias, afastamentos, rescisão, eSocial, SST e pró-labore: checklists e simulações revisáveis. | — |

<details><summary>Exemplo de pedido para <code>ac-dp</code></summary>

> Use a skill ac-dp para organizar a admissão de um empregado fictício. Monte documentos, etapas, responsáveis e pontos que dependem da CCT.

</details>

### 🏛️ Societário e Legalização

Abertura, alteração, baixa, viabilidade e documentos.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-societario` · Societário | Abertura, alteração, baixa, viabilidade, documentos e minutas para revisão. | — |

<details><summary>Exemplo de pedido para <code>ac-societario</code></summary>

> Use a skill ac-societario para preparar um checklist de alteração de endereço. Informe os dados de UF e município necessários e o que depende de validação local.

</details>

### 🗂️ Gestão e Processos do Escritório

Rotinas, entrada de clientes, responsabilidades e gestão no Notion.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-entrada-clientes` · Entrada de Clientes (beta) | Cliente novo e transferência de contabilidade: checklist por departamento, acessos, riscos e handoffs. | — |
| `ac-processos-escritorio` · Processos do Escritório | Transforma uma rotina real em processo, checklist, matriz de responsabilidades e plano de teste. | — |
| `notion-home-negocio` · Gestão no Notion | Clientes, onboarding, tarefas do time e pergunta do dia no template Home do Negócio 2.0. | conector do Notion ligado; cópia do template Home do Negócio 2.0 |

<details><summary>Exemplo de pedido para <code>ac-entrada-clientes</code></summary>

> Use a skill ac-entrada-clientes. Um cliente fictício de comércio e serviços, com 2 funcionários, vem de outra contabilidade. Monte o checklist por departamento, os acessos pendentes e os handoffs. Não peça senhas.

</details>

<details><summary>Exemplo de pedido para <code>ac-processos-escritorio</code></summary>

> Use a skill ac-processos-escritorio. Minha rotina é: receber documentos por e-mail, conferir uma lista e pedir faltantes. Transforme essas etapas em um processo com responsável e evidência. Marque lacunas sem inventar prazo.

</details>

<details><summary>Exemplo de pedido para <code>notion-home-negocio</code></summary>

> Use a skill notion-home-negocio. Esta é a Home da minha cópia: [link]. Identifique onde ficam clientes, onboarding, tarefas do time e os controles de DP, Fiscal, Contábil e Legalização. Me mostre os links e o que não conseguiu confirmar. Não altere nada.

</details>

### 📣 Marketing e Conteúdo

Carrosséis, Reels, anúncios, sequências e revisão de promessas.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-estrategista-conteudo-dai` · Conteúdo D.A.I. | Rascunhos completos de carrosséis, Reels, anúncios, sequências, CTAs e revisão de promessas. | — |

<details><summary>Exemplo de pedido para <code>ac-estrategista-conteudo-dai</code></summary>

> Use a skill ac-estrategista-conteudo-dai para criar um carrossel de 6 slides sobre organização do escritório contábil, sem prometer resultado garantido.

</details>

### 🧰 Instalação e Atualização

Instalar e atualizar skills e plugins por link.

| Skill | Para que usar | Precisa de |
|---|---|---|
| `ac-instalar-skills` · Instalação e atualização | Conduz futuras instalações por link, confere compatibilidade, duplicatas e persistência na conta. | — |

<details><summary>Exemplo de pedido para <code>ac-instalar-skills</code></summary>

> Use ac-instalar-skills e instale na minha conta esta skill: [link]. Confira se aparece na conta e me dê um teste em conversa nova.

</details>

<!-- catalogo:fim -->

Veja [o guia detalhado e exemplos de pedidos](docs/01-GUIA-DA-ALUNA.md). As skills apoiam a profissional responsável e não integram automaticamente sistemas externos. Agentes apenas citados em encaminhamentos não estão necessariamente instalados.


## Atualizar e conferir

Peça: “Confira a versão publicada do kit e atualize minha instalação preservando personalizações.” O instalador Codex aceita repetir a mesma instalação sem duplicar; se encontrar conteúdo diferente, preserva tudo e informa o conflito antes de escrever. Atualizações precisam de comparação e backup. A publicação de uma release não atualiza contas automaticamente.

Confira as dez skills e abra uma conversa nova usando [o teste](docs/03-TESTE-EM-CONVERSA-NOVA.txt). A conexão Notion e a consulta externa da Reforma RAG são verificações separadas.

## Padrão de qualidade

Toda skill do kit passa pelos mesmos critérios antes de publicar: descrição clara de quando usar, SKILL.md curto com detalhes em arquivos de apoio, nenhum caminho de computador, nenhum dado de cliente, nenhuma credencial e nenhum material interno. Os testes conferem isso a cada mudança. Critérios completos em [CONTRIBUTING.md](CONTRIBUTING.md); situação atual de cada skill em [catalogo/QUALIDADE.md](catalogo/QUALIDADE.md); o que entra e o que não entra no kit em [SCOPE.md](SCOPE.md).

## Manutenção

[Procedimento de instalação](INSTALL.md) · [Guia da aluna](docs/01-GUIA-DA-ALUNA.md) · [Fontes do conteúdo](plugin/FONTES.json) · [Manutenção](COMO-ATUALIZAR.md) · [Escopo](SCOPE.md) · [Como contribuir](CONTRIBUTING.md) · [Catálogo](catalogo/departamentos.json)

Os testes verificam estrutura, integridade, conflitos e instalação local. Não comprovam instalação na conta de cada aluna.
