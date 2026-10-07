# Ficha de captura da fonte

## Estado reconfirmado em 2026-09-20

- **source_status:** accessible; inspeção somente leitura no editor autenticado.
- **Auditoria corrente:** [live-editor-audit-2026-09-20.md](live-editor-audit-2026-09-20.md).
- **Instruções:** campo integral reconfirmado; corpo normalizado idêntico a `instructions/system.md` (SHA-256 `73665721ed4edbbd6eeb7a2b21f15fe7e8e7046c56b250bf7bbedd8a8ac1315a`).
- **Nome, descrição e quatro starters:** iguais aos registrados em 2026-08-06; o sufixo `(copy)` permanece no editor.
- **Modelo recomendado:** `Thinking` selecionado; a prévia identifica `GPT-5.5 Thinking`. Diverge do registro histórico sem modelo recomendado.
- **Capacidades nativas:** busca na web, geração de imagens e intérprete de código/análise de dados ativados. Não representam conectores da skill.
- **Actions:** nenhuma Action configurada aparece na seção; somente `Criar nova ação`.
- **Knowledge:** seis nomes reconfirmados visualmente; os bytes e hashes locais coincidem com o manifesto de 2026-08-07. Nenhum download atual foi obtido pela interface; paridade binária com os anexos online atuais permanece não verificada.
- **Distribuição:** cabeçalho `Rascunho` e botão `Criar`. A qualificação histórica como privado não foi reconfirmada por controle explícito de compartilhamento nesta leitura.
- **Lifecycle:** permanece `source-capture` até a aprovação final. Não houve edição, criação, publicação nem clique em `Update` no GPT.

## Registro histórico — 2026-08-06

- **source_status:** accessible
- **data da captura:** 2026-08-06
- **URL exata do editor/fonte:** https://chatgpt.com/gpts/editor/g-6a725a3feec081919ba9131c9f475341
- **nome no editor:** Day Agente da Reforma Tributária Sem Surto (copy)
- **distribuição observada:** rascunho privado
- **responsável:** Academia-de-Contadores
- **método de recuperação:** inspeção somente leitura da configuração no editor autenticado; nenhuma conversa pública foi usada.
- **status de recuperação:** nome, descrição, instruções, starters, metadados do Knowledge, modelo e capacidades acessíveis; conteúdo dos anexos e configuração de autenticação/endpoint não recuperados.

### Campos acessíveis na captura inicial

- **Descrição:** Especialista consultiva em Reforma Tributária do Consumo para contadores: IBS, CBS, IS, DFe/XML/ERP, créditos e respostas claras para clientes.
- **Quebra-gelos:** `Analisar impacto da Reforma em um cliente específico`; `Responder dúvida específica de cliente`; `Revisar nota fiscal, XML e ERP do cliente`; `Adequar cliente da melhor maneira à Reforma`.
- **Modelo recomendado:** Nenhum modelo recomendado, os usuários usarão qualquer modelo que preferirem.
- **Busca na web:** ativada.
- **Geração de imagens:** ativada.
- **Intérprete de código/análise de dados:** ativado.
- **Actions:** a interface mostrou somente a opção de criar nova Action; esquema, autenticação e endpoint não ficaram visíveis.
- **Knowledge (somente nomes e tipos visíveis):**
  - `04-BASE-ORIGINAL-PRESERVADA.md`
  - `06-GAPS-E-LIMITES-DA-IA.md`
  - `02-KB-CONSOLIDADA-IA-REFORMA.md`
  - `01-FONTES-OFICIAIS-E-VERSOES.md`
  - `05-ECONET-FONTE-SECUNDARIA.md`
  - `03-DOCUMENTOS-FISCAIS-ELETRONICOS.md`

### Mapeamento canônico na captura inicial

- **Objetivos:** descrição do editor e escopo expresso nas instruções; ver `objectives/`.
- **Identidade:** trecho explícito de identidade capturado; ver `identity/identity.md`.
- **Soul/tom:** seção `Tom` capturada; ver `identity/soul.md`.
- **Instruções:** campo integral, sem wrapper específico do GPT Builder, em `instructions/system.md`.
- **Guardrails:** índice das seções `Politica de Fontes`, `Guardrails` em `instructions/guardrails.md`; o texto normativo permanece em `instructions/system.md` para evitar duplicação.
- **Workflows:** índice das seções `Formato Padrao Obrigatorio`, `Fluxo Classico Day`, `Etapa 1 — Diagnostico e Traducao`, `Etapa 2 — Analise Tematica`, `Etapa 3 — Estrategia e Action Plan`, `Regras Especificas DFe/XML/ERP`, `Regras Especificas de Classificacao`, `Fechamento Padrao` em `instructions/workflows/main.md`.
- **Skills:** padrões comportamentais estão no campo de instruções e em nomes de anexos; os corpos dos anexos não foram acessados, portanto nenhuma skill independente foi inventada.
- **Conectores:** nenhum conector canônico configurado; capacidades de plataforma foram registradas apenas como metadados.
- **Knowledge:** somente metadados de nomes/tipos; corpos, corpus, índices e exports não foram copiados.

### Dados omitidos na captura inicial

Foram deliberadamente omitidos tokens, credenciais, autenticação, endpoints privados,
conversas de usuários, dados de clientes, logs, arquivos anexos, corpus, índices RAG
e qualquer duplicação específica da plataforma. A linha de instrução destinada ao
campo “Instructions” do GPT Builder e títulos equivalentes foram removidos como
wrapper de plataforma; o comportamento substantivo foi preservado.

## Atualização — recuperação integral do Knowledge (2026-08-07)

- Os 6 anexos exibidos no editor foram baixados diretamente e preservados em `knowledge/original/`.
- `knowledge/MANIFEST.md` registra nome, tamanho e SHA-256 de cada arquivo.
- Esta atualização substitui, para o estado atual do repositório, as observações históricas acima que diziam que os corpos dos anexos não haviam sido recuperados.
- Tokens, credenciais, conversas de usuários, dados de clientes, logs e índices externos continuam fora do repositório.
