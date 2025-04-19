CREATE PROC [dbo].[usp_Restaurants_UpdateIsActive]  
 @Id uniqueidentifier,  
  @IsActive BIT,  
  @UpdatedAt DATETIME,  
  @UpdatedBy NVARCHAR(100)  
AS  
SET NOCOUNT ON  
  

  --UPDATE T
  --SET T.IsActive=@IsActive  
  DELETE T
  FROM [dbo].[RestaurantCreditCards] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id 
  
  --UPDATE T
  --SET T.IsActive=@IsActive  
  DELETE T
  FROM [dbo].[RestaurantCuisines] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive  
  DELETE T
  FROM [dbo].[RestaurantCurrencies] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive  
  DELETE T
  FROM [dbo].[RestaurantEmployeeRelations] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive 
  DELETE T  
  FROM [dbo].[RestaurantFeatures] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive
  DELETE T
  FROM [dbo].[RestaurantFoodTypes] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive
  DELETE T
  FROM [dbo].[RestaurantMediaTags] T
  JOIN [dbo].[RestaurantMedias] TM
    ON TM.Id = T.RestaurantMediaId
  JOIN [dbo].[Restaurants]  TR
    ON TM.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive 
  DELETE T
  FROM [dbo].[RestaurantMedias] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id


  --UPDATE T
  --SET T.IsActive=@IsActive
  DELETE T
  FROM [dbo].[RestaurantOperatingHours] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive  
  DELETE T
  FROM [dbo].[RestaurantSeatingMoments] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  --UPDATE T
  --SET T.IsActive=@IsActive 
  DELETE T
  FROM [dbo].[RestaurantTemporaryClosedDates] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  DELETE T
  FROM [dbo].[Reservations] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  DELETE T
  FROM [dbo].[ReviewMedias] T
  JOIN [dbo].[Reviews] TM
    ON T.ReviewId = TM.Id
  JOIN [dbo].[Restaurants]  TR
    ON TM.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id


  DELETE T
  FROM [dbo].[Reviews] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id

  DELETE T
  FROM [dbo].[BrandOperatorRestaurants] T
  JOIN [dbo].[Restaurants]  TR
    ON T.RestaurantId = TR.Id
  WHERE TR.[Id] = @Id


  --UPDATE T
  --SET IsActive=@IsActive,  
  -- UpdatedAt = @UpdatedAt,  
  -- UpdatedBy = @UpdatedBy 
  DELETE T
  FROM [dbo].[Restaurants] T
  WHERE [Id] = @Id