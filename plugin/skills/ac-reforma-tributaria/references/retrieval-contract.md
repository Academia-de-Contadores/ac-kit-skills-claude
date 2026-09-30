# Action histórica opcional — contrato e fallback

O GPT online tinha zero Actions na auditoria de 2026-09-21. Os schemas abaixo
são arquivos preservados, não ferramentas instaladas ou prova de serviço ativo:

- [Captura do Builder](../connectors/actions/searchDayRagCorpus/openapi.builder-capture.yaml):
  contrato observado em 2026-08-07.
- [Candidato de produção](../connectors/actions/searchDayRagCorpus/openapi.yaml):
  contrato ampliado do runtime histórico, com campos adicionais de auditoria.

Não misture os dois contratos nem afirme que o mais completo está implantado.
O perfil `legacy-action` herda `restored-technical`; somente esta referência
habilita a tentativa opcional de retrieval nas condições abaixo.

## Preflight e health check

1. Confirme que existe no ambiente uma integração real ou acesso HTTP autorizado
   ao runtime e identifique qual schema ele implementa. Esta skill não declara
   MCP, não instala serviço e não contém credenciais.
2. Antes de chamar `searchDayRagCorpus`, execute um health check real pelo mecanismo
   documentado/exposto pelo runtime, sem dados de cliente. Registre método, alvo,
   data e resultado observado. Os dois schemas preservados só documentam
   `POST /rag/search`; não definem rota de saúde. Não invente `/health`, ferramenta
   ou resposta de sucesso. Uma resposta genérica do servidor não comprova saúde
   do retrieval nem que a Action está configurada no GPT.
3. Se não for possível identificar/executar o health check, se ele falhar, ou se
   não houver integração/contrato compatível, não chame a Action. Siga para o
   fallback local. Não fique repetindo tentativas; nova tentativa só com evidência
   de recuperação ou solicitação do usuário.

## Consulta e leitura do retorno

Depois do health check aprovado, use `query` com a pergunta do usuário, sem
transmitir identificadores ou conteúdo privado sem autorização. Classifique
`question_type` como `factual`, `diagnostico`, `regime_simulacao`, `dfe_xml_erp`,
`classificacao`, `resposta_cliente`, `fora_escopo` ou `adversarial_risco`.
Use `needs_current_source=true` para dependência de versão, artigo, prazo, DFe,
tabela, classificação, alíquota ou aplicação operacional. `top_k=6` por padrão;
até `12` para comparação ampla, conflito ou múltiplos temas.

Leia `retrieved_chunks`, `citations`, `source_status`, `gaps` e
`recommended_response_rules` quando fornecido. O candidato de produção também
exige `retrieval_audit`; leia lacunas, dados ausentes e conflitos presentes no
retorno. Verifique os campos obrigatórios do schema realmente selecionado.
Não fabrique campos ausentes para parecer aderente ao contrato mais novo.

Avalie autoridade, versão, `normative_allowed`, `citation_allowed`, rank e
identificação de cada trecho quando disponíveis. A captura antiga não exige todos
os metadados do candidato; ausência de metadados relevantes limita a conclusão
normativa, mesmo com HTTP 200. Um resumo ou fonte pedagógica isolada não substitui
trecho com suporte verificável. Resultado vazio, malformado ou insuficiente pede
fallback e explicitação da lacuna, não certeza improvisada.

## Fallback local

Declare com precisão: “A Action histórica não está disponível/não pôde ser
verificada; vou usar o acervo local” ou “A consulta falhou/não trouxe suporte
suficiente”, conforme a observação. Registre que não houve retrieval quando
nenhuma chamada foi feita; não diga que consultou o corpus completo.

Volte às [regras de fontes](source-policy.md) e às fichas locais pertinentes.
Entregue conceitos sustentados, triagem, hipóteses declaradas, checklist e dados
necessários, podendo confirmar pontos em fonte oficial disponível. Bloqueie
apenas a conclusão que depende do suporte ausente. Não devolva o aviso de acesso
encerrado, pois ele pertence exclusivamente ao perfil `current-closed`.
