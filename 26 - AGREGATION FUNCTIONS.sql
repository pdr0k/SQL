USE ContosoRetailDW


SELECT
	SUM(SalesAmount)
FROM FactSales AS [Sales]

SELECT
	AVG(SalesAmount) -- AVERAGE	
FROM FactSales AS [Sales]

SELECT
	COUNT(SalesAmount) -- LINES
FROM FactSales AS [Sales]

SELECT
	MAX(SalesAmount)	
FROM FactSales AS [Sales]

SELECT
	MIN(SalesAmount)	
FROM FactSales AS [Sales]