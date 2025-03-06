USE northwind;

/* 1. Ciudades que empiezan con "A" o "B". */

SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE 'A%' OR City LIKE 'B%';


/* 2.Número de pedidos que han hecho en las ciudades que empiezan con L.*/

SELECT customers.City AS ciudad, customers.CompanyName AS empresa, customers.ContactName AS persona_contacto, COUNT(orders.OrderID) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE City LIKE 'L%'
GROUP BY customers.CompanyName,customers.ContactName,customers.City;

SELECT City AS ciudad, CompanyName AS empresa, ContactName AS persona_contacto, COUNT(orders.OrderID) AS numero_pedidos
FROM customers
NATURAL JOIN orders
WHERE City LIKE 'L%'
GROUP BY customers.CompanyName,customers.ContactName,customers.City;

/* 3. Nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . 
Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.*/

SELECT  ContactName, ContactTitle, CompanyName 
FROM customers
WHERE ContactTitle NOT LIKE '%Sales%';

/*4.Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/

SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE '_A%';

/* 5.Extraer toda la información sobre las compañías que tengamos en la bases de datos*/

SELECT City, CompanyName, ContactName, 'Customers' AS Relationship
FROM customers

UNION

SELECT City, CompanyName, ContactName, 'Suppliers' AS Relationship
FROM suppliers;


