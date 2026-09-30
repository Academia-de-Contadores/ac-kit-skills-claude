# Ficha de captura da fonte

- **source_status:** accessible
- **data da captura:** 2026-08-06
- **URL exata do editor/fonte:** https://chatgpt.com/gpts/editor/g-6a7259edf2688191b44cec56ff3b7221
- **nome no editor:** Agente Reforma Tributária Day - Consulta RAG (copy)
- **distribuição observada:** rascunho privado
- **responsável:** Academia-de-Contadores
- **método de recuperação:** inspeção somente leitura da configuração no editor autenticado; nenhuma conversa pública foi usada.
- **status de recuperação:** nome, descrição, instruções, starters, metadados do Knowledge, modelo e capacidades acessíveis; conteúdo dos anexos e configuração de autenticação/endpoint não recuperados.

## Campos acessíveis

- **Descrição:** Assistente consultivo para Reforma Tributaria do Consumo com busca RAG nas colecoes Day v2.1 via Chroma Cloud.
- **Quebra-gelos:** `Tirar dúvida específica de um cliente`; `Explicar um ponto da Reforma pra um cliente`; `Fazer uma projeção tributária`; `Estudar dúvida técnica`.
- **Modelo recomendado:** Nenhum modelo recomendado, os usuários usarão qualquer modelo que preferirem.
- **Busca na web:** ativada.
- **Geração de imagens:** ativada.
- **Intérprete de código/análise de dados:** ativado.
- **Actions:** a interface mostrou somente a opção de criar nova Action; esquema, autenticação e endpoint não ficaram visíveis.
- **Knowledge (somente nomes e tipos visíveis):**
  - `01-INSTRUCOES-GPT-ACTIONS-RAG.md`
  - `02-REQUISITOS-RETRIEVAL.md`
  - `03-GAPS-CRITICOS-ANTES-DOS-240-TESTES.md`
  - `04-MAPA-COBERTURA-LEGAL-E-ARTIGOS.md`
  - `05-MAPA-DFE-XML-ERP.md`
  - `06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK.md`
  - `07-REGRAS-DE-NAO-CALCULAR.md`
  - `08-GUIA-REFORMA-SEM-SURTO-DAY.md`

## Mapeamento canônico

- **Objetivos:** descrição do editor e escopo expresso nas instruções; ver `objectives/`.
- **Identidade:** trecho explícito de identidade capturado; ver `identity/identity.md`.
- **Soul/tom:** source_status: unavailable; o editor não expõe campo Soul separado; ver `identity/soul.md`.
- **Instruções:** campo integral, sem wrapper específico do GPT Builder, em `instructions/system.md`.
- **Guardrails:** índice das seções `Fontes`, `Guardrails` em `instructions/guardrails.md`; o texto normativo permanece em `instructions/system.md` para evitar duplicação.
- **Workflows:** índice das seções `Uso obrigatorio da Action`, `Auto-revisao antes de responder`, `Fluxo Day`, `Projecoes e regimes`, `DFe/XML/Classificacao` em `instructions/workflows/main.md`.
- **Skills:** padrões comportamentais estão no campo de instruções e em nomes de anexos; os corpos dos anexos não foram acessados, portanto nenhuma skill independente foi inventada.
- **Conectores:** a instrução exige `searchDayRagCorpus`; o runtime/corpus permanece externo e sem segredo versionado.
- **Knowledge:** somente metadados de nomes/tipos; corpos, corpus, índices e exports não foram copiados.

## Dados omitidos

Foram deliberadamente omitidos tokens, credenciais, autenticação, endpoints privados,
conversas de usuários, dados de clientes, logs, arquivos anexos, corpus, índices RAG
e qualquer duplicação específica da plataforma. A linha de instrução destinada ao
campo “Instructions” do GPT Builder e títulos equivalentes foram removidos como
wrapper de plataforma; o comportamento substantivo foi preservado.

## Atualização — recuperação integral do Knowledge (2026-08-07)

- Os 8 anexos exibidos no editor foram baixados diretamente e preservados em `knowledge/original/`.
- `knowledge/MANIFEST.md` registra nome, tamanho e SHA-256 de cada arquivo.
- Esta atualização substitui, para o estado atual do repositório, as observações históricas acima que diziam que os corpos dos anexos não haviam sido recuperados.
- Tokens, credenciais, conversas de usuários, dados de clientes, logs e índices externos continuam fora do repositório.
