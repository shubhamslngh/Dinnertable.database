CREATE TABLE [mst].[SeatingMoments] (
    [Id]             UNIQUEIDENTIFIER CONSTRAINT [DF_SeatingMoments_Id] DEFAULT (newid()) NOT NULL,
    [SeatingMoments] NVARCHAR (255)   NOT NULL,
    [IsActive]       BIT              CONSTRAINT [DF_SeatingMoments_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_SeatingMoments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UC_SeatingMoments_SeatingMoments] UNIQUE NONCLUSTERED ([SeatingMoments] ASC)
);





