


CREATE PROC [dbo].[usp_RestaurantCreditCards_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@CreditCardId uniqueidentifier,
	@DisplayOrder smallint,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantCreditCards] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantCreditCards] (
		[Id],
		[RestaurantId],
		[CreditCardId],
		[DisplayOrder],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@RestaurantId,
		@CreditCardId,
		@DisplayOrder,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantCreditCards SET 
		[RestaurantId] = @RestaurantId,
		[CreditCardId] = @CreditCardId,
		[DisplayOrder] = @DisplayOrder,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

END