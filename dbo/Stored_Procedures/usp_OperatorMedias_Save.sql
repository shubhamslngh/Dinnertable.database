

CREATE PROC [dbo].[usp_OperatorMedias_Save]

	@Id uniqueidentifier,
	@OperatorId uniqueidentifier,
	@MediaId uniqueidentifier,
	@DisplayOrder smallint,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100)AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[OperatorMedias] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[OperatorMedias] (
		[Id],
		[OperatorId],
		[MediaId],
		[DisplayOrder],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@OperatorId,
		@MediaId,
		@DisplayOrder,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	
END
ELSE BEGIN
	UPDATE OperatorMedias SET 
		[OperatorId] = @OperatorId,
		[MediaId] = @MediaId,
		[DisplayOrder] = @DisplayOrder,
		[IsActive] = @IsActive
	WHERE [Id] = @Id

END