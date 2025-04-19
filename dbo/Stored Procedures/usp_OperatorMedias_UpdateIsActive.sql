Create PROC [dbo].[usp_OperatorMedias_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [dbo].[OperatorMedias] SET IsActive=@IsActive
WHERE [Id] = @Id