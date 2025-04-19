CREATE TABLE [mst].[Cuisines] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Cuisine]  NVARCHAR (100)   NOT NULL,
    [IsActive] BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Cuisines_Cuisine] UNIQUE NONCLUSTERED ([Cuisine] ASC)
);



