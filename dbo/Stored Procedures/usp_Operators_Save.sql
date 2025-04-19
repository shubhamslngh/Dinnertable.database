

CREATE PROC [dbo].[usp_Operators_Save]

	@Id uniqueidentifier,
	@OperatorName nvarchar(1000),
	@BrandId uniqueidentifier,
	@ContactPerson nvarchar(1000),
	@PhoneNumber nvarchar(255),
	@Email nvarchar(255),
	@AddressLine1 nvarchar(500),
	@AddressLine2 nvarchar(500),
	@City nvarchar(255),
	@StateId uniqueidentifier,
	@Latitude decimal,
	@Longitude decimal,
	@LogoMediaId uniqueidentifier,
	@IsActive bit,
	@CreatedAt datetime,
	@CreatedBy nvarchar(100),
	@UpdatedAt datetime,
	@UpdatedBy nvarchar(100)
AS
SET NOCOUNT ON
IF NOT EXISTS (SELECT * FROM [dbo].[Operators] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[Operators] (
		[Id],
		[OperatorName],
		[BrandId],
		[ContactPerson],
		[PhoneNumber],
		[Email],
		[AddressLine1],
		[AddressLine2],
		[City],
		[StateId],
		[Latitude],
		[Longitude],
		[LogoMediaId],
		[IsActive],
		[CreatedAt],
		[CreatedBy]
	)
	VALUES (
		@Id,
		@OperatorName,
		@BrandId,
		@ContactPerson,
		@PhoneNumber,
		@Email,
		@AddressLine1,
		@AddressLine2,
		@City,
		@StateId,
		@Latitude,
		@Longitude,
		@LogoMediaId,
		@IsActive,
		@CreatedAt,
		@CreatedBy
	)
	
END
ELSE BEGIN
	UPDATE Operators SET 
		[OperatorName] = @OperatorName,
		[BrandId] = @BrandId,
		[ContactPerson] = @ContactPerson,
		[PhoneNumber] = @PhoneNumber,
		[Email] = @Email,
		[AddressLine1] = @AddressLine1,
		[AddressLine2] = @AddressLine2,
		[City] = @City,
		[StateId] = @StateId,
		[Latitude] = @Latitude,
		[Longitude] = @Longitude,
		[LogoMediaId] = @LogoMediaId,
		[IsActive] = @IsActive,
		[UpdatedAt] = @UpdatedAt,
		[UpdatedBy] = @UpdatedBy
	WHERE [Id] = @Id

END

SELECT @Id as Id