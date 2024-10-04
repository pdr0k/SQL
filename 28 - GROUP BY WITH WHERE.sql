
USE ContosoRetailDW

SELECT
	Sales.channelKey, -- if we not add the "GROUP BY", it will not work
	Sales.PromotionKey,
	SUM(Sales.SalesAmount) AS 'Sales Total',
	AVG(Sales.SalesAmount) AS 'Sales Average',
	MIN(Sales.SalesAmount) AS 'Minimum Sale',
	MAX(Sales.SalesAmount) AS 'Maximum Sale',
	MAX(Sales.SalesAmount) AS 'Sales Count'
FROM FactSales AS [Sales]
-- WHERE COMES AFTER THE 'FROM' OR 'JOIN'

WHERE 
	Sales.channelKey IN (1,2) AND
	Sales.PromotionKey BETWEEN 1 AND 5 

GROUP BY Sales.channelKey, Sales.PromotionKey
ORDER BY Sales.channelKey, Sales.PromotionKey