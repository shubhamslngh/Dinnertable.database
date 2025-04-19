

CREATE PROC [dbo].[usp_Operators_Delete]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

DELETE FROM [dbo].[Operators]
WHERE [Id] = @Id