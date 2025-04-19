CREATE TABLE [mst].[BookingStatuses] (
    [Id]            UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [BookingStatus] NVARCHAR (100)   NOT NULL,
    [IsActive]      BIT              DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_BookingStatuses_BookingStatus] UNIQUE NONCLUSTERED ([BookingStatus] ASC)
);



