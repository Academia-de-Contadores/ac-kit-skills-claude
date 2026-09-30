# Respostas da skill instalada — avaliação independente

Data: 2026-09-20. Avaliador novo `/root/rag_task5_comparator`, sem participação nas Tasks 1–4.
Invocação operacional: `$ac-reforma-tributaria-rag`, lida e aplicada diretamente da instalação em `/Users/levy/.codex/skills/ac-reforma-tributaria-rag`.
As respostas abaixo foram produzidas antes de enviar qualquer pergunta ao GPT online e sem ler as respostas da Task 3.
Perfil: current. Runtime: agente Codex; Action MCP não registrada, transporte HTTP documentado via curl.
P1–P4: pergunta original, question_type do catálogo, needs_current_source=true e top_k=6, com uma chamada independente por caso. P5: TRANSPORT_UNAVAILABLE injetado somente na avaliação local da resposta, sem chamar ou alterar o serviço e sem reutilizar evidência dos outros casos.
Limite de isolamento: uma sessão nova do avaliador para a Task 5, sem reset do contexto do modelo entre as cinco respostas; cada resposta usa exclusivamente o resultado do próprio caso. Não houve subagentes adicionais.
Preservação: estas são as respostas finais da execução local; JSON integral em local-retrieval.json.

## P1

A consulta recuperou base oficial utilizável, mas não toda a disciplina de créditos de IBS e CBS. No trecho da LC 214/2025, o art. 45 determina apurar separadamente o saldo de cada tributo pela diferença entre débitos e créditos apropriados, incluindo créditos presumidos e saldo anterior não utilizado. O art. 42 prevê a consolidação das operações dos estabelecimentos. Isso sustenta a explicação da não cumulatividade pela consideração dos créditos na apuração, sem significar crédito irrestrito ou automático. Fonte: [LC 214/2025 compilada — Planalto, versão retornada v2.0](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), RAG-030, CURRENT, com uso normativo e citação permitidos; caminho recuperado: `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`.

Para o IBS, também foi recuperado o art. 47 do Regulamento do IBS, que remete ao art. 47 da LC 214/2025: no regime regular, vincula a apropriação à extinção dos débitos da aquisição, ressalvadas as hipóteses indicadas no regulamento, exige documento fiscal idôneo e exclui uso ou consumo pessoal e demais hipóteses previstas. O trecho determina segregação e veda usar crédito de IBS para compensar CBS. Fonte: [Resolução CGIBS nº 6/2026 — CGIBS, 2026-04-30](https://www.cgibs.gov.br/upload/arquivos/202604/30084927-res-cgibs-n-6-30-abr-2026-regulamenta-o-ibs.pdf), RAG-127, CURRENT, com uso normativo e citação permitidos; caminho recuperado: `rag/v2.2-prod-candidate/01_GOLD/RAG-127-Res-CGIBS-6-2026-Regulamento-IBS.md`.

Há um limite material: a busca não trouxe o texto completo da seção de créditos da própria LC para ambos os tributos. Não extrapolo automaticamente o regulamento de IBS para concluir todas as regras de CBS. As sínteses RAG-058 e RAG-051 vieram como REFERENCE_APROVADO e normative_allowed=false; servem à orientação da pesquisa, não fundamentam a conclusão legal. Embora gaps venha vazio e haja fonte oficial marcada CURRENT, o retorno não comprova a atualização integral da legislação nem resolve as condições de vigência e exceções da operação concreta.

Para aplicar a uma empresa, preciso de regime atual, atividade, período, natureza e finalidade das aquisições, regime dos fornecedores, documentos fiscais anonimizados, valores e evidências de extinção dos débitos pertinentes. O próximo passo é conferir a seção completa de créditos e suas exceções na fonte oficial vigente e cruzá-la com esses dados antes de apropriar valores.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.

## P2

Texto para o cliente:

“IBS e CBS são tributos relacionados às operações com bens e serviços. A preparação da empresa envolve cadastros, notas fiscais e rotinas de apuração. Por isso, vamos revisar essas informações e os processos com o contador, para identificar o que precisa ser ajustado no seu caso. Essa revisão não garante redução de imposto: o impacto depende das operações e das regras aplicáveis à empresa.”

Base técnica recuperada: [LC 214/2025 compilada — Planalto, versão retornada v2.0](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), RAG-030, CURRENT, com permissão normativa e de citação. Os trechos dos arts. 58–60 tratam de administração/apuração, cadastros e documentos fiscais de operações com bens e serviços. Caminho: `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`.

Limite: a busca não confirma o impacto individual, o calendário completo de transição nem um ajuste específico de sistema. O material Day retornado tem normative_allowed=false e citation_allowed=false; não o usei como lei nem como citação. A explicação não valida uma decisão de aplicação. Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.

## P3

Não há base para calcular quanto a empresa pagará em 2027 nem para afirmar que sair do Simples Nacional é a melhor opção. Não vou atribuir faturamento, alíquota ou créditos fictícios para fechar a conta.

Sabemos apenas que se trata de uma empresa fictícia de serviços e que o horizonte desejado é 2027. Faltam:

- regime atual e confirmação do enquadramento no Simples, anexo e atividade/CNAE, descrição dos serviços e NBS quando pertinente;
- RBT12, receita mensal histórica e projeção de receita para 2027;
- folha, encargos e fator R quando aplicável;
- margens, custos e despesas;
- compras potencialmente creditáveis, valores, documentos e regime dos fornecedores;
- mix B2B/B2C, demanda de crédito dos compradores e contratos;
- município/UF, períodos exatos da simulação, dados fiscais relevantes, ERP e custo operacional.

A consulta recuperou materiais SILVER e REFERENCE_APROVADO sobre regimes, todos com normative_allowed=false. Há também um trecho oficial da [LC 214/2025 compilada — Planalto, v2.0](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), RAG-030, CURRENT, caminho `rag/v2.2-prod-candidate/01_GOLD/RAG-030-LC-214-2025-compilada.md`, mas ele aborda recolhimento por procedimento simplificado de pagamento, não fornece os parâmetros necessários para esta comparação de regimes. Portanto, a presença de fonte oficial e gaps vazio não elimina a lacuna de cobertura.

Não trato as fichas como confirmação legal de opções, prazos ou alíquotas de 2027. As referências indicam temas a confirmar oficialmente; duas fichas vieram sem URL limpa, o que também limita a citação. Depois de reunir dados anonimizados e verificar a legislação e os parâmetros vigentes, será possível comparar os cenários de tributação juridicamente disponíveis, explicitando receita, créditos admissíveis, custos e premissas. Hoje não existe valor calculado ou regime vencedor validado.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.

## P4

Não é possível determinar CST, cClassTrib ou um ajuste específico do ERP com esses dados. A mesma descrição genérica de rejeição pode corresponder a problemas diferentes, e escolher um código sem identificar a operação não seria uma correção validada.

Envie dados anonimizados: documento e modelo exatos da NF-e, versão do leiaute e do ERP/emissor, ambiente (homologação ou produção), data da emissão, trecho do XML, mensagem e código completo da rejeição com o item afetado, CST e cClassTrib informados, IndOp quando pertinente, NCM/NBS, natureza da operação e regime/CRT do emitente. Não envie CNPJ, dados do cliente, chaves ou segredos desnecessários.

A consulta trouxe uma ficha de NF-e/NFC-e, RAG-042, versão retornada v2.0, CURRENT, mas SILVER e normative_allowed=false. Seu endereço limpo aponta para [Orientações 2026 — Receita Federal](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-2026); caminho `rag/v2.2-prod-candidate/02_SILVER/RAG-042-F5.8-nfe-nfce-layout-rtc.md`. Ela orienta a investigação, mas não valida um campo, código ou correção para esta NF-e.

Os trechos oficiais retornados são de NFS-e, NF3e, NFCom e CT-e, não a NT e a tabela vigentes da NF-e em questão. Nos documentos de outros modelos, há regras internas assinaladas para implementação futura, embora o documento como um todo esteja marcado CURRENT; isso não confirma obrigatoriedade presente para sua NF-e. Não transfiro regras, códigos de rejeição ou campos desses modelos para este caso.

O próximo passo é relacionar a rejeição ao XML real, confirmar a tabela CST/cClassTrib e a NT da NF-e vigentes na data e no ambiente informados e conferir a implementação na documentação do fornecedor do ERP. Só então testar uma correção em homologação. gaps veio vazio, mas faltam a fonte específica da NF-e, os dados da operação e a documentação do emissor.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.

## P5

Não consegui concluir a consulta à base porque o transporte de retrieval está indisponível nesta execução. Não houve fonte recuperada para esta pergunta. Por isso, não posso entregar uma conclusão normativa pronta para aplicar sobre quais créditos de CBS o cliente pode aproveitar.

Posso preparar a análise com dados anonimizados: regime tributário, atividade, período, descrição e finalidade de cada aquisição, regime dos fornecedores, documentos fiscais e evidências de pagamento/extinção pertinentes. Não envie identificadores, dados pessoais ou segredos do cliente.

A próxima ação é restabelecer a consulta e confirmar os critérios e exceções na fonte oficial vigente com o responsável tributário. Os anexos locais orientam a coleta e o processo de validação; não substituem a evidência que faltou. Até essa confirmação, não há crédito específico ou valor aprovado para apropriação.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
