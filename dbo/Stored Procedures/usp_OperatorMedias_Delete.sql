

CREATE PROC [dbo].[usp_OperatorMedias_Delete]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

DELETE FROM [dbo].[OperatorMedias]
WHERE [Id] = @Id