
CREATE PROC [dbo].[usp_RestaurantFoodTypes_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantFoodTypes]WHERE [Id] = @Id