CREATE TABLE [mst].[States] (
    [Id]        UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Name]      NVARCHAR (255)   NOT NULL,
    [CountryId] UNIQUEIDENTIFIER NOT NULL,
    [IsActive]  BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_State_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [mst].[Countries] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [UC_States_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);



