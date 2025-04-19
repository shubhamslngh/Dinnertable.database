CREATE PROC [dbo].[usp_Brands_GetById]
	@Id uniqueidentifier
AS
SET NOCOUNT ON

SELECT 
  TB.[Id], 
	TB.[BrandName], 
	TB.[ContactPerson], 
	TB.[PhoneNumber], 
	TB.[Email], 
	TB.[AddressLine1], 
	TB.[AddressLine2], 
	TB.[City], 
	TB.[StateId], 
	TB.[Latitude], 
	TB.[Longitude], 
	TB.[LogoMediaId], 
	TB.[IsActive], 
	TB.[CreatedAt], 
	TB.[CreatedBy], 
	TB.[UpdatedAt], 
	TB.[UpdatedBy], 
	TB.[DeletedAt], 
	TB.[DeletedBy],

  TBM.Id,
  TBM.BrandId,
  TBM.MediaId,
  TBM.CreatedAt,
  TBM.CreatedBy,
  TBM.IsActive,
  TBM.DisplayOrder,
  
  TBOR.Id,
  TBOR.BrandId,
  TBOR.Comments,
  TBOR.CreatedAt,
  TBOR.CreatedBy,
  TBOR.EndDate,
  TBOR.IsActive,
  TBOR.OperatorId,
  TBOR.RestaurantId,
  TBOR.StartDate,
  TBOR.UpdatedAt,
  TBOR.UpdatedBy

FROM dbo.Brands TB WITH(NOLOCK)
LEFT JOIN dbo.BrandMedias TBM WITH(NOLOCK)
  ON TB.Id = TBM.BrandId
  AND TBM.IsActive=1
LEFT JOIN dbo.BrandOperatorRestaurants TBOR WITH(NOLOCK)
  ON TB.Id = TBOR.BrandId
  AND TBOR.IsActive=1

WHERE TB.[Id] = @Id