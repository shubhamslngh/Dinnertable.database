CREATE TABLE [dbo].[ReviewMedias] (
    [Id]        UNIQUEIDENTIFIER CONSTRAINT [DF__ReviewMedias__Id__634EBE90] DEFAULT (newid()) NOT NULL,
    [ReviewId]  UNIQUEIDENTIFIER NOT NULL,
    [MediaId]   UNIQUEIDENTIFIER NOT NULL,
    [TagId]     UNIQUEIDENTIFIER NULL,
    [IsActive]  BIT              CONSTRAINT [DF__ReviewMed__IsAct__6442E2C9] DEFAULT ((1)) NOT NULL,
    [CreatedAt] DATETIME         CONSTRAINT [DF__ReviewMed__Creat__65370702] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy] NVARCHAR (100)   NOT NULL,
    [DeletedAt] DATETIME         NULL,
    [DeletedBy] NVARCHAR (100)   NULL,
    CONSTRAINT [PK__ReviewMe__3214EC07639E8B5E] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ReviewMedias_Medias_MediaId] FOREIGN KEY ([MediaId]) REFERENCES [dbo].[Medias] ([Id]),
    CONSTRAINT [FK_ReviewMedias_Reviews_ReviewId] FOREIGN KEY ([ReviewId]) REFERENCES [dbo].[Reviews] ([Id]),
    CONSTRAINT [FK_ReviewMedias_Tags] FOREIGN KEY ([TagId]) REFERENCES [mst].[Tags] ([Id])
);

