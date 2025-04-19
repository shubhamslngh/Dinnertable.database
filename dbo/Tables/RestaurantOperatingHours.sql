CREATE TABLE [dbo].[RestaurantOperatingHours] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF__RestaurantOp__Id__1BC821DD] DEFAULT (newid()) NOT NULL,
    [RestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [DayOfWeek]    TINYINT          NOT NULL,
    [OpeningTime]  TIME (7)         NULL,
    [ClosingTime]  TIME (7)         NULL,
    [FromDate]     DATE             NULL,
    [ToDate]       DATE             NULL,
    [IsClosed]     BIT              CONSTRAINT [DF_RestaurantOperatingHours_IsClosed] DEFAULT ((1)) NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF__Restauran__IsAct__1CBC4616] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF__Restauran__Creat__1DB06A4F] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [UpdatedAt]    DATETIME         NULL,
    [UpdatedBy]    NVARCHAR (100)   NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK__Restaura__3214EC07A3B66468] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantHours_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]) ON DELETE CASCADE
);

