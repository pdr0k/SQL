
DECLARE @USER VARCHAR(30);
SET @USER = 'John'

SELECT @USER AS 'User'

USE ContosoRetailDW

DECLARE @DATE DATE
SET @DATE = '2007-01-01'

SELECT * FROM FactOnlineSales

WHERE DateKey = @DATE