CREATE TABLE [dbo].[OperatorMedias] (
    [Id]           UNIQUEIDENTIFIER CONSTRAINT [DF_OperatorMedias_Id] DEFAULT (newid()) NOT NULL,
    [OperatorId]   UNIQUEIDENTIFIER NOT NULL,
    [MediaId]      UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder] SMALLINT         NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_OperatorMedias_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME         CONSTRAINT [DF_OperatorMedias_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]    NVARCHAR (100)   NOT NULL,
    [DeletedAt]    DATETIME         NULL,
    [DeletedBy]    NVARCHAR (100)   NULL,
    CONSTRAINT [PK_OperatorMedias] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OperatorMedias_Medias] FOREIGN KEY ([MediaId]) REFERENCES [dbo].[Medias] ([Id]),
    CONSTRAINT [FK_OperatorMedias_Operators_OperatorId] FOREIGN KEY ([OperatorId]) REFERENCES [dbo].[Operators] ([Id])
);



