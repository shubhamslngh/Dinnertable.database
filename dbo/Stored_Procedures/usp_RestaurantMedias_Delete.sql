
CREATE PROC [dbo].[usp_RestaurantMedias_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantMedias]WHERE [Id] = @Id