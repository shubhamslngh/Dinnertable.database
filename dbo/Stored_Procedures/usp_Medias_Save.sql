CREATE PROC [dbo].[usp_Medias_Save]

	@Id uniqueidentifier,
	@MediaName nvarchar(500),
	@MediaPath nvarchar(1000),
	@MediaTypeId uniqueidentifier,
	@ThumbNailMediaId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)
AS
SET NOCOUNT ON

DECLARE @NEWID uniqueidentifier

IF NOT EXISTS (SELECT * FROM [dbo].[Medias] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[Medias] (
		[Id],
		[MediaName],
		[MediaPath],
		[MediaTypeId],
		[ThumbNailMediaId],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@MediaName,
		@MediaPath,
		@MediaTypeId,
		@ThumbNailMediaId,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	SELECT @NEWID = @ID
END
ELSE BEGIN
	UPDATE Medias SET 
		[MediaName] = @MediaName,
		[MediaPath] = @MediaPath,
		[MediaTypeId] = @MediaTypeId,
		[ThumbNailMediaId] = @ThumbNailMediaId,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy
	WHERE [Id] = @Id

  SELECT @NEWID = @Id

END

SELECT @NEWID AS ID