CREATE PROC [mst].[usp_SeatingMoments_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT [Id], 
	[SeatingMoments] as SeatingMoment,
  [IsActive]
FROM [mst].[SeatingMoments] WITH(NOLOCK)
WHERE [Id] = @Id