
USE ContosoRetailDW

SELECT
	Sales.channelKey, -- if we not add the "GROUP BY", it will not work
	Channel.ChannelName,
	Sales.PromotionKey,
	Promotion.PromotionName,
	SUM(Sales.SalesAmount) AS 'Sales Total',
	AVG(Sales.SalesAmount) AS 'Sales Average',
	MIN(Sales.SalesAmount) AS 'Minimum Sale',
	MAX(Sales.SalesAmount) AS 'Maximum Sale',
	MAX(Sales.SalesAmount) AS 'Sales Count'
FROM FactSales AS [Sales]
-- WHERE COMES AFTER THE 'FROM' OR 'JOIN'

INNER JOIN DimChannel AS [Channel] ON Channel.ChannelKey = Sales.channelKey
INNER JOIN DimPromotion AS [Promotion] ON Promotion.PromotionKey = Sales.PromotionKey

WHERE 
	Sales.channelKey IN (1,2) AND
	Sales.PromotionKey BETWEEN 1 AND 5 

GROUP BY Sales.channelKey, Sales.PromotionKey, Channel.ChannelName, Promotion.PromotionName
ORDER BY Sales.channelKey, Sales.PromotionKey