# Processos do Escritório Autogerenciável

| Campo | Valor |
| --- | --- |
| ID | `ac.processos-escritorio` |
| Skill | `$ac-processos-escritorio` |
| GPT canônico | [`g-6a725900102c8191bdcb028b9ab4f21a`](https://chatgpt.com/gpts/editor/g-6a725900102c8191bdcb028b9ab4f21a) |
| Alias publicado | `g-6a6ea5f0985c8191971aa805e5ad759f` (`copy`) |
| Versão | `0.2.0` |
| Lifecycle | `validated` |

## Propósito

Transforma uma rotina real do escritório contábil em processo executável,
visível, testável e revisável. A skill pode produzir mapa em uma página, RACI,
checklist, plano de cinco dias e roteiro de teste, sempre separando fatos,
lacunas, hipóteses e decisões humanas.

O GPT online é a baseline comportamental preservada. A skill validada é mais
acionável: entrega uma primeira versão mesmo com lacunas, mas não inventa prazo,
obrigação, responsável, sistema, evidência ou conclusão. Escrita, envio,
publicação, protocolo, transmissão e alteração externa exigem aprovação humana
explícita no momento da ação.

Este repositório representa uma única família. O GPT publicado marcado como
`copy` reutiliza o mesmo repositório e a mesma skill; não recebe duplicata.

## Pacote distribuível

O entrypoint é `SKILL.md`; a interface está em `agents/openai.yaml` e as regras
condicionais em `references/`. A allowlist completa e ordenada está em
`agent.yaml` sob `skill_runtime.package`.

O runtime usa exatamente os quatro arquivos já preservados em
`knowledge/original/`, capturados por download direto em 2026-08-07. Nenhum foi
duplicado. `knowledge/MANIFEST.md` e o validador registram e verificam o SHA-256
e o tamanho de cada um. Os nomes continuam visíveis no GPT em 2026-09-21, mas a
paridade binária com o estado online atual permanece um `GAP` documentado.

## Uso

Depois de uma instalação seletiva do pacote, invoque por exemplo:

```text
Use $ac-processos-escritorio para transformar o recebimento mensal de documentos em mapa, RACI e checklist. Marque tudo que ainda depende de decisão humana.
```

Os formatos `/mapa`, `/raci`, `/checklist`, `/plano-5-dias` e `/teste` estão em
`references/process-outputs.md`. Eles são formatos de entrega, não comandos de
sistema nem autorização de execução externa.

## Estado da release

A release `0.2.0` passou nos seis casos de paridade: P1, P2, P3, P4 e P5
obtiveram 12/12; P6 obteve 11/12; todos satisfizeram os gates obrigatórios de
grounding, evidência, segurança e aprovação. A instalação seletiva mantém 17
arquivos regulares, quatro arquivos de Knowledge e nenhum symlink ou
`.gitkeep`. O relatório durável está em
`evaluations/parity/release-validation-2026-09-21.md`.

Validação local reproduzível:

```bash
bash tests/validate-agent-repo.test.sh
bash scripts/validate-agent-repo.sh
```

O CI executa a suíte e o validador em pull requests e pushes para `main`. A
skill não declara Action, MCP ou conector.

## Guias

- [Uso e instalação seletiva](HOW-TO-USE.md)
- [Estrutura do repositório](docs/REPOSITORY-STRUCTURE.md)
- [Captura e lacunas da fonte](evaluations/source-capture.md)
- [Contribuição](governance/CONTRIBUTING.md)
- [Dados e segredos](governance/DATA-AND-SECRETS.md)
