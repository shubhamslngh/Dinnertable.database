CREATE PROC [mst].[usp_Currencies_GetAll]
AS
SET NOCOUNT ON

SELECT [Id], 
	[Currency], 
	[CurrencySymbol],
  [IsActive]
FROM [mst].[Currencies] WITH(NOLOCK)