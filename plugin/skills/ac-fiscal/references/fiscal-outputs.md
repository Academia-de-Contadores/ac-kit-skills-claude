# Saídas fiscais operacionais

Escolha somente os formatos úteis ao pedido. Toda saída distingue fatos,
documentos, lacunas, hipóteses e decisão técnica. Campos sem suporte recebem
`[A VALIDAR]`.

## `/triagem`

Entregue `Leitura curta | Rota | Dentro do escopo? | Fatos | Dados faltantes |
Fonte/status | Risco | Próxima ação`. Se o pedido trouxer apenas “qual código
usar?”, não adivinhe: transforme os dados mínimos da rota em checklist.

## `/notas-xml`

Para NF-e, NFC-e, NFS-e, XML, SEFAZ, prefeitura ou Portal Nacional, registre:

- tipo de documento, competência, emissor/tomador, UF e município;
- evento e status alegado, sistema/emissor e evidência disponível;
- notas ausentes, canceladas, devolvidas, retidas ou duplicadas;
- conferências no XML, no documento auxiliar e no relatório do ERP;
- divergência, responsável, evidência de correção e critério de conclusão.

Não conclua adesão municipal, disponibilidade de portal ou regra de emissão sem
fonte oficial atual. Use `LACUNA DE FONTE OFICIAL` quando necessário.

## `/classificacao`

Entregue a matriz **NO TURNO ATUAL**, inclusive quando os dados forem
insuficientes. Não prometa a matriz para depois.

Inclua estas linhas preenchíveis. Não invente códigos:

```text
NCM — [A VALIDAR] | Valor informado | Evidência/lacuna | Critério | Fonte oficial específica a localizar | Decisão humana
CFOP — [A VALIDAR] | Valor informado | Evidência/lacuna | Critério | Fonte oficial específica a localizar | Decisão humana
CST — [A VALIDAR] | Valor informado | Evidência/lacuna | Critério | Fonte oficial específica a localizar | Decisão humana
cClassTrib — [A VALIDAR] | Valor informado | Evidência/lacuna | Critério | Fonte oficial específica a localizar | Decisão humana
```

Complete também item/serviço, operação, origem/destino, destinatário, regime,
documento e NCM/NBS atual. Em `Fonte oficial específica a localizar`, indique a
tabela, ato ou órgão competente que precisa ser confirmado, sem apresentá-lo
como fonte já verificada. Nunca converta hipótese em classificação final.

Quando cClassTrib for aplicável, produza no mesmo turno um briefing mínimo para
Reforma: fato/operação, documento e dados disponíveis, lacunas, critério de
conferência, fonte oficial específica a localizar, risco `[A VALIDAR]`, pergunta
técnica e responsável pela decisão humana.

## `/pre-apuracao`

Comece com `ESTIMATIVA — NÃO É GUIA`. Entregue:

1. competência, regime e finalidade da estimativa;
2. documentos e relatórios recebidos;
3. notas/XML, cancelamentos, devoluções e retenções a conferir;
4. memória dos valores informados e reconciliações pendentes;
5. divergências, premissas e itens não incluídos;
6. revisão técnica e evidência exigidas antes de qualquer guia;
7. estado operacional de eventual guia, se ela tiver sido pedida ou prevista.

Não apresente data de vencimento, alíquota ou valor final sem fonte e dados
aplicáveis. Não gere, pague nem transmita guia.

Quando o pedido mencionar emissão, pagamento ou transmissão de guia, não pare
na revisão técnica. Acrescente este bloco, mesmo que a ação seja futura:

- `PREPARAR —` memória, dados e valores propostos para conferência;
- `REVISAR —` responsável técnico, validações e pendências;
- `GATE HUMANO — BLOQUEADO` enquanto não houver sistema, alvo, obrigação,
  competência e conteúdo/valores exatos; depois de completos, exigir aprovação
  explícita imediatamente antes daquela ação exata;
- `EXECUTAR —` somente com ferramenta autorizada e gate válido para a ação;
- `EVIDÊNCIA — NÃO EXECUTADO` até existir recibo, protocolo, log ou tela real.

Aprovação do plano, da estimativa, da pré-apuração ou da revisão não autoriza a
emissão, o pagamento, a transmissão, o reenvio nem a próxima ação.

## `/dominio-fiscal`

Monte checklist por `Preparação | Importação | Parâmetros | Conferência |
Divergências | Revisão | Handoff`. Identifique empresa anonimizada, competência,
tipo de documento, arquivo/relatório, mensagem de erro e tela higienizada.
Registre o que foi apenas sugerido; não afirme alteração no Domínio sem
evidência real e aprovação para a ação exata.

## `/regularizacao`

Para CND, PGFN, dívida ou parcelamento, entregue órgão, pendência, período,
status alegado, documentos, acesso/procuração existente, modalidades a pesquisar,
fonte oficial e decisão técnica. Preparar a comparação é permitido; consultar
com credencial, escolher modalidade, aderir, transmitir ou pagar não é.

## `/reforma-handoff`

Use quando houver CBS, IBS, split payment, créditos, DFe/XML, ERP, cClassTrib ou
cronograma 2026–2033:

```markdown
Agente destino: $ac-reforma-tributaria-rag
Motivo do handoff: [sinal de Reforma]
Fatos e documentos: [lista]
Análise Fiscal já realizada: [lista]
Lacunas e fonte oficial: [lista]
Risco: [A VALIDAR]
Pergunta técnica para Reforma: [pergunta]
Decisão humana posterior: [responsável]
```

O handoff preparado não significa que outra skill foi executada.

Quando o handoff mencionar ou prever parametrizar, alterar, importar, emitir ou
outra mutação de ERP/sistema, escolha uma das duas saídas abaixo:

- Se for estritamente análise, não prometa fluxo de execução nem afirme ação
  externa. Não imponha os blocos operacionais a caso sem ação externa.
- Se organizar qualquer fluxo de execução, inclua estes cinco estados separados:
  - `PREPARAR —` dados, conteúdo e valores/parâmetros propostos;
  - `REVISAR —` responsável técnico, conferências e pendências;
  - `GATE HUMANO —` aprovação explícita imediatamente antes da ação exata,
    identificando sistema, ambiente, alvo/empresa, obrigação, competência e
    conteúdo/valores/parâmetros exatos;
  - `EXECUTAR —` somente com ferramenta autorizada e gate válido;
  - `EVIDÊNCIA —` recibo, protocolo, log ou tela real.

No ramo com execução pedida ou prevista, se faltarem sistema, ambiente,
alvo/empresa, obrigação, competência ou conteúdo/valores/parâmetros exatos,
escreva literalmente `GATE HUMANO — BLOQUEADO`, liste as lacunas e mantenha
`NÃO EXECUTADO`. Revisão, planilha ou handoff não autoriza execução.

## `/mensagem-cliente`

Produza rascunho simples com o que foi conferido, o que falta, impacto prático,
prazo apenas se sustentado e próximo passo. Separe preparação, gate de aprovação
e envio. Até a aprovação da ação exata, marque `NÃO ENVIADA`.
