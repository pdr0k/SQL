USE ContosoRetailDW

SET DATEFORMAT YMD

SELECT DISTINCT
	FactSalesOn.DateKey

FROM FactOnlineSales AS [FactSalesOn]

WHERE FactSalesOn.DateKey BETWEEN '2007-12-01' AND '2007-12-31'