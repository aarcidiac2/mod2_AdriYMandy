-- PAIR JOINS II --

USE northwind; 

-- Ej 1. Empleadas que sean de la misma ciudad --
-- consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. --
-- Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas--

SELECT *
FROM employees;
-- nombre de las columnas de esta tabla que me interesan: FirstName, LastName, City, ReportsTo

SELECT e1.FirstName AS FirstName1, e1.LastName AS LastName1, e1.City AS City1, e1.ReportsTo AS ReportsTo1,e2.EmployeeID AS EmployeeID2, e2.FirstName AS FirstName2, e2.LastName AS LastName2, e2.City AS City2, e2.ReportsTo AS ReportsTo2
	FROM Employees AS e1, Employees AS e2
    WHERE e1.ReportsTo  = e2.EmployeeID;



-- Ej 2. una lista con todas las categorías de productos, incluso si no tienen productos asociados. Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría --

SELECT *
FROM products; 

SELECT *
FROM categories;

-- Columnas que me interesan CategoryID, CategoryName (de tabla Categories), ProductName (tabla Products), --

-- pruebo primero con LEFT JOIN a ver que sale --
SELECT * 
	FROM Products AS p
    LEFT JOIN Categories AS c
    USING (CategoryID);
    
-- pruebo ahora con RIGHT JOIN, segun la recomendación del enunciado, a ver que sale --    
SELECT *
	FROM Products AS p
    RIGHT JOIN Categories AS c
    USING (CategoryID);
    
-- 👇 resolucion --

SELECT CategoryID, CategoryName, ProductName
	FROM Products AS p
    RIGHT JOIN Categories AS c
    USING (CategoryID);
    
-- Ej 3. Obtener una lista de todos los pedidos junto con los datos de las empresas clientes, incluso si no tienen cliente registrado --

SELECT *
FROM Orders; 

SELECT *
FROM Customers; 

-- Columnas que me interesan: OrderID (tabla orders), CustomerID (la union), Company Name (tabla customers)--

SELECT CustomerID, OrderID, CompanyName 
	FROM Orders AS o
    LEFT JOIN Customers AS c
    USING (CustomerID);
    
 
-- Ej 4. Qué empleadas han gestionado pedidos y cuáles no --

SELECT *
	FROM employees;
    
SELECT *
FROM Orders; 

SELECT *
FROM OrderDetails; 

-- Columnas que me interesan: EmployeeID (union), OrderID (table Orders), UnitPrice (tabla OrderDetails)--

SELECT EmployeeID, OrderID
	FROM Employees AS e
    LEFT JOIN Orders AS o
    USING (EmployeeID);
    
  
SELECT EmployeeID, OrderID
	FROM Employees AS e
    LEFT JOIN Orders AS o
    USING (EmployeeID)
UNION
    SELECT UnitPrice, OrderID
	FROM orderdetails AS od
    RIGHT JOIN orders AS o
    USING (orderID);
    
SELECT EmployeeID, OrderID
	FROM Employees AS e
    LEFT JOIN Orders AS o
    USING (EmployeeID)
    WHERE OrderID = OrderDetails;

-- 👆 no logré incluir los detalles del pedido --