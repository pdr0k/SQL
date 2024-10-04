SELECT [TrackId]
      ,[Name]
      ,[AlbumId]
      ,[Milliseconds]
      ,[UnitPrice]
	  ,ROW_NUMBER() OVER(ORDER BY UnitPrice ASC) AS 'ROW_NUMBER'
	  ,RANK() OVER(ORDER BY UnitPrice ASC) AS 'RANK' -- skips the next number when the previous ones have been repeated
	  ,DENSE_RANK() OVER(ORDER BY UnitPrice ASC) AS 'DENSE_RANK' -- goes to the next number even when the previous was repeated, not skipping the sequence
  FROM [Chinook].[dbo].[Track]