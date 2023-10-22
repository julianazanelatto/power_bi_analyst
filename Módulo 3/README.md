Neste aquivo estão as transformações no database azure_company.
Diferentemente do proposto no desafio, não utilizei a Azure. Usei o MySQL Server para criar o database e conectei ele ao PowerBI.
Ao criar o banco de dados com os scripts disponíveis, não é possível inserir os dados. 
Tive que fazer uma modificação na linha 63 do arquivo script_bd_company.sql.
Como era: alter table dept_locations drop fk_dept_locations
Como ficou: alter table dept_locations drop foreign key fk_dept_locations
Além disso, deu erro ao inserir os valores associados de cada tabela, apresentando o seguintes erros: 

" Cannot add or update a child row: a foreign key constraint fails (azure_company.employee, CONSTRAINT fk_employee FOREIGN KEY (Super_ssn) REFERENCES employee (Ssn) ON DELETE SET NULL ON UPDATE CASCADE)"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.dependent, CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee (Ssn))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.departament, CONSTRAINT departament_ibfk_1 FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.dept_locations, CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament (Dnumber))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.project, CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament (Dnumber))"
"Cannot add or update a child row: a foreign key constraint fails (azure_company.works_on, CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee (Ssn))"

Para funcionar, usei o que foi sugerido em https://github.com/julianazanelatto/power_bi_analyst/issues/4#issuecomment-1749304462:
INSERT INTO employee VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5);

Feito isso, consegui carregar o database no PowerBI.
As seguintes transformações foram feitas: 

