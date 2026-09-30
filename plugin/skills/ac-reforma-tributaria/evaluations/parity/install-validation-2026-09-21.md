# Validação da instalação seletiva — 2026-09-21

## Escopo e inspeção prévia

Base: `13ca403c8d95427b2370acb73c24ac6a86e209fc`.
Origem: worktree `reforma-tributaria-skill-ready`.
Destino: `/Users/levy/.codex/skills/ac-reforma-tributaria`.

O destino e seu `SKILL.md` não existiam na inspeção inicial (`ls -ld` retornou
“No such file or directory”). Antes da criação foram repetidos `test ! -e`
e `test ! -L`; ambos passaram. Nenhuma instalação anterior, arquivo ou diretório
foi removido. A árvore distribuível da origem também não continha symlinks.

Os sete casos foram congelados antes da instalação em `2026-09-21T04:31:42Z`.
SHA-256 de `questions.yaml`:
`19c12d1a929c93b856c28d56f5ea697a03c3fa42fb095fc64355ef02926ffb2d`.

## Seleção e cópia

Somente esta allowlist foi passada à cópia:

```text
SKILL.md
agent.yaml
agents/
profiles/
references/
instructions/
knowledge/
connectors/
identity/
objectives/
```

Comando executado na origem, após a inspeção:

```sh
mkdir /Users/levy/.codex/skills/ac-reforma-tributaria
rsync -a --exclude='.gitkeep' SKILL.md agent.yaml agents profiles references instructions knowledge connectors identity objectives /Users/levy/.codex/skills/ac-reforma-tributaria/
```

Não se usou cópia da raiz nem `--delete`. Git, SDD, avaliações, relatórios,
governança, testes, validadores, docs de manutenção do repositório e todos os
placeholders `.gitkeep` ficaram fora. As fichas históricas de manutenção/testes
**dentro de `knowledge/source-package/`** pertencem ao acervo preservado de vinte
documentos e foram mantidas, assim como as referências dos conectores. Elas não
são scripts ou ferramentas de manutenção executáveis.

Após PASS 7/7, o manifesto recebeu somente três referências às evidências de
paridade, mantendo `agent.version: 0.2.0` e `agent.lifecycle: candidate`.
Esse único arquivo foi sincronizado novamente com `rsync -a agent.yaml` para o
destino. As instruções, perfis, fontes e schemas usados nas respostas não mudaram.

O resultado contém **53 arquivos regulares**, incluindo oito originais,
vinte arquivos do source-package e dois schemas. A primeira validação feita com
cwd no próprio destino executou:

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria
```

Resultado: exit 0, `Skill is valid!`. A listagem de symlinks e de `.gitkeep`
ficou vazia. A comparação inicial com `cmp` nos dois arquivos raiz e
`diff -rq -x .gitkeep` em todas as oito pastas retornou exit 0.

## Inventário reproduzível final

Execute com cwd no destino:

```sh
find . -type f -exec shasum -a 256 {} + | LC_ALL=C sort -k 2
```

O bloco abaixo é a saída integral desse comando, com LF final. SHA-256 da saída,
obtido encadeando `| shasum -a 256`:
`2e91b2f36ab0341c8688b6c6e5634724234af2fa2535173c29f93dbeaa229718`.

```text
63ca5da10bec52c90f1b114e9997b70a20a8de5d5f5c79afc9946bd427f825f9  ./SKILL.md
b8dc656f9dbd8f5521fbe698396e7b5f399a1aad2c37da9b6ea49bb098e9eaa9  ./agent.yaml
cfef76670a6df0386a86d2d9fa99422e58e5ce0f21ace12eb77e865aec94eb38  ./agents/openai.yaml
adfe2185efc004f96061f90c7eeeb1f600f2ff03f6d6c3cbb82467b201dffb44  ./connectors/actions/searchDayRagCorpus/BUILDER-CAPTURE.md
0666f81df961d6a6a53976a5de4523000f7c3a6c41a321f4e24a42d585c1e435  ./connectors/actions/searchDayRagCorpus/README.md
72c5a23b8e0c24abe06726124c5f544d573cbcaccc206ffd1d47a65bfa7e8890  ./connectors/actions/searchDayRagCorpus/openapi.builder-capture.yaml
44dbc7ffd150a7d8527d67080ebece07c0e0b670ee4e1da0cdf0ab1b2d1bb08b  ./connectors/actions/searchDayRagCorpus/openapi.yaml
ba27d1522364a2d025244c69fcaedf977c9e209ee104ab187594046b0fafa4ad  ./connectors/rag/README.md
8e15f300096dd17f0a0b87203e4634bb7bc3e225d16ce8ec7ef365e563920a65  ./identity/identity.md
e80e29997c2326b8a2828b498a22190a27a088f89c5663fdc3f81eef1cff2373  ./identity/soul.md
63c73fc607b2154e5a8b7ee96efaf745cdbbcaea3662494e578151987de205dd  ./instructions/current-live-2026-08-22.md
13c6651cd7f1e85ac100aa3bd9a3727b9ee7147df8f588a89cc94c294a75c199  ./instructions/guardrails.md
7d31d47d23c8253eedb9c216f110f9c67f240e276bb5186c7ef08d1698c389f0  ./instructions/system.md
da7958f1643fc2da039f1690f2e933ba2448bcc6297b87cf7b7432c69d2f73bb  ./instructions/workflows/main.md
2e180c202d7915beca8fdfaf36d5d0d967d45d36a655652f1d1c6621a14d274d  ./knowledge/MANIFEST.md
828099a7ba8b45d89a2909a851860675c4c3dad1870f77b2a0e104ab72eec23c  ./knowledge/live-2026-08-22/MANIFEST.md
aea4cd93446acc095a2dbf17ef2c48a09cd5862e4b07c2323284914f17d22fb8  ./knowledge/original/01-INSTRUCOES-GPT-ACTIONS-RAG (1).md
e1451f787d632b0f2f66647fbafb75513f4586a331f3bd643c0f0d77c811c9c0  ./knowledge/original/02-REQUISITOS-RETRIEVAL (1).md
bae7d563b631d906457ff1d1dd69c56aa6bc828ff749f5fb15548911ac442d1b  ./knowledge/original/03-GAPS-CRITICOS-ANTES-DOS-240-TESTES (1).md
a2d750d58e8dd31b4ebe426611adc44b0b29699e834eb7b115f3d72c736aa4b1  ./knowledge/original/04-MAPA-COBERTURA-LEGAL-E-ARTIGOS (1).md
b324682535242452f1a1357b82e00a8e93647223909a9ad008bf04c52b63ea27  ./knowledge/original/05-MAPA-DFE-XML-ERP (1).md
07d20efd53f806b8c96d34eeada8fa50fc951b048477d1b2a82ff7853ec4f991  ./knowledge/original/06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK (1).md
cf9d10a45334a9df98ed8f1e91b990aae17ef677405a666e9abc829a0ba8ad50  ./knowledge/original/07-REGRAS-DE-NAO-CALCULAR (1).md
696c99a6ea200ef0f19fbc94c59d386b40d823754d3330aab485472837611271  ./knowledge/original/08-GUIA-REFORMA-SEM-SURTO-DAY (1).md
ced39c83d872fde403bee24bd7989883fb2bb8d9f4ed8250855a0cd454f62c3b  ./knowledge/source-package/01-01-INSTRUCOES-GPT-ACTIONS-RAG-V2-1-POS-RAG.md
48c2c0ab749a8fbb5f07572083c3ca851e71ca09756a7a36a4d4d62d62e6ab6c  ./knowledge/source-package/02-02-REQUISITOS-RETRIEVAL-PRODUCAO.md
ecfdd186741adb5daf23d1393bbea3a978604cfd52c984d01337269b136d1ce0  ./knowledge/source-package/03-04-MAPA-COBERTURA-LEGAL-USO.md
63dd0412f7d64e3ab25aa45126e5fe4f5a6d1ef8ffdf4b6025148a6c17056130  ./knowledge/source-package/04-05-MAPA-DFE-XML-ERP-POS-HARDENING.md
dab1b7091535a9cb2ecfa8d339eeeb34f89a2e42bf7e091827f7783270491c55  ./knowledge/source-package/05-06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK-USO.md
4e3763cba559de8d68c16629f4bfd79c47e98dbe20243d3d1e407ceb41c33a1a  ./knowledge/source-package/06-07-REGRAS-DE-NAO-CALCULAR-V2-1.md
8a7efd37b0326dd24894c80be614ab9a2eff1b76d7c54b58c61bfc989be5f695  ./knowledge/source-package/07-08-GUIA-REFORMA-SEM-SURTO-DAY-PEDAGOGIA.md
4dc41fd1fe07859dc5ac39f5833b8a69909eb1d26bf2bac3abd759882cd2357e  ./knowledge/source-package/08-09-FICHA-CRONOGRAMA-BLINDADO.md
474fa73e8ba34e9fa2bf6933ce3edab5292e187d4d582165252723cdeb05df51  ./knowledge/source-package/09-10-FICHA-FONTE-LACUNA-HIERARQUIA.md
3bac512339e7022e6fcd2a918a209163108718e15417f0c0f3b72bc652430902  ./knowledge/source-package/10-11-FICHA-MODO-WHATSAPP-CLIENTE.md
e81ea0a584bee61bed380b74d8b58450e820216e77104384dc474312315db19b  ./knowledge/source-package/11-12-FICHA-CALCULO-REGIME-MOTOR.md
d6c888a4cea26f87886f7328acb080a3d80985e48f4bd9bbc7cff79fdc039a86  ./knowledge/source-package/12-13-FICHA-EXPORTACAO-DOSSIE.md
473c777c25d3501e9c38317ebab2921b78228b67531502b916d6b064e806cdbd  ./knowledge/source-package/13-14-FICHA-REDUCOES-REGIMES-SETORIAIS.md
31b7c9547c2af78358eb9f2284b4d9eb1efc6fb838535b68d65463898e79565f  ./knowledge/source-package/14-15-FICHA-DADOS-MINIMOS-POR-PERGUNTA.md
17aafbfa2afb9da83ac867593eb3c4f81a8774a18eb262c613dc79469ef9a3fd  ./knowledge/source-package/15-16-FICHA-RESPOSTA-COMPLETA-ANTI-QUICK-ANSWER.md
a5a896fcbcf29cdba2c1eb3e44eea823c8cb7cbdadae2a51128a370e3b565465  ./knowledge/source-package/16-17-FICHA-CLAIMS-COMERCIAIS-DISCLAIMERS.md
e7805303fe72c5c6bf0feda8401ee513e98d857876049cfb5949bce891fafceb  ./knowledge/source-package/17-18-FICHA-RETORNO-ACTION-TOPK.md
9635f63a9bb752b10e4c4838a13198525c6a846c9af00702e07f29f7c1e03313  ./knowledge/source-package/18-19-FICHA-TESTES-VIVOS-METODOLOGIA.md
bcc0380d94565842726b26e837571b2f26be52dbe4ba73e2ce7101f24158c596  ./knowledge/source-package/19-20-FICHA-MANUTENCAO-RAG-VERSOES.md
165679be69c3df9a6b41b9ec7435c29193ba8fb7f2b27aee9227e96df9dea97e  ./knowledge/source-package/20-21-FICHA-FALHAS-P0-REGRESSAO.md
640d97e079ca8f36824f01d39cfb70b8f643b3a3db6450ebc004338e39cb10a8  ./objectives/mission.md
2708dca5572be84c0419f60479e76914c329ad361ba8cc683fbe3c23bd8a18f4  ./objectives/non-goals.md
93970fe691c9f4bbb31e5eb7350bf87a2dbf038d9106c6034d0d48222cb849ff  ./objectives/success-metrics.md
29b409fb81d835c3a95316e0759e05a5640b1113eac34e0d732a684b9d6f9558  ./profiles/current-closed/profile.yaml
dc32af99a391fc260ab75abc1c91c42744d97f0230cd85f68aeb47b003e7ca73  ./profiles/legacy-action/profile.yaml
3f1dc375c788a10c2805b7b51ea2b61cac83af8c7cbca6b4bc55a615cb1d492b  ./profiles/restored-technical/profile.yaml
86f2a7b561b75d51eb19979b5045a38b18755736924b81b23f65500046ec8010  ./references/profile-routing.md
b2a5fc5a63bcddfc1b33e6b21b4eb132bb5e2546a990c2e7224e4249e8c1ad4d  ./references/retrieval-contract.md
7d4c6ceb012108faac58fa35c3dbc3390b4205af9a557ee4cac043c9fc284fb0  ./references/source-policy.md
```

## Verificação final

Verificações concluídas até `2026-09-21T04:39:14Z`, após sincronizar o manifesto:

| Verificação | Resultado observado |
| --- | --- |
| `quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria`, com cwd no destino | exit 0, `Skill is valid!` |
| Allowlist e igualdade byte a byte de conjuntos/caminhos/conteúdo | PASS 53/53; nenhum arquivo extra ou ausente |
| Symlinks e `.gitkeep` no destino | 0 e 0 |
| Acervo e contratos | 8 originais + 20 source-package + 2 schemas |
| SHA-256 do inventário calculado por shell e conferido por validação independente | MATCH `2e91b2f36ab0341c8688b6c6e5634724234af2fa2535173c29f93dbeaa229718` |
| Parse YAML, versão e lifecycle em manifesto/perfis instalados | `0.2.0`, `candidate`; todos os perfis em `0.2.0` |
| Referências de avaliações do manifesto | Todas existem na origem; exclusão do destino intencional |
| SHA-256 do questionário congelado | MATCH; sete casos, sem mudança após o congelamento |
| Respostas e avaliações integrais | Sete de cada; URL/Markdown do perfil encerrado exatos em P1 e P7, MATCH 2/2 |
| Schemas preservados | Ambos só definem `/rag/search`; sem rota de health |
| `bash scripts/validate-agent-repo.sh` | exit 0, `agent repository validation passed` |
| `bash tests/validate-agent-repo.test.sh` | exit 0, `validate-agent-repo tests passed` |
| `git diff --check` | exit 0 |
| `git diff --exit-code` contra a base, em instruções, Knowledge e dois schemas | exit 0; sem alteração |

A validação adicional foi executada ad hoc em Python/PyYAML pelo stdin, sem
salvar ou criar script. Ela conferiu conjuntos de arquivos e bytes, YAMLs,
hash congelado, sete blocos de resposta/avaliação, Markdown exato, contratos e
inventário. A avaliação semântica permanece manual e documentada no relatório
de resultados; a checagem de formato não é apresentada como prova semântica.

SHA-256 do relatório de respostas integrais `local-results-2026-09-21.md`:
`eafa3b6a239672824cfb15c2bdde8a679def3fd25cc8eb51541d6bdd77eb6b16`.

## Limites da distribuição

As referências a `evaluations/` no manifesto e no manifesto de Knowledge
apontam a evidências do repositório, excluídas deliberadamente da distribuição;
não são dependências para responder. O README histórico
`connectors/rag/README.md` ainda cita
`evaluations/regression/connector-unavailable.md`, nome antigo ausente também
na origem; o caso atual do repositório é `evaluations/regression/C1.md`.
Essa referência de proveniência não foi usada para roteamento ou runtime, e
nenhum arquivo histórico foi alterado nesta task.

A validação não instala uma Action, não comprova serviço remoto e não certifica
atualidade normativa. Não houve consulta ao GPT online, envio a terceiros,
publicação, push, mudança de lifecycle nem criação de scripts.

## Verificação pós-review final

Esta seção registra a correção documental posterior, concluída em
`2026-09-21T05:24:13Z`, sem reescrever os hashes, resultados ou condições
históricas das seções anteriores. O README instalado do conector foi marcado
como histórico, passou a apontar para o contrato e o caso de regressão atuais e
foi sincronizado byte a byte com a origem. Nenhum arquivo de instrução,
Knowledge ou schema foi alterado.

| Verificação pós-review | Resultado observado |
| --- | --- |
| `quick_validate.py` na origem | exit 0, `Skill is valid!` |
| `quick_validate.py` na instalação | exit 0, `Skill is valid!` |
| Allowlist e `cmp` de todos os caminhos/conteúdos | PASS 53/53; nenhum extra ou ausente |
| Symlinks e `.gitkeep` na instalação | 0 e 0 |
| SHA-256 de `connectors/rag/README.md` na origem e instalação | MATCH `11fe985e121209e2bb4442cf6c9a5eda2d762cb62e930db8bd7cfac1d572ef7a` |
| SHA-256 do inventário instalado recalculado pelo comando documentado acima | `653c6ea8b23c4497b557059454c9b387e9b92b5672e6552f2b5a11e7bed857af` |
| Instruções, Knowledge e dois schemas versus base `3bd551813eb142acc7f8ed7f5fd34768d35d37e0` | sem diff |
| `bash scripts/validate-agent-repo.sh` | exit 0, `agent repository validation passed` |
| `bash tests/validate-agent-repo.test.sh` | exit 0, `validate-agent-repo tests passed` |
| `git diff --check` | exit 0 |

O inventário continua com **53 arquivos regulares**. O hash novo representa a
instalação pós-review; os hashes anteriores continuam sendo a evidência das
capturas candidata e promovida nos momentos em que foram produzidas. Avaliações
permanecem fora do runtime. Push, pull request e merge não foram executados.
