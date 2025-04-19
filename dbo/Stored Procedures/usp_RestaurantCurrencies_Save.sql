
CREATE PROC [dbo].[usp_RestaurantCurrencies_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@CurrencyId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100),
	@UpdatedAt datetime,
	@UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantCurrencies] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantCurrencies] (
		[Id],
		[RestaurantId],
		[CurrencyId],
		[IsActive],
		[CreatedAt],
		[CreatedBy],
		[UpdatedAt],
		[UpdatedBy]
		
	)
	VALUES (
		@Id,
		@RestaurantId,
		@CurrencyId,
		@IsActive,
		@CreatedAt,
		@CreatedBy,
		@UpdatedAt,
		@UpdatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantCurrencies SET 
		[RestaurantId] = @RestaurantId,
		[CurrencyId] = @CurrencyId,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy,
		[UpdatedAt] = @UpdatedAt,
		[UpdatedBy] = @UpdatedBy
	WHERE [Id] = @Id

END