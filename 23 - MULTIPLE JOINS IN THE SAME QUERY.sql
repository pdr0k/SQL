
USE ContosoRetailDW

-- ALWAYS START "SELECT" WITH THE MAIN TABLE

SELECT TOP 100
	Sales.SalesKey,
	Sales.SalesAmount,
	[Tabela Produto].ProductKey,
	[Tabela Produto].ProductName,
	[Tabela SubProduto].ProductSubcategoryKey,
	[Tabela SubProduto].ProductSubcategoryName,
	[Tabela CategoriaProduto].ProductCategoryKey,
	[Tabela CategoriaProduto].ProductCategoryName

FROM FactSales AS [Sales]

INNER JOIN DimProduct as [Tabela Produto] ON [Tabela Produto].ProductKey = Sales.ProductKey
INNER JOIN DimProductSubcategory as [Tabela SubProduto] ON [Tabela SubProduto].ProductSubcategoryKey = [Tabela Produto].ProductSubcategoryKey
INNER JOIN DimProductCategory as [Tabela CategoriaProduto] ON [Tabela CategoriaProduto].ProductCategoryKey = [Tabela SubProduto].ProductCategoryKey
