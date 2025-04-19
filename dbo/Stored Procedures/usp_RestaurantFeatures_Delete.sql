
CREATE PROC [dbo].[usp_RestaurantFeatures_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantFeatures]WHERE [Id] = @Id