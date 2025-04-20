CREATE PROC [dbo].[usp_RestaurantMedias_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@MediaId uniqueidentifier,
	@DisplayOrder smallint,
	@IsUploadedByRestaurant bit=0,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantMedias] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantMedias] (
		[Id],
		[RestaurantId],
		[MediaId],
		[DisplayOrder],
		[IsUploadedByRestaurant],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@RestaurantId,
		@MediaId,
		@DisplayOrder,
		@IsUploadedByRestaurant,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantMedias SET 
		[RestaurantId] = @RestaurantId,
		[MediaId] = @MediaId,
		[DisplayOrder] = @DisplayOrder,
		[IsUploadedByRestaurant] = @IsUploadedByRestaurant,
		[IsActive] = @IsActive
	WHERE [Id] = @Id

END