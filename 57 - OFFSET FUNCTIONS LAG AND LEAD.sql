USE ContosoRetailDW;

WITH TOTAL_SALES([Year], [Month], [Sales]) AS
(
	SELECT
		DATEPART(YEAR, Sales.DateKey) AS [Year],
		DATEPART(MONTH, Sales.DateKey) AS [Month],
		SUM(Sales.SalesAmount) AS [Sales]
	FROM FactOnlineSales AS Sales
	GROUP BY DATEPART(YEAR, Sales.DateKey), DATEPART(MONTH, Sales.DateKey)
)

SELECT
	[Year],
	[Month],
	FORMAT([Sales], 'C0') AS 'Sales',
	FORMAT(LAG([Sales], 1, 0) OVER (ORDER BY [Year], [Month] ASC), 'C0') AS LAST_MONTH,
	FORMAT(LEAD([Sales], 1, 0) OVER (ORDER BY [Year], [Month] ASC), 'C0') AS NEXT_MONTH,
	FORMAT(LAG([Sales], 3, 0) OVER (ORDER BY [Year], [Month] ASC), 'C0') AS THIRD_MONTH_PRIOR,
	FORMAT(LAG([Sales], 3, 0) OVER (PARTITION BY YEAR ORDER BY [Year], [Month] ASC), 'C0') AS THIRD_MONTH_PRIOR
FROM TOTAL_SALES
ORDER BY [Year], [Month]

USE BikeStores;
SELECT
    Customers.CustomerID,
    Customers.LastName,
    Customers.FirstName,
    Orders.OrderID,
    LAG(Orders.OrderID, 1, Orders.OrderID) OVER(PARTITION BY Customers.CustomerID ORDER BY Orders.OrderID ASC) AS Previous_Order,
    LEAD(Orders.OrderID, 1, Orders.OrderID) OVER(PARTITION BY Customers.CustomerID ORDER BY Orders.OrderID ASC) AS Next_Order 
FROM Sales.Customer AS Customers
INNER JOIN Sales.[Order] Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerID;