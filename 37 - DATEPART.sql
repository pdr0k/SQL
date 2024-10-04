

USE ContosoRetailDW

--DATEPART (part, date)
/*
==============================================
|  Value        || Returned Part    || Abbreviation |
==============================================
| year          || Year             || yy, yyyy      |
| quarter       || Quarter (1/4 year)|| qq, q         |
| month         || Month            || mm, m         |
| dayofyear     || Day of the year  || dy, y         |
| day           || Day              || dd, d         |
| week          || Week             || wk, ww        |
| weekday       || Day of the week  || dw            |
| hour          || Hour             || hh            |
| minute        || Minute           || mi, n         |
| second        || Second           || ss, s         |
==============================================
*/

SELECT TOP 100

	DateKey,
	DATEPART(yy, DateKey) AS [Year],
	DATEPART(quarter, DateKey) AS 'Quarter'

FROM FactSales

WHERE DATEPART(quarter, DateKey) = 3
	AND DATEPART(yy, DateKey) = 2007