
USE BikeStores;

SELECT
	Products.CategoryID,
	COUNT(*) AS TotalProducts
FROM Production.Product AS Products
GROUP BY Products.CategoryID

SELECT
	Products.CategoryID,
	Products.BrandID,
	COUNT(*) AS TotalProducts
FROM Production.Product AS Products
GROUP BY BrandID, CategoryID;

WITH TOTAL_PER_CATEGORY(CategoryID, TotalProducts) AS
(
	SELECT
		Products.CategoryID,
		COUNT(*) AS TotalProducts
	FROM Production.Product AS Products
	GROUP BY Products.CategoryID
)
SELECT
	Products.CategoryID,
	Products.BrandID,
	COUNT(*) AS TotalProducts,
	TC.TotalProducts AS TotalCategory,
	(COUNT(*)*100.0)/TC.TotalProducts AS '%'
FROM Production.Product AS Products
INNER JOIN TOTAL_PER_CATEGORY AS TC ON TC.CategoryID = Products.CategoryID
GROUP BY Products.CategoryID, BrandID, TotalProducts;


-- AGGREGATING WITH WINDOW FUNCTION
WITH TOTAL_PRODUCT_CATEGORY(CategoryID, BrandID, TotalProducts) AS
(
	SELECT
		Products.CategoryID,
		Products.BrandID,
		COUNT(*) AS TotalProducts
	FROM Production.Product AS Products
	GROUP BY BrandID, Products.CategoryID
)
SELECT
	*,
	SUM(TotalProducts) OVER(PARTITION BY CategoryID) AS Total_Category,
	(TotalProducts*100.0)/SUM(TotalProducts) OVER(PARTITION BY CategoryID) AS 'Percent'
FROM TOTAL_PRODUCT_CATEGORY

-----

SELECT
	Products.CategoryID,
	Products.BrandID,
	Products.ProductID,
	Products.Name,
	Products.ListPrice,
	COUNT(*) OVER() AS Products,
	COUNT(*) OVER(PARTITION BY BrandID) AS Products_Brand,
	SUM(Products.ListPrice) OVER() AS Total_Price,
	SUM(Products.ListPrice) OVER(PARTITION BY BrandID) AS Price_Brand,
	AVG(Products.ListPrice) OVER() AS Total_AVG,
	AVG(Products.ListPrice) OVER(PARTITION BY BrandID) AS AVG_Brand,
	MIN(Products.ListPrice) OVER() AS Total_MinPrice,
	MAX(Products.ListPrice) OVER() AS Total_MaxPrice,
	MIN(Products.ListPrice) OVER(PARTITION BY BrandID) AS Brand_MinPrice,
	MAX(Products.ListPrice) OVER(PARTITION BY BrandID) AS Brand_MaxPrice
	
FROM Production.Product AS Products
WHERE CategoryID = 1
ORDER BY BrandID