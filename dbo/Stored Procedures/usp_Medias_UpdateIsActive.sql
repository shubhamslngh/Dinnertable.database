CREATE PROC [dbo].[usp_Medias_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [dbo].[Medias] SET IsActive=@IsActive
WHERE [Id] = @Id