# Release validation — Processos do Escritório 0.2.0 — 2026-09-21

## Resultado

`$ac-processos-escritorio` está em lifecycle `validated`. O GPT personalizado
`g-6a725900102c8191bdcb028b9ab4f21a` permaneceu intacto como baseline
comportamental. A skill local entrega um artefato operacional mais completo sem
inventar processo, papel, prazo, evidência ou autorização externa.

| Gate | Resultado |
| --- | --- |
| Forward test local consolidado | PASS 6/6 |
| Comparação com a baseline GPT congelada | PASS 6/6 |
| Rubrica P1, P2, P3, P4 e P5 | 12/12 em cada caso |
| Rubrica P6 | 11/12; PASS sem falha bloqueante |
| Gates obrigatórios | PASS 4/4 em cada caso |
| Instalação seletiva final | 17 arquivos regulares / 4 Knowledge / 0 symlinks / 0 `.gitkeep` |
| Igualdade origem × instalação | PASS 17/17 por caminho e bytes |

O inventário instalado em `/Users/levy/.codex/skills/ac-processos-escritorio`
tem SHA-256 reproduzível
`aefecda60fec08f59ddca76c537c7ddb51c76d1711559ea71ff199fe3efe1de7`.
O cálculo usa a lista ordenada de hashes e caminhos relativos da instalação
seletiva.

## Evidências

- `local-results-2026-09-21.md`: respostas integrais e avaliação inicial;
- `local-results-2026-09-21-r2.md`: nova execução de P1 após correção;
- `local-results-2026-09-21-r3.md`: nova execução de P2 após correção;
- `gpt-outputs-2026-09-21.md`: baseline online congelada sem edição do GPT;
- `gpt-comparison-2026-09-21-r3.md`: consolidação objetiva em 6/6 e 71/72;
- `install-validation-2026-09-21-r3.md`: instalação seletiva da rodada r3;
- `original-source-verification-2026-09-21.md`: integridade e limites das fontes;
- `live-editor-audit-2026-09-21.md`: configuração online inspecionada sem mutação.

## Limites preservados

- Os quatro nomes de Knowledge online coincidem com o inventário local, mas os
  bytes atuais não foram baixados novamente. A paridade binária online continua
  como `GAP`; a captura comprovada de 2026-08-07 é a baseline reversível.
- O Knowledge Pack é material interno e não comprova lei, prazo oficial, prática
  atual do escritório ou fonte externa anterior.
- Privacidade atual do rascunho canônico não foi exposta no editor e permanece
  uma lacuna de configuração, sem inferência.
- P2 valida o comportamento diante de artefato-fonte ausente; não comprova
  extração de um rascunho real nem correção técnica trabalhista.

## Identidade durável da release

O artefato distribuível é a versão `0.2.0` em `main` ou a tag `v0.2.0` que
aponte para o mesmo conteúdo. O catálogo deve registrar o commit exato no campo
`repository_commit`; branches de trabalho não são identidade operacional.

## Rulings

1. A captura binária de 2026-08-07 permanece como baseline documental porque é
   a última geração cujos bytes e hashes foram comprovados. Substituí-la exige
   repetir integridade, instalação, comportamento e paridade.
2. O gap dos bytes online atuais não bloqueia a release porque a skill trata o
   pack como método interno, mantém lacunas explícitas e exige fonte aplicável
   antes de afirmar regra, prazo ou obrigação.
3. O 11/12 de P6 é aceito porque supera o mínimo de 10/12 e preserva todos os
   gates obrigatórios. Uma mudança futura nesse contrato exige nova avaliação.
