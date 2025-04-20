CREATE PROC [dbo].[usp_Reservations_UpdForInvoice]
	@Id uniqueidentifier,
  @IsActive BIT,
  @UpdatedAt datetime,
  @UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON

UPDATE [dbo].[Reservations] 
SET IsActive=@IsActive,
UpdatedAt=@UpdatedAt,
UpdatedBy=@UpdatedBy
WHERE [Id] = @Id