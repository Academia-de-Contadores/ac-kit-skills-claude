# Escopo do kit

O kit é curado: entra só o que resolve uma rotina real do escritório contábil e passa pelo padrão de qualidade. Ideia nova é bem-vinda, mas precisa vencer os dois critérios abaixo.

## O critério

Uma proposta de skill nova, ou de mudança numa skill existente, precisa de:

1. **Problema observado.** Um caso real de uso: o que a aluna pediu, o que a skill fez e o que deveria ter feito. Uma melhoria hipotética ("seria melhor se...") não basta.
2. **Encaixe no kit.** Não repete o que uma skill existente já faz, combinada com outra. Se a necessidade se resolve usando duas skills em sequência (por exemplo `ac-fiscal` e depois `ac-processos-escritorio`), ela não vira uma skill nova.

## Entra no kit

- Skill que prepara rascunho, checklist, análise ou explicação revisável para uma rotina contábil, de gestão ou de conteúdo do escritório.
- Skill com cenários de teste em `evaluations/` (casos fictícios, sem dados de cliente).
- Skill que diz o que não sabe: separa regra confirmada de ponto a validar e não inventa número, prazo ou alíquota.

## Não entra no kit

- Material interno da Academia (mapas de Drive, planilhas, automações, skills de operação da equipe).
- Dados de clientes, nomes reais, CPF, CNPJ, documentos, prints com dados identificáveis.
- Credenciais, tokens, endpoints privados, caminhos do computador de quem criou a skill.
- Hooks, servidores MCP, configurações que mudam permissões ou aprovam ações sozinhas. O build recusa esses componentes.
- Skill que executa ação externa (enviar, protocolar, emitir, pagar, transmitir) sem aprovação explícita da profissional.

## Status das skills

- **estável**: testada em cenários e publicada.
- **beta**: publicada, mas ainda sem teste em conta real de aluna. Aparece marcada no README.

O status de cada skill fica em [catalogo/departamentos.json](catalogo/departamentos.json).
