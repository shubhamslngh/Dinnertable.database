CREATE PROC [dbo].[usp_Brands_Save]

	@Id uniqueidentifier,
	@BrandName nvarchar(500),
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
IF NOT EXISTS (SELECT * FROM [dbo].[Brands] WITH(NOLOCK) WHERE [Id] = @Id) BEGIN
	INSERT INTO [dbo].[Brands] (
		[Id],
		[BrandName],
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
		@BrandName,
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
	UPDATE Brands SET 
		[BrandName] = @BrandName,
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

SELECT @Id AS Id