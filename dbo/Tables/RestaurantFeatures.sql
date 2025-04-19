CREATE TABLE [dbo].[RestaurantFeatures] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_RestaurantFeatures_Id] DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [FeatureId]    UNIQUEIDENTIFIER NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_RestaurantFeatures_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_RestaurantFeatures_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_RestaurantFeatures] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantFeatures_Features] FOREIGN KEY ([FeatureId]) REFERENCES [mst].[Features] ([Id]),
    CONSTRAINT [FK_RestaurantFeatures_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_FeatureId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [FeatureId] ASC, [IsActive] ASC)
);



