# P3 — resposta nova da skill instalada

Base desta resposta: consulta própria de P3, preservada em `P3-response.json`, e apoio local explicitamente identificado. Não se importa a atribuição do art. 41 feita na resposta do GPT.

## Resposta

Não há dados para calcular quanto essa empresa pagará em 2027 nem para definir o melhor regime. O que sabemos é apenas que se trata de uma empresa fictícia de serviços e que a análise pretendida é para 2027. O regime atual precisa ser confirmado; a pergunta sugere Simples, mas isso será uma hipótese de trabalho, não um dado preenchido por mim.

Já é possível organizar a decisão. A orientação operacional recuperada aponta duas alternativas a estudar para quem for elegível: manter IBS/CBS no Simples ou optar pelo regime regular desses tributos, com permanência no Simples para os demais. Isso indica que estudar IBS/CBS não implica necessariamente sair integralmente do Simples. A disponibilidade jurídica, as condições e o período dessa opção ainda precisam ser confirmados na fonte primária.

Essa explicação vem de `RAG-057-KB-003-simples-nacional-rtc.md`, autoridade retornada `CGSN / Receita Federal`, e `RAG-050-F5.7-simples-nacional-na-rtc.md`, autoridade retornada `Planalto / norma primaria`, ambos em `rag/v2.2-prod-candidate/02_SILVER/`, versão `v2.0`, `CURRENT`, citação permitida e `normative_allowed=false`. O primeiro tem como URL limpa a [orientação Fazenda/CGSN sobre opções para 2027](https://www.gov.br/fazenda/pt-br/assuntos/noticias/2026/abril/comite-define-prazos-de-opcao-pelo-simples-nacional-e-pelo-regime-regular-do-ibs-e-da-cbs-para-2027). São apoio contextual, não fundamento normativo principal para efetivar a opção.

O framework de comparação é este, sem preencher valores:

| Dimensão | Como entra na comparação |
| --- | --- |
| Receita mensal, RBT12 e crescimento | Estabelecem a base econômica e permitem verificar enquadramento, anexo e limites aplicáveis. |
| Custos, folha/fator R e margens | Mostram a estrutura do serviço e quanto uma alteração de preço, tributo ou custo administrativo afetaria o resultado; folha não será presumida como compra creditável. |
| Compras e créditos possíveis | Separe compras por natureza e fornecedor; só use créditos após confirmar elegibilidade, documentação e momento de aproveitamento. |
| Vendas B2B/B2C | Em B2B, avalie se o comprador aproveita crédito e como isso afeta a negociação; em B2C, teste preço final e sensibilidade do consumidor. |
| Preços, contratos e caixa | Compare capacidade de repasse, prazo de recebimento e impacto de desembolso, sem confundir margem contábil com caixa. |
| ERP e esforço operacional | Inclua custo e capacidade de emissão, conferência de documentos, apuração e conciliação. |

Monte três cenários condicionais:

- **Permanência no modelo do Simples, se aplicável:** usar receita, anexo e composição dos tributos efetivamente validados como base; testar margem e preço final no mix real de clientes.
- **Simples com IBS/CBS no regime regular, se a opção for juridicamente cabível para o período:** comparar débitos e créditos validados desses tributos, demais tributos e custo de operação. Se clientes B2B valorizarem o crédito, medir o efeito comercial; se houver poucas aquisições creditáveis ou custo operacional elevado, medir como isso pesa. Nenhuma dessas condições declara um vencedor.
- **Sensibilidade:** para ambas as alternativas, variar receita, margem, preço, compras elegíveis, capacidade de aproveitamento de crédito pelo cliente e custo operacional em hipóteses conservadora, central e favorável. Se a empresa realmente cogitar sair integralmente do Simples, incluir uma análise tributária mais ampla e separada, com os demais tributos, antes de comparar o resultado total.

Não foi adotada alíquota, percentual de crédito, enquadramento ou prazo. O framework é uma orientação consultiva; não é uma simulação numérica já validada.

Preciso de regime atual; atividade/CNAE e NBS; RBT12 e receitas mensais; anexo atual; folha e fator R quando aplicável; margens; custos; compras potencialmente creditáveis com documentos; regime dos fornecedores; mix B2B/B2C e capacidade dos clientes de aproveitar crédito; contratos; ERP/documento fiscal; ano e meses exatos de 2027 e demais dados fiscais pertinentes. Envie amostras anonimizadas.

Há uma lacuna específica do retrieval: ele marcou `has_official_current_source=true` e `gaps=[]`, mas o trecho GOLD da [LC 214/2025 — Planalto](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm), `RAG-030`, versão `v2.0`, trata do procedimento simplificado de recolhimento, não traz o texto do art. 41. Portanto, não uso esse chunk para confirmar a opção de regime. As fichas `P16-02-FICHA-SIMPLES-REGIME-REGULAR-IBS-CBS.md` e `P16-00-SMOKE-30-PROJECOES.md` dão apoio ao método, com autoridade retornada `CGSN / Receita Federal`, `REFERENCE_APROVADO/CURRENT`, citação permitida, uso normativo vedado, versão `validar-conforme-fonte` e sem URL; não completam essa validação. Os metadados essenciais dos chunks vieram, mas as citações agregadas usam uma versão genérica; foram priorizadas as versões dos próprios chunks. O Knowledge local [05 — Cálculos e projeções](../../../knowledge/live-2026-08-22/05-calculos-e-projecoes.md) também apoia a separação entre dados, premissas e cenários, sem provar regras vigentes.

Próximo passo: reunir os dados e confirmar imediatamente as condições oficiais da opção para o período pretendido; em seguida, montar o comparativo de receita, resultado, caixa e custo operacional, validar ERP/documentos e só então decidir com o responsável tributário. Não espere um plano de 30 ou 90 dias para verificar eventual prazo de opção: a própria existência e vigência do prazo precisa de confirmação agora.

Esta resposta é informativa e consultiva. Antes de aplicar, valide o caso concreto, a fonte oficial vigente e o responsável tributário.
