CREATE TABLE [dbo].[RestaurantCurrencies] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_RestaurantCurrencies_Id] DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [CurrencyId]   UNIQUEIDENTIFIER NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_RestaurantCurrencies_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_RestaurantCurrencies_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [UpdatedAt]    DATETIME         NULL,
    [UpdatedBy]    NVARCHAR (100)   NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_RestaurantCurrencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantCurrencies_Currencies] FOREIGN KEY ([CurrencyId]) REFERENCES [mst].[Currencies] ([Id]),
    CONSTRAINT [FK_RestaurantCurrencies_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_CurrencyId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [CurrencyId] ASC, [IsActive] ASC)
);



