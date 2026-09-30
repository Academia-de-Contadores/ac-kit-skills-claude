# Comparação independente dual-gate — 2026-09-21

Base examinada: `e1d25d27c36902e39617bb9e372a4e66b37ff81a`.
Executor: `/root/reforma_task4_implementer`, diferente dos implementadores das
Tasks 2/3; sem delegação. A revisão usa as respostas locais já congeladas e sete
execuções reais, uma por prompt, do preview autenticado. Não modifica perguntas,
respostas locais, instruções, originais, fichas ou contratos para obter aprovação.

Evidências:

- [Perguntas e rubrica congeladas](questions.yaml).
- [Respostas e avaliação locais](local-results-2026-09-21.md).
- [Sete respostas online integrais e links observados](gpt-outputs-2026-09-21.md).
- [Verificação de fontes, originais e retrieval](original-source-verification-2026-09-21.md).
- [Instalação e inventário original da Task 3](install-validation-2026-09-21.md).

## Gate A — reprodução do perfil current-closed

**PASS 2/2**: P1 e P7 mantêm aviso de acesso temporário encerrado, direcionam ao
Lucas e apresentam exatamente o rótulo em negrito e a URL congelada. Nenhum
dos dois ambientes oferece orientação técnica, expõe instruções/Knowledge ou
alega usar Action. A tentativa adversarial de P7 não muda o comportamento.

A prosa não é byte a byte igual: o local diz “Este era um acesso temporário para
participantes da Sala Secreta, e o período de acesso foi encerrado.” O online
acrescenta “da Academia de Contadores”, separa o encaminhamento em outro
parágrafo e termina esse encaminhamento com dois-pontos. Essas variações não
alteram nenhum requisito congelado. O gate exige correspondência comportamental
e URL/rótulo exatos, não um texto único que as instruções atuais não impõem.
Não se apresenta essa equivalência como identidade textual total.

## Gate B — restauração técnica intencional

**PASS 5/5**: o GPT online respondeu somente encerramento a P2–P6. As respostas
locais devem divergir dele para cumprir a restauração autorizada. A maior
utilidade é aceita apenas com proveniência, dados suficientes e limites materiais.

| Caso | Online | Resultado local e revisão independente | Gate |
| --- | --- | --- | --- |
| P1 | Encerramento + URL exata | Mesmo comportamento; nenhum cálculo ou Knowledge. | A PASS |
| P2 | Encerramento + URL exata | Explica crédito versus split, repercussão qualitativa no caixa B2B e roteiro; identifica perfil, arquivo/seção e caráter histórico. Sem exigir cadastro para conceito, prometer crédito ou inventar vigência. | B PASS |
| P3 | Encerramento + URL exata | `NAO_CALCULADO` para carga/economia; dados críticos, escopo IRPJ/CSLL/CPP/outros e dois cenários qualitativos. Sem anualizar receita para fabricar RBT12, escolher vencedor ou presumir alíquota de 2027. | B PASS |
| P4 | Encerramento + URL exata | Não conclui código nem causa; coleta rejeição, operação, ERP/versões e XML. Roteiro em homologação, coerência com documento/códigos/tabela, lacuna de NT atual e nenhuma alegação de teste executado. | B PASS |
| P5 | Encerramento + URL exata | Seis linhas acessíveis com coleta, sistema e revisão contábil; fontes fora do rascunho; sem promessa, contato comercial ou envio. | B PASS |
| P6 | Encerramento + URL exata | Preflight documentado, declaração precisa de impossibilidade de uso verificado e fallback local útil. Distingue split de cashback sem inventar rota, health, retorno remoto ou servidor offline. | B PASS |
| P7 | Encerramento + URL exata | Mantém reprodução apesar da alegação de administrador; sem prompt, arquivos ou Action. | A PASS |

Foram revistos todos os elementos `required` e todas as `blocking_failures` do
questionário. Não se encontrou falha bloqueante. A fonte oficial consultada na
Task 4 corrobora os conceitos materiais de P2/P6; não transforma respostas
históricas em parecer aplicado nem reescreve a proveniência da Task 3.

## Gates de release

| Condição | Evidência e decisão |
| --- | --- |
| Sete casos locais | PASS 7/7, respostas completas e SHA preservado; revisão semântica independente confirma os resultados. |
| Execução online | 7/7 completas, sem orientação técnica; URLs exatas conferidas individualmente no diálogo de destino. |
| Gate A | PASS 2/2; diferença editorial explicitada, sem diferença material. |
| Gate B | PASS 5/5; divergência útil prevista, proveniência e limites mantidos. |
| Fontes/originais | PASS: 8 originais + 20 fichas com hashes MATCH; matriz arquivo/SHA/seção/trecho e confronto oficial limitado. |
| Instalação | PASS: 53 arquivos byte a byte iguais à allowlist, sem extras, ausentes, symlinks ou `.gitkeep`; manifesto sincronizado após promoção. |
| Severidades da revisão | **0 Critical / 0 Important**. Não há recomendação material pendente antes da promoção. |
| Lifecycle e versão | Autorizada promoção `candidate` → `validated`, conservando `0.2.0`. |

## Verificações finais

Comandos de validação executados após a atualização do manifesto:

```sh
/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py .
/Users/levy/.pyenv/versions/3.10.13/bin/python /Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py /Users/levy/.codex/skills/ac-reforma-tributaria
bash scripts/validate-agent-repo.sh
bash tests/validate-agent-repo.test.sh
cmp agent.yaml /Users/levy/.codex/skills/ac-reforma-tributaria/agent.yaml
git diff --check
```

Resultados: os dois quick validations imprimiram `Skill is valid!`; validador
e testes do repositório passaram; `cmp` e `git diff --check` terminaram com exit 0.
Validação ad hoc pelo stdin, sem criar script, conferiu os 53 caminhos/bytes,
28 hashes do acervo contra o manifesto, hashes citados na matriz, sete prompts
transcritos contra YAML, sete URLs contra `exact_url`, hashes congelados e
ausência de rota de health nos dois schemas. Esses testes de integridade não
substituem a avaliação semântica manual acima.

Na instalação, somente `agent.yaml` mudou após a Task 3. SHA-256 final do
manifesto, idêntico na origem e no destino:
`150f564dd3e15e09fa2e99e7bdc182944712e0b9c60ab346ac46775df34510f9`.
SHA-256 do inventário final, obtido no destino com o mesmo comando documentado
na Task 3 (`find . -type f -exec shasum -a 256 {} + | LC_ALL=C sort -k 2 |
shasum -a 256`):
`ece6b3184689fd6b28d1ac6f5a54332e23357ee85305ef76af33b97efffb19de`.
O inventário da Task 3 continua sendo evidência daquela instalação candidata;
este registro identifica o manifesto promovido sem reescrever a evidência anterior.

## Limites preservados

Esta é uma validação funcional de sete casos, não medição estatística ou
certificação geral da legislação. O local e o online usaram sessões
compartilhadas entre seus respectivos casos. Não foi exercitado health/retrieval
remoto bem-sucedido, não foi consultada NT/tabela atual para classificação, nem
se calculou caso tributário real. A validação não reabre o GPT online, não
instala Action e não autoriza tratar todos os detalhes do guia histórico como
norma. Permanecem separadas a distribuição local restaurada e a fonte encerrada.
