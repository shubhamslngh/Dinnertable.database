CREATE PROC [dbo].[usp_RestaurantFeatures_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@FeatureId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)

AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantFeatures] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantFeatures] (
		[Id],
		[RestaurantId],
		[FeatureId],
		[IsActive],
		[CreatedAt],
		[CreatedBy]

	)
	VALUES (
		@Id,
		@RestaurantId,
		@FeatureId,
		@IsActive,
		@CreatedAt,
		@CreatedBy

	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantFeatures SET 
		[RestaurantId] = @RestaurantId,
		[FeatureId] = @FeatureId,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

END