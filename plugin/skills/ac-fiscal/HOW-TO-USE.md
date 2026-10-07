# Como usar a skill Fiscal

## Começo rápido

Escreva `Use $ac-fiscal` e descreva o caso sem senha, token, certificado ou dado
desnecessário de cliente. Informe, quando souber:

- o que precisa conferir;
- competência, regime, UF e município;
- tipo de documento fiscal;
- sistema ou portal usado;
- qual evidência higienizada já existe.

Exemplo:

```text
Use $ac-fiscal com /pre-apuracao. Preciso de uma estimativa para o caixa de agosto. Tenho o relatório de vendas, mas faltam XML, cancelamentos, devoluções e retenções.
```

A skill deve responder `ESTIMATIVA — NÃO É GUIA`, montar a reconciliação e
indicar a revisão técnica. Ela não gera o valor final nem a guia.

## Escolher a saída

- `/triagem`: classifica a demanda e mostra os dados que faltam;
- `/notas-xml`: confere o caminho de NF-e, NFC-e, NFS-e e XML;
- `/classificacao`: prepara matriz não definitiva de CFOP/NCM/CST/cClassTrib;
- `/pre-apuracao`: organiza estimativa e evidências, sem virar guia;
- `/dominio-fiscal`: estrutura importação, parâmetros e divergências;
- `/regularizacao`: organiza CND, PGFN, dívida e parcelamento sem aderir;
- `/reforma-handoff`: prepara o caso para `$ac-reforma-tributaria-rag`;
- `/mensagem-cliente`: cria rascunho que ainda precisa de aprovação para envio.

Os contratos completos estão em `references/fiscal-outputs.md`.

## Entender fonte e lacuna

Para regra atual, prazo, tabela, procedimento de órgão ou classificação, a skill
usa fonte oficial competente quando a verificação ao vivo estiver disponível.
Se isso não for possível, ela deve escrever `LACUNA DE FONTE OFICIAL`, dizer o
que ficou sem confirmação e indicar o portal, órgão ou texto que uma pessoa deve
validar. Blog, material comercial e o próprio Knowledge não substituem essa
fonte.

## Entender aprovação

Criar checklist, matriz, briefing ou rascunho é preparação. Alterar o Domínio,
consultar portal com credencial, emitir, transmitir, aderir, pagar ou enviar
algo é ação externa. Cada ação exata exige aprovação humana imediatamente antes,
com alvo, conteúdo ou valores e canal/sistema definidos. Até lá, o estado é
`NÃO EXECUTADO`.

## Instalação seletiva da release

O checkout inteiro não é uma pasta de skill. A lista normativa está em
`agent.yaml`, em `skill_runtime.package`. Uma instalação deve copiar arquivos
reais, sem symlinks, preservando exatamente os 23 caminhos dessa allowlist:

- `SKILL.md`, `agent.yaml` e `agents/openai.yaml`;
- os três arquivos em `references/`;
- os dois arquivos de identidade, três de objetivos e dois de instruções;
- o índice Fiscal e os nove `.md` de `knowledge/live-2026-08-22/`.

Não copie `.git`, `.github`, avaliações, governança, relatórios, scripts, testes,
documentação, `.gitkeep`, `knowledge/MANIFEST.md`, o manifesto da captura ao vivo
nem os nove arquivos históricos `knowledge/original/01-*` a `99-*`. Nunca use
`cp -R knowledge`, pois isso inclui a captura contaminada por DP.

A versão `0.2.0` está `validated`: a instalação foi conferida byte a byte e os
seis casos locais qualificaram. O GPT canônico permanece a baseline imutável de
identidade; a qualificação da baseline sob a rubrica mais rígida não é requisito
para a skill superar sua utilidade ou segurança.

## Manutenção

Mudança de comportamento começa por avaliação. Preserve os dez hashes e a
allowlist, mantenha caminhos relativos e execute:

```bash
bash tests/validate-agent-repo.test.sh
bash tests/validate-fiscal-skill.test.sh
bash scripts/validate-agent-repo.sh
ruby scripts/validate-fiscal-skill.rb
git diff --check
```

O validador rejeita pacote incompleto, Knowledge alterado, arquivo de DP na
allowlist, ponteiro incorreto, dependência inventada, caminho local, segredo,
rubrica reduzida e regressão do lifecycle validado.

Se o GPT mudar ou um novo download produzir outros bytes, preserve a nova
captura separadamente, compare os dez anexos e repita a validação antes de mudar
o pacote. O GPT online não deve ser alterado para forçar a comparação.
