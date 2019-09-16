-- <Migration ID="0678bef7-6d71-4e5f-9c99-141e0ab10be3" />
GO

PRINT N'Dropping foreign keys from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Form]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Majors]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_University]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_User]
GO
PRINT N'Dropping constraints from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [PK_University_Majors_1]
GO
PRINT N'Dropping index [IX_University_Majors] from [dbo].[University_Majors]'
GO
DROP INDEX [IX_University_Majors] ON [dbo].[University_Majors]
GO
PRINT N'Dropping index [CX_User] from [dbo].[User]'
GO
DROP INDEX [CX_User] ON [dbo].[User]
GO
PRINT N'Creating [dbo].[FormDetail]'
GO
CREATE TABLE [dbo].[FormDetail]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[UniversityId] [uniqueidentifier] NOT NULL,
[MajorsId] [uniqueidentifier] NOT NULL,
[SubjectGroupId] [uniqueidentifier] NOT NULL,
[FormId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_FormDetail] on [dbo].[FormDetail]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FormDetail] ON [dbo].[FormDetail] ([CX])
GO
PRINT N'Creating primary key [PK_FormDetail] on [dbo].[FormDetail]'
GO
ALTER TABLE [dbo].[FormDetail] ADD CONSTRAINT [PK_FormDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[SubjectGroup]'
GO
CREATE TABLE [dbo].[SubjectGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_SubjectGroup] on [dbo].[SubjectGroup]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SubjectGroup] ON [dbo].[SubjectGroup] ([CX])
GO
PRINT N'Creating primary key [PK_SubjectGroup] on [dbo].[SubjectGroup]'
GO
ALTER TABLE [dbo].[SubjectGroup] ADD CONSTRAINT [PK_SubjectGroup] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP
COLUMN [Id],
COLUMN [SubjectGroupType]
GO
EXEC sp_rename N'[dbo].[University_Majors].[FormId]', N'SubjectGroupId', N'COLUMN'
GO
ALTER TABLE [dbo].[University_Majors] ALTER COLUMN [Year] [nchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_University_Majors_1] on [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [PK_University_Majors_1] PRIMARY KEY NONCLUSTERED  ([UniversityId], [MajorsId], [SubjectGroupId], [Year])
GO
PRINT N'Creating index [CX_User] on [dbo].[User]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_User] ON [dbo].[User] ([CX])
GO
PRINT N'Adding foreign keys to [dbo].[FormDetail]'
GO
ALTER TABLE [dbo].[FormDetail] ADD CONSTRAINT [FK_FormDetail_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[FormDetail] ADD CONSTRAINT [FK_FormDetail_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[FormDetail] ADD CONSTRAINT [FK_FormDetail_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
ALTER TABLE [dbo].[FormDetail] ADD CONSTRAINT [FK_FormDetail_Form] FOREIGN KEY ([FormId]) REFERENCES [dbo].[Form] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors1] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_University1] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
