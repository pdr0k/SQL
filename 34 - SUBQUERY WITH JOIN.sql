

USE ContosoRetailDW

-- TOP 5 PRODUCTS WITH MORE SALES
SELECT TOP 5
	SalesTable.ProductKey,
	SUM(SalesTable.SalesAmount) AS Sales
FROM FactSales AS [SalesTable]
GROUP BY SalesTable.ProductKey
ORDER BY SALES DESC	

-- TOP 10 SALES OF TOP 5 PRODUCTS
SELECT TOP 10
	SalesTable2.*
FROM FactSales AS [SalesTable2]
INNER JOIN (
	SELECT TOP 5
		SalesTable.ProductKey,
		SUM(SalesTable.SalesAmount) AS Sales
	FROM FactSales AS [SalesTable]
	GROUP BY SalesTable.ProductKey
	ORDER BY SALES DESC
) AS TOP5 ON TOP5.ProductKey = SalesTable2.ProductKey

SELECT
	DISTINCT(VALIDATION.ProductKey)
FROM (
	SELECT TOP 10
		SalesTable2.*
	FROM FactSales AS [SalesTable2]
	INNER JOIN (
		SELECT TOP 5
			SalesTable.ProductKey,
			SUM(SalesTable.SalesAmount) AS Sales
		FROM FactSales AS [SalesTable]
		GROUP BY SalesTable.ProductKey
		ORDER BY SALES DESC
	) AS TOP5 ON TOP5.ProductKey = SalesTable2.ProductKey
) AS VALIDATION