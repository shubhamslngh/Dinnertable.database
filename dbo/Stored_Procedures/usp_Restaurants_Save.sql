
CREATE PROCEDURE [dbo].[usp_Restaurants_Save]
@Id    UNIQUEIDENTIFIER,
@Name    NVARCHAR(1000),
@PhoneNumber    NVARCHAR(255),
@Email    NVARCHAR(255),
@Description    NVARCHAR(MAX),
@IsTemporarilyClosed    BIT,
@AvgMinCost    SMALLINT,
@AvgMaxCost    SMALLINT,
@SeatingCapacity    INT,
@IsBuffetAvailable    BIT,
@PublicTransport    NVARCHAR(1000),
@Parking    NVARCHAR(1000),
@AdditionalInformation    NVARCHAR(MAX),
@LoyaltyPrograms    NVARCHAR(1000),
@PointOfInterest    NVARCHAR(1000),
@LandMark    NVARCHAR(1000),
@AddressLine1    NVARCHAR(500),
@AddressLine2    NVARCHAR(500),
@City    NVARCHAR(255),
@StateId    UNIQUEIDENTIFIER,
@Latitude    DECIMAL,
@Longitude    DECIMAL,
@IsActive    BIT=1,
@CreatedAt    DATETIME=NULL,
@CreatedBy    NVARCHAR(100),
@UpdatedAt    DATETIME=NULL,
@UpdatedBy    NVARCHAR(100)=NULL
AS
/*--------------------------------------------------------------
             AUTHOR:                                                                                      
       DATE CREATED:  
PURPOSE/DESCRIPTION:  
----------------------------------------------------------------
MODIFIED                                                                                                                    
DATE        AUTHOR              DESCRIPTION                                                                                 
*---------------------------------------------------------------

--------------------------------------------------------------*/
BEGIN
  SET NOCOUNT ON

  DECLARE @TransactionStarted AS INT
  DECLARE @ErrorState         AS INTEGER;
  DECLARE @Msg                AS NVARCHAR(500);

  DECLARE @MergeOutput TABLE
  (
    ActionType NVARCHAR(10),
    NewAddedID UNIQUEIDENTIFIER,
    ExistingID UNIQUEIDENTIFIER
  );

  IF (@@TRANCOUNT = 0) BEGIN  
    SET XACT_ABORT ON;
    SET @TransactionStarted = 1;
    BEGIN TRANSACTION;
  END;

  IF (@CreatedBy IS NULL)
    SET @CreatedBy = 'System'

  IF (@CreatedAt IS NULL)
    SET @CreatedAt = GETDATE()

  BEGIN TRY

  
    MERGE INTO [dbo].[Restaurants] AS T
    USING (SELECT @Id
          ,@Name
          ,@PhoneNumber
          ,@Email
          ,@Description
          ,@IsTemporarilyClosed
          ,@AvgMinCost
          ,@AvgMaxCost
          ,@SeatingCapacity
          ,@IsBuffetAvailable
          ,@PublicTransport
          ,@Parking
          ,@AdditionalInformation
          ,@LoyaltyPrograms
          ,@PointOfInterest
          ,@LandMark
          ,@AddressLine1
          ,@AddressLine2
          ,@City
          ,@StateId
          ,@Latitude
          ,@Longitude
          ,@IsActive
          ,@CreatedAt
          ,@CreatedBy
          ,@UpdatedAt
          ,@UpdatedBy) AS S
           ([Id]
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
          )
        ON (T.Id = S.Id)
        --AND (T.IsActive = 1)
    WHEN MATCHED THEN
      UPDATE SET
         T.[Name] =  S.[Name]
        ,T.[PhoneNumber] =  S.[PhoneNumber]
        ,T.[Email] =  S.[Email]
        ,T.[Description] =  S.[Description]
        ,T.[IsTemporarilyClosed] =  S.[IsTemporarilyClosed]
        ,T.[AvgMinCost] =  S.[AvgMinCost]
        ,T.[AvgMaxCost] =  S.[AvgMaxCost]
        ,T.[SeatingCapacity] =  S.[SeatingCapacity]
        ,T.[IsBuffetAvailable] =  S.[IsBuffetAvailable]
        ,T.[PublicTransport] =  S.[PublicTransport]
        ,T.[Parking] =  S.[Parking]
        ,T.[AdditionalInformation] =  S.[AdditionalInformation]
        ,T.[LoyaltyPrograms] =  S.[LoyaltyPrograms]
        ,T.[PointOfInterest] =  S.[PointOfInterest]
        ,T.[LandMark] =  S.[LandMark]
        ,T.[AddressLine1] =  S.[AddressLine1]
        ,T.[AddressLine2] =  S.[AddressLine2]
        ,T.[City] =  S.[City]
        ,T.[StateId] =  S.[StateId]
        ,T.[Latitude] =  S.[Latitude]
        ,T.[Longitude] =  S.[Longitude]
        ,T.[IsActive] =  S.[IsActive]
        ,T.[UpdatedAt] =  S.[UpdatedAt]
        ,T.[UpdatedBy] =  S.[UpdatedBy]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT([Id]
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
        )
     VALUES(S.[Id]
        ,S.[Name]
        ,S.[PhoneNumber]
        ,S.[Email]
        ,S.[Description]
        ,S.[IsTemporarilyClosed]
        ,S.[AvgMinCost]
        ,S.[AvgMaxCost]
        ,S.[SeatingCapacity]
        ,S.[IsBuffetAvailable]
        ,S.[PublicTransport]
        ,S.[Parking]
        ,S.[AdditionalInformation]
        ,S.[LoyaltyPrograms]
        ,S.[PointOfInterest]
        ,S.[LandMark]
        ,S.[AddressLine1]
        ,S.[AddressLine2]
        ,S.[City]
        ,S.[StateId]
        ,S.[Latitude]
        ,S.[Longitude]
        ,S.[IsActive]
        ,S.[CreatedAt]
        ,S.[CreatedBy]
        )OUTPUT $action
            ,inserted.id
            ,deleted.Id
        INTO @MergeOutput;
        
    IF ((@TransactionStarted = 1) AND (XACT_STATE() = 1))
    BEGIN 
     COMMIT TRANSACTION;
    END

    SELECT @ID = CASE When ActionType='Insert' THEN NewAddedID ELSE ExistingID END
    FROM @MergeOutput

    SELECT @Id as Id

  END TRY


  BEGIN CATCH

    SELECT  @ErrorState = ERROR_STATE();

    SET @Msg = IsNull(ERROR_PROCEDURE(), 'dbo.usp_Restaurants_Save') + ': ' + ERROR_MESSAGE() + ', ' +
               'Line: '  + CONVERT(VARCHAR, ERROR_LINE()) + ', ' +
               'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ', ' +
               'State: ' + CONVERT(VARCHAR, @ErrorState)

    IF ((XACT_STATE() = -1) AND (@TransactionStarted = 1)) BEGIN
      ROLLBACK TRANSACTION;
    END 
    ELSE 
    BEGIN
      IF ((XACT_STATE() = 1) AND (@TransactionStarted = 1)) BEGIN
        COMMIT TRANSACTION;
      END;
    END;

    RAISERROR(@Msg, 16, 1);
  
  END CATCH;
    
END