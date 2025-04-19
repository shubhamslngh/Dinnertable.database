CREATE TABLE [mst].[Features] (
    [Id]          UNIQUEIDENTIFIER CONSTRAINT [DF_Features_Id] DEFAULT (newid()) NOT NULL,
    [FeatureName] NVARCHAR (255)   NOT NULL,
    [IsActive]    BIT              CONSTRAINT [DF_Features_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_Features_FeatureName] UNIQUE NONCLUSTERED ([FeatureName] ASC)
);



