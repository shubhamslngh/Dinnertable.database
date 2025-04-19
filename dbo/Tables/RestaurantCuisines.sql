CREATE TABLE [dbo].[RestaurantCuisines] (
    [Id]           UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [CuisineId]    UNIQUEIDENTIFIER NOT NULL,
    [IsActive]     BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantCuisines_Cuisines_CuisineId] FOREIGN KEY ([CuisineId]) REFERENCES [mst].[Cuisines] ([Id]),
    CONSTRAINT [FK_RestaurantCuisines_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_CuisineId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [CuisineId] ASC, [IsActive] ASC)
);



