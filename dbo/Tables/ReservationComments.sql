CREATE TABLE [dbo].[ReservationComments] (
    [Id]            UNIQUEIDENTIFIER CONSTRAINT [DF__ReservationC__Id__55F4C372] DEFAULT (newid()) NOT NULL,
    [ReservationId] UNIQUEIDENTIFIER NOT NULL,
    [Comment]       NVARCHAR (MAX)   NOT NULL,
    [IsActive]      BIT              CONSTRAINT [DF__Reservati__IsAct__56E8E7AB] DEFAULT ((1)) NOT NULL,
    [CreatedAt]     DATETIME         CONSTRAINT [DF__Reservati__Creat__57DD0BE4] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]     NVARCHAR (100)   NOT NULL,
    [UpdatedAt]     DATETIME         NULL,
    [UpdatedBy]     NVARCHAR (100)   NULL,
    [DeletedAt]     DATETIME         NULL,
    [DeletedBy]     NVARCHAR (100)   NULL,
    CONSTRAINT [PK__Reservat__3214EC07ECEFE753] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ReservationComments_Reservations_ReservationId] FOREIGN KEY ([ReservationId]) REFERENCES [dbo].[Reservations] ([Id]) ON DELETE CASCADE
);

