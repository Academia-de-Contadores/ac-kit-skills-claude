# Perfil da cópia — descoberta, modelo e revalidação

Versão 0.2 · 07/10/2026.

## Para que serve

O perfil é a página que permite a qualquer chat novo saber onde fica cada coisa **naquela cópia**, sem depender do histórico da conversa. Guarda referências de configuração. **Nunca** guarda senhas, tokens ou dados sensíveis de clientes.

## Como descobrir (somente leitura)

1. Partir da Home informada pela usuária. Confirmar o workspace.
2. Para cada finalidade da tabela abaixo: localizar a página, identificar se há base própria ou visualização vinculada, e de qual origem.
3. Ler o esquema da base de origem: nome e tipo de cada propriedade usada; opções de status/seleção; relações e a base de destino de cada relação; campo de pessoa ou texto para responsável.
4. Conferir pelo menos um registro de cada base para ver como as datas e o cliente são preenchidos.
5. Marcar o que não foi possível confirmar.
6. Mostrar o resultado à usuária. Salvar como página somente se ela pedir.

## Modelo da página “Perfil da cópia para a IA”

```text
Perfil da cópia para a IA
Workspace: [nome]           Home: [link]
Última verificação: [data] por [quem]

| Finalidade | Página / base | Origem (data source) | Campos usados (tipo) | Opções de status | Relações |
|---|---|---|---|---|---|
| Cadastro de cliente (CRM) | [link] | [link] | Nome (título), CPF/CNPJ (texto), Status (seleção)... | [...] | [...] |
| Ficha do cliente | [link] | ... | ... | ... | Dados de Clientes CRM → CRM |
| Negociações (Comercial) | ... |
| Onboarding | ... |
| Tarefas do time | ... | ... | Tarefa, Prazo (data), Responsável (pessoa ou texto), Cliente (relação ou seleção), Status, Observações | ... |
| Tarefas da CEO | ... |
| DP: Lista de Clientes / Ficha DP | ... |
| DP: Fechamento de Folha [competência] | ... |
| Fiscal: controles em uso | ... |
| Contábil: Fechamento [competência] | ... |
| Legalização: Processos societários | ... |
| POPs por departamento (Time) | [link de cada área] | ... | Nome do POP, versão, data | ... | Link para a área que usa o POP |

Convenções do escritório:
- Datas: [formato]   - Competência: [MM/AAAA]
- Status de bloqueio: [opção existente ou "usar Observações"]
- Responsáveis: [nomes e papéis]
- Sistema principal de recorrências: [Notion / outro sistema: qual]

Não confirmado: [lista]
```

## Revalidação

- Se um link do perfil não abrir, um campo citado não existir ou uma opção mudar: avisar, usar o que existe e propor atualização do perfil.
- Revalidar o perfil inteiro quando a usuária mudar a estrutura ou a cada mês, na passagem de competência.
- Controles mensais mudam de página a cada competência: o perfil registra onde ficam e o padrão de nome, não só o mês atual.
