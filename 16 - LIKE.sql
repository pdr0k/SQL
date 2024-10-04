



USE ContosoRetailDW

--SEARCHING FULL NAME
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	*
FROM DimEmployee

WHERE FirstName + ' ' + LastName LIKE 'Aaron Painter'


--SEARCHING "Paul" as FirstName
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	*
FROM DimEmployee

WHERE FirstName + ' ' + LastName LIKE 'Paul%'

--SEARCHING "Paul" anywhere in the string / Not CaseSensitive
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	*
FROM DimEmployee

WHERE FirstName + ' ' + LastName LIKE '%Paul%'


--Finishes with 'Allen'
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	*
FROM DimEmployee

WHERE FirstName + ' ' + LastName LIKE '%Allen'

--Finishes with 'Allen'

--When you don't know some letter of the name
SELECT
	FirstName + ' ' + LastName AS [Full Name],
	*
FROM DimEmployee

WHERE FirstName + ' ' + LastName LIKE '%gon[zs]ale[zs]%'
-- in the case above, [zs] means it can be 'z' or 's'
-- careful using LIKE