CREATE PROC [mst].[usp_Currencies_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT [Id], 
	[Currency], 
	[CurrencySymbol],
  [IsActive]
FROM [mst].[Currencies] WITH(NOLOCK)
WHERE [Id] = @Id