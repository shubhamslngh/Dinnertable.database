CREATE TABLE [mst].[CancelReasons] (
    [Id]           UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [CancelReason] NVARCHAR (100)   NOT NULL,
    [IsActive]     BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_CancelReasons_CancelReason] UNIQUE NONCLUSTERED ([CancelReason] ASC)
);



