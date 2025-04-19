CREATE TABLE [dbo].[Medias] (
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DF__Medias__Id__6EC0713C] DEFAULT (newid()) NOT NULL,
    [MediaName]        NVARCHAR (500)   NOT NULL,
    [MediaPath]        NVARCHAR (1000)  NOT NULL,
    [MediaTypeId]      UNIQUEIDENTIFIER NOT NULL,
    [ThumbNailMediaId] UNIQUEIDENTIFIER NULL,
    [IsActive]         BIT              CONSTRAINT [DF__Medias__IsActive__6FB49575] DEFAULT ((1)) NOT NULL,
    [CreatedAt]        DATETIME         CONSTRAINT [DF__Medias__CreatedA__70A8B9AE] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]        NVARCHAR (100)   NOT NULL,
    [DeletedAt]        DATETIME         NULL,
    [DeletedBy]        NVARCHAR (100)   NULL,
    CONSTRAINT [PK__Medias__3214EC07B31A55D1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Medias_MediaTypes_MediaTypeId] FOREIGN KEY ([MediaTypeId]) REFERENCES [mst].[MediaTypes] ([Id])
);

