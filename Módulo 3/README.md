## PROCESSANDO E TRANSFORMANDO DADOS COM POWERBI

### Objetivo do desafio

O desafio faz parte de um dos projetos desenvolvidos para o Bootcamp Santander 2023 - Ciência de Dados e como o próprio nome já diz, tem como objetio fazer transformações em um database utilizando PowerBi.

### Passo a Passo

Em Módulo 3/Desafio de Projeto encontram-se os arquivos utilizados para criação do database, em SQL, que utilizaremos para realizar as transformações no PowerBI.
Diferentemente do proposto no desafio, não utilizei a Azure para criação de uma instância para MySQL. 
Utilizei o MySQL Server e conectei ele ao PowerBI.
Ao criar o database com os scripts disponibilizados pela DIO, não foi possível inserir os dados. 
Realizei uma modificação na linha 63 do arquivo script_bd_company.sql

De: ```alter table dept_locations drop fk_dept_locations``` 

Para: ```alter table dept_locations drop foreign key fk_dept_locations```

Além disso, ao inserir os valores associados de cada tabela, que também foram disponibilizados pela DIO para a realização do desafio, os seguintes erros foram apresentados: 

```
"Cannot add or update a child row: a foreign key constraint fails (azure_company.employee, CONSTRAINT fk_employee FOREIGN KEY (Super_ssn) REFERENCES employee (Ssn) ON DELETE SET NULL ON UPDATE CASCADE)"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.dependent, CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee (Ssn))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.departament, CONSTRAINT departament_ibfk_1 FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.dept_locations, CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament (Dnumber))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.project, CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament (Dnumber))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.works_on, CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee (Ssn))"]
 ```

Para funcionar, usei o que foi sugerido em:
<https://github.com/julianazanelatto/power_bi_analyst/issues/4#issuecomment-1749304462:>
INSERT INTO employee VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5);

Com isso, consegui carregar o database, que tem como nome azure_company, no PowerBI e iniciei as transformações usando o PowerQuery.
As seguintes transformações foram feitas: 

1. Modifiquei o tipo dos valores de "Salary" do database azure_company employee para Número decimal fixo;
2. Modifiquei o tipo dos valores de "Hours" do database azure_company employee para Número Inteiro;
3. Modiquei o nome dos headers para ficar mais claro o que significa cada coluna;
4. Colunas complexas como Address foram separadas em AddressNo, Address_Name, City e State;
5. "Os employees com nulos em Super_ssn podem ser os gerentes". Em Headquarters (Dno = 1), Super_ssn = null. Modifiquei para que esse departamento seja gerenciado pelo próprio "employee", James Borg e modifiquei o Super_ssn para o ssn correspondente deste colaborador.
6. Mesclei as consultas employee e departament, através do Dno (número do departamento) criando uma nova consulta "Merge1". Essa nova consulta contém as colunas de employee e o nome dos departamentos associados aos colaboradores (Department_Name). Exclui o restante que havia na consulta department;
7. Em Merge1, mesclei as colunas Fname e Lname usando a função "Transform > Merge Columns" e nomeei como "Collaborators";
8. Em Merge1, para mesclar os nomes de departamentos e localização, adicionei uma coluna chamada "Dept_Name_Location". Para fazer isso, fui na guia Adicionar Coluna > Coluna de Exemplos e usei a coluna "City" como exemplo. Feito isso, dupliquei a coluna "Department_Name" e usei a ferramenta merge columns para mesclar as cidades que estão em "Dept_Name_Location" com a coluna duplicada de "Department_Name". Utilizamos a mescla neste caso o que buscamos é unir as colunas de duas tabelas, se utilizassemos o método de atribuir iriamos unificar as linhas de duas consultas, podendo assim obter resultados nulos, já que uma consulta pode haver mais linhas em relação à outra;
9. Colunas não utilizadas foram excluídas.
    
Veja como ficou a tabela "Merge1":
<img width="619" alt="Screenshot 2023-10-23 115216" src="https://github.com/vanessalrz/power_bi_analyst/assets/122112581/0790e535-294d-4509-8d11-e4b215a34849">
<img width="622" alt="Screenshot 2023-10-23 115329" src="https://github.com/vanessalrz/power_bi_analyst/assets/122112581/969161fb-b844-4db7-80f8-0487734ab964">
<img width="622" alt="Screenshot 2023-10-23 115340" src="https://github.com/vanessalrz/power_bi_analyst/assets/122112581/df6e32e6-d73b-470c-8350-f0f10295a52b">



