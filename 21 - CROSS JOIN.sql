USE ContosoRetailDW

SELECT DISTINCT
	[Tabela Produtos].ProductKey,
	[Tabela de Vendas].ProductKey as [Produto Fato]
FROM DimProduct AS [Tabela Produtos]

CROSS JOIN FactSales [Tabela de Vendas]