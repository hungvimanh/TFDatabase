-- <Migration ID="3ea8381a-cd1b-4f9b-b55f-683185168274" />
GO

PRINT N'Altering [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD
[Salt] [nvarchar] (50) NULL
GO
