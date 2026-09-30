# Paridade focal — premissa de 2027 — 2026-09-24

## Escopo

Comparação da skill instalada com o GPT personalizado publicado para o pedido
da responsável contábil. Teste sintético com empresa fictícia, sem dados de
cliente. Não substitui validação de cálculo tributário concreto.

## Matriz de verificação

| Critério | GPT online | Skill instalada | Resultado |
| --- | --- | --- | --- |
| 2026, PIS/Cofins cumulativo geral | 3,65% e R$ 3.650 em R$ 100.000 | 3,65% e R$ 3.650 | PASS |
| 2027, somente parcela federal | CBS estimada 9,11% e R$ 9.110 | CBS estimada 9,11% e R$ 9.110 | PASS |
| Ponte entre referência e transição | 9,21% estimados, CBS 9,11% + IBS 0,10% | Mesma decomposição | PASS |
| Natureza do número | Premissa, não alíquota oficial | Premissa, não alíquota oficial | PASS |
| Fonte e consulta | Action chamada com `needs_current_source=true` | `GET /health` e `POST /rag/search` HTTP 200 | PASS |
| Regime excepcional e dados ausentes | Não aplicou 9,21% como carga automática do Simples | Não testado nesta rodada | PASS online; pendente para skill |

O teste independente da skill foi executado por outro agente, que leu apenas o
pacote instalado e fontes necessárias; não leu as avaliações nem a resposta do
GPT online. A resposta reproduziu a conta sintética, identificou os 9,21%
como inferência da [Resolução CGIBS nº 14/2026](https://www.cgibs.gov.br/upload/arquivos/202607/31144942-resoluc-ao-cgibs-n-14-de-29-de-julho-de-2026-proposta-percentual-ibs-cgibs-2027.pdf) e a redução transitória dos
arts. 344 e 347 da [LC 214/2025](https://legis.senado.gov.br/norma/40180341/publicacao/40181429). O retorno do serviço identificou a coleção
`day_rtc_v2_3_20260801` e o banco `ac-staging`.

## Instalação e integridade

- Pacote local: `/Users/levy/.codex/skills/ac-reforma-tributaria-rag`.
- Oito itens seletivos do repositório (`SKILL.md`, `agent.yaml`, `agents/`,
  `profiles/`, `references/`, `instructions/`, `knowledge/`, `connectors/`)
  foram comparados recursivamente com a instalação e estavam idênticos.
- `quick_validate.py`: `Skill is valid!` tanto na origem quanto na instalação.
- `scripts/validate-agent-repo.sh`: `agent repository validation passed`.
- `tests/validate-agent-repo.test.sh`: `validate-agent-repo tests passed`.
- `git diff --check`: passou.

## Limites

A validação focal não repete a suíte comportamental completa P1–P5 da versão
0.2.0. Os oito anexos do GPT foram reconfirmados por nome, mas não baixados nem
comparados binariamente nesta alteração; a última verificação binária
documentada permanece de 2026-09-09. A Action não foi alterada. A alíquota
oficial da CBS para 2027 deve prevalecer quando fixada e verificada.
