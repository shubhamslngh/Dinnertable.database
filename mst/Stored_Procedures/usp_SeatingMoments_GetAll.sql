
CREATE PROC [mst].[usp_SeatingMoments_GetAll]
AS
SET NOCOUNT ON

SELECT [Id], 
	[SeatingMoments] AS SeatingMoment,
  [IsActive]
FROM [mst].[SeatingMoments] WITH(NOLOCK)