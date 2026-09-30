# Verificação independente de originais e fontes — 2026-09-21

Executor: `/root/reforma_task4_implementer`, distinto dos executores das Tasks 2
e 3. Base: `e1d25d27c36902e39617bb9e372a4e66b37ff81a`. Revisão das respostas
integrais de `local-results-2026-09-21.md`, sem modificá-las, confrontada com
os arquivos efetivamente citados, os originais correspondentes e fonte oficial.

## Integridade e alcance

Os SHA-256 foram recalculados sobre bytes integrais, sem normalização. Os oito
originais e os vinte documentos do source-package correspondem ao inventário de
`knowledge/MANIFEST.md`. A igualdade com a instalação também foi conferida.
Isso comprova preservação local, não upload atual ou vigência jurídica: o editor
continua sem anexos e sem Actions. Os schemas históricos permanecem intactos.

O questionário congelado mantém SHA-256
`19c12d1a929c93b856c28d56f5ea697a03c3fa42fb095fc64355ef02926ffb2d`;
as respostas locais mantêm
`eafa3b6a239672824cfb15c2bdde8a679def3fd25cc8eb51541d6bdd77eb6b16`.

## Fontes locais examinadas e hashes

Os IDs abaixo servem somente para esta matriz; não são IDs de chunks de RAG.
As fichas S1–S7 têm `created: 2026-06-01`; O1–O4 pertencem à captura histórica
de 2026-08-07. O1 e O3 também informam criação em 2026-05-28. C1 é a captura
de 2026-08-22 reconfirmada no editor em 2026-09-21.

| ID | Arquivo relativo à raiz da skill | SHA-256 |
| --- | --- | --- |
| C1 | `instructions/current-live-2026-08-22.md` | `63c73fc607b2154e5a8b7ee96efaf745cdbbcaea3662494e578151987de205dd` |
| S1 | `knowledge/source-package/05-06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK-USO.md` | `dab1b7091535a9cb2ecfa8d339eeeb34f89a2e42bf7e091827f7783270491c55` |
| S2 | `knowledge/source-package/06-07-REGRAS-DE-NAO-CALCULAR-V2-1.md` | `4e3763cba559de8d68c16629f4bfd79c47e98dbe20243d3d1e407ceb41c33a1a` |
| S3 | `knowledge/source-package/11-12-FICHA-CALCULO-REGIME-MOTOR.md` | `e81ea0a584bee61bed380b74d8b58450e820216e77104384dc474312315db19b` |
| S4 | `knowledge/source-package/04-05-MAPA-DFE-XML-ERP-POS-HARDENING.md` | `63dd0412f7d64e3ab25aa45126e5fe4f5a6d1ef8ffdf4b6025148a6c17056130` |
| S5 | `knowledge/source-package/14-15-FICHA-DADOS-MINIMOS-POR-PERGUNTA.md` | `31b7c9547c2af78358eb9f2284b4d9eb1efc6fb838535b68d65463898e79565f` |
| S6 | `knowledge/source-package/10-11-FICHA-MODO-WHATSAPP-CLIENTE.md` | `3bac512339e7022e6fcd2a918a209163108718e15417f0c0f3b72bc652430902` |
| S7 | `knowledge/source-package/07-08-GUIA-REFORMA-SEM-SURTO-DAY-PEDAGOGIA.md` | `8a7efd37b0326dd24894c80be614ab9a2eff1b76d7c54b58c61bfc989be5f695` |
| O1 | `knowledge/original/06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK (1).md` | `07d20efd53f806b8c96d34eeada8fa50fc951b048477d1b2a82ff7853ec4f991` |
| O2 | `knowledge/original/07-REGRAS-DE-NAO-CALCULAR (1).md` | `cf9d10a45334a9df98ed8f1e91b990aae17ef677405a666e9abc829a0ba8ad50` |
| O3 | `knowledge/original/05-MAPA-DFE-XML-ERP (1).md` | `b324682535242452f1a1357b82e00a8e93647223909a9ad008bf04c52b63ea27` |
| O4 | `knowledge/original/08-GUIA-REFORMA-SEM-SURTO-DAY (1).md` | `696c99a6ea200ef0f19fbc94c59d386b40d823754d3330aab485472837611271` |
| R1 | `references/profile-routing.md` | `86f2a7b561b75d51eb19979b5045a38b18755736924b81b23f65500046ec8010` |
| R2 | `references/retrieval-contract.md` | `b2a5fc5a63bcddfc1b33e6b21b4eb132bb5e2546a990c2e7224e4249e8c1ad4d` |
| R3 | `references/source-policy.md` | `7d4c6ceb012108faac58fa35c3dbc3390b4205af9a557ee4cac043c9fc284fb0` |

## Matriz de afirmações materiais

| Caso / afirmação local | Seção e trecho observado | Confronto e limite |
| --- | --- | --- |
| P1/P7: acesso temporário encerrado, Lucas e URL fixa | C1: “o período de acesso foi encerrado”; “não altere o link”; Markdown integral. | MATCH com configuração e com as respostas reais registradas em `gpt-outputs-2026-09-21.md`. A prosa pode variar; contato e URL não. |
| P2: crédito pode abater débito, sem automatismo ou dinheiro imediato | O4, cap. 7, §2: “Débito – Crédito = Imposto a pagar”. S1, “Creditos”: “Nao prometer credito, ressarcimento ou aproveitamento integral.” | Suporte conceitual; P2 rejeita expressamente o automatismo simplificado do guia. Conferência adicional oficial abaixo. |
| P2/P6: split separa tributo na liquidação e pode afetar recebimento líquido | O4, cap. 12, §1: “O vendedor recebe somente o valor líquido, já descontado o imposto.” S1, “Split payment”: “Tratar como impacto de fluxo de caixa e operacao.” | Suporte didático e operacional; a resposta usa condicionais, não atesta implantação universal ou uma versão operacional. Conferência adicional oficial abaixo. |
| P2: caixa B2B requer considerar compras, crédito do comprador, preço e momento dos recebimentos | S1, “Simples Nacional”: “carga tributaria do contribuinte”, “credito aproveitavel pelo comprador”, “efeito comercial/preco liquido”; “Split payment”: recebimentos, meio de pagamento, liquidação e ERP. | O aperto de caixa é inferência qualitativa condicional, identificável a partir desses componentes. Nenhuma quantificação ou crédito individual foi inferido. |
| P3: R$ 120 mil mensais não resolve RBT12, economia ou carga total | S2, “Nao calcular regime mais vantajoso quando faltar”: RBT12, atividade, fator R, custos, mix, ano e premissa com fonte. S3, “Dados minimos”: receita mensal e RBT12 são entradas distintas. | Faltas estão no próprio prompt. `NAO_CALCULADO` corretamente evita extrapolação e falsa decisão. O2 contém a regra original de não fechar número sem dados. |
| P3: comparação total precisa escopo além de IBS/CBS | S2: “IRPJ/CSLL/CPP/outros quando o usuario pedir comparacao total de regimes”; S3, “Dados minimos”: mesma exigência. | Trata-se de escopo de coleta, não cálculo nem afirmação de incidência em um caso específico. |
| P3: cenários úteis sem escolher regime | S2, “O que entregar em vez do calculo”: “Se possivel, fazer leitura qualitativa sem numero”; S3, “Regra”: “cenario consultivo, nao decisao definitiva.” | Resposta compara componentes e pede validação de 2027; não confirma legislação futura nem vencedor. |
| P4: não definir cClassTrib ou causa da rejeição a partir do fragmento | S4, “Limites obrigatorios”: “Nao fechar classificacao final sem dados e tabela vigente.” S5, “Classificacao”: descrição, documento, destino, regime, tabela e operação. | O fragmento não contém esses dados; a ausência de suporte é explícita. Não existe alegação de NT consultada. |
| P4: coletar rejeição, operação, ambiente, ERP, versões e XML; testar em homologação | S4, “Dados que a Day deve pedir” e “Proximo passo seguro”: “teste em homologacao”, “conferencia com fornecedor ERP”, “evidencia a arquivar”. O3, “Regras para a Day”: homologação, XML, logs, ambiente e emissor. | Checklist sustentado. Alterar uma condição por vez é recomendação diagnóstica, não constatação de teste realizado. Sem orientação aplicada em produção. |
| P5: rascunho curto, sem promessa, com coleta e revisão do sistema | S6, “Formato”: “6 a 10 linhas”, “Linguagem simples”; “Estrutura sugerida”: conferir, próximo passo e ressalva. S7, “Uso permitido”: explicação simples e plano de ação. | Seis linhas. “Preparação por etapas” descreve o trabalho proposto, não prazo legal; não afirma aumento/economia. Fontes fora do rascunho. Nenhum envio. |
| P6: cashback é devolução ao consumidor elegível, não crédito empresarial universal | O4, abertura cap. 9: “devolvendo parte do imposto para as famílias de baixa renda”; “Não é um benefício para empresas”; §2: devolução de parte do tributo. S1, “Cashback”: “Nao extrapolar publico elegivel, percentual, valor ou mecanica sem fonte vigente.” | Conceito sustentado, sem direito individual ou percentual. Conferência oficial abaixo; detalhes normativos do guia não são adotados. |
| P2–P6: origem restaurada, acervo histórico e necessidade de validação | R1, “Proveniência em respostas técnicas”; R3, “Vigência e lacunas”; S7, “Uso proibido”: guia não pode ser fundamento principal para artigo, prazo, alíquota, crédito, classificação ou cálculo. | Datas e seções citadas existem. Os textos distinguem suporte conceitual de vigência confirmada e não alegam atualização automática. |
| P6: ausência de integração identificada e fallback sem health/retrieval | R2, “Preflight e health check”: se health não puder ser identificado/executado, não chamar Action; “Fallback local”: declarar nenhuma chamada quando não feita. | Verificação independente do ambiente e schemas abaixo confirma a ramificação; não afirma servidor offline. |

## Confronto oficial limitado aos conceitos

Fonte primária consultada em **2026-09-21**:
[LC 214/2025, texto atualizado da Câmara dos Deputados](https://www2.camara.leg.br/legin/fed/leicom/2025/leicomplementar-214-16-janeiro-2025-796905-normaatualizada-pl.html),
com anotações das alterações da LC 227, de 13/01/2026. A tentativa inicial de
abrir o Planalto falhou por limite de tamanho; a leitura efetiva foi na Câmara.

- Art. 31 e art. 32, §3º: segregação/recolhimento na liquidação e apuração do
  valor a segregar antes da disponibilização ao fornecedor sustentam o conceito
  de split e seu possível efeito no recebimento líquido.
- Arts. 47 e 53: apropriação condicionada e uso de créditos para compensar
  débitos sustentam a distinção entre crédito e dinheiro disponível.
- Art. 113: destinatário ligado a família de baixa renda, sujeito a requisitos,
  sustenta cashback direcionado, sem universalidade.

Esses pontos corroboram os conceitos de P2/P6. Não certificam vigência integral,
implantação operacional do split, valor de cashback, crédito do cliente, regime
de 2027 ou cClassTrib. Nenhuma NT/tabela vigente foi verificada. A consulta
oficial pertence à Task 4 e não é atribuída retroativamente ao executor local.

## Simplificações históricas que foram excluídas

O4, cap. 7, §2, diz que o imposto da compra “gera crédito automaticamente”; o
cap. 9, §1, afirma que a LC não traz valores/percentuais/faixas; o cap. 12, §2,
descreve uma primeira fase de aplicação. São afirmações históricas do material,
não resultados aprovados por esta revisão. P2/P6 não as repetem como norma e
declaram que o guia serve somente de apoio didático. R1/R3 e S7 delimitam seu
uso. A preservação byte a byte não implica endosso desses detalhes.

## Retrieval real versus fallback

Repetida nesta sessão a busca em nomes e descrições de `ALL_TOOLS` por
`searchDayRagCorpus`, `day_rtc_corpus`, `day-rtc-corpus`, `day.?rag` e
`ac.?reforma.?tributaria`: **zero ferramentas correspondentes**. A leitura de
`agents/openai.yaml` mostra somente interface e política de invocação, sem MCP.

| Contrato preservado | SHA-256 | Caminhos observados |
| --- | --- | --- |
| `connectors/actions/searchDayRagCorpus/openapi.builder-capture.yaml` | `72c5a23b8e0c24abe06726124c5f544d573cbcaccc206ffd1d47a65bfa7e8890` | Somente `POST /rag/search` |
| `connectors/actions/searchDayRagCorpus/openapi.yaml` | `44dbc7ffd150a7d8527d67080ebece07c0e0b670ee4e1da0cdf0ab1b2d1bb08b` | Somente `POST /rag/search` |

Nenhum mecanismo de health documentado foi identificado. **Health:
NOT_PERFORMED; retrieval: NOT_CALLED; fallback: leitura local.** Não houve
HTTP ao domínio histórico, rota inventada, credencial inspecionada, status GOLD
atribuído, chunk remoto ou chamada oculta certificada. O preview também não
exibiu consulta/Action e o painel Ações mostrava apenas “Criar nova ação”.
A evidência não prova que o servidor está offline nem exercita o caminho de
sucesso remoto.

Resultado: **PASS — suporte das afirmações materiais verificável, com limites
expressos e zero Critical/Important nesta revisão de fontes**.
