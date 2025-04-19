CREATE TABLE [dbo].[Employees] (
    [Id]        UNIQUEIDENTIFIER NOT NULL,
    [UserId]    NVARCHAR (450)   NULL,
    [FirstName] NVARCHAR (255)   NOT NULL,
    [LastName]  NVARCHAR (255)   NOT NULL,
    [IsActive]  BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt] DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy] NVARCHAR (100)   NOT NULL,
    [UpdatedAt] DATETIME         NULL,
    [UpdatedBy] NVARCHAR (100)   NULL,
    [DeletedAt] DATETIME         NULL,
    [DeletedBy] NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Employees_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

