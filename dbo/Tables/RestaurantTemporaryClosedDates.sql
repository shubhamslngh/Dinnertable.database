CREATE TABLE [dbo].[RestaurantTemporaryClosedDates] (
    [Id]           UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [FromDate]     DATE             NOT NULL,
    [ToDate]       DATE             NOT NULL,
    [IsActive]     BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [UpdatedAt]    DATETIME         NULL,
    [UpdatedBy]    NVARCHAR (100)   NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantClosedDates_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]) ON DELETE CASCADE
);

