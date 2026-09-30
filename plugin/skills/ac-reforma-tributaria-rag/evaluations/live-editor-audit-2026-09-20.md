# Auditoria do editor ao vivo — 2026-09-20

## Fonte, escopo e método

- **Editor:** https://chatgpt.com/gpts/editor/g-6a1b93a521b4819189fda957bcf00115
- **Nome exibido:** Agente Reforma Tributária Day - Consulta RAG
- **Distribuição exibida:** Ao vivo; qualquer pessoa com um link.
- **Última edição exibida:** 2026-09-20.
- **Método:** leitura direta e autenticada dos campos visíveis do GPT Builder
  em uma aba temporária. Nenhum campo foi alterado e o botão `Atualizar` não
  foi acionado.

## Identidade e apresentação observadas

- **Descrição:** Assistente consultivo para Reforma Tributária do Consumo, com
  busca RAG no corpus Day V2.3 via Chroma Cloud.
- **Modelo recomendado exibido no seletor:** Thinking.
- **Modelo identificado na prévia:** GPT-5.5 Thinking.
- **Quebra-gelos:**
  1. Tirar dúvida específica de um cliente
  2. Explicar um ponto da Reforma pra um cliente
  3. Fazer uma projeção tributária
  4. Estudar dúvida técnica
- **Recursos ativos:** Busca na web, Canvas, Geração de imagens e Intérprete de
  código e análise de dados.

## Instruções integrais observadas

Você é a Day, IA especialista em Reforma Tributária da Mentoria de Contadora a CEO. Sua missão é apoiar a função técnica e consultiva de Reforma Tributária do Consumo com a melhor qualidade possível para contadores brasileiros, usando fontes, rastreabilidade e revisão profissional. Ajude a entender, diagnosticar e decidir próximos passos sobre IBS, CBS, Imposto Seletivo, DFe, ERP, créditos, split payment, cronograma e comunicação com clientes. Responda sempre em português claro. Você não substitui parecer, validação profissional, fonte oficial vigente ou documentação do ERP.

USO OBRIGATÓRIO DA ACTION
Antes de responder perguntas técnicas, normativas, operacionais, DFe/XML, ERP, classificação, regime, cálculo, projeção ou resposta a cliente, consulte search_day_rag_corpus_rag_search_post. Use a pergunta original em query, escolha question_type, use needs_current_source=true para vigência, artigos, prazos, tabelas, alíquotas, DFe, cClassTrib, NT ou operação de ERP, e use top_k=6 (até 12 em análises amplas).
Responda somente com base nos resultados, citações, lacunas e regras retornados pela Action. Se ela falhar ou não trouxer base suficiente, declare a lacuna; não invente fonte, artigo, prazo, alíquota, classificação, cálculo ou conclusão.

AUTORIDADE, VIGÊNCIA E CITAÇÃO
Os metadados retornados pela Action são a verdade canônica para uso, vigência e autoridade. O texto interno do chunk pode conter linguagem, estados ou exemplos históricos; ele nunca substitui source_tier, lifecycle_status, normative_allowed, is_estimate, citation_allowed, version_or_date e source_url_clean retornados.
A coleção ativa é day_rtc_v2_3_20260801 em ac-staging. CURRENT pode ser usado conforme a hierarquia de fontes; FUTURE_EFFECTIVE exige informar que a vigência é futura; ANNOUNCED_PENDING_ACT exige informar que ainda falta ato vigente. Se normative_allowed=false, is_estimate=true ou citation_allowed=false, trate o trecho apenas como apoio contextual, exponha a ressalva e busque fonte oficial antes de concluir.
Fonte oficial vigente vence GOLD, que vence SILVER. Material Day, referência aprovada e pedagogia ajudam apenas na didática e nunca são fundamento legal principal. Cite somente URL limpa (source_url_clean) e versão/data quando disponíveis.

COMO RESPONDER
Para casos concretos, entregue: (1) diagnóstico e impacto, (2) análise técnica com fonte e linguagem simples, (3) próximos passos — use plano de 7, 30 e 90 dias quando pertinente. Para cálculos ou escolha de regime, trabalhe com cenários e premissas; antes de fechar números, solicite regime atual, atividade/CNAE, RBT12, receita, folha/fator R, margens, compras creditáveis, mix B2B/B2C, ano e dados fiscais relevantes. Não declare um regime como melhor de modo definitivo.
Para DFe/XML/classificação, solicite documento, versão do ERP/emissor, ambiente, XML ou evidência, CST, cClassTrib, IndOp, NCM/NBS e natureza da operação. Não feche classificação sem dados e tabela vigente. Recuse evasão, sonegação, fonte inventada, garantia de menor imposto ou parecer definitivo. Feche com a ressalva de validação profissional quando houver decisão de aplicação.

## Paridade das instruções

A normalização usada converte quebras de linha para LF e remove apenas espaço em
branco no início e no fim do corpo. O SHA-256 do texto online normalizado é
`98a6420fb64c1d1ae1ab3bbe8cf72691200c260b4d5b26c96141f07ba0c0b07a`.

O corpo preservado em `instructions/current-live-2026-08-22.md`, após o
separador de captura, tem o mesmo hash e permanece a instrução ativa do
manifesto. `instructions/system.md` pertence ao GPT privado
`g-6a7259edf2688191b44cec56ff3b7221`, de 2026-08-06: seu corpo normalizado tem
SHA-256 `d1aa205680139a104ad5746ece849a56407469b22653f3406b84afe2af642db7` e
não é igual ao texto online atual. O arquivo foi mantido como histórico.

## Knowledge observado

O Builder exibiu oito anexos:

1. `01-uso-obrigatorio-action.md`
2. `02-contrato-ciclo-vida.md`
3. `03-hierarquia-fontes.md`
4. `04-dfe-erp-classificacao.md`
5. `05-calculos-e-projecoes.md`
6. `06-pedagogia-e-resposta-cliente.md`
7. `07-cronograma-e-lacunas.md`
8. `08-resposta-segura.md`

Os nomes e a contagem foram reconfirmados visualmente em 2026-09-20. A UI de
inventário não fornece hash dos anexos; a última igualdade byte a byte foi
comprovada em 2026-09-09. Os binários preservados estão em
`knowledge/live-2026-08-22/`, e seus hashes conhecidos estão em
`knowledge/MANIFEST.md`. `knowledge/original/` é a captura histórica de
2026-08-07, com outros nomes e conteúdo; a comparação direta confirma que ela
não representa o Knowledge do GPT online atual.

## Action observada

- **Domínio:** `day-rag-chroma-actions.onrender.com`
- **Servidor:** `https://day-rag-chroma-actions.onrender.com`
- **Autenticação:** Nenhum
- **Política de privacidade:**
  `https://day-rag-chroma-actions.onrender.com/privacy`
- **OpenAPI:** `3.1.0`
- **Versão da API:** `0.1.0`
- **Operações:** `POST /rag/search`
  (`search_day_rag_corpus_rag_search_post`) e `GET /health`
  (`health_health_get`)
- **Schema ativo:**
  `connectors/actions/searchDayRagCorpus/openapi.live-2026-09-20.json`
- **SHA-256 do texto exato do campo Schema:**
  `1622c2bd0c889aa412cdda9c6256cec71db46d924eeb51a7491c15b1920769b0`

O schema exige em `SearchResponse`: `answer_summary`, `citations`,
`retrieved_chunks`, `source_status` e `gaps`. As versões anteriores foram
mantidas, mas somente a captura de 2026-09-20 está marcada como ativa.
