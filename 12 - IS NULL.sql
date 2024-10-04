USE ContosoRetailDW

SELECT
	EmailAddress,
	Gender,
	MaritalStatus,
	TotalChildren,
	NumberChildrenAtHome,
	NumberCarsOwned AS 'Quantidade de Carros',
	Education

FROM DimCustomer
WHERE
	Education = 'High School'
	AND NumberChildrenAtHome >= 1
	AND TotalChildren IN (3, 4)
	AND MaritalStatus IS NULL

ORDER BY 2 DESC, 3 DESC, 4 DESC, [Quantidade de Carros] DESC