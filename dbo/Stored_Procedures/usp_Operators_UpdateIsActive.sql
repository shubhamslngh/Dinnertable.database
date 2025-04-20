Create PROC [dbo].[usp_Operators_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT,
  @UpdatedAt datetime, 
  @UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON

UPDATE [dbo].[Operators] SET IsActive=@IsActive, UpdatedAt=@UpdatedAt,UpdatedBy=@UpdatedBy
WHERE [Id] = @Id