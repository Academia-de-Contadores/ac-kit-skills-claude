# Release validation — Fiscal 0.2.0 — 2026-09-21

## Resultado atual

`$ac-fiscal` está em lifecycle `validated`. A evidência comportamental atual é
a rodada r4 integral, executada contra o source behavior head
`e682cdc20a459732b316d8e9b63d843563f116ea`. O GPT personalizado
`g-6a72595c828c8191aec02f7931d9c626` permaneceu intacto como baseline de
identidade e comportamento. A skill local mantém os limites: não inventa regra,
fonte, classificação, cálculo, guia ou execução.

| Gate | Resultado |
| --- | --- |
| Forward test local r4 | PASS 6/6; 36/36 gates |
| Notas locais r4 P1–P6 | 12, 11, 12, 12, 11 e 12; total 70/72 |
| Findings r4 | Critical 0 / Important 0 / Minor 2 |
| Baseline online congelada | 2/6 qualificam sob a rubrica da skill; não é gate de release |
| Instruções online | MATCH byte a byte: 4.461 bytes, 134 linhas, SHA-256 `12775f4f9fbf7b0b3fa62a06c6837f920944cbd0a49f1d7ab2eb90453787893b` |
| Inventário Knowledge online | MATCH de nomes 10/10; bytes atuais `GAP` |
| Instalação seletiva | 23 arquivos regulares / 10 Knowledge / 0 symlinks / 0 `.gitkeep` |
| Igualdade pacote × instalação | PASS 23/23 por caminho e bytes |

O hash reproduzível do inventário do pacote e da instalação r4 é
`b5a57d7a87fe2baf5ab1bc528245b81fad36408535cf55e9c4cada1ee4bb22cd`.

## Evidências

- `live-editor-audit-2026-09-21.md`: configuração online inspecionada sem
  mutação, instruções exatas, nomes 10/10 e gaps atuais;
- `local-results-2026-09-21-r4.md`: síntese da execução integral r4;
- `gpt-comparison-2026-09-21-r4.md`: avaliação independente integral da r4,
  incluindo dimensões, gates, contrato de cinco estados e justificativas;
- `scoring-matrix-2026-09-21-r4.yaml`: matriz estruturada com seis dimensões e
  seis gates por caso;
- `install-validation-2026-09-21-r4.md`: prova de pacote, instalação,
  inventário e igualdade byte a byte;
- `hashes-2026-09-21-r4.sha256`: hashes verificáveis dos artefatos r4;
- `gpt-outputs-2026-09-21.md`: saídas online congeladas;
- r1, r2 e r3 permanecem preservadas como evidência histórica. Em especial, o
  FAIL r3 registrou as lacunas que motivaram o reforço de P3 e P5; r2 foi uma
  composição histórica e não é a evidência forward atual.

## Limites preservados

- Os dez nomes de Knowledge online coincidem com o inventário, mas os bytes
  atuais não puderam ser baixados; a paridade binária atual continua `GAP`.
- Nove arquivos de `knowledge/original/` pertencem a uma captura histórica
  contaminada por material de DP e são excluídos da allowlist. Somente o índice
  Fiscal e os nove arquivos da captura de 2026-08-22 entram no runtime.
- A interface exibiu `Thinking 5.6` no seletor e `GPT-5.6 Sol` na prévia; não há
  evidência para inferir um identificador interno único.
- Os primários internos citados pelo Knowledge não estão neste repositório e a
  curadoria não substitui fonte oficial vigente.
- M1 (P2) não explicita UF nem aplicabilidade a perfil de prestador/serviço; M2
  (P5) usa fontes genéricas em parte da matriz. Ambos são limites de completude
  não bloqueantes: não autorizam alterar runtime, fontes ou outputs r4.

## Interpretação da baseline online

Aplicando a rubrica da skill às respostas congeladas do GPT, P2 e P5
qualificam; P1, P3, P4 e P6 não qualificam por gates adicionais de fonte,
handoff ou aprovação. Isso não altera nem rebaixa o GPT: ele é a origem de
identidade preservada. A qualificação local, e não a qualificação da baseline
online, é o gate da skill; a baseline não precisa passar o gate local para
preservar seu papel de identidade e comportamento.

## Verificação final r4

- Fonte de comportamento: `e682cdc20a459732b316d8e9b63d843563f116ea`.
- Pacote: `/tmp/ac-fiscal-r4-package.eGIqmI/ac-fiscal`.
- Instalação/backup recuperável: `/Users/levy/.codex/skills/ac-fiscal` e
  `/tmp/ac-fiscal-r4-backup.i3epNP/ac-fiscal`.
- Pacote e instalação: 23 arquivos regulares, 10 Knowledge, 0 symlinks e 0
  `.gitkeep`; igualdade por caminho e bytes 23/23.
- Hash do pacote e da instalação:
  `b5a57d7a87fe2baf5ab1bc528245b81fad36408535cf55e9c4cada1ee4bb22cd`.
- `quick_validate.py`, validadores do repositório e da skill e testes negativos
  integram o gate final. O check padrão de whitespace (`git diff --check`) é
  aplicado aos arquivos autorais e de runtime; ele não é aplicado aos outputs
  brutos P3 e P5, cujos dois espaços finais são hard-breaks Markdown
  intencionais e preservados por hash. Essa exceção explícita evita um falso
  negativo de whitespace sem transformar a verificação global em um PASS
  artificial.

Este commit posterior registra somente evidência e documentação fora de
`skill_runtime.package`. Nenhum dos 23 arquivos do pacote foi alterado desde
`e682cdc`; por isso a instalação r4 continua byte-equal ao pacote final.

## Identidade durável

O artefato distribuível é a versão `0.2.0`. O catálogo deve registrar no campo
`repository_commit` o commit exato desta release; branches de trabalho não são
identidade operacional durável. Os quatro registros/aliases Fiscal catalogados
continuam aliases da família e não recebem repositórios ou skills próprios.

## Rulings históricos preservados

1. A captura binária de 2026-08-22 continua como baseline documental
   provisória porque é a última geração com bytes e hashes comprovados. Se um
   download atual divergir, preserve a nova geração e repita integridade,
   comportamento e instalação em nova versão.
2. O gap dos bytes online não bloqueia a release porque nenhum conteúdo curado
   é promovido a fonte oficial sem validação competente.
3. O aditamento estrutural de P5 permanece evidência histórica: o contrato de
   `/reforma-handoff` é validado dentro da sua própria seção Markdown e não
   pode ser satisfeito pelos estados de `/pre-apuracao`. A r4 substitui a
   composição anterior como prova comportamental atual, sem reescrever os
   outputs ou relatórios r1/r2/r3.
