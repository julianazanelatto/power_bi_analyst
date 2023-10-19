# power_bi_analyst

1. Divisão de coluna address em address line 1, address line 2, city e state
2. Mudança do tipo da coluna Salary na tabela Employee e da coluna Hours na tabela works_on para Número decimal fixo
9. Mescla das tabelas Employee e Departament utilizando tipo de junção interna (inner join)
10. Remoção das colunas Bdate, Address line 1, Address line 2, City, State, Sex, Salary pois não é necessária essas informações no join
11. SQL utilizado: 	SELECT CONCAT(f.Fname, " ", F.Minit, " ", F.Lname) as Name, CONCAT (g.Fname, " ", g.Minit, " ", g.Lname) as Manager
			FROM employee f
			INNER JOIN employee g ON f.Super_ssn = g.Ssn;
12. Mescla das colunas de Nome, Nome do meio e Sobrenome
13. Mescla das tabelas Departament e dept_locations e remoção das colunas  Mgr_ssn, Mgr_start_date, Dept_create_date pois não é uma informação necessária
14. Utilizamos a mescla no passo 13 pois a mescla visa unir as colunas de duas tabelas e ao utilizarmos o método de acrescentar consulta iriamos unificar as
linhas de duas tabelas e com isso poderiamos ter resultados nulos já que uma tabela pode ter mais linhas que a outra
 
