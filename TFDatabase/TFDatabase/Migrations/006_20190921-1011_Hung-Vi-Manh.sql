-- <Migration ID="ea5ac275-3992-4374-b04e-1c4c8a1e725c" />
GO

PRINT N'Dropping foreign keys from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [FK_HighSchool_District]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool1]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool2]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool3]
GO
PRINT N'Dropping foreign keys from [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] DROP CONSTRAINT [FK_Province_Area]
GO
PRINT N'Dropping constraints from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [PK_HighSchool]
GO
PRINT N'Dropping index [CX_HighSchool] from [dbo].[HighSchool]'
GO
DROP INDEX [CX_HighSchool] ON [dbo].[HighSchool]
GO
PRINT N'Altering [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] DROP
COLUMN [AreaId]
GO
PRINT N'Rebuilding [dbo].[HighSchool]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_HighSchool]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (3) NOT NULL,
[Name] [nvarchar] (500) NULL,
[DistrictId] [uniqueidentifier] NOT NULL,
[Address] [nvarchar] (500) NULL,
[AreaId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_HighSchool] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_HighSchool]([Id], [CX], [Code], [Name], [DistrictId]) SELECT [Id], [CX], [Code], [Name], [DistrictId] FROM [dbo].[HighSchool]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_HighSchool] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[HighSchool]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_HighSchool]', RESEED, @idVal)
GO
DROP TABLE [dbo].[HighSchool]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_HighSchool]', N'HighSchool', N'OBJECT'
GO
PRINT N'Creating index [CX_HighSchool] on [dbo].[HighSchool]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_HighSchool] ON [dbo].[HighSchool] ([CX])
GO
PRINT N'Creating primary key [PK_HighSchool] on [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [PK_HighSchool] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[Majors]'
GO
ALTER TABLE [dbo].[Majors] ALTER COLUMN [Name] [nvarchar] (200) NOT NULL
GO
PRINT N'Altering [dbo].[SubjectGroup]'
GO
ALTER TABLE [dbo].[SubjectGroup] ALTER COLUMN [Name] [nvarchar] (500) NOT NULL
GO
PRINT N'Altering [dbo].[University]'
GO
ALTER TABLE [dbo].[University] ALTER COLUMN [Name] [nvarchar] (200) NOT NULL
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD
[Descreption] [nvarchar] (500) NULL
GO
PRINT N'Adding foreign keys to [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_Area] FOREIGN KEY ([AreaId]) REFERENCES [dbo].[Area] ([Id])
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_District] FOREIGN KEY ([DistrictId]) REFERENCES [dbo].[District] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_HighSchool] FOREIGN KEY ([RegisterPlaceOfExamId]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_HighSchool1] FOREIGN KEY ([HighSchoolGrade10Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_HighSchool2] FOREIGN KEY ([HighSchoolGrade11Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_HighSchool3] FOREIGN KEY ([HighSchoolGrade12Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
