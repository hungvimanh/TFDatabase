-- <Migration ID="5e6c4b4b-ee09-42bc-a1cb-e9591c7157f5" />
GO

PRINT N'Dropping foreign keys from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_University1]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Majors1]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_SubjectGroup]
GO
PRINT N'Dropping constraints from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [PK_University_Majors_1]
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ALTER COLUMN [Year] [nvarchar] (50) NOT NULL
GO
PRINT N'Creating primary key [PK_University_Majors_1] on [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [PK_University_Majors_1] PRIMARY KEY NONCLUSTERED  ([UniversityId], [MajorsId], [SubjectGroupId], [Year])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_University1] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors1] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_SubjectGroup] FOREIGN KEY ([SubjectGroupId]) REFERENCES [dbo].[SubjectGroup] ([Id])
GO
