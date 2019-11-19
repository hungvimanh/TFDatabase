-- <Migration ID="707c0aeb-7acb-4b57-925f-27d877a982fe" />
GO

PRINT N'Dropping foreign keys from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Majors1]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_SubjectGroup]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_University1]
GO
PRINT N'Dropping constraints from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [PK_University_Majors_1]
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP
COLUMN [Benchmark],
COLUMN [Descreption],
COLUMN [Quantity]
GO
EXEC sp_rename N'[dbo].[University_Majors].[SubjectGroupId]', N'Id', N'COLUMN'
GO
ALTER TABLE [dbo].[University_Majors] ALTER COLUMN [Year] [nchar] (4) NOT NULL
GO
PRINT N'Creating primary key [PK_University_Majors] on [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [PK_University_Majors] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[University_Majors_SubjectGroup]'
GO
CREATE TABLE [dbo].[University_Majors_SubjectGroup]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[University_MajorsId] [uniqueidentifier] NOT NULL,
[Benchmark] [float] NULL,
[Quantity] [int] NULL,
[Note] [nvarchar] (500) NULL,
[SubjectGroupId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_University_Majors_Year_SubjectGroup] on [dbo].[University_Majors_SubjectGroup]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_University_Majors_Year_SubjectGroup] ON [dbo].[University_Majors_SubjectGroup] ([CX])
GO
PRINT N'Creating primary key [PK_University_Majors_Year_SubjectGroup] on [dbo].[University_Majors_SubjectGroup]'
GO
ALTER TABLE [dbo].[University_Majors_SubjectGroup] ADD CONSTRAINT [PK_University_Majors_Year_SubjectGroup] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors_SubjectGroup]'
GO
ALTER TABLE [dbo].[University_Majors_SubjectGroup] ADD CONSTRAINT [FK_University_Majors_SubjectGroup_University_Majors] FOREIGN KEY ([University_MajorsId]) REFERENCES [dbo].[University_Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors_SubjectGroup] ADD CONSTRAINT [FK_University_Majors_SubjectGroup_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
