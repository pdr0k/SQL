

USE ContosoRetailDW


--https://learn.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver16

SELECT
	GETDATE(),
	FORMAT(GETDATE(), 'yy/MM/dd HH:mm'),
	FORMAT(GETDATE(), 'yyyy-MM/MMM')