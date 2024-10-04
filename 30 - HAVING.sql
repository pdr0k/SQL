
USE ContosoRetailDW

SELECT TOP 1000
	Sales.ProductKey,
	SUM(Sales.SalesQuantity) AS 'Sales Quantity'
FROM FactSales AS [Sales]
WHERE Sales.DateKey >= '2009-01-01'

GROUP BY Sales.ProductKey
HAVING SUM(Sales.SalesQuantity) BETWEEN 1000 AND 2000



ORDER BY [Sales Quantity] desc -- ORDER BY ALWAYS LAST