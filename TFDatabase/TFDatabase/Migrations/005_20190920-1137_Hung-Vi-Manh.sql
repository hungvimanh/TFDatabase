-- <Migration ID="1812ada3-06d7-4818-a198-0c35f9344723" />
GO

PRINT N'Dropping foreign keys from [dbo].[District]'
GO
ALTER TABLE [dbo].[District] DROP CONSTRAINT [FK_District_Province]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Province]
GO
PRINT N'Dropping constraints from [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] DROP CONSTRAINT [PK_Province]
GO
PRINT N'Dropping index [CX_Province] from [dbo].[Province]'
GO
DROP INDEX [CX_Province] ON [dbo].[Province]
GO
PRINT N'Rebuilding [dbo].[Province]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Province]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[AreaId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Province] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Province]([Id], [CX], [Code], [Name]) SELECT [Id], [CX], [Code], [Name] FROM [dbo].[Province]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Province] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Province]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Province]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Province]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Province]', N'Province', N'OBJECT'
GO
PRINT N'Creating index [CX_Province] on [dbo].[Province]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Province] ON [dbo].[Province] ([CX])
GO
PRINT N'Creating primary key [PK_Province] on [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] ADD CONSTRAINT [PK_Province] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Area]'
GO
CREATE TABLE [dbo].[Area]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Code] [nvarchar] (10) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_Area] on [dbo].[Area]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Area] ON [dbo].[Area] ([CX])
GO
PRINT N'Creating primary key [PK_Area] on [dbo].[Area]'
GO
ALTER TABLE [dbo].[Area] ADD CONSTRAINT [PK_Area] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Ethnic]'
GO
CREATE TABLE [dbo].[Ethnic]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_Ethnic] on [dbo].[Ethnic]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Ethnic] ON [dbo].[Ethnic] ([CX])
GO
PRINT N'Creating primary key [PK_Ethnic] on [dbo].[Ethnic]'
GO
ALTER TABLE [dbo].[Ethnic] ADD CONSTRAINT [PK_Ethnic] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[PriorityType]'
GO
CREATE TABLE [dbo].[PriorityType]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Code] [nchar] (2) NOT NULL
)
GO
PRINT N'Creating index [CX_PriorityType] on [dbo].[PriorityType]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_PriorityType] ON [dbo].[PriorityType] ([CX])
GO
PRINT N'Creating primary key [PK_PriorityType] on [dbo].[PriorityType]'
GO
ALTER TABLE [dbo].[PriorityType] ADD CONSTRAINT [PK_PriorityType] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] ADD CONSTRAINT [FK_Province_Area] FOREIGN KEY ([AreaId]) REFERENCES [dbo].[Area] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[District]'
GO
ALTER TABLE [dbo].[District] ADD CONSTRAINT [FK_District_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Province] FOREIGN KEY ([ClusterContestId]) REFERENCES [dbo].[Province] ([Id])
GO
