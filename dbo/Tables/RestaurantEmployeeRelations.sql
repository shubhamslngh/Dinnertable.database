CREATE TABLE [dbo].[RestaurantEmployeeRelations] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [RestaurantId]   UNIQUEIDENTIFIER NOT NULL,
    [EmployeeId]     UNIQUEIDENTIFIER NOT NULL,
    [EmployeeRoleId] NVARCHAR (450)   NOT NULL,
    [IsActive]       BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]      DATETIME         DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]      NVARCHAR (100)   NOT NULL,
    [UpdatedAt]      DATETIME         NULL,
    [UpdatedBy]      NVARCHAR (100)   NULL,
    [DeletedAt]      DATETIME         NULL,
    [DeletedBy]      NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RestaurantEmployeeRelations_AspNetRoles_RoleId] FOREIGN KEY ([EmployeeRoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RestaurantEmployeeRelations_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RestaurantEmployeeRelations_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurants] ([Id]) ON DELETE CASCADE
);

