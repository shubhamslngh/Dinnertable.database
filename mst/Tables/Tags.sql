CREATE TABLE [mst].[Tags] (
    [Id]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Tag]      NVARCHAR (255)   NOT NULL,
    [IsActive] BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Tags_Tag] UNIQUE NONCLUSTERED ([Tag] ASC)
);



