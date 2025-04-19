CREATE TABLE [mst].[Countries] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Name]     NVARCHAR (255)   NOT NULL,
    [IsActive] BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Countries_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);



