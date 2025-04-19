CREATE PROC [dbo].[usp_Reservations_GetAll]
AS
SET NOCOUNT ON

SELECT 
  TR.[Id], 
	TR.[RestaurantId], 
	TR.[PaxCount], 
	TR.[BookingTime], 
	TR.[BookingStatusId], 
	TR.[CustomerId], 
	TR.[SpecialOccasionId], 
	TR.[ConfirmedAt], 
	TR.[ConfirmedBy], 
	TR.[CanceledAt], 
	TR.[CanceledBy], 
	TR.[CancelReasonId], 
	TR.[FinalPaxCount], 
	TR.[InvoiceId], 
	TR.[IsActive], 
	TR.[CreatedAt], 
	TR.[CreatedBy], 
	TR.[UpdatedAt], 
	TR.[UpdatedBy], 
	TR.[DeletedAt], 
	TR.[DeletedBy],

  TRC.[Id],
  TRC.ReservationId,
  TRC.Comment,
	TRC.[IsActive], 
	TRC.[CreatedAt], 
	TRC.[CreatedBy], 
	TRC.[UpdatedAt], 
	TRC.[UpdatedBy], 
	TRC.[DeletedAt], 
	TRC.[DeletedBy]


FROM Reservations TR WITH (NOLOCK)
LEFT JOIN dbo.ReservationComments TRC WITH (NOLOCK)
  ON TR.Id = TRC.ReservationId