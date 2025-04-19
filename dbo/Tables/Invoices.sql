CREATE TABLE [dbo].[Invoices] (
    [Id]                   UNIQUEIDENTIFIER CONSTRAINT [DF_Invoices_InvoiceId] DEFAULT (newid()) NOT NULL,
    [RestaurantId]         UNIQUEIDENTIFIER NOT NULL,
    [AmountWithoutTaxes]   DECIMAL (8, 2)   NULL,
    [ServiceCharges]       DECIMAL (8, 2)   NULL,
    [Taxes]                DECIMAL (8, 2)   NULL,
    [Tips]                 DECIMAL (8, 2)   NULL,
    [DiscountAmount]       DECIMAL (8, 2)   NULL,
    [AmountPaidByCustomer] DECIMAL (8, 2)   NULL,
    [Comments]             NVARCHAR (MAX)   NULL,
    [CreatedAt]            DATETIME         CONSTRAINT [DF_Invoices_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (100)   NOT NULL,
    [UpdatedAt]            DATETIME         NULL,
    [UpdatedBy]            NVARCHAR (100)   NULL,
    [DeletedAt]            DATETIME         NULL,
    [DeletedBy]            NVARCHAR (100)   NULL,
    CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED ([Id] ASC)
);

