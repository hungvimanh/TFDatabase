-- <Migration ID="fe6e9171-dacb-4633-a62b-22e00dafa93e" />
GO

PRINT N'Dropping constraints from [dbo].[Ethnic]'
GO
ALTER TABLE [dbo].[Ethnic] DROP CONSTRAINT [PK_Ethnic]
GO
PRINT N'Dropping index [CX_Ethnic] from [dbo].[Ethnic]'
GO
DROP INDEX [CX_Ethnic] ON [dbo].[Ethnic]
GO
PRINT N'Rebuilding [dbo].[Ethnic]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Ethnic]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
INSERT INTO [dbo].[RG_Recovery_1_Ethnic]([Id], [CX], [Name]) SELECT [Id], [CX], [Name] FROM [dbo].[Ethnic]
GO
DROP TABLE [dbo].[Ethnic]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Ethnic]', N'Ethnic', N'OBJECT'
GO
PRINT N'Creating index [CX_Ethnic] on [dbo].[Ethnic]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Ethnic] ON [dbo].[Ethnic] ([CX])
GO
PRINT N'Creating primary key [PK_Ethnic] on [dbo].[Ethnic]'
GO
ALTER TABLE [dbo].[Ethnic] ADD CONSTRAINT [PK_Ethnic] PRIMARY KEY NONCLUSTERED  ([Id])
GO
