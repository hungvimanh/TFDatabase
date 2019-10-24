-- <Migration ID="ea4153af-1b9a-479c-b54e-336bd69a7ff4" />
GO

PRINT N'Dropping foreign keys from [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [FK_Aspiration_Form]
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [FK_Aspiration_Majors]
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [FK_Aspiration_SubjectGroup]
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [FK_Aspiration_University]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_User]
GO
PRINT N'Dropping constraints from [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [PK_FormDetail]
GO
PRINT N'Dropping constraints from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [PK_User]
GO
PRINT N'Dropping index [CX_FormDetail] from [dbo].[Aspiration]'
GO
DROP INDEX [CX_FormDetail] ON [dbo].[Aspiration]
GO
PRINT N'Dropping index [CX_User] from [dbo].[User]'
GO
DROP INDEX [CX_User] ON [dbo].[User]
GO
PRINT N'Rebuilding [dbo].[Aspiration]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Aspiration]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Sequence] [int] NOT NULL,
[UniversityId] [uniqueidentifier] NOT NULL,
[MajorsId] [uniqueidentifier] NOT NULL,
[SubjectGroupId] [uniqueidentifier] NOT NULL,
[FormId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Aspiration] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Aspiration]([Id], [CX], [UniversityId], [MajorsId], [SubjectGroupId], [FormId]) SELECT [Id], [CX], [UniversityId], [MajorsId], [SubjectGroupId], [FormId] FROM [dbo].[Aspiration]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Aspiration] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Aspiration]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Aspiration]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Aspiration]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Aspiration]', N'Aspiration', N'OBJECT'
GO
PRINT N'Creating index [CX_FormDetail] on [dbo].[Aspiration]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_FormDetail] ON [dbo].[Aspiration] ([CX])
GO
PRINT N'Creating primary key [PK_FormDetail] on [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [PK_FormDetail] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[User]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_User]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (50) NOT NULL,
[Phone] [nvarchar] (20) NOT NULL,
[FullName] [nvarchar] (50) NOT NULL,
[Password] [nvarchar] (50) NOT NULL,
[Salt] [nvarchar] (50) NULL,
[IsAdmin] [bit] NOT NULL,
[Gender] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_User] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_User]([Id], [CX], [Email], [Password], [Salt], [IsAdmin]) SELECT [Id], [CX], [Username], [Password], [Salt], [IsAdmin] FROM [dbo].[User]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_User] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[User]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_2_User]', RESEED, @idVal)
GO
DROP TABLE [dbo].[User]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_User]', N'User', N'OBJECT'
GO
PRINT N'Creating index [CX_User] on [dbo].[User]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_User] ON [dbo].[User] ([CX])
GO
PRINT N'Creating primary key [PK_User] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_Form] FOREIGN KEY ([FormId]) REFERENCES [dbo].[Form] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
