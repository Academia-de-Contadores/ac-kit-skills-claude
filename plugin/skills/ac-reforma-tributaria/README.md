# Agente da Reforma Tributária Oficial

| Campo | Valor |
| --- | --- |
| ID | `ac.reforma-tributaria` |
| Skill | `$ac-reforma-tributaria` |
| Versão | `0.2.0` |
| Lifecycle | `validated` |

## Propósito

Restaura no Codex a orientação consultiva da Day sobre Reforma Tributária usando
o acervo histórico local. O GPT online encerrou o acesso temporário da Sala
Secreta; a auditoria de 2026-09-21 confirmou **zero Knowledge e zero Actions**.
Esta distribuição não reabre nem altera o GPT.

| Perfil | Quando usar |
| --- | --- |
| `restored-technical` | Padrão para orientação técnica, cenários e comunicação com clientes; usa oito originais e vinte fichas preservadas, com verificação de fontes e dados. |
| `current-closed` | Reprodução/auditoria do GPT encerrado; somente aviso e link exato para Lucas. |
| `legacy-action` | Integração histórica opcional, somente após health check real; indisponibilidade leva ao Knowledge local. |

O entrypoint é [SKILL.md](SKILL.md). Os perfis técnicos podem explicar, organizar
hipóteses e propor próximos passos sem a Action. Não fecham cálculo, regime ou
classificação sem dados e fontes suficientes. Os dois schemas preservados não
comprovam integração ativa. A versão `0.2.0` está `validated`: passou pela
instalação seletiva (53/53 arquivos), pelo forward test local (7/7), pelos
Gates A (2/2) e B (5/5), pela verificação de fontes/originais e pela revisão
independente com zero achados Critical/Important. As evidências estão em
`evaluations/parity/`.

O lifecycle `validated` descreve os gates técnicos e não, por si só, o canal de
distribuição. Para produção, confirme que o commit validado está em `main` ou em
uma tag/release aprovada e que a instalação aponta exatamente para esse commit.

## Instalação seletiva

Instale em uma pasta `ac-reforma-tributaria` no diretório de skills do Codex,
copiando somente `SKILL.md`, `agent.yaml`, `agents/`, `profiles/`, `references/`,
`instructions/`, `knowledge/`, `connectors/`, `identity/` e `objectives/`.
Não copie Git, `.superpowers/`, avaliações, relatórios, governança, testes,
validadores, docs de manutenção ou `.gitkeep`; não use symlinks para a worktree.
Veja [o procedimento e a verificação](HOW-TO-USE.md#instalação-seletiva-no-codex).

Exemplo: “Use `$ac-reforma-tributaria` para organizar os dados necessários à
comparação de regimes deste cliente.” A seleção implícita está habilitada.

## Usar e manter este agente

1. Para operar a skill, leia `SKILL.md` e as referências do perfil escolhido.
   Para manutenção, consulte também o núcleo histórico em `objectives/`,
   `identity/` e `instructions/`, preservando suas capturas originais.
2. Para reconstruir ou adaptar esta versão, siga `HOW-TO-USE.md` e use
   `agent.yaml` como índice dos componentes canônicos.
3. Registre fontes curadas em `knowledge/` e
   contratos externos em `connectors/`; nunca registre credenciais.
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
