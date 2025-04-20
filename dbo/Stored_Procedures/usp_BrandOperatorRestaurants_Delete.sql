
CREATE PROC [dbo].[usp_BrandOperatorRestaurants_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[BrandOperatorRestaurants]WHERE [Id] = @Id