CREATE PROC [mst].[usp_CreditCards_GetAll]
AS
SET NOCOUNT ON

SELECT [Id], 
	[CreditCardName],
  [IsActive]
FROM [mst].[CreditCards] WITH(NOLOCK)