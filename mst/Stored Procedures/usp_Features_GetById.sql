CREATE PROC [mst].[usp_Features_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT [Id], 
	[FeatureName],
  [IsActive]
FROM [mst].[Features] WITH(NOLOCK)
WHERE [Id] = @Id