CREATE PROC [mst].[usp_Cuisines_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [mst].[Cuisines] SET IsActive=@IsActive
WHERE [Id] = @Id