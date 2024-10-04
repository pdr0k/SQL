
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
GROUP BY Sales.channelKey, Sales.PromotionKey
ORDER BY Sales.channelKey, Sales.PromotionKey