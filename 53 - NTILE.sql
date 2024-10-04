SELECT [TrackId]
      ,[Name]
	  ,[GenreId]
      ,[AlbumId]
      ,[Milliseconds]
      ,[UnitPrice]
	  ,ROW_NUMBER() OVER(ORDER BY UnitPrice ASC) AS 'ROW_NUMBER'
	  ,RANK() OVER(ORDER BY UnitPrice ASC) AS 'RANK'
	  ,DENSE_RANK() OVER(ORDER BY UnitPrice ASC) AS 'DENSE_RANK'
	  ,NTILE(12) OVER(PARTITION BY GenreID ORDER BY UnitPrice ASC) AS 'NTILE' -- DYNAMICALLY CREATES GROUPS
  FROM [Chinook].[dbo].[Track]