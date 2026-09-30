# Changelog

Todas as mudanças relevantes deste agente serão registradas aqui.

## Unreleased

- Confirma a release 0.2.0 como `validated`: o confronto P1–P5 com artefatos
  originais verificou as atribuições materiais de P1–P4 e o fallback sem fonte
  de P5.
- Marca a primeira comparação como histórica/superada, preserva o PASS
  comportamental r2 e acrescenta o gate de proveniência aprovado.
- Corrige README/HOW-TO-USE para instalação seletiva dos oito itens
  distribuíveis, sem checkout completo dentro da pasta de skills.
- Adiciona manual operacional, referência completa da estrutura e guia de contribuição expandido.
- Torna os documentos operacionais obrigatórios na validação.

- Estrutura inicial do template canônico.

## 0.2.1 — 2026-09-24

- Atualiza o GPT online e a skill para incluir a premissa contábil estimada de
  9,21% em simulações de 2027, sem afirmar alíquota oficial da CBS.
- Separa, no cenário padrão, CBS estimada de 9,11% após ajuste de 0,1 ponto
  percentual e IBS transitório de 0,10%; restringe 3,65% ao PIS/Cofins
  cumulativo aplicável em 2026.
- Preserva os oito anexos e a Action do GPT, registra captura e teste de
  regressão da mudança.

## 0.2.0 — 2026-09-20

- Promove o agente para `validated` após reteste funcional independente com PASS 5/5 frente às respostas reais preservadas do GPT de referência.
- Preserva a comparação r2, quatro retornos novos do endpoint, respostas completas e fallback local de indisponibilidade com explicação e checklist provisórios.
- Registra a captura atual, a instalação verificada e a comparação r2 no manifesto; mantém skill, contrato, Knowledge, schema, GPT e instalação sem alterações nesta rodada.
- Mantém a versão 0.2.0 e as evidências da rodada anterior para rastreabilidade.
