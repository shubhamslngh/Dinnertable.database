CREATE PROC [mst].[usp_Features_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [mst].[Features] SET IsActive=@IsActive
WHERE [Id] = @Id