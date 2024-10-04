

USE ContosoRetailDW;

WITH PRODUCT_ANALYSIS(DATE_YEAR, DATE_MONTH, PRODUCT_ID, PRODUCT_NAME, QUANTITY)
AS
(
	SELECT
		DATEPART(YEAR, Sales.DateKey) AS DATE_YEAR,
		DATEPART(MONTH, Sales.DateKey) AS DATE_MONTH,
		Sales.ProductKey AS PRODUCT_ID,
		Products.ProductName AS PRODUCT_NAME,
		SUM(Sales.SalesQuantity) AS QUANTITY
	FROM FactSales AS Sales

	INNER JOIN DimProduct AS Products 
		ON Products.ProductKey = Sales.ProductKey

	GROUP BY DATEPART(YEAR, Sales.DateKey), DATEPART(MONTH, Sales.DateKey), Sales.ProductKey, Products.ProductName
)

SELECT
	AVG(QUANTITY)
FROM PRODUCT_ANALYSIS