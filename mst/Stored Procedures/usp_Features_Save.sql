CREATE PROC [mst].[usp_Features_Save]

	@Id uniqueidentifier,
	@FeatureName nvarchar(255),
  @IsActive bit
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [mst].[Features] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [mst].[Features] (
		[Id],
		[FeatureName],
    [IsActive]
	)
	VALUES (
		@Id,
		@FeatureName,
    @IsActive
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE Features SET 
		[FeatureName] = @FeatureName,
    [IsActive]=@IsActive
	WHERE [Id] = @Id

END