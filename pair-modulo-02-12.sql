USE northwind;

-- 1. Extraed los pedidos con el máximo "order_date" para cada empleado.--

SELECT *
FROM orderdetails;

SELECT *
FROM orders;


SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
FROM orders;  



SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
	FROM orders AS o
	WHERE OrderDate = (SELECT MAX(OrderDate) 
						FROM orders
						WHERE EmployeeID = o.employeeID); 


SELECT MAX(OrderDate) 
FROM orders
WHERE EmployeeID = 2;  -- esto es una consulta --


-- 2. Extraed información de los productos "Beverages".  Devuelve el ID del producto, el nombre del producto y su ID de categoría. --

SELECT *
FROM products;

SELECT *
FROM categories;

-- beverages es CategoryID 1 en la tabla Categories --

SELECT ProductID, ProductName, CategoryID 
FROM products
WHERE CategoryID = 1;




