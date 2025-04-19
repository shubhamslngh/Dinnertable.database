CREATE TABLE [mst].[CreditCards] (
    [Id]             UNIQUEIDENTIFIER CONSTRAINT [DF_CreditCards_Id] DEFAULT (newid()) NOT NULL,
    [CreditCardName] NVARCHAR (50)    NOT NULL,
    [IsActive]       BIT              CONSTRAINT [DF_CreditCards_IsActive] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_CreditCards] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_CreditCardName] UNIQUE NONCLUSTERED ([CreditCardName] ASC)
);





