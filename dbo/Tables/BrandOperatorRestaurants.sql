CREATE TABLE [dbo].[BrandOperatorRestaurants] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_BrandOperatorRestaurants_Id] DEFAULT (newid()) NOT NULL,
    [BrandId]      UNIQUEIDENTIFIER NULL,
    [OperatorId]   UNIQUEIDENTIFIER NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [StartDate]    DATETIME         NULL,
    [EndDate]      DATETIME         NULL,
    [Comments]     NVARCHAR (MAX)   NULL,
    [IsActive]     BIT              CONSTRAINT [DF_BrandOperatorRestaurants_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_BrandOperatorRestaurants_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [UpdatedAt]    DATETIME         NULL,
    [UpdatedBy]    NVARCHAR (100)   NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_BrandOperatorRestaurants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BrandOperatorRestaurants_Brands] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brands] ([Id]),
    CONSTRAINT [FK_BrandOperatorRestaurants_Operators] FOREIGN KEY ([OperatorId]) REFERENCES [dbo].[Operators] ([Id]),
    CONSTRAINT [FK_BrandOperatorRestaurants_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id])
);

