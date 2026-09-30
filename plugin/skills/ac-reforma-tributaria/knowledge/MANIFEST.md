# Manifesto do Knowledge original do GPT

## Separação entre estado online e acervo local

Revisão em **2026-09-21**: o GPT permanece acessível, mas está em estado
**`expired/closed`**, com **zero anexos de Knowledge e zero Actions configuradas**.
Os arquivos inventariados aqui são históricos locais; não estão ativos no editor.
Ver [auditoria somente leitura](../evaluations/live-editor-audit-2026-09-21.md).

| Conjunto | Arquivos locais | Relação com o estado atual |
| --- | ---: | --- |
| `original/` | 8 | Downloads históricos de 2026-08-07; hashes e bytes MATCH 8/8. |
| `source-package/` | 20 | Pacote técnico preservado; inventário local abaixo, não upload atual. |
| `../connectors/actions/searchDayRagCorpus/` | 2 schemas | Action histórica/opcional; hashes MATCH nas referências, sem Action configurada online. |
| Knowledge online | 0 | MATCH com manifesto de 2026-08-22; GAP de comparação binária com o acervo local. |

## Originais preservados — captura de 2026-08-07

- **GPT:** `ac.reforma-tributaria`
- **Editor:** https://chatgpt.com/gpts/editor/g-6a7259cd04a48191a3bb1c2833b0ca2f
- **Captura integral:** 2026-08-07
- **Arquivos preservados:** 8/8
- **Método:** download direto de cada anexo no editor autenticado do GPT Builder.

| Arquivo preservado | SHA-256 | Bytes |
| --- | --- | ---: |
| `original/01-INSTRUCOES-GPT-ACTIONS-RAG (1).md` | `aea4cd93446acc095a2dbf17ef2c48a09cd5862e4b07c2323284914f17d22fb8` | 3268 |
| `original/03-GAPS-CRITICOS-ANTES-DOS-240-TESTES (1).md` | `bae7d563b631d906457ff1d1dd69c56aa6bc828ff749f5fb15548911ac442d1b` | 1686 |
| `original/02-REQUISITOS-RETRIEVAL (1).md` | `e1451f787d632b0f2f66647fbafb75513f4586a331f3bd643c0f0d77c811c9c0` | 1875 |
| `original/06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK (1).md` | `07d20efd53f806b8c96d34eeada8fa50fc951b048477d1b2a82ff7853ec4f991` | 1459 |
| `original/08-GUIA-REFORMA-SEM-SURTO-DAY (1).md` | `696c99a6ea200ef0f19fbc94c59d386b40d823754d3330aab485472837611271` | 56005 |
| `original/07-REGRAS-DE-NAO-CALCULAR (1).md` | `cf9d10a45334a9df98ed8f1e91b990aae17ef677405a666e9abc829a0ba8ad50` | 1248 |
| `original/04-MAPA-COBERTURA-LEGAL-E-ARTIGOS (1).md` | `a2d750d58e8dd31b4ebe426611adc44b0b29699e834eb7b115f3d72c736aa4b1` | 2108 |
| `original/05-MAPA-DFE-XML-ERP (1).md` | `b324682535242452f1a1357b82e00a8e93647223909a9ad008bf04c52b63ea27` | 2150 |

Os arquivos foram copiados byte a byte com o mesmo nome exibido no GPT. Os hashes acima são a referência canônica para restauração e auditoria.

Em **2026-09-21**, todos os oito SHA-256 e tamanhos acima foram recalculados
diretamente dos bytes locais, sem normalização ou modificação: **MATCH 8/8** com
as referências deste manifesto. Não houve novo download, pois o editor não
apresenta anexos. MATCH de integridade histórica não é equivalência online.

## Source package — inventário local de 2026-09-21

Contagem: **20 arquivos**. SHA-256 calculado sobre os bytes integrais, sem
normalização. Estes valores estabelecem a referência do inventário atual; não
há hash de upload online para comparação (**GAP de equivalência online**).

| Arquivo em `source-package/` | Bytes | SHA-256 |
| --- | ---: | --- |
| `01-01-INSTRUCOES-GPT-ACTIONS-RAG-V2-1-POS-RAG.md` | 4274 | `ced39c83d872fde403bee24bd7989883fb2bb8d9f4ed8250855a0cd454f62c3b` |
| `02-02-REQUISITOS-RETRIEVAL-PRODUCAO.md` | 3948 | `48c2c0ab749a8fbb5f07572083c3ca851e71ca09756a7a36a4d4d62d62e6ab6c` |
| `03-04-MAPA-COBERTURA-LEGAL-USO.md` | 1428 | `ecfdd186741adb5daf23d1393bbea3a978604cfd52c984d01337269b136d1ce0` |
| `04-05-MAPA-DFE-XML-ERP-POS-HARDENING.md` | 1782 | `63dd0412f7d64e3ab25aa45126e5fe4f5a6d1ef8ffdf4b6025148a6c17056130` |
| `05-06-MAPA-SIMPLES-CREDITOS-SPLIT-CASHBACK-USO.md` | 1701 | `dab1b7091535a9cb2ecfa8d339eeeb34f89a2e42bf7e091827f7783270491c55` |
| `06-07-REGRAS-DE-NAO-CALCULAR-V2-1.md` | 1974 | `4e3763cba559de8d68c16629f4bfd79c47e98dbe20243d3d1e407ceb41c33a1a` |
| `07-08-GUIA-REFORMA-SEM-SURTO-DAY-PEDAGOGIA.md` | 2175 | `8a7efd37b0326dd24894c80be614ab9a2eff1b76d7c54b58c61bfc989be5f695` |
| `08-09-FICHA-CRONOGRAMA-BLINDADO.md` | 1330 | `4dc41fd1fe07859dc5ac39f5833b8a69909eb1d26bf2bac3abd759882cd2357e` |
| `09-10-FICHA-FONTE-LACUNA-HIERARQUIA.md` | 847 | `474fa73e8ba34e9fa2bf6933ce3edab5292e187d4d582165252723cdeb05df51` |
| `10-11-FICHA-MODO-WHATSAPP-CLIENTE.md` | 829 | `3bac512339e7022e6fcd2a918a209163108718e15417f0c0f3b72bc652430902` |
| `11-12-FICHA-CALCULO-REGIME-MOTOR.md` | 874 | `e81ea0a584bee61bed380b74d8b58450e820216e77104384dc474312315db19b` |
| `12-13-FICHA-EXPORTACAO-DOSSIE.md` | 745 | `d6c888a4cea26f87886f7328acb080a3d80985e48f4bd9bbc7cff79fdc039a86` |
| `13-14-FICHA-REDUCOES-REGIMES-SETORIAIS.md` | 879 | `473c777c25d3501e9c38317ebab2921b78228b67531502b916d6b064e806cdbd` |
| `14-15-FICHA-DADOS-MINIMOS-POR-PERGUNTA.md` | 866 | `31b7c9547c2af78358eb9f2284b4d9eb1efc6fb838535b68d65463898e79565f` |
| `15-16-FICHA-RESPOSTA-COMPLETA-ANTI-QUICK-ANSWER.md` | 764 | `17aafbfa2afb9da83ac867593eb3c4f81a8774a18eb262c613dc79469ef9a3fd` |
| `16-17-FICHA-CLAIMS-COMERCIAIS-DISCLAIMERS.md` | 1035 | `a5a896fcbcf29cdba2c1eb3e44eea823c8cb7cbdadae2a51128a370e3b565465` |
| `17-18-FICHA-RETORNO-ACTION-TOPK.md` | 1134 | `e7805303fe72c5c6bf0feda8401ee513e98d857876049cfb5949bce891fafceb` |
| `18-19-FICHA-TESTES-VIVOS-METODOLOGIA.md` | 756 | `9635f63a9bb752b10e4c4838a13198525c6a846c9af00702e07f29f7c1e03313` |
| `19-20-FICHA-MANUTENCAO-RAG-VERSOES.md` | 746 | `bcc0380d94565842726b26e837571b2f26be52dbe4ba73e2ce7101f24158c596` |
| `20-21-FICHA-FALHAS-P0-REGRESSAO.md` | 821 | `165679be69c3df9a6b41b9ec7435c29193ba8fb7f2b27aee9227e96df9dea97e` |

## Action e schemas históricos

Os dois schemas de `connectors/actions/searchDayRagCorpus/` têm hashes e tamanhos
recalculados na [auditoria atual](../evaluations/live-editor-audit-2026-09-21.md#schemas-históricos-e-action-opcional),
com **MATCH** frente às referências históricas. São contratos opcionais para
restauração, não evidência de Action atualmente configurada. Nenhum health check
ou consulta ao endpoint foi executado nesta reconciliação.
