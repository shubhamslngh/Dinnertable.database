CREATE PROC [dbo].[usp_RestaurantCuisines_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@CuisineId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantCuisines] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantCuisines] (
		[Id],
		[RestaurantId],
		[CuisineId],
		[IsActive],
		[CreatedAt],
		[CreatedBy]

	)
	VALUES (
		@Id,
		@RestaurantId,
		@CuisineId,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantCuisines SET 
		[RestaurantId] = @RestaurantId,
		[CuisineId] = @CuisineId,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

END