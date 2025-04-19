CREATE TABLE [dbo].[WareHouseRestaurants] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_WareHouseRestaurants_Id] DEFAULT (newid()) NOT NULL,
    [WareHouseId]  UNIQUEIDENTIFIER NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [StartDate]    DATETIME         NULL,
    [EndDate]      DATETIME         NULL,
    [IsActive]     BIT              CONSTRAINT [DF_WareHouseRestaurants_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_WareHouseRestaurants_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [UpdatedAt]    DATETIME         NULL,
    [UpdatedBy]    NVARCHAR (100)   NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_WareHouseRestaurants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WareHouseRestaurants_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [FK_WareHouseRestaurants_WareHouses] FOREIGN KEY ([WareHouseId]) REFERENCES [dbo].[WareHouses] ([Id])
);

