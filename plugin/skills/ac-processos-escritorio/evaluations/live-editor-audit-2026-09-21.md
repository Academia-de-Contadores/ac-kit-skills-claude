# Auditoria do editor — Processos do Escritório — 2026-09-21

## Escopo e método

- **Editor canônico:** https://chatgpt.com/gpts/editor/g-6a725900102c8191bdcb028b9ab4f21a
- **Método:** inspeção somente leitura no navegador interno autenticado, na
  aba `Configurar`, usando os valores visíveis dos campos e a árvore de
  acessibilidade.
- **Limite:** nenhum campo foi editado. Não houve remoção ou upload de
  Knowledge, criação de Action, envio de prompt, publicação nem acionamento do
  botão `Criar`.

`MATCH` significa que a paridade foi comprovada no nível indicado. `GAP`
significa divergência ou evidência insuficiente. Nomes visíveis e bytes dos
anexos são evidências diferentes e permanecem separados.

## Comparação do editor com o repositório

| Campo | Online em 2026-09-21 | Repositório | Evidência | Resultado |
| --- | --- | --- | --- | --- |
| Nome | `Agente de Processos do Escritório Autogerenciável (copy)` | Mesmo nome na captura; `agent.name` preserva o nome canônico sem `Agente de` e sem `(copy)` | Campo Nome e cabeçalho | MATCH — a normalização não cria outra identidade |
| Descrição | `Transforme um processo real do escritório em uma primeira versão visível, testável e revisável — com responsáveis, evidências, exceções, handoffs e plano de cinco dias.` | Mesmo texto na captura | Campo Descrição integral | MATCH |
| Quebra-gelos | quatro textos, listados abaixo | Os mesmos quatro textos na captura | Quatro campos preenchidos; quinto vazio | MATCH |
| Instruções | 6.957 bytes UTF-8 normalizados, 155 linhas | Corpo canônico de `instructions/system.md` | SHA-256 idêntico; método abaixo | MATCH |
| Modelo recomendado | `Nenhum modelo recomendado, os usuários usarão qualquer modelo que preferirem` | Mesmo valor na captura histórica | Opção selecionada no editor | MATCH |
| Rótulo da prévia | `Instantânea` | Não é declarado como configuração canônica | Compositor da prévia | observação — não foi inferido ID nem vínculo com o modelo recomendado |
| Busca na web | desativada | desativada na captura | checkbox desmarcado | MATCH — capacidade nativa |
| Geração de imagens | desativada | desativada na captura | checkbox desmarcado | MATCH — capacidade nativa |
| Intérprete de código/análise de dados | desativado | desativado na captura | checkbox desmarcado | MATCH — capacidade nativa |
| Actions | nenhuma configurada visível; somente `Criar nova ação` | `connectors: []` | seção Ações sem item, esquema ou endpoint | MATCH — ausência observável |
| Knowledge: nomes/quantidade | quatro anexos listados abaixo | quatro arquivos em `knowledge/original/` | lista do editor | MATCH — inventário visual 4/4 |
| Knowledge: bytes atuais | tentativa de download não produziu binário acessível à auditoria | captura histórica de 2026-08-07 preservada | o duplo clique gerou descritor de download, mas não um conteúdo utilizável para novo hash | GAP — igualdade binária atual não comprovada |
| Distribuição: estado | `Rascunho`, botão `Criar` desabilitado | captura histórica: rascunho | cabeçalho | MATCH — estado de rascunho |
| Distribuição: privacidade | não exibida explicitamente | captura histórica: privado | fluxo de criação/compartilhamento não foi aberto | GAP — privacidade não reconfirmada |

As capacidades nativas são metadados do GPT Builder e não viram conectores da
skill automaticamente. A ausência de Action não autoriza inventar endpoint.

## Instruções: paridade criptográfica

Normalização aplicada nos dois lados: converter CRLF/CR em LF e remover apenas
espaço em branco nas bordas. O corpo local começa em `Você é o **Agente de
Processos` e exclui somente o cabeçalho de proveniência de
`instructions/system.md`.

| Objeto | Bytes UTF-8 | Linhas | SHA-256 |
| --- | ---: | ---: | --- |
| Campo online normalizado | 6957 | 155 | `b97585a192658dad37d47ad4456feb39f9ab34b453ad1cec390da28b3c0924c9` |
| Corpo canônico local normalizado | 6957 | 155 | `b97585a192658dad37d47ad4456feb39f9ab34b453ad1cec390da28b3c0924c9` |
| `instructions/system.md` completo | — | — | `7089e489ef1604b6bc983a6573f90abc72096a16924dfeba65f04778b9c57955` |

## Quebra-gelos observados

1. `Quero organizar um processo que hoje só funciona quando eu estou presente.`
2. `Tenho um rascunho de processo. Ajude a encontrar lacunas, evidências e exceções.`
3. `Quero transformar uma rotina do Fiscal, DP ou Contábil em um processo testável.`
4. `Monte comigo um plano de cinco dias para testar um processo com a equipe.`

## Knowledge: inventário atual e captura preservada

O editor exibiu, nesta ordem:

1. `03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md`
2. `00-INDICE-E-ESCOPO.md`
3. `01-METODO-PROCESSO-EXECUTAVEL.md`
4. `02-PADROES-DEPARTAMENTAIS-E-RISCOS.md`

Os mesmos quatro nomes existem em `knowledge/original/`. A integridade local
foi recalculada nesta auditoria:

| Arquivo | Bytes locais | SHA-256 local | Estado online atual |
| --- | ---: | --- | --- |
| `00-INDICE-E-ESCOPO.md` | 2413 | `8f3461074c4a0ed0c1aa55ab2139b2d2be362f990bce5a9c8624c839677852bf` | nome MATCH; bytes GAP |
| `01-METODO-PROCESSO-EXECUTAVEL.md` | 3509 | `1a3021e1374f2bcfe55f1e2f5b91f27152090252d18c612388f4773ceadfd5d9` | nome MATCH; bytes GAP |
| `02-PADROES-DEPARTAMENTAIS-E-RISCOS.md` | 4533 | `f1dca8545e265739dfdb3be626221578eeb16c076657292d7cc3dca6b649c001` | nome MATCH; bytes GAP |
| `03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md` | 3658 | `1a60d3ce068d16857824978a9e6cb39d6f616963dcb87f55e5a8dde3e31b0ccc` | nome MATCH; bytes GAP |

Os arquivos se identificam como Knowledge Pack interno, versão
`ss_ea_process_agent_v2`. Eles não citam URL ou publicação externa que permita
comprovar um original primário anterior. O que está comprovado é que os bytes
locais vieram do download direto do GPT em 2026-08-07. Isso não prova autoria
original nem igualdade binária com o estado online de hoje.

## Resolução dos dois registros relacionados no catálogo

O catálogo possui dois registros que apontam para
`ac.processos-escritorio`, mas eles não justificam duas novas skills:

1. `g-6a725900102c8191bdcb028b9ab4f21a`, com `relationship: draft`, é o
   próprio editor canônico auditado nesta ficha. Não é uma segunda família.
2. `g-6a6ea5f0985c8191971aa805e5ad759f`, com `relationship: copy`, é a
   variante publicada que a auditoria de 2026-08-22 encontrou sem anexos. Ela
   permanece alias da família e não recebe repositório ou skill própria.

Portanto, ambos reutilizam a família canônica, embora somente o segundo esteja
classificado explicitamente como cópia. O primeiro é a fonte canônica listada
no inventário de aliases por seu estado de rascunho.

## Gaps remanescentes

- bytes e hashes do Knowledge online atual não foram obtidos;
- a privacidade do rascunho não foi reconfirmada por controle explícito;
- a variante pública não foi reaberta nesta auditoria e conserva a evidência
  histórica de 2026-08-22;
- não há comprovação de arquivos primários externos anteriores ao Knowledge
  Pack interno;
- o rótulo `Instantânea` da prévia não foi tratado como ID de modelo nem como
  substituto da seleção explícita “Nenhum modelo recomendado”.

## Decisão de baseline reversível

O GPT canônico continua sendo o baseline comportamental. Para a próxima etapa,
os quatro arquivos de `knowledge/original/` podem ser usados como baseline
documental provisório porque são a última captura binária preservada e passam
na integridade local. A futura skill poderá ser mais acionável do que o GPT,
mas deverá preservar a separação entre fato, lacuna, hipótese e decisão humana,
sem transformar padrões internos em obrigação normativa.

Esta decisão é reversível: se um novo download produzir bytes diferentes, a
nova geração deve ser preservada separadamente, comparada e só então promovida
ao runtime. O custo de a decisão atual estar errada é usar material documental
desatualizado; a correção exigirá nova captura, revalidação comportamental e
nova versão da skill, sem apagar o histórico.
