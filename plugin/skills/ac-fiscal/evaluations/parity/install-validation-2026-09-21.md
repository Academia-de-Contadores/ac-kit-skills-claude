# Verificação independente da instalação — 2026-09-21

Runtime de origem: `2d57acb710b077e33cbc93bd3ca85c04cd2f2d23`.
Commit da auditoria de fonte: `04fd08cd26e5bd635e08e19b18298d02ada52c81`.
Origem: `/Volumes/SSD-500GB-1/chat/Projetos-codex/gptspersonalizados/agent-repos/ac-agente-fiscal/.worktrees/fiscal-skill-ready`.
Instalação: `/Users/levy/.codex/skills/ac-fiscal`.
Versão/lifecycle conferidos em `agent.yaml`: **0.2.0 candidate**.

## Inventário e comparação byte a byte

A allowlist foi lida de `skill_runtime.package`, usando YAML seguro com suporte
à data. Uma cópia temporária nova foi montada exclusivamente com os caminhos
dessa lista; não foi copiada a árvore inteira do repositório.

Pacote temporário inspecionado:
`/var/folders/fs/m54k6xrj5115ls809st2wnk80000gn/T/ac-fiscal-task3-20260921-35287-81m7df`.
Essa cópia é uma saída de auditoria temporária; nenhum arquivo instalado foi
criado ou alterado pelo avaliador.

| Verificação | Instalação | Pacote temporário |
| --- | ---: | ---: |
| Arquivos regulares | 23 | 23 |
| Arquivos Knowledge | 10 | 10 |
| Links simbólicos | 0 | 0 |
| Arquivos .gitkeep | 0 | 0 |
| Conjunto exato da allowlist | sim | sim |
| Arquivos byte-equal à origem | 23/23 | 23/23 |

A comparação usou `File.binread` para cada caminho e inventário recursivo com
`Find.find`, contando links separadamente. Não basta comparar só nomes.

## Hash reproduzível

Executado em cada raiz, com a mesma representação de caminhos relativa:

```sh
find . -type f -exec shasum -a 256 {} + | LC_ALL=C sort -k 2 | shasum -a 256
```

- Instalação: `fa6ac4b0e6e7f73ed09a04ad98d68359a270966ba3a369fcdfff9d3e968768b0`
- Pacote temporário novo: `fa6ac4b0e6e7f73ed09a04ad98d68359a270966ba3a369fcdfff9d3e968768b0`
- Valor esperado informado pelo controlador: `fa6ac4b0e6e7f73ed09a04ad98d68359a270966ba3a369fcdfff9d3e968768b0`
- Resultado: três valores iguais, ambos os comandos encerrados com código 0.

O hash é do inventário ordenado de hashes e caminhos, não de um arquivo tar/zip.
A contagem de Knowledge corresponde aos dez caminhos de
`skill_runtime.knowledge`, sem os nove originais históricos contaminados por DP.

## Validações novas desta rodada

| Comando | Resultado |
| --- | --- |
| `bash tests/validate-agent-repo.test.sh` | exit 0; validate-agent-repo tests passed; Fiscal skill validator tests passed |
| `bash scripts/validate-agent-repo.sh` | exit 0; agent repository validation passed |
| `bash tests/validate-fiscal-skill.test.sh` | exit 0; Fiscal skill validator tests passed |
| `ruby scripts/validate-fiscal-skill.rb` | exit 0; Fiscal skill package validation passed |
| `quick_validate.py .` | exit 0; Skill is valid! |
| `quick_validate.py /Users/levy/.codex/skills/ac-fiscal` | exit 0; Skill is valid! |
| `git diff --check` | exit 0; sem saída |

Os dois comandos `quick_validate.py` usaram explicitamente:
`/Users/levy/.pyenv/versions/3.10.13/bin/python3.10`, com o validador em
`/Users/levy/.codex/skills/.system/skill-creator/scripts/quick_validate.py`.

Os testes estruturais não substituem a avaliação comportamental: P4 falha no
gate de aprovação imediata da ação exata. Resultado local: **5/6**, sem promoção
de lifecycle e sem correção de runtime nesta rodada.

## Limites e integridade

Os outputs locais e o Markdown congelado do GPT foram recebidos como evidência
e permaneceram sem edição. O avaliador não consultou o GPT, navegador ou web,
não alterou instalação/runtime, catálogo, remoto ou GPT.

O Markdown congelado já contém seis linhas com espaço final (21, 24, 74, 102,
106 e 108). Elas são preservadas por integridade da captura. O comando pedido
`git diff --check` verifica alterações não staged e passou; a verificação
adicional de todo o conteúdo staged sinaliza esses seis espaços já existentes.
Os relatórios novos não introduzem espaços finais.

A prova acima estabelece igualdade entre allowlist local, instalação e pacote
reconstruído; não comprova bytes atuais do Knowledge online nem identidade do
modelo da captura. Consulte `gpt-comparison-2026-09-21.md`.

`hashes-2026-09-21.sha256` contém hashes reais dos arquivos de evidência,
incluindo entradas/rubrica, captura congelada, outputs brutos e relatórios;
exclui a si próprio para evitar autorreferência. Os hashes de innerText online
ficam rotulados separadamente na comparação e na matriz, nunca como hashes de
arquivos inexistentes.
