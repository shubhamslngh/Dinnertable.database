CREATE PROC [dbo].[usp_Brands_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT,
  @UpdatedAt datetime, 
  @UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON

UPDATE [dbo].[Brands] SET IsActive=@IsActive, UpdatedAt=@UpdatedAt,UpdatedBy=@UpdatedBy
WHERE [Id] = @Id