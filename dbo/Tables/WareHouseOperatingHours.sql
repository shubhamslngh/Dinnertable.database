CREATE TABLE [dbo].[WareHouseOperatingHours] (
    [Id]          UNIQUEIDENTIFIER CONSTRAINT [DF_WareHouseOperatingHours_Id] DEFAULT (newid()) NOT NULL,
    [WareHouseId] UNIQUEIDENTIFIER NOT NULL,
    [DayOfWeek]   TINYINT          NOT NULL,
    [OpeningTime] TIME (7)         NULL,
    [ClosingTime] TIME (7)         NULL,
    [FromDate]    DATE             NULL,
    [ToDate]      DATE             NULL,
    [IsClosed]    BIT              CONSTRAINT [DF_WareHouseOperatingHours_IsClosed] DEFAULT ((1)) NOT NULL,
    [IsActive]    BIT              CONSTRAINT [DF_WareHouseOperatingHours_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]   DATETIME         CONSTRAINT [DF_WareHouseOperatingHours_CreatedAt] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]   NVARCHAR (100)   NOT NULL,
    [UpdatedAt]   DATETIME         NULL,
    [UpdatedBy]   NVARCHAR (100)   NULL,
    [DeletedAt]   DATETIME         NULL,
    [DeletedBy]   NVARCHAR (100)   NULL,
    CONSTRAINT [PK_WareHouseOperatingHours] PRIMARY KEY CLUSTERED ([Id] ASC)
);

