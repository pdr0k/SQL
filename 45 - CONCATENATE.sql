
DECLARE @USER VARCHAR(30);
SET @USER = 'Mary ';


DECLARE @USER2 VARCHAR(30);
SET @USER2 = 'John';


SELECT @USER + @USER2

SELECT CONCAT(@USER2, ' ','Peavy')