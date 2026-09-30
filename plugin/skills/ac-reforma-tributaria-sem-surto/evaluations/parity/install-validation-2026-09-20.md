# Instalação seletiva e validação local

Rodada planejada: 2026-09-20. Execução: 2026-09-21 UTC; primeira inspeção com horário registrado em `2026-09-21T03:04:47Z`.

- Base: `5554ee1bd036dc8f0f828cfb96eb2358ad36fd1c`.
- Origem: worktree `sem-surto-skill-ready` do repositório Sem Surto.
- Destino absoluto: `/Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto`.
- Inspeção antes da instalação: `ls -la` retornou `No such file or directory`; o diretório pai existia. Nenhum arquivo anterior foi sobrescrito ou removido.
- Resultado: **instalação PASS; forward test PASS 6/6**. Lifecycle preservado como `candidate`, versão `0.2.0`.

## Seleção do pacote

Incluídos: `SKILL.md`, `agent.yaml` e conteúdo canônico de `agents/`, `references/`, `instructions/`, `knowledge/`, `identity/` e `objectives/`. Total final: **20 arquivos regulares, zero symlinks**. `connectors/` contém apenas placeholder na origem e não foi instalado.

Excluídos: `.git`, `.github`, `.superpowers`, `README.md`, `HOW-TO-USE.md`, `CHANGELOG.md`, `docs/`, `reports/`, `evaluations/`, `governance/`, `tests/`, `scripts/`, `decisions/`, `adapters/`, `profiles/`, `skills/`, `.gitignore` e placeholders `.gitkeep`. A cópia inicial dos diretórios trouxe cinco `.gitkeep` vazios; foram removidos apenas da nova instalação por patch explícito, antes de fechar o inventário. A origem permanece intacta e permite recuperação desses placeholders sem conteúdo.

O `agent.yaml` instalado contém referências de auditoria para avaliações e captura mantidas no repositório; `knowledge/MANIFEST.md` também aponta para a auditoria externa ao pacote. Esses são ponteiros de proveniência, não dependências de execução. Não se instalou a pasta de avaliações para satisfazê-los. Todas as referências usadas para produzir respostas (`SKILL`, `references`, instruções e Knowledge) resolveram dentro do destino.

## Operações executadas

Após a inspeção, a instalação usou `mkdir` no destino explícito, `cp SKILL.md agent.yaml DESTINO/` e `cp -R agents references instructions knowledge identity objectives DESTINO/`. A remoção dos cinco placeholders foi feita por `apply_patch` em caminhos absolutos individuais recém-criados. Não houve exclusão recursiva, script de orquestração ou modificação de outra skill.

Após o forward test, foram acrescentadas ao `agent.yaml` somente as três referências de evidência desta Task, e esse manifesto foi sincronizado no destino. Nenhum conteúdo comportamental, Knowledge, identidade ou versão mudou entre a execução e a instalação final.

## Validações observadas

Executado com diretório de trabalho `/Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto`, fora da worktree:

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria-sem-surto
```

Saída exata: `Skill is valid!`, exit 0. Repetido após sincronizar o manifesto final, mesmo resultado.

Outros resultados:

- `find . -type l`: vazio, nenhum vínculo com a worktree.
- Busca por `/Volumes/`, `.worktrees`, `.superpowers` e `agent-repos` em SKILL, references, agents, instructions, identity, objectives e knowledge: nenhuma ocorrência.
- `cmp` para cada um dos 20 arquivos instalados contra o caminho correspondente da origem: todos iguais, exit 0.
- SHA-256 dos seis arquivos em `knowledge/original/` conferidos contra `knowledge/MANIFEST.md`: **6/6 OK**.
- `bash scripts/validate-agent-repo.sh`, na worktree: `agent repository validation passed`, exit 0.
- `git diff --check`: exit 0.
- Mensagem Q3 extraída entre as seções de resposta e registro, sem newline final, e medida com `wc -m`: **407 caracteres**, limite 600.

O validador estrutural não testa comportamento. A evidência comportamental é a execução integral e a análise por caso em [local-results-2026-09-20.md](local-results-2026-09-20.md), com entradas fixadas em [questions.yaml](questions.yaml).

## Hashes e algoritmo reproduzível

Os hashes abaixo usam SHA-256. Hash de pacote é o SHA-256 da listagem ordenada, em locale C, no formato de saída de `shasum`, incluindo o prefixo relativo `./`, dois espaços entre hash e caminho e newline por linha. Não é hash de tar/zip e não depende de data de modificação.

```sh
find . -type f -print | LC_ALL=C sort | while IFS= read -r task_file; do shasum -a 256 "$task_file"; done | shasum -a 256
```

- Pacote durante o forward test, manifesto da Task 2: `0b465768e1bbeec5a70fbbc5c0b3b9ec9c366e0903888c409a0ab3da5c5c047d`.
- `agent.yaml` durante o forward test: `83dff76a16a9b4acaefc96f29dc242c30db872cc88a4e47f2d2fa0f82e5546dd`.
- Pacote final, com as três referências de evidência: `d528819cb655a25963248be6151d60e2eddd2331abcc27388ec40bef2b699f2e`.
- `agent.yaml` final: `0057bc720c115417ef7043376b03769b944b82511b7bcb5c8a701ae9b526f722`.
- `knowledge/MANIFEST.md`, inalterado: `b42f45ac30624005b22f410796b1afc7e19871aa60a1bf76a341f8d0078f52f2`.

Inventário final completo:

```text
038e297a2d1a2e39e40cd0278d6e6a3adc58aad324d790035175e65093f2a5bb  ./SKILL.md
0057bc720c115417ef7043376b03769b944b82511b7bcb5c8a701ae9b526f722  ./agent.yaml
d1964967c01d4ff5b3e54c6639313dfdc2c535a56be44c1c74e7c204bb212762  ./agents/openai.yaml
853a28385663c09a661e477f7937996364462da2452bddd06a3dbc6fe3224f3e  ./identity/identity.md
8ec4b3b44bcd32dd673d2f8c84e87ff3a2a170b15b6c5c8b728b8b87723b3961  ./identity/soul.md
ec4edfb79a14aa60dcd9de37370982ccde15cdcca3db5d1b4ff96f7d3e70a128  ./instructions/guardrails.md
b13d48d87c53d8087e7a1290aaaf7a74058c7efb29453934348fc9e8373a1d23  ./instructions/system.md
4cfee4577277e936d783d477b8c2eae79ec3842e8e220147079291e3301cf890  ./instructions/workflows/main.md
b42f45ac30624005b22f410796b1afc7e19871aa60a1bf76a341f8d0078f52f2  ./knowledge/MANIFEST.md
a5d4f909f3c893d61d2aa2265914a423c2c6c94f0f7ce4f0b5416776b34f12d4  ./knowledge/original/01-FONTES-OFICIAIS-E-VERSOES.md
754d6fcfb84356b76e8f262b72f74beb135689c8bc0546354ec27862def60872  ./knowledge/original/02-KB-CONSOLIDADA-IA-REFORMA.md
bd04fa2361e998bb83d894c8743f7f633d9901066b1e05573bfc1ee9b0b85538  ./knowledge/original/03-DOCUMENTOS-FISCAIS-ELETRONICOS.md
c532693ebfcc6eacacaf8804c846253e4007e704bdcf159fc3245a0cdb22a36c  ./knowledge/original/04-BASE-ORIGINAL-PRESERVADA.md
0aa380ad3b766b9b06da1bd391f4c664295470e5fd6c3355ec5cab309be673cf  ./knowledge/original/05-ECONET-FONTE-SECUNDARIA.md
bfb8bb305b66f4818353c21c1e3ccd2feb59f2757fe369845f7a7dfafd7bab33  ./knowledge/original/06-GAPS-E-LIMITES-DA-IA.md
1a07407eccf46c659dd5fa71e4119d1a86c1abdb93b71898366ed2dddcc7abca  ./objectives/mission.md
b08ccafe413d37d919f0cb6422885b745f64cfb4a3ac436480403e4403941b3f  ./objectives/non-goals.md
93970fe691c9f4bbb31e5eb7350bf87a2dbf038d9106c6034d0d48222cb849ff  ./objectives/success-metrics.md
4b16f42cf704ab3cfa54203676a94f396b79ac52c1439faea0f769de3e2ae0ea  ./references/response-modes.md
368c82fc671446d33b51d152cba2a7f7474c023943b755efb2c49041967d32d2  ./references/source-policy.md
```

## Estado pós-promoção para `validated`

As seções anteriores preservam o histórico da instalação executada enquanto a
skill ainda estava em lifecycle `candidate`. Os hashes
`0b465768e1bbeec5a70fbbc5c0b3b9ec9c366e0903888c409a0ab3da5c5c047d`,
`83dff76a16a9b4acaefc96f29dc242c30db872cc88a4e47f2d2fa0f82e5546dd`,
`d528819cb655a25963248be6151d60e2eddd2331abcc27388ec40bef2b699f2e` e
`0057bc720c115417ef7043376b03769b944b82511b7bcb5c8a701ae9b526f722`
pertencem somente a etapas anteriores à promoção e não identificam o manifesto
nem o pacote distribuível validados finais.

Depois da comparação funcional independente e da verificação contra as fontes
originais, a skill foi promovida para `validated`, mantendo a versão `0.2.0` e
os mesmos limites de uso. O destino continuou com **20 arquivos regulares, zero
symlinks**, todos iguais aos caminhos distribuíveis correspondentes da origem.

- Manifesto final `agent.yaml`:
  `44fb7ef4bc0ba3d4373108211393c2e60e042b6c906d3ad8d9be6bc57786af78`.
- Pacote final, pelo algoritmo reproduzível acima:
  `36570f2744601f294f32dfec58ac6f540bd4b5f45f51aa0462501e65f8e2ee0f`.
- Evidência da comparação: [gpt-comparison-2026-09-20.md](gpt-comparison-2026-09-20.md).
- Evidência de confronto com as fontes:
  [original-source-verification-2026-09-20.md](original-source-verification-2026-09-20.md).

As correções documentais pós-promoção em `README.md`, `HOW-TO-USE.md` e neste
registro não integram o pacote distribuível e, portanto, não alteram os dois
hashes finais acima.

## Self-review e preocupações

O agente novo produziu os seis casos sem acessar respostas anteriores e registrou resultados integrais, fontes usadas, fontes inacessíveis, lacunas, pedidos de dados e decisão segura. Q1 entrega conceito com fonte; Q2 um plano mesmo sem números; Q3 mensagem curta; Q4 investigação sem código arbitrário; Q5 matriz sem carga inventada; Q6 alternativa lícita sem falsa citação. Nenhum caso ficou apenas na recusa.

O pacote herdado menciona versões antigas de NT/IT; a política de consulta do entrypoint impediu a promoção automática dessas versões a vigentes em Q4. Não se atualizou Knowledge histórico nem instrução capturada para “corrigir” a fonte original. A limitação de abertura de alguns portais foi declarada. O teste é qualitativo em uma sessão nova, não uma amostra estatística e não seis contextos separados. A descoberta automática, comparação com baseline online e release não são comprovadas aqui. Esses limites não impedem o gate local, mas devem acompanhar sua interpretação.
