CREATE TABLE [mst].[MediaTypes] (
    [Id]        UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [MediaType] NVARCHAR (100)   NOT NULL,
    [IsActive]  BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_MediaTypes_MediaType] UNIQUE NONCLUSTERED ([MediaType] ASC)
);



