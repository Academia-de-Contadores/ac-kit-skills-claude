# Procedimentos de operação da IA

Versão 0.1 · Regras compartilhadas com o manual da aluna. Os caminhos abaixo são lógicos; descubra os destinos reais na cópia em uso. Campos mencionados foram observados publicamente, mas seus tipos, opções completas e permissões precisam de inspeção na cópia.

## 1. Preparar a operação

Consulte o [mapa](mapa-template.md) apenas para reconhecer a organização. Identifique a raiz, a base de origem e os campos necessários. Uma visualização não é um novo cadastro. Uma etiqueta com nome de cliente não é necessariamente uma relação com o CRM. Use o esquema retornado pela ferramenta, quando disponível, e não o ícone ou a posição visual como prova de tipo.

Use ferramentas de leitura e escrita efetivamente expostas no ambiente. Esta documentação não fixa nomes de funções MCP nem versões de API. Se houver apenas navegação pública, faça consulta/documentação; não simule acesso de escrita. Não interprete falha de busca como inexistência de cliente sem avaliar escopo e paginação.

Antes de criar, compare identificadores normalizados para busca, preservando o valor de origem no registro. CPF/CNPJ é preferível ao nome quando disponível. Nunca gere um número fictício para preencher um cadastro real. Na ausência de identificador, compare nome, contato, serviço e contexto. Se restarem dois candidatos plausíveis, peça desambiguação.

## 2. Matriz pedido → destino → ação → evidência

| Pedido | Dados que determinam a operação | Destino | Ação e conferência |
|---|---|---|---|
| Registrar negociação | Pessoa/empresa, serviço, data, etapa; valor e próximo contato se conhecidos | Comercial → Controle de Vendas e Negociações | Procurar a mesma oportunidade; criar/atualizar; reler nome, produto e etapa. Não cadastrar como contratado por inferência. |
| Cadastrar contratado | Identidade, confirmação de contratação, início, contatos; serviços e honorário quando informados | Clientes → CRM | Buscar por identificador, criar/atualizar e conferir datas/status existentes. Retornar link do cadastro. |
| Detalhar cliente | Cadastro identificado, atividade, serviços e particularidades documentadas | Clientes → Clientes Mensais | Criar ou atualizar ficha individual; preencher relação com CRM somente se confirmada tecnicamente; reler vínculo. |
| Registrar honorário | Cliente, valor contratado, vigência/início, atualização e encerramento se aplicável | Controle de Honorários Contábeis | Não confundir preço contratado com recebimento. Localizar registro, alterar dados comprovados e conferir relação na ficha. |
| Registrar onboarding | Cliente, responsável, etapa/documentos aplicáveis | Legalização → Onboarding | Usar lista de novos clientes/contratos conforme finalidade. Ausência de campo de prazo/status não autoriza criar propriedade; registrar contexto no corpo ou propor ajuste. |
| Completar DP | Cliente, escopo confirmado, funcionários e parâmetros recebidos | DP → Lista de Clientes; ficha de Clientes DP | Separar dados da empresa, empregados, sindicato e rubricas. Só incluir controles aplicáveis. Reabrir cada destino alterado. |
| Completar Fiscal/Contábil | Cliente, regime/serviço confirmado, competência e obrigação indicada pela responsável técnica | Fiscal ou Contábil → ficha/controle específico | Não deduzir obrigações a partir de exemplo do template. Conferir cliente e competência em cada registro. |
| Criar demanda pontual | Tarefa concreta, cliente se houver, responsável, prazo acordado, resultado esperado | Acompanhamento de Rotinas → base do time | Pesquisar ocorrência igual; criar com status inicial válido. Registrar resultado esperado e bloqueio em Observações/corpo. |
| Planejar trabalho da dona | Tarefa, categoria, prioridade e data | Planejamento semanal CEO → base pessoal | Distinguir da visualização do time presente na mesma página. Não atribuir tarefa pessoal à equipe por engano. |
| Atualizar andamento | Registro identificado, fato novo, data, etapa e impedimento | Registro já existente | Preservar histórico e atualizar campo compatível. Se não houver opção Bloqueado, usar Observações com causa e próxima ação; não criar opção silenciosamente. |
| Registrar comprovante | Registro/cliente/competência, arquivo ou link efetivamente fornecido, evento que comprova | Campo específico, como Recibos de entrega de ECD/ECF; senão corpo/Observações | Relacionar evidência e evento; conferir acesso/conteúdo quando permitido. Declarar separadamente recebimento, conferência e resultado. |
| Preparar mês seguinte | Departamento, competência de origem/destino, carteira vigente e escopo | Página mensal do departamento | Ver procedimento 6; conferir independência e preservação do histórico. |
| Consultar pendências | Período, responsáveis, departamentos/clientes e definição de pendente | Bases correspondentes | Consultar todos os resultados acessíveis necessários; informar filtros, data de corte e limites. Não confundir ausência na visão com inexistência. |
| Registrar conteúdo/ideia | Canal, objetivo, data, etapa e responsável quando necessário | Marketing → controle do canal ou Produção de conteúdo; P&D para desenho de serviço | Evitar criar o mesmo conteúdo em todas as bases. Informar o controle escolhido e o link. |
| Registrar movimento financeiro | Escritório ou cliente BPO, período, natureza, valor e referência documental | Financeiro ou BPO do cliente | Escolher o domínio correto; não interpretar coluna Saldo como extrato bancário validado. Registro não equivale a pagamento. |

## 3. Potencial cliente → cliente contratado

1. Abra a oportunidade existente no Comercial ou crie uma se o pedido for de prospecção. Consulte as opções reais de Status. As etapas citadas na aula não foram integralmente confirmadas no seletor público.
2. Quando houver confirmação da contratação, atualize a negociação com esse fato e a referência fornecida. Não apague o histórico comercial.
3. Procure o cliente em Clientes → CRM. Cadastre ou atualize o cadastro contratual.
4. Localize/crie a ficha em Clientes Mensais. Há dois exemplos públicos chamados Clientes Atuais; identifique a ficha pela base e pelo cliente, nunca só por esse título.
5. Complete honorários e onboarding se incluídos no pedido e com dados suficientes. Registre relações reais quando existirem. Um campo de relação preenchido não cria automaticamente os registros das outras bases.
6. Defina departamentos aplicáveis a partir do serviço contratado e de orientação da responsável técnica. Ausência de funcionários não comprova ausência de todo trabalho de DP; pode haver escopo relacionado a pró-labore, por exemplo. Se faltar essa definição, deixe-a pendente.
7. Retorne um checklist com links por destino: negociação, CRM, ficha, honorário, onboarding, departamentos. Não anuncie cadastro integral se alguma etapa ficou incompleta.

## 4. Ficha e controles departamentais

**DP:** lista da empresa → ficha individual → dados dos empregados quando aplicável → controle de folha/adiantamento da competência. Dados mestres e andamento mensal têm finalidades diferentes. Um empregado cadastrado não gera fechamento mensal automaticamente. Não replique exemplos de salário, sindicato ou benefícios do template.

**Fiscal:** orientações tributárias do cliente, fechamento MEI/SN, anuais, IR e parcelamentos são destinos distintos. Escolha apenas o controle aplicável. A base de IR visível não apresenta responsável; informe a ausência antes de prometer filtros por responsável. Parcelamentos contém campos com nomes e valores pouco consistentes; confirme o esquema antes de preencher.

**Contábil:** fechamento mensal separa Integração Folha, Integração Fiscal, Outros Lançamentos e Situação do fechamento. ECD/ECF tem Recibos de entrega. Não conclua o conjunto com etapas pendentes sem justificativa explícita e evidência correspondente.

**Legalização:** diferencie onboarding, contratos, processo societário, processo interestadual, licenciamento e caixinha de boas-vindas. O protocolo de uma solicitação pode comprovar protocolo, mas não necessariamente deferimento final.

## 5. Plano → tarefa → execução → evidência → acompanhamento

Esta é uma **convenção proposta de operação**, não uma cadeia automatizada identificada no template.

- **Plano:** objetivo e resultado esperado em Projetos ou Planejamento estratégico. Registre escopo e critério de conclusão no corpo disponível.
- **Tarefa:** ação concreta na base do time ou base pessoal da CEO, conforme quem executa. Mantenha link para o plano no corpo/Observações se não houver relação própria confirmada.
- **Execução:** trabalho efetivamente feito pela pessoa ou sistema responsável. A IA pode registrar o relato; não substituir o serviço por um clique.
- **Evidência:** link/arquivo, cliente e competência, evento comprovado, data e fonte. Use campo existente; não invente uma base Evidências como se já existisse.
- **Acompanhamento:** consulte prazos, estados, impedimentos e evidências. Resolva inconsistências antes de apresentar conclusão consolidada.

Formato sugerido para o corpo ou Observações, adaptável sem exigir novos campos:

```text
Resultado esperado:
Cliente e competência:
Plano relacionado: [link, se houver]
Andamento — data e autor/fonte:
Bloqueio e próxima ação:
Evidência — link/arquivo e evento comprovado:
Conferência — por quem, quando e o que foi conferido:
Pendência residual:
```

Ao receber “marque como concluído”, determine se a usuária está relatando execução ou solicitando só a atualização administrativa. Pode registrar o estado informado dentro do pedido, com atribuição e pendência documental; não rotule como “serviço verificado” sem conferir evidência. Se os campos contradisserem a conclusão, exponha a divergência e resolva o significado antes de produzir um relatório de entregas confirmadas.

## 6. Passagem de mês preservando histórico

1. Identifique controle e mês de origem. Confirme que o novo período não existe; não duplique por repetição de pedido.
2. Inspecione se a página contém uma base própria ou apenas visualização vinculada. Duplicar uma visão pode continuar apontando para os mesmos registros.
3. Para uma estrutura mensal independente, duplique a página/base adequada e confira a nova origem e os registros antes de reinicializar estados. Se forem os mesmos IDs, não limpe os status: isso alteraria o histórico. Informe a estrutura encontrada e obtenha a definição necessária para uma mudança de arquitetura.
4. Nomeie a nova competência; revise datas, responsáveis, carteira e serviços. Retire do novo período quem não deve constar, conforme instrução; preserve os registros históricos anteriores.
5. Reinicie somente campos de execução do novo mês. Não copie recibos antigos como se fossem novos, nem apague referências históricas da origem. Preserve dados cadastrais válidos.
6. Confira amostra e totais relevantes: um cliente que permanece, um que entra, um que sai; ausência de evidência antiga atribuída ao novo mês; origem intacta. Não afirme que isso foi testado nesta pesquisa: aqui não houve duplicação real.

## 7. Consulta, falhas parciais e encerramento

Consulta recomendada: informar data de corte, competências, bases cobertas, critérios de pendente/atrasado/bloqueado e lacunas. Não agrupar controles diferentes só porque se chamam Acompanhamento Fechamento. Não estimar atraso sem prazo conhecido. Sem acesso a um departamento, use “não consultado”, não “sem pendências”.

Em falha parcial, liste a etapa concluída, o link e o que falta. Antes de retomar, releia o último destino possivelmente alterado. Se uma gravação falhar novamente pelo mesmo impedimento após uma tentativa de correção sustentada por evidência, pare a etapa e relate a condição; não repita criações cegamente. Não desfazer registros válidos para simular uma operação atômica.

Confirme a autorização já existente no pedido, sem reconfirmações rotineiras. Alterações de compartilhamento, envio externo, migração e reorganização de bases não decorrem automaticamente do pedido de cadastro.
