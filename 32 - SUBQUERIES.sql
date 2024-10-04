

USE ContosoRetailDW

SELECT
	AVG(UnitPrice)
FROM DimProduct


SELECT
	ProductName,
	UnitPrice
FROM DimProduct

WHERE UnitPrice <= (SELECT AVG(UnitPrice) FROM DimProduct) -- THIS IS THE SUBQUERY, WE PUT A SELECT INSIDE ANOTHER SELECT