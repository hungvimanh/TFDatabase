-- <Migration ID="003e2ff6-f09c-428d-b4ce-7778e2d6c5e6" />
GO

PRINT N'Dropping foreign keys from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [FK_HighSchool_Area]
GO
PRINT N'Dropping constraints from [dbo].[Area]'
GO
ALTER TABLE [dbo].[Area] DROP CONSTRAINT [PK_Area]
GO
PRINT N'Dropping constraints from [dbo].[Ethnic]'
GO
ALTER TABLE [dbo].[Ethnic] DROP CONSTRAINT [PK_Ethnic]
GO
PRINT N'Dropping constraints from [dbo].[PriorityType]'
GO
ALTER TABLE [dbo].[PriorityType] DROP CONSTRAINT [PK_PriorityType]
GO
PRINT N'Dropping index [CX_Area] from [dbo].[Area]'
GO
DROP INDEX [CX_Area] ON [dbo].[Area]
GO
PRINT N'Dropping index [CX_Table_1] from [dbo].[District]'
GO
DROP INDEX [CX_Table_1] ON [dbo].[District]
GO
PRINT N'Dropping index [CX_Ethnic] from [dbo].[Ethnic]'
GO
DROP INDEX [CX_Ethnic] ON [dbo].[Ethnic]
GO
PRINT N'Dropping index [CX_PriorityType] from [dbo].[PriorityType]'
GO
DROP INDEX [CX_PriorityType] ON [dbo].[PriorityType]
GO
PRINT N'Altering [dbo].[University]'
GO
ALTER TABLE [dbo].[University] ALTER COLUMN [Code] [nvarchar] (10) NOT NULL
GO
PRINT N'Rebuilding [dbo].[Area]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Area]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Area] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Area]([Id], [CX], [Code], [Name]) SELECT [Id], [CX], [Code], [Name] FROM [dbo].[Area]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Area] OFF
GO
DROP TABLE [dbo].[Area]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Area]', N'Area', N'OBJECT'
GO
PRINT N'Creating index [CX_Area] on [dbo].[Area]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Area] ON [dbo].[Area] ([CX])
GO
PRINT N'Creating primary key [PK_Area] on [dbo].[Area]'
GO
ALTER TABLE [dbo].[Area] ADD CONSTRAINT [PK_Area] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[Ethnic]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_Ethnic]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Ethnic] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_Ethnic]([Id], [CX], [Code], [Name]) SELECT [Id], [CX], [Code], [Name] FROM [dbo].[Ethnic]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Ethnic] OFF
GO
DROP TABLE [dbo].[Ethnic]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_Ethnic]', N'Ethnic', N'OBJECT'
GO
PRINT N'Creating index [CX_Ethnic] on [dbo].[Ethnic]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Ethnic] ON [dbo].[Ethnic] ([CX])
GO
PRINT N'Creating primary key [PK_Ethnic] on [dbo].[Ethnic]'
GO
ALTER TABLE [dbo].[Ethnic] ADD CONSTRAINT [PK_Ethnic] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[PriorityType]'
GO
CREATE TABLE [dbo].[RG_Recovery_3_PriorityType]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_PriorityType] ON
GO
INSERT INTO [dbo].[RG_Recovery_3_PriorityType]([Id], [CX], [Code]) SELECT [Id], [CX], [Code] FROM [dbo].[PriorityType]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_PriorityType] OFF
GO
DROP TABLE [dbo].[PriorityType]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_3_PriorityType]', N'PriorityType', N'OBJECT'
GO
PRINT N'Creating index [CX_PriorityType] on [dbo].[PriorityType]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_PriorityType] ON [dbo].[PriorityType] ([CX])
GO
PRINT N'Creating primary key [PK_PriorityType] on [dbo].[PriorityType]'
GO
ALTER TABLE [dbo].[PriorityType] ADD CONSTRAINT [PK_PriorityType] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [CX_District] on [dbo].[District]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_District] ON [dbo].[District] ([CX])
GO
PRINT N'Adding foreign keys to [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_Area] FOREIGN KEY ([AreaId]) REFERENCES [dbo].[Area] ([Id])
GO
