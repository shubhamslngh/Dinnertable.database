CREATE TABLE [dbo].[Brands] (
    [Id]            UNIQUEIDENTIFIER CONSTRAINT [DF_Brands_Id] DEFAULT (newid()) NOT NULL,
    [BrandName]     NVARCHAR (500)   NOT NULL,
    [ContactPerson] NVARCHAR (1000)  NULL,
    [PhoneNumber]   NVARCHAR (255)   NULL,
    [Email]         NVARCHAR (255)   NULL,
    [AddressLine1]  NVARCHAR (500)   NULL,
    [AddressLine2]  NVARCHAR (500)   NULL,
    [City]          NVARCHAR (255)   NULL,
    [StateId]       UNIQUEIDENTIFIER NULL,
    [Latitude]      DECIMAL (14, 10) NULL,
    [Longitude]     DECIMAL (14, 10) NULL,
    [LogoMediaId]   UNIQUEIDENTIFIER NULL,
    [IsActive]      BIT              CONSTRAINT [DF_Brands_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]     DATETIME         CONSTRAINT [DF_Brands_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]     NVARCHAR (100)   NOT NULL,
    [UpdatedAt]     DATETIME         NULL,
    [UpdatedBy]     NVARCHAR (100)   NULL,
    [DeletedAt]     DATETIME         NULL,
    [DeletedBy]     NVARCHAR (100)   NULL,
    CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Brands_Medias] FOREIGN KEY ([LogoMediaId]) REFERENCES [dbo].[Medias] ([Id])
);

