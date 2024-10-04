USE ContosoRetailDW

SELECT
	COUNT(DISTINCT(ProductKey))
FROM DimProduct


SELECT
	COUNT(DISTINCT(ProductKey))
FROM FactSales


SELECT DISTINCT
	[Tabela Produtos].ProductKey,
	[Tabela Produtos].ProductName,
	[Tabela de Vendas].ProductKey as [Produto Fato]
FROM DimProduct AS [Tabela Produtos]
LEFT JOIN FactSales AS [Tabela de Vendas] ON [Tabela de Vendas].ProductKey = [Tabela Produtos].ProductKey
-- Left Join count the common between two tables + the remaining of the left table (in this case, Fact Table)
ORDER BY 3