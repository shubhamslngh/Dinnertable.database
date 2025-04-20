CREATE PROC [mst].[usp_SeatingMoments_Save]

	@Id uniqueidentifier,
	@SeatingMoment nvarchar(255),
  @IsActive bit
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [mst].[SeatingMoments] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [mst].[SeatingMoments] (
		[Id],
		[SeatingMoments],
    [IsActive]
	)
	VALUES (
		@Id,
		@SeatingMoment,
    @IsActive
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE SeatingMoments SET 
		[SeatingMoments] = @SeatingMoment,
    [IsActive]=@IsActive
	WHERE [Id] = @Id

END