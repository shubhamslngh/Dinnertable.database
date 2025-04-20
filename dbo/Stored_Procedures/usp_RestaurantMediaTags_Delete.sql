
CREATE PROC [dbo].[usp_RestaurantMediaTags_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantMediaTags]WHERE [Id] = @Id