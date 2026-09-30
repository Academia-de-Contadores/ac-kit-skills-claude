# Como usar a skill Reforma Tributária Day

## Instalar o pacote seletivo

O repositório inclui avaliação, testes e governança que não pertencem à
instalação da skill. Para instalar `ac-reforma-tributaria-rag`, crie a pasta de
destino com esse nome e copie **somente** estes oito itens, preservando seus
caminhos relativos:

- `SKILL.md`
- `agent.yaml`
- `agents/`
- `profiles/`
- `references/`
- `instructions/`
- `knowledge/`
- `connectors/`

Não faça checkout do repositório inteiro dentro da pasta de skills. Não copie
`.git`, `.github`, `.superpowers`, `scripts/`, `tests/`, `evaluations/`,
`reports/`, `governance/` ou `docs/`. Copiar somente `SKILL.md` também é
insuficiente porque quebra as referências relativas. Depois da cópia seletiva,
recarregue a descoberta de skills do ambiente.

Este procedimento descreve a instalação; o repositório por si só não instala
nem ativa a skill em todas as sessões. A versão `0.2.1` está em lifecycle
`validated`: a base 0.2.0 passou em P1–P5 e no confronto de citações com os
originais; a correção 0.2.1 foi testada na regressão de 2027. Essa validação não comprova disponibilidade
contínua do serviço nem substitui validação profissional do caso concreto.

## Invocar e escolher perfil

Depois de instalada e descoberta, use por exemplo:

```text
Use $ac-reforma-tributaria-rag para analisar quais dados faltam para uma
projeção de CBS e IBS para uma empresa do Simples Nacional.
```

O perfil [current](profiles/current/profile.yaml) é o padrão e aponta para o
GPT principal, instruções atualizadas em 2026-09-24, oito anexos preservados
e schema ativo de 2026-09-20.
A seleção implícita também está habilitada em [agents/openai.yaml](agents/openai.yaml).

Para comparação histórica, peça explicitamente:

```text
Use $ac-reforma-tributaria-rag com o perfil legacy para explicar as diferenças
entre o material preservado do Reforma Oficial e o perfil current.
```

O perfil [legacy](profiles/legacy/profile.yaml) reúne a cópia privada do RAG e
“Agente da Reforma Tributária | Oficial”. Seus arquivos locais e schema são
históricos; os documentos não são duplicados. Caminhos dentro dos perfis são
resolvidos a partir da pasta de cada `profile.yaml`; caminhos em `agent.yaml`
são relativos à raiz do pacote.

## Acessar o retrieval

Leia [references/retrieval-contract.md](references/retrieval-contract.md).
A consulta exige a Action ativa ou uma ferramenta HTTP capaz de executar
`POST https://day-rag-chroma-actions.onrender.com/rag/search` com JSON. O
servidor não usa autenticação. Não há MCP ou dependência de ferramenta
instalada automaticamente pelo pacote. `GET /health` ajuda a diagnosticar
disponibilidade; não valida a qualidade das fontes.

Envie somente informação pública, retirando dados de clientes e segredos.
O schema ativo é
[openapi.live-2026-09-20.json](connectors/actions/searchDayRagCorpus/openapi.live-2026-09-20.json).
`openapi.yaml` é candidato futuro e os demais schemas são históricos. O nome
antigo `searchDayRagCorpus` em anexos preservados não muda a operação ativa
`search_day_rag_corpus_rag_search_post`.

## Limites de uso

As respostas técnicas dependem de retrieval suficiente e de metadados de
autoridade, vigência e citação. Sem transporte, com serviço indisponível ou
fontes insuficientes, a skill informa lacunas e próximos passos; não substitui
a consulta por uma conclusão de memória. Anexos locais são orientações de
uso, não uma base legal completa. Projeções exigem dados e premissas; DFe e
classificação exigem dados da operação e tabela vigente. A aplicação final
exige validação do responsável tributário.

## Manter e validar

Edite a entrada e o perfil correspondente, preservando a origem das capturas.
Sincronize `canonical_agent_version` dos perfis com `agent.version`. Antes de
distribuir, execute os validadores do pacote e da skill, este último a partir
da instalação local da ferramenta `skill-creator`:

```bash
python3 <diretorio-da-skill-creator>/scripts/quick_validate.py .
bash scripts/validate-agent-repo.sh
```

Para alterações do próprio validador, há testes em
`tests/validate-agent-repo.test.sh`. Avaliações de cenário ficam em
`evaluations/`; validação estrutural não as executa. Consulte
[CONTRIBUTING](governance/CONTRIBUTING.md),
[CHANGE-POLICY](governance/CHANGE-POLICY.md) e
[DATA-AND-SECRETS](governance/DATA-AND-SECRETS.md) para contribuição, mudanças
e dados permitidos. Não publique capturas com segredos, conversas ou corpus.
