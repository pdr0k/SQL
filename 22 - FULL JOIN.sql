USE ContosoRetailDW

SELECT DISTINCT
	[Tabela Produtos].ProductKey,
	[Tabela Produtos].ProductName,
	[Tabela de Vendas].ProductKey as [Produto Fato]
FROM DimProduct AS [Tabela Produtos]
FULL JOIN FactSales AS [Tabela de Vendas] ON [Tabela de Vendas].ProductKey = [Tabela Produtos].ProductKey
ORDER BY 3