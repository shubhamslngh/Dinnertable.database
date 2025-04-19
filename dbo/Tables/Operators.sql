CREATE TABLE [dbo].[Operators] (
    [Id]            UNIQUEIDENTIFIER CONSTRAINT [DF_Operators_Id] DEFAULT (newid()) NOT NULL,
    [OperatorName]  NVARCHAR (1000)  NOT NULL,
    [BrandId]       UNIQUEIDENTIFIER NULL,
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
    [IsActive]      BIT              CONSTRAINT [DF_Operators_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]     DATETIME         CONSTRAINT [DF_Operators_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]     NVARCHAR (100)   NOT NULL,
    [UpdatedAt]     DATETIME         NULL,
    [UpdatedBy]     NVARCHAR (100)   NULL,
    [DeletedAt]     DATETIME         NULL,
    [DeletedBy]     NVARCHAR (100)   NULL,
    CONSTRAINT [PK_Operators] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Operators_Brands] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brands] ([Id]),
    CONSTRAINT [FK_Operators_Medias] FOREIGN KEY ([LogoMediaId]) REFERENCES [dbo].[Medias] ([Id]),
    CONSTRAINT [FK_Operators_States_StateId] FOREIGN KEY ([StateId]) REFERENCES [mst].[States] ([Id])
);



