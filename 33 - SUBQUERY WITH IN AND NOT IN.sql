
USE ContosoRetailDW
-- IN
SELECT
	*
FROM FactSales AS [Sales]
WHERE Sales.ProductKey IN (
	SELECT
		ProductKey
	FROM DimProduct

	WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
)
ORDER BY UnitPrice DESC


-- NOT IN
SELECT
	*
FROM FactSales AS [Sales]
WHERE Sales.ProductKey NOT IN (
	SELECT
		ProductKey
	FROM DimProduct

	WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct)
)
ORDER BY UnitPrice ASC