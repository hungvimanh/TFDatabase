-- <Migration ID="c3ae66d6-bdaf-4fcf-a523-2657e29ad8e4" />
GO

PRINT N'Altering [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ALTER COLUMN [Status] [int] NOT NULL
GO
PRINT N'Altering [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ALTER COLUMN [Status] [int] NOT NULL
GO
