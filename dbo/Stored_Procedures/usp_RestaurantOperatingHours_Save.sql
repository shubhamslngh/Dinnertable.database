CREATE PROC [dbo].[usp_RestaurantOperatingHours_Save]  
  
 @Id uniqueidentifier,  
 @RestaurantId uniqueidentifier,  
 @DayOfWeek tinyint,  
 @OpeningTime time,  
 @ClosingTime time,  
 @FromDate date,  
 @ToDate date,  
 @IsClosed bit,  
 @IsActive bit,  
 @CreatedAt datetime,  
 @CreatedBy nvarchar(100),  
 @UpdatedAt datetime,  
 @UpdatedBy nvarchar(100)  
  
AS  
SET NOCOUNT ON  
IF NOT EXISTS (SELECT * FROM [dbo].[RestaurantOperatingHours] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN  
 INSERT INTO [dbo].[RestaurantOperatingHours] (  
  [Id],  
  [RestaurantId],  
  [DayOfWeek],  
  [OpeningTime],  
  [ClosingTime],  
  [FromDate],  
  [ToDate],  
  [IsClosed],  
  [IsActive],  
  [CreatedAt],  
  [CreatedBy]
  
 )  
 VALUES (  
  @Id,  
  @RestaurantId,  
  @DayOfWeek,  
  @OpeningTime,  
  @ClosingTime,  
  @FromDate,  
  @ToDate,  
  @IsClosed,  
  @IsActive,  
  @CreatedAt,  
  @CreatedBy 

 )  
 SELECT SCOPE_IDENTITY() As InsertedID  
END  
ELSE BEGIN  
 UPDATE RestaurantOperatingHours SET   
  [RestaurantId] = @RestaurantId,  
  [DayOfWeek] = @DayOfWeek,  
  [OpeningTime] = @OpeningTime,  
  [ClosingTime] = @ClosingTime,  
  [FromDate] = @FromDate,  
  [ToDate] = @ToDate,  
  [IsClosed] = @IsClosed,  
  [IsActive] = @IsActive,  
  [UpdatedAt] = @UpdatedAt,  
  [UpdatedBy] = @UpdatedBy  
  
 WHERE [Id] = @Id  
  
END