CREATE PROC [dbo].[usp_BrandOperatorRestaurants_UpdateIsActive]
	@Id uniqueidentifier,
  @IsActive BIT
AS
SET NOCOUNT ON

UPDATE [dbo].[BrandOperatorRestaurants] SET IsActive=@IsActive
WHERE [Id] = @Id