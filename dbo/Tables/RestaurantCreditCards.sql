CREATE TABLE [dbo].[RestaurantCreditCards] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_RestaurantCreditCards_Id] DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [CreditCardId] UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder] SMALLINT         NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_RestaurantCreditCards_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_RestaurantCreditCards_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_RestaurantCreditCards] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantCreditCards_CreditCards] FOREIGN KEY ([CreditCardId]) REFERENCES [mst].[CreditCards] ([Id]),
    CONSTRAINT [FK_RestaurantCreditCards_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [UC_RestaurantId_CreditCardId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [CreditCardId] ASC, [IsActive] ASC)
);



