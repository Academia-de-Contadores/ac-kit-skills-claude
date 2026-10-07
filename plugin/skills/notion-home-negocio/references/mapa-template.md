# Mapa do template Home do Negócio 2.0

Leitura pública em 01/10/2026 · versão 0.1. Os links são referências ao **template original**, não à cópia de uma aluna. O mapa descreve conteúdo e campos visíveis, sem afirmar acesso ao esquema completo da API, opções ocultas, fórmulas ou automações.

## Vocabulário para ler o mapa

| Elemento | Como interpretar |
|---|---|
| Página | Contêiner de texto, links, bases e subpáginas. Pode ser também um registro de base. |
| Tabela simples | Células de conteúdo; não presumir propriedades, relações ou comportamento de base. |
| Base de dados | Conjunto de registros e propriedades. Uma linha pode abrir uma página. |
| Visualização vinculada | Outra apresentação dos registros de uma origem. Não é necessariamente uma cópia independente. |
| Etiqueta | Valor classificatório, como categoria ou nome escolhido; não implica vínculo com cadastro. |
| Relação | Propriedade que conecta registros de bases. Confirmar tecnicamente o destino na cópia. |
| Modelo/exemplo | Conteúdo usado como ponto de partida. Nome, valor, data e status não devem ser herdados como fatos do escritório. |

## 1. Inventário das 18 áreas da Home

Os nomes de agrupamento usados aqui servem à navegação; não propõem novos departamentos.

| Área e link público | Finalidade e conteúdo encontrado | Cobertura/observação |
|---|---|---|
| [Acessos](https://jade-bubble-db4.notion.site/1af16bf5123481698ee1e0aed1730ce0) | Tabela com Categoria, Login, Senha | Estrutura visível; não é cofre de senhas auditado. |
| [Planejamento semanal CEO](https://jade-bubble-db4.notion.site/1af16bf5123481a38d1fea0d45769ca1) | Metas/textos, base pessoal e visualização de tarefas do time | Duas origens diferentes. |
| [Estudos](https://jade-bubble-db4.notion.site/1af16bf51234816a8f65fd3b0ee30796) | Cursos e exemplo Contador a CEO | Base com Status e Data no registro. |
| [Projetos](https://jade-bubble-db4.notion.site/1af16bf512348129b255cfecf8a1225b) | Implementação da gestão, novo serviço BPO e reorganização | Quadro com Status/Atribuir e textos orientadores. |
| [Planejamento estratégico](https://jade-bubble-db4.notion.site/1af16bf51234814e88cfe28f408a9746) | Cronograma 2025 e planejamento mensal; exemplo Março | Datas de modelo. Cronograma sem conteúdo operacional visível. |
| [A Empresa](https://jade-bubble-db4.notion.site/1af16bf51234819ebc14d25ac69ea15b) | Missão, visão, valores, tríade, comunicação e divulgação | Alguns cartões vazios, outros com perguntas. |
| [Clientes](https://jade-bubble-db4.notion.site/1af16bf51234811e9464eaaee2860593) | CRM, Clientes Mensais e página Clientes Atuais/Antigos | Cadastro contratual e fichas aprofundadas. |
| [Acompanhamento de Rotinas](https://jade-bubble-db4.notion.site/1af16bf5123481e7864acfc1ffd1aecd) | Tarefas do time | Exemplos recorrentes apesar da prioridade a pontuais nas aulas. |
| [Time](https://jade-bubble-db4.notion.site/1af16bf5123481ad85a1ff77a9601fb9) | Reunião, quatro áreas de funções/rotinas, carreira e avaliação | Contratos/POPs variam entre vazios e anexos. |
| [Legalização](https://jade-bubble-db4.notion.site/1af16bf5123481878c73de81f4b5d896) | Onboarding, contratos, documentos, societário, interestadual, licenciamento e boas-vindas | Controles separados, com campos diferentes. |
| [Departamento Pessoal](https://jade-bubble-db4.notion.site/1af16bf5123481e5a086e55d08f5d6ab) | Lista de empresas, fichas, folha, adiantamento e mensagens | Dados mestres separados da execução mensal. |
| [Marketing](https://jade-bubble-db4.notion.site/1af16bf5123481928134fe60cb662a20) | Canais, produção, calendários e estratégias | Bases sobrepostas por finalidade; escolher o controle principal. |
| [Comercial](https://jade-bubble-db4.notion.site/1af16bf5123481638dcbf36928723ee0) | Processo, script, metas, negociação, controle mensal e indicadores | Negociação não é cadastro de contratado. |
| [Departamento Contábil](https://jade-bubble-db4.notion.site/1af16bf512348125979bc09e62969557) | Fechamento e ECD/ECF | Recibos de entrega presentes no controle ECD/ECF. |
| [Departamento Fiscal](https://jade-bubble-db4.notion.site/1af16bf5123481799463deffc161da87) | Orientações, IR, fechamento MEI/SN, anuais, mensagens e parcelamentos | Não é fonte normativa de obrigações/prazos. |
| [P&D](https://jade-bubble-db4.notion.site/1af16bf51234817bbb22efa327594e07) | Produtos/serviços, atendimentos, lista e dois modelos | Conteúdo de mentoria/infoproduto exige adaptação. |
| [Financeiro](https://jade-bubble-db4.notion.site/1af16bf5123481f1acdeee0e7e7867dc) | Ano/mês, entradas, custos, cartão, outros, divisão e honorários | Financeiro do escritório. Valores/fórmulas não auditados. |
| [BPO Financeiro](https://jade-bubble-db4.notion.site/1af16bf512348157a60ac50a1ee63610) | Cliente modelo, serviços, receber/pagar, planejamento, relatórios e fluxo | Financeiro do cliente atendido; não confundir com o escritório. |

## 2. Destinos centrais: clientes, tarefas e planejamento

| Caminho / origem pública | Campos e conteúdo visíveis | Regra de uso |
|---|---|---|
| Clientes → CRM → [Dados de Clientes](https://jade-bubble-db4.notion.site/1af16bf5123481bbbbbfcb65df6f36bd) | Status, Nome, Data de Início de Contrato, CPF/CNPJ, Email, WhatsApp, Origem, Data de atualização de honorário, Data de Encerramento de contrato, Histórico do cliente | Cadastro geral de contratado. Opções completas de Status não verificadas no seletor. |
| Clientes → [Clientes Mensais](https://jade-bubble-db4.notion.site/1af16bf512348175a595f2126311b27b) | Dois registros intitulados Clientes Atuais | Modelos com informações aprofundadas. Não assumir duas empresas ou duplicação indevida. |
| [Clientes Atuais — modelo 1](https://jade-bubble-db4.notion.site/1af16bf51234815d87baefb0001793f7) | Ramo/Atividade, CNAEs, Serviços, Dados de Clientes CRM, Controle de Honários Contábeis; corpo com acessos, particularidades, informações tributárias, reuniões | Campos com nomes de bases sugerem os vínculos tratados nas aulas; tipo/destino precisam confirmação técnica. |
| [Clientes Atuais — modelo 2](https://jade-bubble-db4.notion.site/1af16bf5123481d1af3dc17d5ff454d7) | Mesma estrutura e visualização de tarefas do time | A visão pública mostra tarefas de mais de um cliente. Filtrar explicitamente na cópia. |
| Clientes → [Clientes Atuais/Antigos](https://jade-bubble-db4.notion.site/1af16bf5123481a59394c871b7c92b07) | Títulos: honorários, acessos, informações tributárias, pauta | Página adicional, sem demonstrar substituição automática do CRM. |
| Financeiro → [Controle de Honorários](https://jade-bubble-db4.notion.site/1af16bf5123481b0b6b0e78c5d979ca8) | Status, Nome, início do contrato, CPF/CNPJ, Valor do Honorário, atualização, encerramento | O nome público usa “Honários”. Preço contratado não comprova recebimento. |
| Acompanhamento de Rotinas → [base do time](https://jade-bubble-db4.notion.site/1af16bf5123481509d64c4569ddec24c) | Tarefa, Prazo, Responsável, Cliente, Status, Observações | Também aparece no Planejamento CEO e em uma ficha de cliente. Campos Cliente/Responsável não tiveram tipo confirmado por API. |
| Planejamento CEO → [base pessoal](https://jade-bubble-db4.notion.site/1af16bf5123481218db2f11b59f3ab9b) | Feito, Categoria, Tarefa, Prioridade, Data, Cliente, Observações | Tarefa da dona; não confundir com a base do time. |
| Projetos → [quadro](https://jade-bubble-db4.notion.site/1af16bf5123481198912cbd3c195f115) | Status e Atribuir; grupos Não iniciada, Em andamento, Concluído | Corpos dos projetos apresentam perguntas; relação nativa com tarefa/evidência não demonstrada. |
| Estratégico → [Planejamento mensal 2025](https://jade-bubble-db4.notion.site/1af16bf512348155abf4dc05359e076a) | Exemplo Março com objetivos | Referência de estrutura, não calendário atual. |

## 3. Legalização

| Caminho / base pública | Campos observados | Limite |
|---|---|---|
| Onboarding → [novos clientes](https://jade-bubble-db4.notion.site/1af16bf5123481518484fcd51ab62d68) | Nome, Responsável | Prazo/status não visíveis. |
| Onboarding → [contratos](https://jade-bubble-db4.notion.site/1af16bf5123481b4ad9acdd242af73c8) | Razão Social, CNPJ, representante legal, CPF, endereço, e-mail, telefone do sócio, honorário, assinatura, vencimento, observações, responsável | Cadastro não equivale a assinatura contratual. |
| [Documentos](https://jade-bubble-db4.notion.site/1af16bf5123481628430edd6342e8277) | Etapa, Arquivos e mídia; boas-vindas, checklists, apresentação, manual | Arquivos identificados, conteúdo não auditado. |
| [Processos societários](https://jade-bubble-db4.notion.site/1af16bf5123481109209d312172bce5c) | Cliente, Responsável, protocolo, Status do Processo, Situação do Processo, Situação Final, início, atualização, observações | Exemplos abertura/alteração/baixa. Interior de cada registro de processo não foi tratado como checklist validado. |
| [Processos interestaduais](https://jade-bubble-db4.notion.site/1af16bf5123481048e48d36ade531e8e) | Cliente, protocolo, Status Processo, Junta Comercial, Prefeitura, Fazenda Estadual, Status Final, observações, atualização | Esquema diferente do societário; responsável não visível. |
| [Caixinha de boas-vindas](https://jade-bubble-db4.notion.site/1af16bf5123481989462ef98f1c5e400) | Cliente, Endereço, Situação, Observações | Registro de acompanhamento não comprova envio físico. |
| [Licenciamento](https://jade-bubble-db4.notion.site/1af16bf512348172bab7c86c7eaf65d3) | Cliente, CNPJ, Prefeitura, alvará ativo/bloqueado, validades alvará/bombeiros, vigilância/saúde, meio ambiente, observações, acessos e consulta | Validades devem vir de documentos efetivos. |

## 4. Departamento Pessoal

| Caminho / base pública | Campos observados | Uso |
|---|---|---|
| Lista de Clientes → [base](https://jade-bubble-db4.notion.site/1af16bf51234812a8195cc7037ece860) | Código Domínio, Nome Fantasia, CNPJ, Enquadramento Tributário, Adiantamento, Sindicato, VT/VA/AC | Parâmetros da empresa. |
| [Fichas de Clientes DP](https://jade-bubble-db4.notion.site/1af16bf512348104884cd7c5c4e8108a) → [exemplo](https://jade-bubble-db4.notion.site/1af16bf5123481d893b6ce968c2a4139) | Tags, observações, empregados, sindicato/vigência/site, rubricas e acessos | Ficha aprofundada. Não foi demonstrada geração automática pela lista geral. |
| Ficha → [Informações dos Funcionários](https://jade-bubble-db4.notion.site/1af16bf51234811685fee3c1bcf25a6d) | Código, nome, função, salário, horários, adiantamento, ajuda de custo, valor/dia, recibo/desconto, alimentação/valor/recibo | Dados de exemplo não devem ser reaproveitados como dados reais. |
| Ficha → [Rúbricas/Lançamentos](https://jade-bubble-db4.notion.site/1af16bf512348160bc7fd54e9e8e4d00) | Código, Nome funcionário, Função | O título é mais amplo que as colunas visíveis; confirmar uso antes de preencher rubricas. |
| Fechamento de Folha → 05-2024 → [base](https://jade-bubble-db4.notion.site/1af16bf5123481ee8696fcb2efc3472a) | Cliente, Folha, Impostos, Situação do fechamento, Reponsavel pelo processo, Observações | Exemplo com status contraditórios; conferir etapas. |
| Adiantamento → 06.2024 → [base](https://jade-bubble-db4.notion.site/1af16bf5123481269a43e7ffce484f33) | Cliente, Adiantamento, Situação, Reponsável, Observações | Apenas clientes com serviço aplicável. |
| [Mensagens DP](https://jade-bubble-db4.notion.site/1af16bf5123481c6a330e9c9b2195c19) | Modelos de mensagens | Consultar/adaptar texto; existência do modelo não autoriza envio. |

## 5. Fiscal e Contábil

| Caminho / base pública | Campos observados | Uso e cautela |
|---|---|---|
| Fiscal → [Orientações](https://jade-bubble-db4.notion.site/1af16bf5123481898ed3d4c15ecd4d6f) → [Modelo](https://jade-bubble-db4.notion.site/1af16bf51234816bb38dc0ebb5fb422f) | Corpo com razão social/CNPJ; tabela CNAE, descritivo, anexo do Simples | Conteúdo tributário de exemplo não foi validado legalmente. |
| Fiscal → [Imposto de Renda](https://jade-bubble-db4.notion.site/1af16bf5123481a6b1fef68fc7ce4005) | Nome, Sócio, Enviou Documentos, Status, Status do Pagamento, Observações | Não foi visto campo Responsável. |
| Fiscal → Fechamento → MEI → 02/2025 → [base](https://jade-bubble-db4.notion.site/1af16bf51234814c9782c0e814c60d82) | Cliente, Planilha Faturamento MEI, Guia enviada?, Reponsavel pelo processo, Observações | Envio depende de evidência; competência do título é de modelo. |
| Fiscal → Fechamento → SN → 02/2025 → [base](https://jade-bubble-db4.notion.site/1af16bf5123481a089f7daa229d7df13) | Cliente, Importação Notas fiscais, Status do Fechamento, Reponsavel pelo processo, Observações | Modelo não demonstra todas as obrigações do regime. |
| Fiscal → Anuais → [DEFIS](https://jade-bubble-db4.notion.site/1af16bf51234818eab71f2f87a8575ca) | Cliente, Status da Declaração, Enviado Cliente, Responsável, Observações | Confirmar exercício e aplicabilidade. |
| Fiscal → [Mensagens](https://jade-bubble-db4.notion.site/1af16bf51234815cae70f4a91c6404d3) | Nome, Observações; cinco modelos visíveis | Não são mensagens já enviadas. |
| Fiscal → Parcelamentos → 06/2025 → [base](https://jade-bubble-db4.notion.site/21c16bf512348193a775db426ddd9409) | Enviar para, Cliente, CNPJ, CPF, Forma de entrega, Senhas, Referência, Reponsavel pelo processo, Observações | Valores “Não iniciada” aparecem repetidos em linhas vazias; tipos/opções não confirmados. Etapas estava vazia. |
| Contábil → Fechamento → 03/2025 → [base](https://jade-bubble-db4.notion.site/1af16bf5123481d29eecf26c04efe869) | Cliente, Integração Folha, Integração Fiscal, Outros Lançamentos, Situação do fechamento, Reponsavel pelo processo, Observações | Origem diferente das bases homônimas de DP e Fiscal. |
| Contábil → [ECD/ECF](https://jade-bubble-db4.notion.site/21c16bf5123481a9a7b8ddefeaaa4bcb) | Cliente, SPED CONTÁBIL, ECF, Reponsavel pelo processo, Recibos de entrega | Destino explícito de comprovantes. |

## 6. Time: função, rotina e processo

Há páginas de [DP](https://jade-bubble-db4.notion.site/1af16bf512348185a431ea4650b9f1bf), [Fiscal](https://jade-bubble-db4.notion.site/21c16bf51234807b9da0d1b704787d8d), [Contábil](https://jade-bubble-db4.notion.site/21c16bf512348072acb0e6518dcb9ec4) e [Societário](https://jade-bubble-db4.notion.site/21c16bf512348039b975ce15eacf5757). Cada conjunto oferece acessos, descrição de função, contrato, POP e rotinas. Nomes pessoais nos exemplos não determinam a equipe da aluna.

- Reunião semanal tem modelo de ata com prazos da próxima semana.
- Rotinas diárias/semanais/mensais usam Name, Tipo, Feito e, em algumas bases, Dia. DP e Fiscal também têm fechamento. No Societário, itens “Por demandas” estão sob títulos diários/semanais: frequência precisa ser interpretada pelo processo, não só pelo cabeçalho.
- POP Fiscal lista arquivos de procedimentos; Societário lista um PDF. POP DP/Contábil e contratos encontrados não apresentavam instruções completas. Os anexos não foram auditados.
- [Carreira](https://jade-bubble-db4.notion.site/2d616bf5123480ad9a4bc2074d06fb9b) possui tabelas por departamento com nível, função, competências e remuneração exemplificativa.
- [Avaliação](https://jade-bubble-db4.notion.site/2d616bf51234816ab1f6e056c1e3a1e3) contém Pilar, Afirmativa, Autoavaliação, Nota EM/SEM/PM, médias, menor nota, percentual, sequência e trimestre. Texto de Tech Lead exige adaptação; fórmulas e adequação dos critérios não auditadas.

## 7. Comercial e Marketing

| Controle público | Campos/conteúdo visíveis | Observação |
|---|---|---|
| [Vendas e Negociações](https://jade-bubble-db4.notion.site/1af16bf51234814dbb70fdbf447186ff) | Data, Name, Produto, Valor, Status, Motivo/expectativa, Pós-venda | Destino comercial principal indicado nas aulas. |
| Controle Mensal → [Março 2025](https://jade-bubble-db4.notion.site/1af16bf512348125ae4ae81114d074a6) | Data, Name, Produto, Valor, Status, Origem, Pós-venda | Base distinta da global; título e datas de exemplos não coincidem. Não assumir sincronização. |
| [Metas](https://jade-bubble-db4.notion.site/1af16bf5123481e98ae2ee1900ad3c0c) | Mês, Serviço, Valor Médio, Quantidade, Meta, Realizada, Total, Status | Cálculos não auditados. |
| [Indicadores](https://jade-bubble-db4.notion.site/1af16bf5123481309bb8f32e43728840) | Contatos/vendas; contratos/indicações; novos/cancelados com campos de indicação | Definições precisam revisão antes de interpretar índices. |
| [Stories](https://jade-bubble-db4.notion.site/1af16bf51234817181ccdad75e216d88) | Calendário | Mês visível sem eventos não comprova base inteira vazia. |
| Feed → [Projeção](https://jade-bubble-db4.notion.site/1af16bf5123481ea90edd079154b603d) | Ideia/Tema, Objetivo da Semana, Start, Arte/Gravação, Legenda, Postado/Agendado, Formato, Data | Há também calendário editorial e base adicional de itens sem título. |
| [YouTube](https://jade-bubble-db4.notion.site/1af16bf51234819b8243cc8ce4ecd316) | Vídeo/Roteiro, prazos de gravação/edição/postagem, etapas, Status | Planejamento não comprova publicação. |
| [E-mails](https://jade-bubble-db4.notion.site/1af16bf512348106b128e7f7fb2584e3) | Programado, Name, Data de Envio, Objetivo | Conferir envio em sistema correspondente. |
| [WhatsApp](https://jade-bubble-db4.notion.site/1af16bf512348153a3ace7edad7d8fda) | Assunto, Data, Objetivo, Feito | Controle editorial, sem automação de envio demonstrada. |
| Produção/Fábrica → [Conteúdo Instagram](https://jade-bubble-db4.notion.site/1af16bf5123481abb4a3eda682203205) | Headline, Data Disparo, Status, Finalidade, Formato, Link Design/Vídeo, Responsáveis, Gaveta; registro também mostra Prioridade, Referências, Call To Action, Progresso | Mesma origem aparece em Produção e Fábrica. Fluxo visual de escrever a finalizar; Status e Progresso são campos diferentes. |

Marketing também contém Linha editorial, Referências e estratégias de Pinterest, TikTok, Twitter, YouTube e Telegram, com perguntas de preenchimento. Comercial contém script de conversa; preços e promessas do exemplo não definem política comercial.

## 8. Financeiro, BPO e P&D

**Financeiro do escritório:** em [Janeiro 2024](https://jade-bubble-db4.notion.site/1af16bf5123481848eedefca5fbe5f07), Entradas contém Data, Entrada, Serviço, Bruto, Líquido e Observações; Custos Fixos contém Data, Name, Valor, Data de Pagto, Status e Notas; Cartão contém Data, Name, Parcela, Valor, Status e Notas; Outros contém Data, Name, Valor, Status e Notas. Divisão é um controle de distribuição exemplificativa. Não tratar percentuais como recomendação financeira. Honorários foi detalhado na seção 2.

**BPO:** [Cliente Modelo](https://jade-bubble-db4.notion.site/3b916bf5123480ddb5c5fa7e887d0d15) contém Cadastro de Serviços (Cód., Serviço, Valor, Duração), Contas a Receber/Pagar por ano modelo, Planejamento PJ, Reuniões e Relatórios, Fluxo de Caixa, Informações importantes, Reuniões como/quando, Contatos de suporte e Quadro de Sonhos. Contas a Receber mostra janeiro/fevereiro de 2024, com Dia de Vencimento, Nome, Valor a receber, Valor recebido e Situação. Contas a Pagar mostra os mesmos meses, com Dia de Vencimento, Cliente, Valor, Valor pago e Situação. Relatórios de janeiro a abril trazem Data da reunião, Presentes e tópicos de métricas, pontos positivos/negativos, objetivos e ações; são modelos de reunião, não resultados financeiros comprovados.

O [Planejamento PJ](https://jade-bubble-db4.notion.site/c3b16bf5123483699c06814fc7405ad8) apresenta Categoria, Lançamentos financeiros, JAN–DEZ e TOTAL. O [Fluxo de Caixa](https://jade-bubble-db4.notion.site/4e116bf51234835db00e012adfd3e7b8) apresenta Mês, Data, Descrição, Classificação, Tipo, Valor e Saldo na conta. Fórmulas e conciliação bancária não verificadas. O [Quadro de sonhos](https://jade-bubble-db4.notion.site/ce816bf51234830f972b0158a7693ece) apresenta preço, prazo em meses, guardar mensalmente e motivo. Valores são exemplos.

**P&D:** Produtos/Serviços contém Atendimentos, Lista de Produtos e dois Modelos. Cada modelo tem Objetivo, Descrição, Estrutura do Serviço, Divulgação & Comunicação, Modelo de Vendas e Processos. A Estrutura reúne perguntas sobre nicho, promessa, cliente, entregáveis e encontros. Calendários de abertura de agenda e modelos de boas-vindas orientam planejamento; não demonstram envio ou criação automática de tarefas.

## 9. Limites de cobertura

Todas as 18 áreas principais foram abertas e seus principais caminhos operacionais e bases públicas foram percorridos. O inventário registra a estrutura apresentada no navegador e exemplos relevantes. Não é exportação integral do workspace nem auditoria de todas as células, todos os registros ou anexos.

Não verificados: esquema via API do template; opções completas de seleção; campos ocultos; fórmulas; automações; botões/modelos disponíveis só em edição; permissões efetivas de colaboradoras; comportamento real de duplicação; páginas privadas ou links que só surgem com autenticação; conteúdo dos anexos; meses fora da janela de calendário visível. Não declarar recurso vazio apenas porque o mês atual não mostra eventos.

O inventário completo (inventario-publico.md, no pacote original da aula) lista os 256 destinos consultados além da Home. O documento plano-e-evidencias.md, no pacote original, consolida a cobertura, validação documental e pendências. O destino de uma operação futura deve ser reconfirmado na cópia real.
