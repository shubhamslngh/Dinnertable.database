CREATE PROC [dbo].[usp_OperatorMedias_GetAll]
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