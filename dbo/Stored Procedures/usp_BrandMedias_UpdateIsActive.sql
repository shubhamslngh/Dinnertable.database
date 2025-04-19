CREATE PROC [dbo].[usp_BrandMedias_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [dbo].[BrandMedias] SET IsActive=@IsActive
WHERE [Id] = @Id