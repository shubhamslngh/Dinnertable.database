CREATE TABLE [dbo].[BrandMedias] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_BrandMedias_Id] DEFAULT (newid()) NOT NULL,
    [BrandId]      UNIQUEIDENTIFIER NOT NULL,
    [MediaId]      UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder] SMALLINT         NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_BrandMedias_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_BrandMedias_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_BrandMedias] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BrandMedias_Brands] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brands] ([Id]),
    CONSTRAINT [FK_BrandMedias_Medias] FOREIGN KEY ([MediaId]) REFERENCES [dbo].[Medias] ([Id])
);

