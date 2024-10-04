

USE ContosoRetailDW

SELECT
	DATEDIFF(DAY, '2024-09-06', GETDATE()) AS DIFF_DAY,
	DATEDIFF(YEAR, '2022-09-06', GETDATE()) AS DIFF_YEAR

SELECT TOP 100

	DATEDIFF(MONTH, DateKey, GETDATE()) AS MONTH_DIFF,
	DATEDIFF(DAY, DateKey, GETDATE()) AS MONTH_DIFF

FROM FactOnlineSales

ORDER BY 1 DESC