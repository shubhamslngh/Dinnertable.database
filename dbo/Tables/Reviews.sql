CREATE TABLE [dbo].[Reviews] (
    [Id]            UNIQUEIDENTIFIER CONSTRAINT [DF__Reviews__Id__5BAD9CC8] DEFAULT (newid()) NOT NULL,
    [RestaurantId]  UNIQUEIDENTIFIER NOT NULL,
    [ReservationId] UNIQUEIDENTIFIER NULL,
    [CustomerId]    UNIQUEIDENTIFIER NOT NULL,
    [Rating]        TINYINT          NOT NULL,
    [Comments]      NVARCHAR (1000)  NULL,
    [IsActive]      BIT              CONSTRAINT [DF__Reviews__IsActiv__5CA1C101] DEFAULT ((1)) NOT NULL,
    [CreatedAt]     DATETIME         CONSTRAINT [DF__Reviews__Created__5D95E53A] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]     NVARCHAR (100)   NOT NULL,
    [UpdatedAt]     DATETIME         NULL,
    [UpdatedBy]     NVARCHAR (100)   NULL,
    [DeletedAt]     DATETIME         NULL,
    [DeletedBy]     NVARCHAR (100)   NULL,
    CONSTRAINT [PK__Reviews__3214EC07EDE15F56] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Reviews_Customers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Reviews_Reservations_ReservationId] FOREIGN KEY ([ReservationId]) REFERENCES [dbo].[Reservations] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Reviews_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id])
);

