CREATE PROC [mst].[usp_Currencies_Save]

	@Id uniqueidentifier,
	@Currency nvarchar(50),
	@CurrencySymbol nvarchar(50),
  @IsActive bit
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [mst].[Currencies] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [mst].[Currencies] (
		[Id],
		[Currency],
		[CurrencySymbol],
    [IsActive]
	)
	VALUES (
		@Id,
		@Currency,
		@CurrencySymbol,
    @IsActive
	)
	SELECT SCOPE_IDENTITY() As InsertedID
END
ELSE BEGIN
	UPDATE Currencies SET 
		[Currency] = @Currency,
		[CurrencySymbol] = @CurrencySymbol,
    [IsActive] = @IsActive
	WHERE [Id] = @Id

END