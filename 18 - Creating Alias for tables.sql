USE ContosoRetailDW

SELECT TOP 100
	S.SalesKey,
	S.DateKey,
	S.channelKey,
	C.ChannelKey,
	C.ChannelName
--  C.* (returns everything)

FROM FactSales AS S
INNER JOIN DimChannel C ON C.ChannelKey = S.channelKey
--------------------------| This is the table relation |