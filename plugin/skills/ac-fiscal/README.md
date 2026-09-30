# Agente Fiscal Oficial

| Campo | Valor |
| --- | --- |
| ID | `ac.fiscal` |
| Skill | `$ac-fiscal` |
| GPT representado | [`g-6a72595c828c8191aec02f7931d9c626`](https://chatgpt.com/gpts/editor/g-6a72595c828c8191aec02f7931d9c626) |
| Versão | `0.2.0` |
| Lifecycle | `validated` |

## O que esta skill faz

A skill organiza rotinas fiscais brasileiras em triagens, checklists, matrizes
de conferência, briefings e handoffs. Ela cobre notas e XML, NF-e/NFC-e/NFS-e,
SEFAZ, prefeitura, Portal Nacional, CFOP/NCM/CST/cClassTrib, regimes, CND,
parcelamento, pré-apuração, Domínio Fiscal e encaminhamento para Reforma.

A skill validada é mais operacional que o GPT preservado, mas mantém limites
mais explícitos: não inventa regra ou fonte vigente, não fecha
classificação, cálculo ou guia, não escolhe regime, não usa segredo e não
executa ação externa sem aprovação humana imediatamente antes da ação exata.

Os GPTs duplicados ou temporários da família Fiscal não recebem outra skill.
Todos reutilizam este repositório e `$ac-fiscal`; o link acima identifica o GPT
canônico usado como baseline comportamental.

## Knowledge correto

O pacote distribuível usa exatamente dez documentos:

- `knowledge/original/00-INDICE-FISCAL.md`;
- os nove `.md` de `knowledge/live-2026-08-22/` listados em `agent.yaml`.

Os outros nove arquivos de `knowledge/original/` são preservados apenas para
auditoria porque a captura contém material de DP. Eles não entram na skill. Os
nomes dos dez anexos foram reconfirmados no GPT em 2026-09-21; os bytes online
atuais continuam como `GAP`, por isso a seleção é uma baseline histórica,
provisória e reversível.

## Exemplo para leigos

```text
Use $ac-fiscal. Importei XML no Domínio e o total não bateu. Ainda não sei se há notas canceladas ou devoluções. Monte o checklist de conferência e diga o que preciso enviar ao responsável fiscal.
```

A resposta deve organizar o que já se sabe, listar os documentos faltantes,
marcar riscos e preparar a revisão. Ela não deve afirmar que corrigiu o Domínio.

## Validação da release

O pacote contém uma allowlist de 23 arquivos, incluindo os dez documentos
Fiscal. Os seis casos locais P1–P6 qualificam: 12, 11, 12, 12, 11 e 12 pontos,
respectivamente, totalizando 70/72 e 36/36 gates PASS. A instalação seletiva
preserva 23 arquivos
regulares, dez arquivos de Knowledge, nenhum symlink e nenhum `.gitkeep`.

A baseline online congelada qualificou 2/6 casos sob a mesma rubrica de release.
Isso não bloqueia a publicação: o GPT online é a fonte preservada de identidade
e comportamento, não o teto de utilidade ou segurança da skill. As instruções
online têm paridade byte a byte, os dez nomes de anexos coincidem e os bytes
online atuais continuam como `GAP`. Veja o relatório durável em
`evaluations/parity/release-validation-2026-09-21.md`.

Para usar, instalar ou manter, consulte [HOW-TO-USE.md](HOW-TO-USE.md). Para a
evidência da fonte, veja
[evaluations/live-editor-audit-2026-09-21.md](evaluations/live-editor-audit-2026-09-21.md).
