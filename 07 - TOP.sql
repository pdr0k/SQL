WUSE ContosoRetailDW

SELECT TOP 10
	EmailAddress,
	Gender,
	MaritalStatus,
	TotalChildren,
	NumberChildrenAtHome,
	NumberCarsOwned AS 'Quantidade de Carros',
	Education

	FROM DimCustomer

ORDER BY 2 DESC, 3 DESC, 4 DESC, [Quantidade de Carros] DESC