-- <Migration ID="ad704080-ab53-4539-9f18-01e2765a6ad3" />
GO

PRINT N'Dropping foreign keys from [dbo].[FormDetail]'
GO
ALTER TABLE [dbo].[FormDetail] DROP CONSTRAINT [FK_FormDetail_University]
GO
ALTER TABLE [dbo].[FormDetail] DROP CONSTRAINT [FK_FormDetail_Majors]
GO
ALTER TABLE [dbo].[FormDetail] DROP CONSTRAINT [FK_FormDetail_SubjectGroup]
GO
ALTER TABLE [dbo].[FormDetail] DROP CONSTRAINT [FK_FormDetail_Form]
GO
PRINT N'Dropping constraints from [dbo].[FormDetail]'
GO
ALTER TABLE [dbo].[FormDetail] DROP CONSTRAINT [PK_FormDetail]
GO
PRINT N'Dropping index [CX_FormDetail] from [dbo].[FormDetail]'
GO
DROP INDEX [CX_FormDetail] ON [dbo].[FormDetail]
GO
PRINT N'Dropping [dbo].[FormDetail]'
GO
DROP TABLE [dbo].[FormDetail]
GO
PRINT N'Altering [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP
COLUMN [NumberForm],
COLUMN [DepartmentCode],
COLUMN [Date],
COLUMN [Grade12Name],
COLUMN [GraduateYear]
GO
PRINT N'Creating [dbo].[Aspiration]'
GO
CREATE TABLE [dbo].[Aspiration]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[UniversityId] [uniqueidentifier] NOT NULL,
[MajorsId] [uniqueidentifier] NOT NULL,
[SubjectGroupId] [uniqueidentifier] NOT NULL,
[FormId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_FormDetail] on [dbo].[Aspiration]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FormDetail] ON [dbo].[Aspiration] ([CX])
GO
PRINT N'Creating primary key [PK_FormDetail] on [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [PK_FormDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_Form] FOREIGN KEY ([FormId]) REFERENCES [dbo].[Form] ([Id])
GO
