CREATE TABLE [dbo].[RestaurantMedias] (
    [Id]                     UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [RestaurantId]           UNIQUEIDENTIFIER NOT NULL,
    [MediaId]                UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder]           SMALLINT         NOT NULL,
    [IsUploadedByRestaurant] BIT              DEFAULT ((1)) NOT NULL,
    [IsActive]               BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]              DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]              NVARCHAR (100)   NOT NULL,
    [DeletedAt]              DATETIME         NULL,
    [DeletedBy]              NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantMedias_Medias_MediaId] FOREIGN KEY ([MediaId]) REFERENCES [dbo].[Medias] ([Id]),
    CONSTRAINT [FK_RestaurantMedias_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_MediaId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [MediaId] ASC, [IsActive] ASC)
);



