CREATE TABLE [dbo].[CustomerAddress] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [CustomerId]    UNIQUEIDENTIFIER NOT NULL,
    [AddressTypeId] UNIQUEIDENTIFIER NOT NULL,
    [AddressLine1]  NVARCHAR (500)   NOT NULL,
    [AddressLine2]  NVARCHAR (500)   NULL,
    [City]          NVARCHAR (255)   NOT NULL,
    [StateId]       UNIQUEIDENTIFIER NOT NULL,
    [Latitude]      DECIMAL (14, 10) NOT NULL,
    [Longitude]     DECIMAL (14, 10) NOT NULL,
    [IsActive]      BIT              CONSTRAINT [DF_CustomerAddress_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]     DATETIME         CONSTRAINT [DF_CustomerAddress_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]     NVARCHAR (100)   NOT NULL,
    [UpdatedAt]     DATETIME         NULL,
    [UpdatedBy]     NVARCHAR (100)   NULL,
    [DeletedAt]     DATETIME         NULL,
    [DeletedBy]     NVARCHAR (100)   NULL,
    CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CustomerAddress_AddressTypes] FOREIGN KEY ([AddressTypeId]) REFERENCES [mst].[AddressTypes] ([Id])
);

