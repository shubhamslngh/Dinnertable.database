CREATE TABLE [mst].[AddressTypes] (
    [Id]          UNIQUEIDENTIFIER CONSTRAINT [DF_AddressTypes_Id] DEFAULT (newid()) NOT NULL,
    [AddressType] NVARCHAR (100)   NOT NULL,
    [IsActive]    BIT              CONSTRAINT [DF_AddressTypes_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_AddressTypes_AddressType] UNIQUE NONCLUSTERED ([AddressType] ASC)
);



