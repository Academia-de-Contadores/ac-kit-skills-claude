# Auditoria do editor — Fiscal — 2026-09-21

## Escopo e método

- **Editor:** https://chatgpt.com/gpts/editor/g-6a72595c828c8191aec02f7931d9c626
- **Método:** inspeção somente leitura pelo navegador interno autenticado, na
  aba `Configurar`, usando os valores visíveis dos campos.
- **Limite:** nenhum campo foi editado. Não houve remoção ou upload de
  Knowledge, criação de Action, envio de prompt nem publicação.

`MATCH` significa que a paridade foi comprovada no nível indicado. `GAP`
significa divergência ou evidência insuficiente. A auditoria separa nomes
visíveis, bytes atuais e capturas binárias históricas.

## Comparação do editor com o repositório

| Campo | Online em 2026-09-21 | Repositório | Evidência | Resultado |
| --- | --- | --- | --- | --- |
| Nome | `Agente Fiscal — Contadora CEO \| Oficial (copy)` | Mesmo nome em `source-capture.md`; `agent.name` preserva o nome canônico sem `(copy)` | Campo Nome | MATCH — sufixo do editor não virou outra identidade |
| Descrição | `Apoia rotinas fiscais com triagem, checklists, fontes, lacunas, handoffs e revisão humana — sem decisões tributárias definitivas.` | Mesmo texto na captura | Campo Descrição integral | MATCH |
| Starter preenchido | `Preciso organizar uma rotina fiscal com segurança e revisão humana.` | Mesmo texto na captura | Campo de quebra-gelo | MATCH |
| Instruções | 4.461 bytes UTF-8, 134 linhas, sem quebra final | Corpo de `instructions/system.md` a partir da linha 11 | SHA-256 idêntico; método abaixo | MATCH byte a byte |
| Modelo recomendado | seletor: `Thinking 5.6`; prévia: `GPT-5.6 Sol` | captura inicial dizia “nenhum modelo recomendado” | Dois rótulos visíveis; nenhum ID interno inferido | GAP — mudança histórica e ambiguidade de rótulo documentadas |
| Busca na web | ativada | ativada na captura | controle marcado | MATCH — capacidade nativa |
| Geração de imagens | desativada | desativada na captura | controle desmarcado | MATCH — capacidade nativa |
| Intérprete de código/análise de dados | desativado | desativado na captura | controle desmarcado | MATCH — capacidade nativa |
| Actions | nenhuma configurada visível; somente `Criar nova ação` | `connectors: []` | seção Ações sem item, esquema ou endpoint | MATCH — ausência observável |
| Knowledge: nomes/quantidade | dez anexos com os mesmos nomes preservados | dez nomes nas duas gerações locais | lista do editor | MATCH — somente inventário visual 10/10 |
| Knowledge: bytes atuais | URLs de download retornaram `404 Not found` | capturas de 2026-08-07 e 2026-08-22 preservadas | tentativas por duplo clique não forneceram arquivo | GAP — paridade binária atual não comprovada |
| Distribuição: estado | `Rascunho` | captura histórica: rascunho | cabeçalho | MATCH — estado de rascunho |
| Distribuição: privacidade | não exibida explicitamente | captura histórica: privado | controle de compartilhamento não foi aberto | GAP — privacidade não reconfirmada |

As capacidades nativas são metadados do GPT Builder e não viram conectores da
skill automaticamente. A ausência de Action não autoriza inventar endpoint.

## Instruções: paridade criptográfica

O campo online foi obtido integralmente e sem quebra de linha final. No arquivo
local, as linhas 1–10 são somente o cabeçalho de proveniência; o corpo começa no
marcador `---` da linha 11. Removendo apenas a quebra final acrescentada pelo
arquivo Markdown, os bytes são idênticos aos do editor.

| Objeto | Bytes UTF-8 | Linhas | SHA-256 |
| --- | ---: | ---: | --- |
| Campo online bruto | 4461 | 134 | `12775f4f9fbf7b0b3fa62a06c6837f920944cbd0a49f1d7ab2eb90453787893b` |
| Corpo canônico local sem a quebra final | 4461 | 134 | `12775f4f9fbf7b0b3fa62a06c6837f920944cbd0a49f1d7ab2eb90453787893b` |
| `instructions/system.md` completo | 4824 | 144 | `312434daf5ece2446d35111f2bbcfe212ca8f03472fa9155d993e0eb93121e08` |

## Knowledge: inventário atual e capturas preservadas

Os dez nomes visíveis, listados em ordem canônica para auditoria, são:

1. `00-INDICE-FISCAL.md`
2. `01-REGRAS-DE-USO-E-LIMITES.md`
3. `02-ESCOPO-E-ROTEAMENTO.md`
4. `03-FONTES-CANONICAS.md`
5. `04-SKILLS-E-CENARIOS-DE-USO.md`
6. `05-PERGUNTAS-TESTE-E-RESPOSTAS-ESPERADAS.md`
7. `06-GUARDRAILS-E-CLAIMS-BLOQUEADOS.md`
8. `07-MODELOS-DE-RESPOSTA-E-CHECKLISTS.md`
9. `08-LACUNAS-E-ROADMAP.md`
10. `99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md`

A ordem visual do editor não foi usada como requisito. Os mesmos dez nomes
existem nas duas gerações preservadas, mas nove arquivos mudaram entre
2026-08-07 e 2026-08-22. O índice permaneceu igual.

| Arquivo | Captura 2026-08-07 | Última captura binária ativa, 2026-08-22 | Estado online atual |
| --- | --- | --- | --- |
| `00-INDICE-FISCAL.md` | `7b1847f59d362f0497936e3d20de5254860b5869b551638520db2781e6f96a9c` (1938 bytes) | mesmo arquivo em `original/` | nome MATCH; bytes GAP |
| `01-REGRAS-DE-USO-E-LIMITES.md` | `53f52cc81668c5b0cdfb9a267ce4c694aa6b04661e9e01cf0f4da8381c0bba79` (4506 bytes) | `fa65270ad3d49b0136b23cb6414f562f3d73dc775be84c13b519767f0f4b0067` (2253 bytes) | nome MATCH; bytes GAP |
| `02-ESCOPO-E-ROTEAMENTO.md` | `50e4f5c43ff8471e27e341ada3c112685c98da3b761d598482655fc217f4a6b7` (3342 bytes) | `6a9e0aac77085d42e836bd5b303704da168606d15982e158b2edfd3a39121313` (1970 bytes) | nome MATCH; bytes GAP |
| `03-FONTES-CANONICAS.md` | `02353d1c992659f2cde283ddc3fa72cf9990363dca4b8afbbb5d68fe85d3115a` (2594 bytes) | `9ed86f2189998d30587c6ca808a24bb540e8802256ecebae7e0fb51e1842c976` (1696 bytes) | nome MATCH; bytes GAP |
| `04-SKILLS-E-CENARIOS-DE-USO.md` | `6913372aada02f901f9402a09647f60d56005b9f600b972e3be7daafcc1bd3af` (2034 bytes) | `a848d382372a90c28f11d40c576e09c276d813809aa9e3369aa61e9758fc00dc` (1694 bytes) | nome MATCH; bytes GAP |
| `05-PERGUNTAS-TESTE-E-RESPOSTAS-ESPERADAS.md` | `a2b4cf8964be07b0d88dd6d415a122fb3fbca6bf80fb946947e67be454718fa3` (2064 bytes) | `a71c2927a672c9b6774fe2a1d81715154be0e427c6d6783c2bb83e9da60d8847` (2248 bytes) | nome MATCH; bytes GAP |
| `06-GUARDRAILS-E-CLAIMS-BLOQUEADOS.md` | `4772eee8f4e4e276560b6434037bebcbe2f4f85ba59f289106635cf8623902c5` (1534 bytes) | `1efb16bd7d7b3b557c756fdda2e00d9b7f46bd8328ebef42471269271fcdac54` (1058 bytes) | nome MATCH; bytes GAP |
| `07-MODELOS-DE-RESPOSTA-E-CHECKLISTS.md` | `c5b302e56ecb817b59e5351071b3775bb56f2ce3ec7c2034ee156806feb69aa2` (2050 bytes) | `48dd271b4cbeca36937fbdccf995e567e88a701aea093f111fe2a0799c8a2fd6` (2037 bytes) | nome MATCH; bytes GAP |
| `08-LACUNAS-E-ROADMAP.md` | `20931e6c393e3e6e662d1e1526e672dc029e3476fafaf789f68e4097002287ec` (1431 bytes) | `4fbf8a1b4b263f9b793749540a7c7815252723f6bae5b5a79a494253d021131b` (1602 bytes) | nome MATCH; bytes GAP |
| `99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md` | `05374b6ce9247236d4eb62a9c216193b585e6169ec7fe2d94670da8eaf4bc71a` (4115 bytes) | `c6d48fc8ab848800a10f1ef4091d6023b5db88f1cd86246b27c001601fa7786e` (1159 bytes) | nome MATCH; bytes GAP |

Os hashes e tamanhos das duas gerações foram recalculados nesta auditoria e
conferem com os manifestos históricos. A tabela não afirma qual geração está
online hoje sem um novo download válido.

## Origem e limites dos anexos

- A geração original contém nove documentos de DP anexados ao GPT Fiscal; só o
  índice `00-INDICE-FISCAL.md` pertence inequivocamente ao domínio Fiscal.
- A geração de 2026-08-22 declara `fonte_tipo: curadoria`,
  `origem: agents/knowledge/fiscal` e `confiabilidade: interna_curada`.
- Ela cita prompts internos, extrações de processos fiscais, síntese, parecer,
  materiais da Reforma e PDFs com OCR pendente. Esses primários não estão
  neste repositório e não foram revalidados nesta auditoria.
- Nenhuma dessas referências transforma a curadoria em fonte oficial. Para
  conclusão tributária concreta, a própria configuração exige fonte oficial
  vigente e revisão do responsável técnico.

## Registros relacionados no catálogo

O catálogo mantém quatro registros associados a `ac.fiscal`: o editor oficial
auditado, uma versão temporária publicada, um rascunho temporário e um guia de
rotinas superseded. Eles são variantes da mesma família, não quatro agentes
canônicos. Conforme o catálogo, continuam sem repositório ou skill próprios;
somente `ac.fiscal` recebe a skill canônica.

## Gaps remanescentes

- bytes e hashes do Knowledge online atual não foram obtidos;
- a privacidade atual do rascunho não foi reconfirmada;
- `Thinking 5.6` e `GPT-5.6 Sol` aparecem em superfícies diferentes, sem ID
  interno que permita provar equivalência;
- os primários internos citados pelo Knowledge Fiscal não estão neste
  repositório;
- as outras três variantes catalogadas não foram reabertas nesta auditoria.

## Decisão de baseline reversível

O GPT canônico continua sendo o baseline comportamental. Para a release,
os nove arquivos de `knowledge/live-2026-08-22/` mais
`knowledge/original/00-INDICE-FISCAL.md` formam o baseline documental
provisório porque são a última captura binária comprovada e específica do
domínio Fiscal. `knowledge/original/` permanece histórico e não entra
silenciosamente no runtime por conter material de DP.

Esta decisão é reversível: se um novo download produzir bytes diferentes, a
nova geração deve ser preservada separadamente, comparada e só então promovida
à skill. O custo de a decisão atual estar errada é usar material
documental desatualizado; a correção exigirá nova captura, revalidação
comportamental e nova versão da skill, sem alterar o GPT para forçar paridade.
