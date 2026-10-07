# Auditoria do editor — Sem Surto — 2026-09-20

## Escopo e método

Fonte: https://chatgpt.com/gpts/editor/g-6a725a3feec081919ba9131c9f475341.
Inspeção somente leitura pelo navegador interno autenticado, na aba `Configurar`.
Foram lidos os campos da interface, a árvore de acessibilidade e o valor integral
do campo `Instruções`. Os botões com os nomes dos seis anexos foram abertos para
verificar a disponibilidade de download. Nenhum campo foi editado; não houve
clique em `Criar`, `Criar nova ação`, `Update`, remoção, upload ou publicação.

`MATCH` significa paridade comprovada no nível descrito na linha. `GAP` significa
divergência ou evidência insuficiente, explicitada na própria linha. A comparação
histórica usa a captura de 2026-08-06 e os binários baixados em 2026-08-07.

## Comparação

| campo | online | repositório | evidência | resultado MATCH/GAP |
| --- | --- | --- | --- | --- |
| Nome | Day Agente da Reforma Tributária Sem Surto (copy) | Mesmo nome em `source-capture.md`; `agent.name` usa o nome canônico sem `(copy)` | Campo Nome e cabeçalho; sufixo do editor preservado como metadado | MATCH — captura, com distinção explícita do nome canônico |
| Descrição | Especialista consultiva em Reforma Tributária do Consumo para contadores: IBS, CBS, IS, DFe/XML/ERP, créditos e respostas claras para clientes. | Mesmo texto em `source-capture.md` | Campo Descrição integral | MATCH |
| Starter 1 | Analisar impacto da Reforma em um cliente específico | Mesmo texto na captura | Primeiro campo de quebra-gelo | MATCH |
| Starter 2 | Responder dúvida específica de cliente | Mesmo texto na captura | Segundo campo de quebra-gelo | MATCH |
| Starter 3 | Revisar nota fiscal, XML e ERP do cliente | Mesmo texto na captura | Terceiro campo de quebra-gelo | MATCH |
| Starter 4 | Adequar cliente da melhor maneira à Reforma | Mesmo texto na captura | Quarto campo de quebra-gelo; quinto campo vazio | MATCH |
| Instruções integrais | Corpo de 7202 bytes normalizados | Corpo de `instructions/system.md`, 7202 bytes normalizados | SHA-256 igual, método e valores abaixo | MATCH |
| Modelo recomendado | `Thinking` selecionado; prévia: `Usando o modelo recomendado pelo criador: GPT-5.5 Thinking` | Captura de agosto: nenhum modelo recomendado | Opção selecionada e texto da prévia; ambos os rótulos foram preservados sem inferir um identificador interno | GAP — mudança histórica documentada na captura corrente |
| Busca na web | Ativada | Ativada na captura | Checkbox marcado | MATCH — metadado nativo |
| Geração de imagens | Ativada | Ativada na captura | Checkbox marcado | MATCH — metadado nativo |
| Intérprete de código/análise de dados | Ativado | Ativado na captura | Checkbox marcado | MATCH — metadado nativo |
| Actions | Nenhuma configurada visível; apenas `Criar nova ação` | Nenhum conector declarado (`connectors: []`); captura histórica relata a mesma interface | Seção Ações sem lista de ações ou endpoint | MATCH — ausência observável, sem inventar conector |
| Knowledge: nomes e quantidade | Seis anexos com os mesmos nomes | Seis originais preservados | Lista da interface e tabela abaixo | MATCH — somente nomes/quantidade |
| Knowledge: binários atuais | Bytes e SHA-256 atuais não obtidos | Binários de 2026-08-07 íntegros | Abertura de cada nome não expôs controle de download; nenhum novo arquivo obtido | GAP — paridade binária online atual não comprovada |
| Distribuição: estado | `Rascunho`, botão `Criar` | Captura histórica: rascunho privado | Cabeçalho do editor | MATCH — estado de rascunho |
| Distribuição: privacidade | Sem controle explícito de compartilhamento observado | Qualificação histórica `privado` | Não houve abertura de fluxo de criação/publicação | GAP — privacidade não reconfirmada independentemente |

## Instruções: registro integral e hashes

O texto integral observado coincide com o corpo de
[`instructions/system.md`](../instructions/system.md), a partir de `Voce e a Day —`.
Esse arquivo é o registro integral canônico; não houve alteração das instruções.
Seu cabeçalho de proveniência e o parágrafo editorial anterior ao corpo não fazem
parte do campo online e são excluídos apenas da comparação normalizada.

Normalização idêntica nos dois lados: converter CRLF/CR em LF, aplicar `trim()`
nas bordas do texto e adicionar um LF final; codificar em UTF-8. Nenhuma alteração
de acentos, pontuação, espaços internos ou quebras internas foi aplicada.

| Objeto | Bytes | SHA-256 |
| --- | ---: | --- |
| Campo online normalizado | 7202 | `73665721ed4edbbd6eeb7a2b21f15fe7e8e7046c56b250bf7bbedd8a8ac1315a` |
| Corpo canônico normalizado | 7202 | `73665721ed4edbbd6eeb7a2b21f15fe7e8e7046c56b250bf7bbedd8a8ac1315a` |
| Arquivo `instructions/system.md` completo, sem normalização | 7564 | `b13d48d87c53d8087e7a1290aaaf7a74058c7efb29453934348fc9e8373a1d23` |

O campo online foi lido pelo locator `getByRole("textbox", { name:
"Instruções", exact: true })`, usando leitura de `el.value`, e o hash calculado
com `node:crypto`. O valor online bruto tinha 7193 caracteres JavaScript.

Reprodução local:

```js
const fs = require("fs");
const crypto = require("crypto");
const raw = fs.readFileSync("instructions/system.md");
const text = raw.toString("utf8");
const body = text.slice(text.indexOf("Voce e a Day —"));
const normalized = body.replace(/\r\n?/g, "\n").trim() + "\n";
console.log(Buffer.byteLength(normalized), crypto.createHash("sha256").update(normalized).digest("hex"));
console.log(crypto.createHash("sha256").update(raw).digest("hex"));
```

## Knowledge: evidência visual e integridade histórica separadas

Os seis nomes foram reconfirmados na seção `Conhecimento`. Os botões de anexo
mostraram o nome/tooltip, sem conteúdo, menu ou controle de download acessível
na sessão. Essa observação limita o resultado; não afirma impossibilidade geral
de download nem equivalência dos binários online atuais.

Os hashes abaixo foram recalculados dos arquivos locais em 2026-09-20 e são
iguais aos valores registrados pelo download de 2026-08-07. Nenhum original
foi substituído ou modificado.

| Arquivo em `knowledge/original/` | Nome online em 2026-09-20 | Bytes locais históricos | SHA-256 local histórico | Binário online atual |
| --- | --- | ---: | --- | --- |
| `04-BASE-ORIGINAL-PRESERVADA.md` | MATCH | 2302 | `c532693ebfcc6eacacaf8804c846253e4007e704bdcf159fc3245a0cdb22a36c` | GAP — não obtido |
| `06-GAPS-E-LIMITES-DA-IA.md` | MATCH | 2496 | `bfb8bb305b66f4818353c21c1e3ccd2feb59f2757fe369845f7a7dfafd7bab33` | GAP — não obtido |
| `02-KB-CONSOLIDADA-IA-REFORMA.md` | MATCH | 4280 | `754d6fcfb84356b76e8f262b72f74beb135689c8bc0546354ec27862def60872` | GAP — não obtido |
| `01-FONTES-OFICIAIS-E-VERSOES.md` | MATCH | 2238 | `a5d4f909f3c893d61d2aa2265914a423c2c6c94f0f7ce4f0b5416776b34f12d4` | GAP — não obtido |
| `05-ECONET-FONTE-SECUNDARIA.md` | MATCH | 1782 | `0aa380ad3b766b9b06da1bd391f4c664295470e5fd6c3355ec5cab309be673cf` | GAP — não obtido |
| `03-DOCUMENTOS-FISCAIS-ELETRONICOS.md` | MATCH | 2723 | `bd04fa2361e998bb83d894c8743f7f633d9901066b1e05573bfc1ee9b0b85538` | GAP — não obtido |

## Decisão

Paridade comprovada das instruções, dos metadados listados e dos nomes do
Knowledge; integridade local dos seis binários históricos confirmada. Modelo
recomendado divergente da captura inicial; paridade binária atual e privacidade
explícita não comprovadas. Não declarar paridade integral do GPT.

As capacidades nativas permanecem metadados da plataforma, sem equivalência
automática com capacidades ou conectores da futura skill. A ausência observável
de Actions não cria contrato de RAG ou outro conector. O lifecycle permanece
`source-capture` até aprovação final; o baseline online permaneceu intocado.
