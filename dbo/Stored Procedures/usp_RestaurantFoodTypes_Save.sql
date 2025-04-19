
CREATE PROC [dbo].[usp_RestaurantFoodTypes_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@FoodTypeId uniqueidentifier,
	@DisplayOrder smallint,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantFoodTypes] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantFoodTypes] (
		[Id],
		[RestaurantId],
		[FoodTypeId],
		[DisplayOrder],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@RestaurantId,
		@FoodTypeId,
		@DisplayOrder,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantFoodTypes SET 
		[RestaurantId] = @RestaurantId,
		[FoodTypeId] = @FoodTypeId,
		[DisplayOrder] = @DisplayOrder,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

END