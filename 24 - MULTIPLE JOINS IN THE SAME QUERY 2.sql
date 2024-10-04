
USE ContosoRetailDW

SELECT TOP 100
	Sales.SalesAmount,
	Sales.ProductKey,
	Product.ProductName,
	Store.StoreKey,
	Store.StoreName,
	Store.GeographyKey,
	Geo.CityName,
	Geo.RegionCountryName,
	Geo.ContinentName

FROM FactSales AS [Sales]
INNER JOIN DimProduct AS [Product] ON Product.ProductKey = Sales.ProductKey
INNER JOIN DimStore AS [Store] ON Store.StoreKey = Sales.StoreKey
INNER JOIN DimGeography AS [Geo] ON Geo.GeographyKey = Store.GeographyKey
WHERE ContinentName = 'Europe'
