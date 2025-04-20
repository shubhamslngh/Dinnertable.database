CREATE PROC [mst].[usp_CreditCards_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT [Id], 
	[CreditCardName],
  [IsActive]
FROM [mst].[CreditCards] WITH(NOLOCK)
WHERE [Id] = @Id