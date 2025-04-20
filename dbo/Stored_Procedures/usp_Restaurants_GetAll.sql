
CREATE PROCEDURE [dbo].[usp_Restaurants_GetAll]
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

  SELECT [Id]
      ,[Name]
      ,[PhoneNumber]
      ,[Email]
      ,[Description]
      ,[IsTemporarilyClosed]
      ,[AvgMinCost]
      ,[AvgMaxCost]
      ,[SeatingCapacity]
      ,[IsBuffetAvailable]
      ,[PublicTransport]
      ,[Parking]
      ,[AdditionalInformation]
      ,[LoyaltyPrograms]
      ,[PointOfInterest]
      ,[LandMark]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[City]
      ,[StateId]
      ,[Latitude]
      ,[Longitude]
      ,[IsActive]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[DeletedAt]
      ,[DeletedBy]
  FROM [dbo].[Restaurants] TVL WITH(NOLOCK) 
  --WHERE TVL.IsActive=1

  END TRY
  BEGIN CATCH

    SELECT  @ErrorState = ERROR_STATE();

    SET @Msg = IsNull(ERROR_PROCEDURE(), 'dbo.[usp_SEL_Restaurants]') + ': ' + ERROR_MESSAGE() + ', ' +
               'Line: '  + CONVERT(VARCHAR, ERROR_LINE()) + ', ' +
               'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ', ' +
               'State: ' + CONVERT(VARCHAR, @ErrorState)

    RAISERROR(@Msg, 16, 1);
  
  END CATCH;
    
END