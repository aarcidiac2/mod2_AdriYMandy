USE northwind;

-- CustumerID, CompanyName y Country--

SELECT *
FROM customers;

-- seleccionar las columnas de customers que nos interesan--
SELECT CustomerID, CompanyName, Country
	FROM customers
    WHERE Country = "UK";
    
-- selceccionar las columnas de orders que nos interesan--

SELECT *
FROM orders;

SELECT CustomerID, Country
	FROM customers
    WHERE Country = "UK";
    

SELECT c.CustomerID, c.CompanyName, c.Country
	FROM customers AS c
    INNER JOIN orders AS o
    ON o.CustomerID = c.CustomerID;
    

SELECT c.CustomerID, c.CompanyName, c.Country, o.OrderID
	FROM customers AS c
    INNER JOIN orders AS o
    ON o.CustomerID = c.CustomerID
    GROUP BY c.Country = "UK"
    HAVING COUNT(o.OrderID);

-- aqui faltaba el group by --   
SELECT c.CustomerID, c.CompanyName, c.Country, COUNT(o.OrderID)
	FROM customers AS c
    INNER JOIN orders AS o
    ON o.CustomerID = c.CustomerID
     WHERE Country = "UK";

SELECT c.CustomerID, c.CompanyName, c.Country, o.OrderID
	FROM customers AS c
    INNER JOIN orders AS o
    ON o.CustomerID = c.CustomerID
     WHERE Country = "UK";

-- este es el que funciona--
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID)
	FROM customers AS c
    INNER JOIN orders AS o
    ON o.CustomerID = c.CustomerID
    WHERE Country = "UK"
    GROUP BY c.CompanyName, c.CustomerID;
    

-- ejercicio 2- 

SELECT *
FROM orders;

SELECT c.CustomerID, c.CompanyName, o.OrderDate
	FROM customers AS c
    INNER JOIN orders AS o 
	ON o.CustomerID = c.CustomerID
     WHERE Country = "UK"
      GROUP BY c.CompanyName, o.OrderDate;

SELECT c.CustomerID, c.CompanyName, YEAR(o.OrderDate)
	FROM customers AS c
    INNER JOIN orders AS o ON o.CustomerID = c.CustomerID
    INNER JOIN 
     WHERE Country = "UK"
      GROUP BY c.CompanyName, YEAR(o.OrderDate);

