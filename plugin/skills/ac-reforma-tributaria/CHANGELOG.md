# Changelog

Todas as mudanças relevantes deste agente serão registradas aqui.

## Unreleased

- Adiciona manual operacional, referência completa da estrutura e guia de contribuição expandido.
- Torna os documentos operacionais obrigatórios na validação.

- Estrutura inicial do template canônico.

## 0.2.0 — 2026-09-21

- Valida a skill `$ac-reforma-tributaria` com perfil técnico restaurado padrão,
  reprodução `current-closed` e Action histórica opcional com fallback local.
- Registra PASS 7/7 local, sete respostas integrais do preview autenticado,
  Gate A PASS 2/2 e Gate B PASS 5/5, com revisão independente e zero
  Critical/Important. A divergência técnica útil em relação ao GPT encerrado
  é intencional e documentada.
- Verifica originais e fontes por arquivo, SHA-256, seção/trecho e confronto
  oficial limitado; distingue acervo histórico de regra vigente e preserva
  todos os arquivos do Knowledge e schemas.
- Promove o lifecycle a `validated` e sincroniza o manifesto instalado.
  A validação não certifica vigência normativa geral nem disponibilidade de
  retrieval remoto: health e retrieval não foram executados, com fallback
  local explícito. Não houve alteração de configuração do GPT ou push.
