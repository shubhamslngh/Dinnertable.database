CREATE PROC [mst].[usp_CancelReasons_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [mst].[CancelReasons] SET IsActive=@IsActive
WHERE [Id] = @Id