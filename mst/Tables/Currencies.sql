CREATE TABLE [mst].[Currencies] (
    [Id]             UNIQUEIDENTIFIER CONSTRAINT [DF_Currencies_Id] DEFAULT (newid()) NOT NULL,
    [Currency]       NVARCHAR (50)    NOT NULL,
    [CurrencySymbol] NVARCHAR (50)    NULL,
    [IsActive]       BIT              CONSTRAINT [DF_Currencies_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Currencies_Currency] UNIQUE NONCLUSTERED ([Currency] ASC),
    CONSTRAINT [UC_Currencies_CurrencyAndCurrencySymbol] UNIQUE NONCLUSTERED ([Currency] ASC, [CurrencySymbol] ASC)
);





