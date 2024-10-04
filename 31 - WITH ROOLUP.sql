USE ContosoRetailDW

SELECT TOP 1000
	Stores.StoreName,
	Geo.RegionCountryName,
	SUM(Sales.SalesQuantity) AS 'Sales Quantity'
FROM FactSales AS [Sales]

INNER JOIN DimStore AS [Stores] ON Stores.StoreKey = Sales.StoreKey
INNER JOIN DimGeography AS [Geo] ON Geo.GeographyKey = Stores.GeographyKey
GROUP BY Geo.RegionCountryName, Stores.StoreName
WITH ROLLUP -- SUBTOTAL OF GROUP