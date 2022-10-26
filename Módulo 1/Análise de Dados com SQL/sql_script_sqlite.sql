
SELECT * FROM Album a ;
SELECT count(*) as Records FROM Album a;

SELECT count(*) FROM Album a WHERE Column1 is NOT NULL;
SELECT AlbumId, Title FROM Album a WHERE Column1 is NULL;

SELECT * FROM Artist a;

-- caracterizando os registros dos artistas
SELECT a2.ArtistId, a2.Name, count(*) as Records from Album a INNER JOIN Artist a2 GROUP BY 1;
SELECT a2.ArtistId, a2.Name, count(*) as Records from Album a INNER JOIN Artist a2 GROUP BY 1 ORDER BY Records LIMIT 3;

SELECT * FROM Customer c LIMIT 10;
SELECT COUNT(*) FROM Customer c2 ;
SELECT FirstName, Address FROM Customer c;

-- Quantos clientes moram na Broadway?
SELECT count(*) FROM Customer c WHERE Address like '%Broadway%';
SELECT State, COUNT(*) AS Total FROM Customer c GROUP BY 1 ORDER BY Total DESC limit 10;


-- verificar company dos clientes
SELECT * FROM Customer c;
SELECT count(*) FROM Customer c WHERE Company IS NOT NULL;

SELECT FirstName FROM Customer c WHERE Company IS NULL;


-- Quais dos clientes são colaboradores?
SELECT * FROM Employee e ;

SELECT c.FirstName, c.LastName FROM Customer c 
	WHERE Company IS NULL AND c.FirstName IN 
		(SELECT e.FirstName FROM Employee e);

SELECT c.FirstName, c.LastName  FROM Customer c INNER JOIN Employee e WHERE c.FirstName = e.FirstName;


SELECT * FROM Invoice i LIMIT 10;
SELECT * FROM InvoiceLine il ORDER BY UnitPrice  DESC LIMIT 10;

SELECT UnitPrice, COUNT(*) AS Record  FROM InvoiceLine il GROUP BY UnitPrice;

-- Clientes que possuem Invoice associados e a quantidade para cada cliente.

SELECT c.CustomerId, c.FirstName, COUNT(*) as Record FROM Invoice i 
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
	GROUP BY 1 ORDER BY Record;

SELECT i.InvoiceId, il.InvoiceLineId  FROM Invoice i 
	INNER JOIN InvoiceLine il 
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
	GROUP BY 1
	LIMIT 100;
