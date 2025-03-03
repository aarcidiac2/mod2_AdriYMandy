USE northwind;

-- 1. Productos más baratos y caros de nuestra bases de datos:
-- Desde la división de productos nos piden conocer el precio de los productos que tienen el precio más alto y más bajo. Dales el alias lowestPrice y highestPrice.

SELECT UnitPrice
	FROM products;

SELECT MIN(UnitPrice) AS lowestPrice
	FROM products;
    
SELECT ProductName, UnitPrice,  
	CASE 
		WHEN UnitPrice < 15.00 THEN "lowestPrice"   
		WHEN UnitPrice > 15.00 THEN "highestPrice"  
    ELSE "mediumPrice"   
    END AS priceRange 
FROM products;

-- 2. Conociendo el numero de productos y su precio medio:
-- Adicionalmente nos piden que diseñemos otra consulta para conocer el número de productos y el precio medio de todos ellos (en general, no por cada producto).

SELECT ROUND(AVG(UnitPrice),2), COUNT(ProductID)
	FROM products;
    
SELECT ProductName, ROUND(AVG(UnitPrice), 2)
	FROM products
    GROUP BY ProductName;