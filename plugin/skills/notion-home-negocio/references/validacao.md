# Validação documental por cenários

Versão 0.1 · 01/10/2026. **Método:** teste de mesa, comparando pedidos fictícios com as regras da skill, o manual, os campos observados e as fontes. Não houve execução de escrita, simulação de retorno MCP nem criação de comprovantes reais. “Atendido” abaixo significa que o procedimento tem destino, tratamento e critério de conferência documentados; não significa integração homologada.

## Casos revisados

| Caso | Entrada fictícia | Decisão esperada e conferência | Resultado documental |
|---|---|---|---|
| V01 — Potencial cliente | Oficina Horizonte pediu proposta; contratação não confirmada | Comercial → Vendas e Negociações. Buscar oportunidade igual. Não criar contratado ativo no CRM. Conferir nome, serviço, etapa e link. | Atendido: manual 3 e operação 2–3. |
| V02 — Contratação posterior | Mesma Oficina confirmou contrato, início e honorário; identificação fornecida | Atualizar oportunidade, localizar/criar CRM, ficha e honorário, onboarding/departamentos pertinentes. Preservar histórico e retornar links por etapa. | Atendido: manual 4 e operação 3. |
| V03 — Cliente com DP | Clínica Estrela, dois empregados, folha e adiantamento confirmados | Lista da empresa + ficha/empregados + controles da competência. Não considerar cadastro de empregado como folha executada. | Atendido: manual 5 e operação 4. |
| V04 — Cliente sem DP | Empresa de consultoria, responsável confirmou que não há escopo de DP | Cadastrar destinos contratados sem criar empregados ou controles de DP. Se houver só “sem empregados”, perguntar o escopo antes de concluir ausência de DP. | Atendido: manual 5 e operação 3–4. |
| V05 — Demanda com bloqueio | Conferir documentos até 08/10/2026, Ana, falta comprovante de endereço | Criar uma tarefa do time, responsável/prazo, resultado esperado e bloqueio em campo existente. Não inventar opção de status. Após recebimento, registrar conferência e evidência correspondente. | Atendido: manual 7–8 e operação 5. |
| V06 — Novo mês | Preparar novembro a partir de outubro, com um cliente que entra e outro que sai | Verificar se destino já existe e se é independente. Limpar somente execução nova; anterior intacto; não reaproveitar recibos como entregas novas. | Atendido documentalmente: manual 10 e operação 6. Duplicação real pendente. |
| V07 — Consulta de pendências | Dona pede tudo que está pendente na semana | Definir bases/período, ler escopo acessível, considerar rotinas departamentais além do time, não estimar atraso sem prazo. Declarar base inacessível como não consultada. | Atendido: manual 6/rotina diária e operação 7. |
| V08 — Pedido repetido | “Cadastre a Oficina” enviado duas vezes | Buscar identificador e reler resultados. Se já existir, atualizar apenas diferenças ou informar nenhuma alteração necessária. | Atendido: skill e operação 1/3. |
| V09 — Dados incompletos | “Crie uma tarefa para o cliente João”, sem distinguir dois homônimos, prazo ou responsável | Resolver identidade antes de vincular. Pedir os dados que determinam execução; não atribuir responsável nem prazo arbitrário. Pode preparar rascunho textual identificado, sem afirmar tarefa completa. | Atendido: skill e manual 7. |
| V10 — Destino inacessível | CRM acessível, DP sem acesso | Concluir apenas etapas independentes autorizadas; listar links concluídos e destino bloqueado. Não declarar onboarding completo. | Atendido: operação 7 e manual conferência. |
| V11 — Falha parcial de criação | Retorno ambíguo após criar ficha | Reconsultar antes de tentar novamente; usar identificação/resultado disponível. Não criar várias fichas nem apagar registros válidos para ocultar falha. | Atendido: operação 7. Não testado com MCP real. |
| V12 — Status sem comprovação | Pedido para marcar declaração como entregue, sem recibo | Distinguir atualização informada de serviço conferido; solicitar/localizar evidência se a conclusão requerida for verificada. Não inventar comprovante. | Atendido: skill, operação 5 e manual 8. |
| V13 — Estado contraditório | Finalizado no agregador, etapas Folha/Impostos em andamento | Reportar divergência; não contabilizar como entrega comprovada só pelo agregador. Identificar etapa e evidência antes de afirmar conclusão. | Atendido: achado público D04. |
| V14 — Filtro e permissão | “Mostre só os clientes da Ana, assim ela não acessa os outros” | Separar configuração da visão de controle de acesso. Não prometer isolamento pelo filtro; conferir permissões efetivas em trabalho de implantação. | Atendido: manual 9/7 final e fontes oficiais. |
| V15 — Dois modelos homônimos | Pedido de preencher “Clientes Atuais” | Desambiguar pela origem e finalidade; não assumir que os dois cartões são o mesmo cliente. Conferir relação e filtro da ficha escolhida. | Atendido: mapa seção 2 e operação 3. |
| V16 — Base já controlada em outro sistema | Escritório controla obrigação fiscal em software próprio | Identificar controle principal e evitar duplicação sem benefício. Notion pode guardar referência e demanda excepcional. | Atendido: manual 2 e 7. |
| V17 — Visão duplicada no novo mês | Página nova aponta aos mesmos registros da origem | Não zerar status. Explicar a dependência e definir estrutura adequada antes de mudança. | Atendido: operação 6. |
| V18 — Plano sem automação | Implantar três clientes e acompanhar resultado | Projeto + tarefas com links + evidências em campos/corpo existentes. Não afirmar relação nativa/automação que não foi identificada. | Atendido: manual exemplo completo e operação 5. |

## Coerência entre skill e manual

| Regra | Onde a IA a encontra | Onde a aluna a encontra |
|---|---|---|
| CRM da carteira é diferente de negociação | SKILL: escolher fluxo; operação 2–3 | Manual 1 e procedimentos 3–4 |
| IDs públicos não são destinos da cópia | SKILL: localizar antes de operar | Manual abertura e procedimento 1 |
| Relação não implica cadastro automático | Operação 3–4 | Procedimentos 4–5 |
| Pontual no time; recorrência no controle adequado | SKILL e fontes D01 | Procedimento 7 |
| Conclusão precisa ser qualificada pela evidência | SKILL: executar/conferir; operação 5 | Procedimento 8 |
| Novo mês preserva o anterior | Operação 6 | Procedimento 10 |
| Consulta informa lacunas | Operação 7 | Rotina diária e conferência da IA |
| Filtro não é acesso | Fontes técnicas; mapa; operação 1 | Procedimentos 9 e seção 7 |

## Homologação futura na cópia real

Não executada nesta entrega. Quando houver cópia de treinamento e acesso adequado, validar pelo menos V02, V05, V06, V08, V10, V11 e V14 com registros fictícios identificados e evidência dos resultados reais. Conferir: esquema e opções, relações após duplicação, comportamento das visualizações, permissões por papel, ausência de duplicação e preservação do mês anterior. Registrar links dos testes sem confundi-los com comprovantes de serviço contábil.
