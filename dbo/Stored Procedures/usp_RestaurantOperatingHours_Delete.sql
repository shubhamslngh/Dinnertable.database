
CREATE PROC [dbo].[usp_RestaurantOperatingHours_Delete]	@Id uniqueidentifierASSET NOCOUNT ONDELETE FROM [dbo].[RestaurantOperatingHours]WHERE [Id] = @Id