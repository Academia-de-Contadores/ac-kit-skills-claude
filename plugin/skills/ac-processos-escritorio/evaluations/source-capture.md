# Ficha de captura da fonte

## Estado reconfirmado em 2026-09-21

- **source_status:** accessible; inspeção somente leitura no editor
  autenticado.
- **Auditoria corrente:**
  [live-editor-audit-2026-09-21.md](live-editor-audit-2026-09-21.md).
- **Instruções:** o campo integral coincide criptograficamente com o corpo
  canônico de `instructions/system.md` após normalização de bordas e quebras de
  linha (6.957 bytes UTF-8; 155 linhas; SHA-256
  `b97585a192658dad37d47ad4456feb39f9ab34b453ad1cec390da28b3c0924c9`).
- **Nome, descrição e starters:** iguais à captura histórica. O nome online
  mantém o sufixo `(copy)` e existem quatro starters preenchidos.
- **Modelo recomendado:** continua selecionado `Nenhum modelo recomendado, os
  usuários usarão qualquer modelo que preferirem`; a prévia exibe o rótulo
  `Instantânea`, registrado sem inferir um ID interno ou equivalência.
- **Capacidades nativas:** busca na web, geração de imagens e intérprete de
  código/análise de dados desativados.
- **Actions:** nenhuma Action configurada aparece; somente `Criar nova ação`.
- **Knowledge:** quatro nomes reconfirmados e correspondentes a
  `knowledge/original/`. A tentativa de download não produziu binário acessível
  para novo hash, portanto a igualdade binária online atual permanece `GAP`.
- **Última captura binária preservada:** 2026-08-07, com quatro arquivos e
  hashes registrados em `knowledge/MANIFEST.md`.
- **Distribuição:** o cabeçalho mostra `Rascunho` e o botão `Criar` está
  desabilitado. A privacidade não foi reconfirmada por um controle explícito.
- **Mutação online:** nenhuma. Não houve edição, remoção, upload, criação de
  Action, envio de prompt nem publicação.

O registro antigo de zero anexos referia-se à variante publicada
`g-6a6ea5f0985c8191971aa805e5ad759f`, não ao editor canônico acima. Os dois
IDs permanecem mapeados à mesma família, sem criação de repositório ou skill
duplicada.

## Registro histórico — 2026-08-06

- **source_status:** accessible
- **data da captura:** 2026-08-06
- **URL exata do editor/fonte:** https://chatgpt.com/gpts/editor/g-6a725900102c8191bdcb028b9ab4f21a
- **nome no editor:** Agente de Processos do Escritório Autogerenciável (copy)
- **distribuição observada:** rascunho privado
- **responsável:** Academia-de-Contadores
- **método de recuperação:** inspeção somente leitura da configuração no editor autenticado; nenhuma conversa pública foi usada.
- **status de recuperação:** nome, descrição, instruções, starters, metadados do Knowledge, modelo e capacidades acessíveis; conteúdo dos anexos e configuração de autenticação/endpoint não recuperados.

## Campos acessíveis

- **Descrição:** Transforme um processo real do escritório em uma primeira versão visível, testável e revisável — com responsáveis, evidências, exceções, handoffs e plano de cinco dias.
- **Quebra-gelos:** `Quero organizar um processo que hoje só funciona quando eu estou presente.`; `Tenho um rascunho de processo. Ajude a encontrar lacunas, evidências e exceções.`; `Quero transformar uma rotina do Fiscal, DP ou Contábil em um processo testável.`; `Monte comigo um plano de cinco dias para testar um processo com a equipe.`.
- **Modelo recomendado:** Nenhum modelo recomendado, os usuários usarão qualquer modelo que preferirem.
- **Busca na web:** desativada.
- **Geração de imagens:** desativada.
- **Intérprete de código/análise de dados:** desativado.
- **Actions:** a interface mostrou somente a opção de criar nova Action; esquema, autenticação e endpoint não ficaram visíveis.
- **Knowledge (somente nomes e tipos visíveis):**
  - `03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md`
  - `00-INDICE-E-ESCOPO.md`
  - `01-METODO-PROCESSO-EXECUTAVEL.md`
  - `02-PADROES-DEPARTAMENTAIS-E-RISCOS.md`

## Mapeamento canônico

- **Objetivos:** descrição do editor e seção `Missão`; ver `objectives/`.
- **Identidade:** trecho explícito de identidade capturado; ver `identity/identity.md`.
- **Soul/tom:** source_status: unavailable; o editor não expõe campo Soul separado; ver `identity/soul.md`.
- **Instruções:** campo integral, sem wrapper específico do GPT Builder, em `instructions/system.md`.
- **Guardrails:** índice das seções `Fora do escopo`, `Privacidade e segurança`, `Limites técnicos absolutos` em `instructions/guardrails.md`; o texto normativo permanece em `instructions/system.md` para evitar duplicação.
- **Workflows:** índice das seções `Fluxo obrigatório da conversa`, `Perguntas de descoberta`, `Formato obrigatório da entrega`, `Roteiro de teste`, `Fechamento` em `instructions/workflows/main.md`.
- **Skills:** padrões comportamentais estão no campo de instruções e em nomes de anexos; os corpos dos anexos não foram acessados, portanto nenhuma skill independente foi inventada.
- **Conectores:** nenhum conector canônico configurado; capacidades de plataforma foram registradas apenas como metadados.
- **Knowledge:** somente metadados de nomes/tipos; corpos, corpus, índices e exports não foram copiados.

## Dados omitidos

Foram deliberadamente omitidos tokens, credenciais, autenticação, endpoints privados,
conversas de usuários, dados de clientes, logs, arquivos anexos, corpus, índices RAG
e qualquer duplicação específica da plataforma. A linha de instrução destinada ao
campo “Instructions” do GPT Builder e títulos equivalentes foram removidos como
wrapper de plataforma; o comportamento substantivo foi preservado.

## Atualização — recuperação integral do Knowledge (2026-08-07)

- Os 4 anexos exibidos no editor foram baixados diretamente e preservados em `knowledge/original/`.
- `knowledge/MANIFEST.md` registra nome, tamanho e SHA-256 de cada arquivo.
- Esta atualização substitui, para o estado atual do repositório, as observações históricas acima que diziam que os corpos dos anexos não haviam sido recuperados.
- Tokens, credenciais, conversas de usuários, dados de clientes, logs e índices externos continuam fora do repositório.
