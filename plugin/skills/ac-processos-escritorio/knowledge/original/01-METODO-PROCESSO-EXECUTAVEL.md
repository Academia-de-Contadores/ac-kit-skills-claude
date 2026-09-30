---
title: Método do Processo Executável
version: ss_ea_process_agent_v2
entra_no_rag: sim
---

# Método do Processo Executável

## Conceitos

- **Processo:** sequência conectada de ações que transforma entradas em um resultado observável.
- **Gatilho:** evento verificável que inicia a execução.
- **Entrada:** documento, informação, acesso ou condição necessária.
- **Passo:** ação com verbo, responsável e resultado verificável.
- **Responsável:** função que responde pela conclusão.
- **Substituto:** função capaz de executar na ausência do responsável.
- **Limite de autonomia:** o que pode ser decidido sem escalar.
- **Revisão:** checkpoint humano antes de risco, transmissão ou entrega.
- **Evidência:** registro que comprova execução ou revisão.
- **Exceção:** situação fora do fluxo padrão.
- **Escalonamento:** condição que determina quando e para quem pedir decisão.
- **Handoff:** entrega clara para a próxima função ou departamento.
- **Objetivo observável:** resultado que outra pessoa consegue verificar.
- **SLA interno:** prazo operacional definido pelo escritório e sujeito a validação.

## Processo não é lista solta

Uma lista de tarefas não se torna processo enquanto não houver:

1. início e fim;
2. relação entre as etapas;
3. papéis claros;
4. critérios de decisão;
5. evidências;
6. tratamento de exceções;
7. handoff;
8. teste com outra pessoa.

## Perguntas mínimas

### Começo e resultado

- O que dispara o processo?
- Qual resultado precisa existir no final?
- Quem recebe ou usa esse resultado?

### Entradas

- O que precisa chegar antes de começar?
- Onde chega?
- Como se verifica se está completo?

### Execução

- Quais passos realmente acontecem hoje?
- O que a pessoa produz em cada passo?
- Onde existem esperas, retornos ou retrabalho?

### Papéis e autonomia

- Quem executa?
- Quem substitui?
- O que pode ser decidido sem chamar a dona?
- Qual evento exige escalada?

### Qualidade

- Qual evidência comprova conclusão?
- Onde existe revisão humana?
- Qual erro teria maior impacto?
- Como o próximo setor recebe o handoff?

## Critérios para o primeiro teste

Um processo está pronto para teste inicial quando:

1. o início e o fim estão definidos;
2. as entradas estão acessíveis;
3. os passos usam verbos e seguem uma ordem;
4. responsável e substituto aparecem por função;
5. os limites de autonomia estão explícitos;
6. revisões e evidências estão definidas;
7. exceções indicam quando escalar;
8. outra pessoa consegue tentar executar;
9. existe prazo interno a validar;
10. o teste produz aprendizado para a versão seguinte.

## Diagnóstico de dependência da dona

Marque como lacuna quando:

- somente a dona sabe onde encontrar a entrada;
- a equipe pede autorização para decisões recorrentes;
- a qualidade depende de memória, e não de evidência;
- não há substituto;
- o handoff acontece por mensagem informal sem critério;
- a exceção não possui regra de escalonamento;
- a dona precisa revisar tudo, inclusive itens de baixo risco.

O objetivo não é eliminar a dona. É separar decisão estratégica ou técnica de interferência operacional evitável.

## Linguagem recomendada

- Prefira: `validar`, `registrar`, `conferir`, `encaminhar`, `evidenciar`, `escalar`.
- Evite: `garantir`, `automatizar tudo`, `eliminar erros`, `funcionar sem liderança`.
- Use `prazo interno a validar` quando não houver fonte suficiente para prazo obrigatório.
