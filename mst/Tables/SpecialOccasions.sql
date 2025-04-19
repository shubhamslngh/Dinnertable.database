CREATE TABLE [mst].[SpecialOccasions] (
    [Id]              UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [SpecialOccasion] NVARCHAR (100)   NOT NULL,
    [IsActive]        BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_SpecialOccasions_SpecialOccasion] UNIQUE NONCLUSTERED ([SpecialOccasion] ASC)
);



