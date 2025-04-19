CREATE TABLE [mst].[FoodTypes] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [FoodType] NVARCHAR (100)   NOT NULL,
    [IsActive] BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_FoodTypes_FoodType] UNIQUE NONCLUSTERED ([FoodType] ASC)
);



