CREATE PROC [mst].[usp_AddressTypes_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [mst].[AddressTypes] SET IsActive=@IsActive
WHERE [Id] = @Id