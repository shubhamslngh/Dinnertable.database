CREATE PROC [dbo].[usp_Operators_GetAll]
AS
SET NOCOUNT ON

  SELECT 
    TOS.[Id], 
	  TOS.[OperatorName], 
	  TOS.[BrandId], 
	  TOS.[ContactPerson], 
	  TOS.[PhoneNumber], 
	  TOS.[Email], 
	  TOS.[AddressLine1], 
	  TOS.[AddressLine2], 
	  TOS.[City], 
	  TOS.[StateId], 
	  TOS.[Latitude], 
	  TOS.[Longitude], 
	  TOS.[LogoMediaId], 
	  TOS.[IsActive], 
	  TOS.[CreatedAt], 
	  TOS.[CreatedBy], 
	  TOS.[UpdatedAt], 
	  TOS.[UpdatedBy], 
	  TOS.[DeletedAt], 
	  TOS.[DeletedBy]

    ,TOM.[Id]
    ,TOM.[OperatorId]
    ,TOM.[MediaId]
    ,TOM.[DisplayOrder]
    ,TOM.[IsActive]
    ,TOM.[CreatedAt]
    ,TOM.[CreatedBy]
    ,TOM.[DeletedAt]
    ,TOM.[DeletedBy]


  FROM dbo.Operators TOS WITH(NOLOCK)
  LEFT JOIN dbo.OperatorMedias TOM  WITH(NOLOCK)
    ON TOS.Id = TOM.OperatorId
    AND TOM.IsActive=1