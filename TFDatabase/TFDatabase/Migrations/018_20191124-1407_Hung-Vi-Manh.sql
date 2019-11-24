-- <Migration ID="98e63873-1739-420d-bded-5f73b2773a2e" />
GO

PRINT N'Altering [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD
[Image] [varbinary] (max) NULL
GO
