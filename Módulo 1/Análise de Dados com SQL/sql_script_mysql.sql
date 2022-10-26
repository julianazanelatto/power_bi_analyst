use company_constraints;
show tables;

select * from employee e ; -- Dno
select * from departament d ; -- Dnumber

select Dno, Ssn from employee e inner join departament d on Dno = Dnumber; 


-- Frequência e Categorização dos dados

-- Categorizar os departamentos por número de colaboradores
select Dname, Dno, count(*) as Employees from employee e 
		inner join departament d on Dno = Dnumber 
		group by 1 order by Employees ASC; 

-- Projetos por departamento
select Pname, Dnum from project p inner join departament d on Dnum = Dnumber;

select Dnum, COUNT(*) as Projects from project p 
		inner join departament d on Dnum = Dnumber 
		group by 1 order by Projects ASC;
		
select d.Dname, Dnum, COUNT(*) as Projects from project p 
		inner join departament d on Dnum = Dnumber 
		group by 1 order by Projects ASC;
	
select * from employee e ;


-- Discretização
select Fname,
	case
		when Salary > 39000 then 'Executivo'
		when Salary > 29000 then 'Senior'
		when Salary > 19000 then 'Pleno'
		else 'NA'
	end as Employee_level
	from employee e 
	order by Employee_level;


-- exemplo de NPS
/*
 * select reponse_id,
	case
		when nps <= 6 then 'Detrator'
		when nps <=8 then  'Passivo'
		else 'Promoter'
	end as NPS
	from table_name e 
	order by NPS;
 * */


-- Padronização

select Fname,
	case
		when Sex = 'M' then 'Masculino'
		when Sex = 'F' then 'Feminino'
		else Sex
		end as Gender
	from employee e ;


/*
  select Fname, Sex 
	case
		when Sex = 'm' then 'M'
		when Sex = 'f' then 'F'
		else Sex
	end as Gender
	from employee e ;
*/
