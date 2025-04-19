CREATE PROC [mst].[usp_Features_GetAll]
AS
SET NOCOUNT ON

SELECT [Id], 
	[FeatureName],
  [IsActive]
FROM [mst].[Features] WITH(NOLOCK)