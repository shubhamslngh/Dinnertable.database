CREATE PROC [dbo].[usp_RestaurantSeatingMoments_Save]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@SeatingMomentId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)

AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantSeatingMoments] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[RestaurantSeatingMoments] (
		[Id],
		[RestaurantId],
		[SeatingMomentId],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@RestaurantId,
		@SeatingMomentId,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE RestaurantSeatingMoments SET 
		[RestaurantId] = @RestaurantId,
		[SeatingMomentId] = @SeatingMomentId,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

END