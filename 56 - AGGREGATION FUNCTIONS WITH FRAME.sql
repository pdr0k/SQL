

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
	FORMAT(SUM(SALES) OVER(PARTITION BY [Year] ORDER BY [Year], [Month] ASC 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 'C0') AS SALES_YTD,

	FORMAT(AVG(SALES) OVER(PARTITION BY [Year] ORDER BY [Year], [Month] ASC 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 'C0') AS SALES_AVG, -- unbound = all lines behind

	FORMAT(AVG(SALES) OVER(ORDER BY [Year], [Month] ASC 
		ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING), 'C0') AS SALES_AVG_3M, -- avg between the third line preceding and the first one preceding

	FORMAT(SUM(SALES) OVER(ORDER BY [Year], [Month] ASC 
		ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 'C0') AS SALES_LAST_MONT -- frame = between range of lines

FROM TOTAL_SALES
ORDER BY [Year], [Month]