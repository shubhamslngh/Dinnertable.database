CREATE TABLE [dbo].[RestaurantMediaTags] (
    [Id]                UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [RestaurantMediaId] UNIQUEIDENTIFIER NOT NULL,
    [TagId]             UNIQUEIDENTIFIER NOT NULL,
    [IsActive]          BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]         DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]         NVARCHAR (100)   NOT NULL,
    [DeletedAt]         DATETIME         NULL,
    [DeletedBy]         NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantMediaTags_RestaurantMedias_RestaurantMediaId] FOREIGN KEY ([RestaurantMediaId]) REFERENCES [dbo].[RestaurantMedias] ([Id]),
    CONSTRAINT [FK_RestaurantMediaTags_Tags_TagId] FOREIGN KEY ([TagId]) REFERENCES [mst].[Tags] ([Id]),
    CONSTRAINT [UC_RestaurantMediaId_TagId_IsActive] UNIQUE NONCLUSTERED ([RestaurantMediaId] ASC, [TagId] ASC, [IsActive] ASC)
);



