  
CREATE PROCEDURE [dbo].[usp_Restaurants_Search]  
 @Name      NVARCHAR(1000)=NULL,  
 @City      NVARCHAR(255)=NULL,  
 --@AddressLine1 NVARCHAR(500)=NULL,  
 @Latitude DECIMAL(14,10)=NULL,  
 @Longitude DECIMAL(14,10)=NULL  
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
  IF @Name =''  
 SET @Name = NULL;  
  
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
      ,CASE WHEN @Latitude IS NOT NULL AND @Longitude IS NOT NULL   
        THEN dbo.fn_Distance_Get(@Latitude,@Longitude,TVL.Latitude,TVL.Longitude)   
        ELSE NULL END AS Distance  
      ,ABS(CHECKSUM(NEWID()) % 4) + 2 AS Rating
      ,TRM.Id
      ,TRM.RestaurantId
      ,TRM.IsUploadedByRestaurant
      ,TRM.DisplayOrder
      ,TRM.MediaId
      ,TRM.IsActive

      ,TM.Id
      ,TM.MediaName
      ,TM.MediaPath
      ,TM.MediaTypeId
      ,TM.IsActive
      ,TM.ThumbNailMediaId

      ,TMT.Id
      ,TMT.MediaType
      ,TMT.IsActive

    FROM [dbo].[Restaurants] TVL WITH(NOLOCK)   
    LEFT JOIN dbo.RestaurantMedias TRM WITH(NOLOCK)   
      ON TVL.Id = TRM.RestaurantId
      AND TRM.IsActive=1
    LEFT JOIN dbo.Medias TM WITH(NOLOCK)   
      ON TM.Id = TRM.MediaId
      AND TM.IsActive=1
    LEFT JOIN mst.MediaTypes TMT WITH(NOLOCK)   
      ON TMT.Id = TM.MediaTypeId
      AND TMT.IsActive=1
    
    WHERE TVL.IsActive=1  
    AND (@Name IS NULL OR TVL.Name LIKE '%' + @Name + '%')  
    AND (@City IS NULL OR TVL.City LIKE '%' + @City + '%')  
    AND (@Latitude IS NULL OR @Longitude IS NULL OR (ABS(Latitude - @Latitude) <= 0.2 AND ABS(Longitude - @Longitude) <= 0.3))  



  END TRY  
  BEGIN CATCH  
  
    SELECT  @ErrorState = ERROR_STATE();  
  
    SET @Msg = IsNull(ERROR_PROCEDURE(), 'dbo.[usp_Restaurants_Search]') + ': ' + ERROR_MESSAGE() + ', ' +  
               'Line: '  + CONVERT(VARCHAR, ERROR_LINE()) + ', ' +  
               'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ', ' +  
               'State: ' + CONVERT(VARCHAR, @ErrorState)  
  
    RAISERROR(@Msg, 16, 1);  
    
  END CATCH;  
      
END