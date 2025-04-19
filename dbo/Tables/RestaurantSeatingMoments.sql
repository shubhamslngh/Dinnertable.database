CREATE TABLE [dbo].[RestaurantSeatingMoments] (
    [Id]              UNIQUEIDENTIFIER CONSTRAINT [DF_RestaurantSeatingMoments_Id] DEFAULT (newid()) NOT NULL,
    [RestaurantId]    UNIQUEIDENTIFIER NOT NULL,
    [SeatingMomentId] UNIQUEIDENTIFIER NOT NULL,
    [IsActive]        BIT              CONSTRAINT [DF_RestaurantSeatingMoments_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]       DATETIME         CONSTRAINT [DF_RestaurantSeatingMoments_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (100)   NOT NULL,
    [DeletedAt]       DATETIME         NULL,
    [DeletedBy]       NVARCHAR (100)   NULL,
    CONSTRAINT [PK_RestaurantSeatingMoments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantSeatingMoments_Restaurants] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]),
    CONSTRAINT [FK_RestaurantSeatingMoments_SeatingMoments] FOREIGN KEY ([SeatingMomentId]) REFERENCES [mst].[SeatingMoments] ([Id]),
    CONSTRAINT [UC_RestaurantId_SeatingMomentId_IsActive] UNIQUE NONCLUSTERED ([RestaurantId] ASC, [SeatingMomentId] ASC, [IsActive] ASC)
);



