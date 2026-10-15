# Manutenção do kit

Este repositório é a distribuição pública. `plugin/skills/` contém as cópias revisadas entregues às alunas. As origens e commits ficam em `plugin/FONTES.json`.

## Alterar o kit

1. Edite a skill, guia ou comando pertinente. Para uma nova skill, crie `plugin/skills/<nome>/SKILL.md` com frontmatter name/description e recursos necessários.
2. Atualize a versão em `plugin/.claude-plugin/plugin.json`, o catálogo/guia e a origem em `plugin/FONTES.json` quando mudar o conteúdo distribuído. O build também registra o commit, distinguindo revisões.
3. Rode `python3 -m pip install -r requirements.txt` e `python3 scripts/build.py`. O diretório dist é gerado e não é versionado.
4. Revise o conteúdo e faça commit/push em main (ou revise uma PR antes de mesclar).
5. Aguarde o workflow “Validar e publicar kit” ficar verde. Confira a release e os downloads anônimos.

O workflow roda em push de main e manualmente. Cada commit publicado recebe uma release `kit-<SHA completo>`, preservando versões anteriores. Os nomes dos arquivos não mudam, então os links releases/latest/download continuam válidos. Uma repetição do mesmo workflow não sobrescreve uma release existente.

## Atualizações nos repositórios de origem

Alterar ac-agente-fiscal ou outra origem não atualiza este pacote sozinho. Traga deliberadamente a versão escolhida para plugin/skills, preserve as adaptações Claude, atualize FONTES.json e valide antes de publicar. Isso evita propagar uma mudança incompatível sem revisão. Nenhum agendamento externo foi criado.

## Permissões

O pacote não altera permissões de contas, não distribui credenciais, não contém hooks de autoaprovação e não remove validações profissionais. O modo automático é selecionado pela aluna na interface quando disponível.

## Retorno a uma versão anterior

Baixe os assets da release anterior e aplique pela interface do Claude, preservando personalizações. Não apague releases para corrigir uma nova versão: corrija o código e publique outro commit.

## Instalação em Claude e Codex (1.4.0)

O fluxo canônico está em INSTALL.md. Mantenha README, comandos de encaminhamento e ac-instalar-skills alinhados. Rode `python3 -m unittest discover -s tests -v`, `python3 scripts/build.py` e os validadores oficiais `claude plugin validate .` e `claude plugin validate ./plugin`. A release inclui install.py e seu checksum. Não altere conteúdo técnico para adaptar o instalador. Teste Codex em destino isolado e Claude Code com CLAUDE_CONFIG_DIR isolado; registre separadamente o teste de conta Claude Chat/Cowork.
