
CREATE PROC [dbo].[usp_RestaurantCuisines_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantCuisines]WHERE [Id] = @Id