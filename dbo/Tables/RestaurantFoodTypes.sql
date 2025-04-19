CREATE TABLE [dbo].[RestaurantFoodTypes] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_RestaurantFoodTypes_Id] DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [FoodTypeId]   UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder] SMALLINT         NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_RestaurantFoodTypes_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_RestaurantFoodTypes_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_RestaurantFoodTypes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantFoodTypes_FoodTypes] FOREIGN KEY ([FoodTypeId]) REFERENCES [mst].[FoodTypes] ([Id]),
    CONSTRAINT [FK_RestaurantFoodTypes_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_FoodTypeId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [FoodTypeId] ASC, [IsActive] ASC)
);



