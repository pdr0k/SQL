

USE ContosoRetailDW

SELECT TOP 100

	DateKey,
	DATEPART(yy, DateKey) AS [Year],
	DATEPART(quarter, DateKey) AS 'Quarter'

FROM FactSales

WHERE DATEPART(quarter, DateKey) = 3
	AND DATEPART(yy, DateKey) = 2007