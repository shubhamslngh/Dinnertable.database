  
CREATE PROCEDURE [dbo].[usp_RestaurantAssociatedInfo_GetById]  
@Id UNIQUEIDENTIFIER  
AS  
/*--------------------------------------------------------------  
             AUTHOR:                                                                                        
       DATE CREATED:    
PURPOSE/DESCRIPTION:    
----------------------------------------------------------------  
MODIFIED                                                                                                                      
DATE        AUTHOR              DESCRIPTION                                                                                   
*---------------------------------------------------------------  
TEST CASES:  
exec usp_RestaurantAssociatedInfo_GetById @ID='F23757A7-3321-4C5F-8D74-1FB5C77D4A3A'  
--------------------------------------------------------------*/  
BEGIN  
  SET NOCOUNT ON  
  
  DECLARE @ErrorState         AS INTEGER;  
  DECLARE @Msg                AS NVARCHAR(500);  
  DECLARE @CreationTime       AS DATETIME = GETDATE();  
  
  DECLARE   
  @ParamId      INT,  
  @ParamAgentKey NVARCHAR(50),  
  @ParamName          NVARCHAR(50)  
    
  
  BEGIN TRY  
  
  SELECT   
       TVL.[Id]  
      ,TVL.[Name]  
      ,TVL.[PhoneNumber]  
      ,TVL.[Email]  
      ,TVL.[Description]  
      ,TVL.[IsTemporarilyClosed]  
      ,TVL.[AvgMinCost]  
      ,TVL.[AvgMaxCost]  
      ,TVL.[SeatingCapacity]  
      ,TVL.[IsBuffetAvailable]  
      ,TVL.[PublicTransport]  
      ,TVL.[Parking]  
      ,TVL.[AdditionalInformation]  
      ,TVL.[LoyaltyPrograms]  
      ,TVL.[PointOfInterest]  
      ,TVL.[LandMark]  
      ,TVL.[AddressLine1]  
      ,TVL.[AddressLine2]  
      ,TVL.[City]  
      ,TVL.[StateId]  
      ,TVL.[Latitude]  
      ,TVL.[Longitude]  
      ,TVL.[IsActive]  
      ,TVL.[CreatedAt]  
      ,TVL.[CreatedBy]  
      ,TVL.[UpdatedAt]  
      ,TVL.[UpdatedBy]  
      ,TVL.[DeletedAt]  
      ,TVL.[DeletedBy]  
  
      ,TCC.Id  
      ,TCC.RestaurantId  
      ,TCC.DisplayOrder  
      ,TCC.CreditCardId  
      ,TCC.IsActive  
  
      ,TRC.Id  
      ,TRC.CuisineId  
      ,TRC.RestaurantId  
      ,TRC.IsActive  
  
      ,TRCC.Id  
      ,TRCC.RestaurantId  
      ,TRCC.CurrencyId  
      ,TRCC.IsActive  
  
      ,TRF.Id  
      ,TRF.RestaurantId  
      ,TRF.FeatureId  
      ,TRF.IsActive  
  
      ,TFT.Id  
      ,TFT.RestaurantId  
      ,TFT.FoodTypeId  
      ,TFT.DisplayOrder  
      ,TFT.IsActive  
  
      ,TOH.Id  
      ,TOH.ClosingTime  
      ,TOH.DayOfWeek  
      ,TOH.FromDate  
      ,TOH.IsActive  
      ,TOH.IsClosed  
      ,TOH.OpeningTime  
      ,TOH.RestaurantId  
      ,TOH.ToDate  
        
      ,TSM.Id  
      ,TSM.RestaurantId  
      ,TSM.SeatingMomentId  
      ,TSM.IsActive  
  
    FROM [dbo].[Restaurants] TVL WITH(NOLOCK)   
    LEFT JOIN dbo.RestaurantCreditCards TCC WITH(NOLOCK)  
      ON TVL.Id = TCC.RestaurantId  
      AND TCC.IsActive=1  
    LEFT JOIN dbo.RestaurantCuisines TRC WITH(NOLOCK)  
      ON TVL.Id = TRC.RestaurantId  
      AND TRC.IsActive=1  
    LEFT JOIN dbo.RestaurantCurrencies TRCC WITH(NOLOCK)  
      ON TVL.Id = TRCC.RestaurantId  
      AND TRCC.IsActive=1  
  
    LEFT JOIN dbo.RestaurantFeatures TRF WITH(NOLOCK)  
      ON TVL.Id = TRF.RestaurantId  
      AND TRF.IsActive=1  
    LEFT JOIN dbo.RestaurantFoodTypes TFT WITH(NOLOCK)  
      ON TVL.Id = TFT.RestaurantId  
      AND TFT.IsActive=1  
    LEFT JOIN dbo.RestaurantOperatingHours TOH WITH(NOLOCK)  
      ON TVL.Id = TOH.RestaurantId  
      AND TOH.IsActive=1  
    LEFT JOIN dbo.RestaurantSeatingMoments TSM WITH(NOLOCK)  
      ON TVL.Id = TSM.RestaurantId  
      AND TSM.IsActive=1  
  
   WHERE TVL.Id = @Id  
  
  END TRY  
  BEGIN CATCH  
  
    SELECT  @ErrorState = ERROR_STATE();  
  
    SET @Msg = IsNull(ERROR_PROCEDURE(), 'dbo.[usp_RestaurantAssociatedInfo_GetById]') + ': ' + ERROR_MESSAGE() + ', ' +  
               'Line: '  + CONVERT(VARCHAR, ERROR_LINE()) + ', ' +  
               'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ', ' +  
               'State: ' + CONVERT(VARCHAR, @ErrorState)  
  
    RAISERROR(@Msg, 16, 1);  
    
  END CATCH;  
      
END