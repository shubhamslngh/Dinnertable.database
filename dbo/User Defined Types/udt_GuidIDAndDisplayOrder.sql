CREATE TYPE [dbo].[udt_GuidIDAndDisplayOrder] AS TABLE (
    [ID]           UNIQUEIDENTIFIER NOT NULL,
    [DisplayOrder] INT              NOT NULL);

