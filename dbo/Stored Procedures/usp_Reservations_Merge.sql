CREATE PROC [dbo].[usp_Reservations_Merge]

	@Id uniqueidentifier,
	@RestaurantId uniqueidentifier,
	@PaxCount smallint,
	@BookingTime datetime,
	@BookingStatusId uniqueidentifier,
	@CustomerId uniqueidentifier,
	@SpecialOccasionId uniqueidentifier,
	@ConfirmedAt datetime,
	@ConfirmedBy uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100),
	@UpdatedAt datetime,
	@UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[Reservations] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[Reservations] (
		[Id],
		[RestaurantId],
		[PaxCount],
		[BookingTime],
		[BookingStatusId],
		[CustomerId],
		[SpecialOccasionId],
		[ConfirmedAt],
		[ConfirmedBy],
		[IsActive],
		[CreatedAt],
		[CreatedBy],
		[UpdatedAt],
		[UpdatedBy]
	)
	VALUES (
		@Id,
		@RestaurantId,
		@PaxCount,
		@BookingTime,
		@BookingStatusId,
		@CustomerId,
		@SpecialOccasionId,
		@ConfirmedAt,
		@ConfirmedBy,
		@IsActive,
		@CreatedAt,
		@CreatedBy,
		@UpdatedAt,
		@UpdatedBy
	)
	
END
ELSE BEGIN
	UPDATE Reservations SET 
		[RestaurantId] = @RestaurantId,
		[PaxCount] = @PaxCount,
		[BookingTime] = @BookingTime,
		[BookingStatusId] = @BookingStatusId,
		[CustomerId] = @CustomerId,
		[SpecialOccasionId] = @SpecialOccasionId,
		[ConfirmedAt] = @ConfirmedAt,
		[ConfirmedBy] = @ConfirmedBy,
		[IsActive] = @IsActive,
		[CreatedAt] = @CreatedAt,
		[CreatedBy] = @CreatedBy,
		[UpdatedAt] = @UpdatedAt,
		[UpdatedBy] = @UpdatedBy
	WHERE [Id] = @Id

END

SELECT @Id AS Id