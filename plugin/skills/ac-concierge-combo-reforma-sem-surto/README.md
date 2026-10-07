# Concierge do Combo da Reforma Sem Surto

Origem: GPT "Day Agente da Reforma Tributária Sem Surto".

| Campo | Valor |
| --- | --- |
| ID | `ac.reforma-tributaria-sem-surto` |
| Versão | `0.2.0` |
| Lifecycle | `validated` |

## Propósito

Especialista consultiva em Reforma Tributária do Consumo para contadores, com
foco em IBS, CBS, IS, DFe/XML/ERP, créditos e respostas claras para clientes.

Este repositório é a fonte de verdade do agente existente e também contém a
skill instalável `$ac-concierge-combo-reforma-sem-surto`. O GPT online permanece como
baseline preservado; a skill validada acrescenta uma interface mais acionável
sem inventar fontes nem fechar cálculos, regimes ou classificações sem suporte.

## Invocação

Depois da instalação seletiva descrita em `HOW-TO-USE.md`, invoque a skill pelo
nome em um pedido real, por exemplo:

```text
Use $ac-concierge-combo-reforma-sem-surto para diagnosticar o impacto da RTC neste cliente e montar um plano D7/D30/D90.
```

Também é possível usar os comandos `/diagnostico`, `/responder-cliente`, `/dfe`,
`/classificacao`, `/simular-regime`, `/checklist-erp` e `/fontes` no pedido. A
skill não declara Action, MCP ou conector; trabalha com os arquivos versionados
do pacote e com fontes oficiais quando o ambiente permitir consulta.

## Usar e manter este agente

1. Leia `objectives/`, `identity/` e `instructions/` antes de operar ou alterar o
   agente; esses diretórios definem missão, papel, comportamento e limites.
2. Para instalar somente o pacote distribuível ou adaptar esta versão, siga
   `HOW-TO-USE.md` e use `agent.yaml` como índice dos componentes canônicos.
3. Registre procedimentos internos opcionais em `skills/<nome>/SKILL.md`; o
   entrypoint distribuível desta skill é o `SKILL.md` na raiz. Registre fontes
   curadas em `knowledge/` e contratos externos em `connectors/`; nunca registre
   credenciais.
4. Adicione avaliações para cada mudança comportamental e execute:

   ```bash
   bash tests/validate-agent-repo.test.sh
   bash scripts/validate-agent-repo.sh
   ```

5. Siga o processo de contribuição antes de abrir um pull request.

## Guias do repositório

- [Como usar e reconstruir o agente](HOW-TO-USE.md)
- [Estrutura e destino de cada arquivo](docs/REPOSITORY-STRUCTURE.md)
- [Como contribuir](governance/CONTRIBUTING.md)
- [Política de dados e segredos](governance/DATA-AND-SECRETS.md)
- [Política de mudanças](governance/CHANGE-POLICY.md)

## Proteções versionadas e verificáveis

O `.gitignore` reduz o risco de adicionar artefatos locais conhecidos, e
`scripts/validate-agent-repo.sh` rejeita arquivos proibidos, artefatos RAG locais
e arquivos maiores que 5 MB. O workflow `validate` executa esse validador em
pull requests e pushes para `main`. O `CODEOWNERS` solicita revisão para áreas
sensíveis. Workflow e `CODEOWNERS`, isoladamente, não provam bloqueio de merge;
branch protection, rulesets, visibilidade e demais controles devem ser
confirmados na configuração remota. Consulte `reports/task-3-report.md` para a
evidência local e seus limites.
