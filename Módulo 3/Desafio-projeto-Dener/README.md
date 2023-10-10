## Conexão com Banco de Dados "company_dener" com acesso e transformação das Tabelas

Realizei conexão com o banco de dados "company_dener" com isso acessei e transformei as seguintes tabelas:

- Tabela "departament"
- Tabela "dependent"
- Tabela "dept_locations"
- Tabela "project"
- Tabela "employee"
- Tabela "works_on"

Relatório de alteração de cada tabela:

### Tabela "departament"

1. Renomeei as colunas para "Department_name" e "Department_number".

### Tabela "dependent"

Nenhuma ação foi considerada necessária.

### Tabela "dept_locations"

1. Renomeei as colunas para "Department_number" e "Department_location".

### Tabela "project"

1. Renomeei as colunas para "Project_name", "Project_number" e "Project_location".
2. Adicionei o sufixo "-TX" à coluna "Project_location", para a criação de visual de mapa.

### Tabela "employee"

1. Dividi a coluna "Address" para poder acessar cada componente do endereço.
2. Renomeei as colunas para "House_number", "Street", "City" e "State".
3. Substituí valores em "City" e "State" para ajustar um erro na divisão.
4. Removi a coluna "Address.5".
5. Alterei o tipo de coluna "Salary" para decimal fixo.
6. Combinei colunas de nome em "Full_name".
7. Renomeei as colunas para "House_number" e "Department_number".

### Tabela "works_on"

1. Renomeei a coluna para "Project_number".

### Tabela "works_on" (junção com "project")

1. Mesclei com a tabela "project" usando "Project_number".
2. Expandi as colunas da tabela "project".
3. Removi colunas não utilizadas.

### Tabela "employee" (junção com "dependent")

1. Mesclei com a tabela "dependent" usando "Ssn" e "Essn".
2. Expandi as colunas da tabela "dependent".
3. Agrupei por nome completo, contando os dependentes por cada.

### Tabela "departament" (junção com "employee" e "project")

1. Mesclei com a tabela "employee" e "project" usando "Department_number".
2. Removi colunas não utilizadas.
3. Expandi as colunas da tabela "employee" e "project".
4. Mesclei com a tabela "works_on" usando "Project_number".
5. Agrupei por nome completo, contando os projetos por cada.

Essas transformações prepararam os dados vindos da base de dados para a elaboração de report no Power BI. 
