

CREATE PROC [dbo].[usp_OperatorMedias_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT [Id], 
	[OperatorId], 
	[MediaId], 
	[DisplayOrder], 
	[IsActive], 
	[CreatedAt], 
	[CreatedBy], 
	[DeletedAt], 
	[DeletedBy]
FROM OperatorMedias
WHERE [Id] = @Id