# Saídas de processo

Leia somente o formato necessário. Todo artefato é uma primeira versão
revisável; campos sem evidência recebem `[A VALIDAR]`.

Antes de preencher etapas extraídas de um rascunho ou outro artefato, confirme
que seu conteúdo foi fornecido ou está acessível. Se não estiver, entregue um
template vazio. Se exemplos ajudarem, use uma coluna `Origem/status` e uma
coluna `Dependência`, marque **cada** linha `HIPÓTESE/EXEMPLO` e escreva
`validar no artefato-fonte` na dependência correspondente.

Em ambos os formatos, inclua no artefato entregue estes dois registros
explícitos, mesmo que nenhuma etapa esteja confirmada:

- `Status de risco: [A VALIDAR]`
- `SLA: [A VALIDAR]`

Não substitua esses registros por uma pergunta futura nem proponha um prazo.

## `/mapa`

Entregue: nome, objetivo observável, gatilho, entradas, etapas numeradas,
responsáveis por função, dependências, evidências, riscos, exceções, SLA
informado, resultado e handoff. Uma etapa começa com verbo e termina com algo
observável. Separe qualquer cobrança, comunicação ou outra ação externa em
preparação, gate humano e execução: o gate confirma alvo, conteúdo e canal
imediatamente antes de cada execução.

## `/raci`

Use uma linha por etapa e as colunas `Etapa | R | A | C | I | Evidência`.
Não atribua nomes ou funções não informados. Marque `[A VALIDAR]` e explique a
decisão necessária. Não confunda `A` de accountable com autorização para agir.
Se o artefato-fonte estiver ausente, use em vez disso
`Etapa | Origem/status | Dependência | R | A | C | I | Evidência`, deixando a
etapa vazia ou marcando cada exemplo como `HIPÓTESE/EXEMPLO`, e mantenha os
registros explícitos de risco e SLA junto da tabela.

## `/checklist`

Agrupe por preparação, execução, revisão, exceção e handoff. Cada item deve ter
responsável por função, dependência, evidência e estado. Evite listas soltas que
não mostram ordem ou critério de conclusão. Quando uma ação for externa, crie
um item anterior de aprovação por execução com alvo, conteúdo e canal; um plano
ou procedimento aprovado não satisfaz esse gate.

## `/plano-5-dias`

- Dia 1: observar a execução real e registrar lacunas.
- Dia 2: ordenar entradas, etapas, papéis e dependências.
- Dia 3: definir evidências, revisões, riscos e exceções.
- Dia 4: testar com cenário fictício ou anonimizado.
- Dia 5: ajustar ambiguidades e submeter a versão à aprovação humana.

Os dias são uma sequência de ativação do método, não promessa de implantação
nem SLA do processo.

## `/teste`

Registre executor por função, cenário anonimizado, entradas entregues, dúvidas,
ajudas solicitadas, evidências ausentes, resultado, prazo interno informado e
ajustes para a próxima versão.

## Exemplo compacto

Pedido: “Organize o recebimento mensal de documentos; ainda não definimos quem
cobra pendências nem o prazo.”

Saída correta: mapear o recebimento e as evidências já descritas; escrever
`Responsável pela cobrança: [A VALIDAR]` e `SLA: [A VALIDAR]`; entregar um
checklist revisável e perguntar quem decide esses dois campos. Se houver
cobrança externa, preparar a minuta e deixar a execução como `NÃO EXECUTADA`
até aprovação humana, imediatamente antes de cada contato, do alvo, conteúdo e
canal. Não escolher a função nem criar um prazo padrão.
