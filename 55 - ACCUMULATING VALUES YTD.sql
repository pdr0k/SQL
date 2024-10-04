

USE ContosoRetailDW;

WITH TOTAL_SALES([Year], [Month], [Sales]) AS
(
	SELECT
		DATEPART(YEAR, Sales.DateKey) AS [Year],
		DATEPART(MONTH, Sales.DateKey) AS [Month],
		SUM(Sales.SalesAmount) AS [Sales]
	FROM FactOnlineSales AS Sales
	GROUP BY DATEPART(YEAR, Sales.DateKey), DATEPART(MONTH, Sales.DateKey)
)

SELECT
	[Year],
	[Month],
	FORMAT([Sales], 'C0') AS 'Sales',
	FORMAT(SUM([Sales]) OVER(PARTITION BY [Year] ORDER BY [Month]), 'C0') AS Sales_YTD, -- accumulates until end of year
	FORMAT(SUM([Sales]) OVER(PARTITION BY [Year]), 'C0') AS Sales_Total_Year
FROM TOTAL_SALES
ORDER BY [Year], [Month]