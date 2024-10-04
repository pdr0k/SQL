 
 
 USE ContosoRetailDW

SELECT
	YEAR(GETDATE()) AS [Current_Year],
	MONTH(GETDATE()) AS [Current_Month],
	DAY(GETDATE()) AS [Current_Day]

SELECT TOP 100 *
FROM FactSales

WHERE YEAR(DateKey) = 2007
	AND MONTH(DateKey) = 11
	AND DAY(DateKey) = 13