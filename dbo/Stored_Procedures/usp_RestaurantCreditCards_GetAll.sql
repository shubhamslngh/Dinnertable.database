CREATE PROC [dbo].[usp_RestaurantCreditCards_GetAll]
AS
SET NOCOUNT ON

SELECT [Id], 
	[RestaurantId], 
	[CreditCardId], 
	[DisplayOrder], 
	[IsActive], 
	[CreatedAt], 
	[CreatedBy], 
	[DeletedAt], 
	[DeletedBy]
FROM [dbo].[RestaurantCreditCards] WITH(NOLOCK)