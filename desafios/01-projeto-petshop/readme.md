# Vamos testar seu conhecimento em SQL!

Você trabalha em uma empresa que faz consultoria de TI e ficou encarregado de desenhar uma base dados para as franquias de uma rede de petshop, imagine a Petz para facilitar a compreensão. Após uma série de reuniões para elicitação dos requisitos seu gerente de projetos te apresenta a seguinte lista de requisitos para a base:


Olá, nós precisamos armazenar os seguintes domínios de dados:
- Cadastro de produtos: código, nome, data de cadastro, categoria, valor, data de validade e código do fornecedor
- Cadastro de clientes: código, nome, data de nascimento, email, telefone, endereço
- Cadastro de fornecedores: código, nome, telefone, endereço
- Cadastro dos tipos de pagamento: codigo, descricao, taxa de juros
- Cadastro de vendas: código da venda, codigo do cliente, codigo do produto, quantidade, valor total, valor desconto, valor do frete e tipo de pagamento

Com base nessas informações realize a criação do modelo de dados ER junto com os arquivos DDL da criação das entidades e arquivos DML com a instrução de INSERT de ao menos 5 registros por entidade. Você pode utilizar o banco de dados e ferramenta gráfica para desenho do modelo de sua preferencia. Como solução espera-se a seguinte estrutura:

```
01-projeto-petshop/
├── ddl/
│   ├── create_produtos.sql
│   ├── create_vendas.sql
│   ├── ...
│   └── <operacao>.<tabela>.sql
├── ddl/
│   ├── insert_produtos.sql
│   ├── insert_vendas.sql
│   ├── ...
│   └── <operacao>.<tabela>.sql
└── diagrama.<jpg/png/svg>
```

O que te diferencia nessa atividade: utilize corretamente dos tipos de dados para suas tabelas junto com regras de restrição de integridade: _primary keys_, _foreign keys_, _not nulls_ e todas as demais soluções que o SGBD de escolha forneça para enriquecer sua solução.
