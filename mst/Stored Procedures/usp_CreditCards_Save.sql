CREATE PROC [mst].[usp_CreditCards_Save]

	@Id uniqueidentifier,
	@CreditCardName nvarchar(50),
  @IsActive Bit
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [mst].[CreditCards] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [mst].[CreditCards] (
		[Id],
		[CreditCardName],
    [IsActive]
	)
	VALUES (
		@Id,
		@CreditCardName,
    @IsActive
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE CreditCards SET 
		[CreditCardName] = @CreditCardName,
    [IsActive] = @IsActive
	WHERE [Id] = @Id

END