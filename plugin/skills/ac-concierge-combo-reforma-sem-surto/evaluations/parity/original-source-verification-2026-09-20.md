# Verificação independente de originais e fontes

Rodada 2026-09-20; verificação efetiva em 2026-09-21 UTC por `/root/sem_surto_task4_implementer`, distinto dos implementadores das Tasks 2 e 3. Base: `a65e4f32cffad9c169c83814d576a16cbc53016c`.

**Gate de fontes: PASS para as afirmações materiais das seis respostas da skill.** Não há conclusão fiscal individual, código definitivo ou vigência de NT/tabela apoiada apenas em inferência. A verificação é limitada aos casos testados; não certifica todo o corpus ou todas as afirmações extras do GPT baseline.

## Identidade e escopo dos originais

Os originais verificados são os seis anexos Markdown preservados do GPT em 2026-08-07, identificados pelo manifesto. Raiz dos caminhos abaixo: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-reforma-tributaria-sem-surto/.worktrees/sem-surto-skill-ready/`. A mesma árvore relativa existe na instalação `/Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto/`, conferida byte a byte nesta Task.

| ID | Caminho do original | SHA-256 calculado nesta Task |
| --- | --- | --- |
| O01 | `knowledge/original/01-FONTES-OFICIAIS-E-VERSOES.md` | `a5d4f909f3c893d61d2aa2265914a423c2c6c94f0f7ce4f0b5416776b34f12d4` |
| O02 | `knowledge/original/02-KB-CONSOLIDADA-IA-REFORMA.md` | `754d6fcfb84356b76e8f262b72f74beb135689c8bc0546354ec27862def60872` |
| O03 | `knowledge/original/03-DOCUMENTOS-FISCAIS-ELETRONICOS.md` | `bd04fa2361e998bb83d894c8743f7f633d9901066b1e05573bfc1ee9b0b85538` |
| O04 | `knowledge/original/04-BASE-ORIGINAL-PRESERVADA.md` | `c532693ebfcc6eacacaf8804c846253e4007e704bdcf159fc3245a0cdb22a36c` |
| O05 | `knowledge/original/05-ECONET-FONTE-SECUNDARIA.md` | `0aa380ad3b766b9b06da1bd391f4c664295470e5fd6c3355ec5cab309be673cf` |
| O06 | `knowledge/original/06-GAPS-E-LIMITES-DA-IA.md` | `bfb8bb305b66f4818353c21c1e3ccd2feb59f2757fe369845f7a7dfafd7bab33` |

Resultado: 6/6 coincidem com `knowledge/MANIFEST.md`; nenhum original foi alterado. O04 menciona 11 PDFs e conversões antigas: esses PDFs não foram usados nem sua disponibilidade ou identidade foi inferida nesta Task. Os nomes dos seis anexos estavam visíveis no editor atual, mas isso não prova igualdade binária com o Knowledge online corrente. A limitação histórica do manifesto permanece válida.

## Matriz de afirmações materiais da skill

| Caso / afirmação usada no veredito | Original, seção/trecho | Correspondência e complemento oficial | Resultado |
| --- | --- | --- | --- |
| Q1: CBS federal; IBS compartilhado entre estados, DF e municípios | O01, “Fontes Primarias e Oficiais”: EC 132 como fundamento constitucional | EC 132, art. 156-A, e RFB “Objetivos” verificam competências. O01 orienta a consulta; não foi usado sozinho como prova normativa | PASS |
| Q1: CBS substitui PIS/Cofins; IBS assume ICMS/ISS gradualmente; marcos 2026, 2027, 2029–2033 | O02, KB-001, “a transicao vai de 2026 a 2033” | EC 132, ADCT arts. 124–129; RFB “Transição”, blocos 2026, 2027/2028, 2029–2032 e 2033 | PASS |
| Q1: IPI tem redução a zero com exceções de ZFM, não simples extinção | O01 remete à EC; O02 não detalha IPI | EC 132, ADCT art. 126, III; RFB bloco 2027/2028. A resposta não identifica item nem promete benefício | PASS |
| Q1: não há alíquota individual universal a aplicar à carteira | O01, “O Que a IA Nao Pode Fazer”; O06, dados faltantes | EC 132, art. 156-A, §1º, V–VII e §6º, e fases do ADCT dão suporte à dependência de destino, exceções e período | PASS |
| Q2: triagem por regime, mix, ERP, documentos, compras/créditos, recebimentos e contratos; D7/D30/D90 | O02, KB-008; O04, “Uso no Prompt”; O06, dados faltantes | Correspondência direta. Riscos alto/médio são rotulados como prioridade de investigação, não diagnóstico comprovado. Prazos D7/D30/D90 são plano operacional, não prazos legais | PASS |
| Q3: impacto não pode ser garantido; obter vendas/compras e itens antes de reajuste geral | O06, “nao garante economia, credito, enquadramento ou classificacao”; O02, KB-008 | Texto não afirma aumento/redução nem regra numérica. A coleta é orientação operacional; dispensa nova tese normativa | PASS |
| Q4: não escolher cClassTrib arbitrário; pedir operação e evidência; homologar e validar fiscalmente | O03, “cClassTrib/CST/IndOp”, “Checklist pratico” e “Modo XML” | Correspondência direta com a coleta de XML, ERP, versões, operação, tabela e validação humana. A falta do retorno impede identificar a causa | PASS |
| Q4: solicitar cStat/xMotivo e retorno completo | O03 exige rejeição/XML, mas não nomeia essas tags | MOC 7.0 oficial, leiautes de mensagem de retorno, define código e descrição do status. Consulta por índice oficial confirma os nomes; nenhuma rejeição concreta é atribuída | PASS |
| Q4: v1.40 é conhecida na base; busca mostra NT v1.50 e IT v1.60 como indício posterior | O03, NF-e/NFC-e; O01, “Versoes Críticas no Pacote” | Índices oficiais encontrados exibem NT 2025.002 v1.50 e IT 2025.002 v1.60. A skill declarou falha de abertura e não atestou vigência/aplicabilidade; a verificação confirma somente a existência dessas referências oficiais | PASS no alcance declarado |
| Q5: faturamento isolado não fecha regime/carga; matriz, período, elegibilidade, margens, compras, créditos e folha | O02, KB-003/008; O06, “Simulacao de regime sem dados” e dados faltantes | Matriz é estrutura de análise, sem alíquota, fórmula legal final, economia ou escolha de regime. “Presumido/Real” não é usado para deduzir alíquota IBS/CBS | PASS |
| Q6: não fabricar artigo/benefício; Econet é secundária; não fechar NCM/cClassTrib sem dados | O01, hierarquia; O05, “Nao entra como” e “Regra de Citacao”; O06, limites e recusas | Correspondência direta; alternativa ao cliente preserva pendências e exige fonte oficial, ficha técnica e responsável tributário | PASS |

## Fontes oficiais efetivamente consultadas

Todas as consultas abaixo ocorreram em 2026-09-21 UTC. “Índice” significa conteúdo de resultado de busca do domínio oficial, não leitura integral do documento. Conteúdo de terceiros retornado pelas buscas não foi usado como prova.

| Fonte / URL | Seção e observação | Uso e limite |
| --- | --- | --- |
| [EC 132/2023 — Planalto](https://www.planalto.gov.br/ccivil_03/constituicao/emendas/emc/emc132.htm) | Abertura direta e leitura dos arts. 156-A e ADCT 124–129; art. 125 mostra alíquotas de teste; art. 126 trata PIS/Cofins e IPI | Norma primária para Q1. Não implica auditoria integral de alterações futuras ou da tributação de cliente individual |
| [Entenda a RTC — RFB](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/entenda) | Abertura direta; atualização exibida 03/07/2026; blocos de competência e transição | Confirma resumo didático Q1. Não determina alíquota de cliente |
| [Avisos — Portal NF-e](https://www.nfe.fazenda.gov.br/portal/informe.aspx?AspxAutoDetectCookieSupport=1&ehCTG=false&page=0&pagesize=30) | Índice: publicação de NT 2025.002 v1.50 em 03/06/2026 e IT 2025.002 v1.60 em 23/06/2026; abertura direta retornou `Internal Error` | Sustenta o indício descrito em Q4; não certifica última versão ou cronograma aplicável |
| [Tabelas — Portal NF-e](https://www.nfe.fazenda.gov.br/pOrtaL/listaConteudo.aspx?AspxAutoDetectCookieSupport=1&tipoConteudo=%2FNJarYc9nus%3D) | Índice mostra tabela cClassTrib referente ao IT 2025.002 v1.60 e publicação em 23/06/2026 | Confirma existência da referência, sem selecionar código nem assumir vigência para operação |
| [MOC 7.0 — Visão Geral](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=LrBx7WT9PuA%3D) | Índice oficial: leiautes de retorno identificam cStat como código do status e xMotivo como descrição; abertura integral falhou | Corrobora nomenclatura do pacote de evidências de Q4; não atesta versão vigente de regras RTC nem diagnostica rejeição |

Consultas de busca incluíram: `site.nfe.fazenda.gov.br "NT 2025.002" "1.50" "1.60"`, `site.nfe.fazenda.gov.br "Tabela de Classificação" "2025.002.v.1.60"` e `site.nfe.fazenda.gov.br "MOC 7.0" "cStat" "xMotivo"`. Os links oficiais de EC/RFB foram abertos diretamente. Não houve conclusão que dependesse de ler uma NT/tabela integral inacessível.

## Checagens complementares do baseline

Estas observações distinguem fonte de comportamento, sem tornar o GPT autoridade normativa ou ampliar o gate da skill:

- Q1 menciona novas regras do Simples. A [notícia oficial da RFB de agosto de 2026](https://www.gov.br/receitafederal/pt-br/assuntos/noticias/2026/agosto/cgsn-atualiza-regras-do-simples-nacional-para-adequacao-a-reforma-tributaria-do-consumo), aberta, confirma adaptações e separa a opção pelo Simples da opção de IBS/CBS regular.
- Q2 menciona cronogramas DFe. O [índice oficial das orientações RFB](https://www.gov.br/receitafederal/pt-br/acesso-a-informacao/acoes-e-programas/programas-e-atividades/reforma-tributaria-do-consumo/orientacoes-da-reforma-tributaria) mostra documentos e leiautes, mas a abertura integral falhou. Não se usou um prazo específico desse link no veredito.
- Q4 usa como exemplos 1023 e 1024, expressamente sem diagnosticar a rejeição do usuário. [Trecho indexado de documento oficial NF-e](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=IwLPdZ67F5M%3D) contém essas mensagens nas regras UB14-10/20. A [IT 2025.002 v1.60 indexada](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?AspxAutoDetectCookieSupport=1&conteudo=jxTMMQeEVM8%3D), p. 5, corrobora a relação dos três primeiros dígitos do cClassTrib com o CST. Isso não prova vigência ou implantação desses exemplos no ambiente do usuário. Um link do GPT remete à IT v1.40: a resposta online não é um inventário consistente da documentação mais recente.
- Q5 cita a janela de setembro/2026. A [notícia RFB publicada em 01/09 e atualizada em 02/09/2026](https://www.gov.br/receitafederal/pt-br/assuntos/noticias/2026/setembro/receita-federal-alerta-comeca-hoje-o-prazo-para-opcao-pelo-simples-nacional-e-para-a-escolha-do-modelo-de-recolhimento-do-ibs-e-da-cbs-em-2027/) foi aberta e confirma 1º–30/09 para as escolhas ali delimitadas, distinguindo ingresso e permanência. A skill não cita prazo conflitante; pede regime atual e período antes de concluir. Esse alerta adicional do GPT é uma vantagem de cobertura temporal, não prova de superioridade da skill em todos os eixos.
- A [LC 214 compilada no Planalto](https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214compilado.htm) não foi lida integralmente: a ferramenta informou excesso de tamanho, e uma tentativa adicional de leitura HTTP direta terminou com conexão reiniciada pelo servidor, sem conteúdo. O conteúdo completo do art. 41 citado pelo GPT não foi usado como premissa normativa do PASS da skill. A [página de calculadora](https://piloto-cbs.tributos.gov.br/servico/calculadora-consumo) abriu sem texto extraível; um [resultado oficial do serviço atual](https://consumo.tributos.gov.br/servico/calcular-tributos-consumo/calculadora) descreveu simulações regular/Simples. Não houve execução nem certificação de cálculo.

## Limites e conclusão

O gate prova suporte aos conceitos da Q1, fidelidade às instruções dos anexos em Q2–Q6 e o tratamento explícito da incerteza em Q4. Não prova igualdade binária atual dos anexos online, vigência integral das tabelas fiscais, acesso a PDFs referidos por O04, nem todas as alegações acessórias da resposta online. Ausência de prova não foi convertida em vigência: os pontos sem leitura suficiente permanecem explicitamente não certificados e não são premissas do PASS. Nenhum achado Critical/Important nas seis respostas da skill.
