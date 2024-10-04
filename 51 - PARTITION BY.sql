
SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[Composer]
      ,[Milliseconds]
	  ,ROW_NUMBER() OVER(ORDER BY Milliseconds DESC) AS 'ROW_NUMBER'
	  ,ROW_NUMBER() OVER(PARTITION BY Composer ORDER BY Milliseconds DESC) AS 'ROW_NUMBER_PARTITION_BY'
  FROM [Chinook].[dbo].[Track]

WHERE Composer LIKE '%Anthony Kiedis%'