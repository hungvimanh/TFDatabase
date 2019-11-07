-- <Migration ID="5467ead9-5a80-4ca0-872f-67fb3f98aeb6" />
GO

PRINT N'Dropping foreign keys from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [FK_HighSchool_Area]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Town]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool1]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool2]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_HighSchool3]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_User]
GO
PRINT N'Dropping constraints from [dbo].[Area]'
GO
ALTER TABLE [dbo].[Area] DROP CONSTRAINT [PK_Area]
GO
PRINT N'Dropping constraints from [dbo].[PriorityType]'
GO
ALTER TABLE [dbo].[PriorityType] DROP CONSTRAINT [PK_PriorityType]
GO
PRINT N'Dropping index [CX_Area] from [dbo].[Area]'
GO
DROP INDEX [CX_Area] ON [dbo].[Area]
GO
PRINT N'Dropping index [CX_PriorityType] from [dbo].[PriorityType]'
GO
DROP INDEX [CX_PriorityType] ON [dbo].[PriorityType]
GO
PRINT N'Dropping [dbo].[PriorityType]'
GO
DROP TABLE [dbo].[PriorityType]
GO
PRINT N'Dropping [dbo].[Area]'
GO
DROP TABLE [dbo].[Area]
GO
PRINT N'Altering [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP
COLUMN [FullName],
COLUMN [Dob],
COLUMN [PlaceOfBirth],
COLUMN [Ethnic],
COLUMN [Identify],
COLUMN [TownId],
COLUMN [IsPermanentResidenceMore18],
COLUMN [IsPermanentResidenceSpecialMore18],
COLUMN [HighSchoolGrade10Id],
COLUMN [HighSchoolGrade11Id],
COLUMN [HighSchoolGrade12Id],
COLUMN [Phone],
COLUMN [Email],
COLUMN [Address],
COLUMN [ResultForUniversity],
COLUMN [StudyAtHighSchool],
COLUMN [Connected]
GO
EXEC sp_rename N'[dbo].[Form].[UserId]', N'StudentId', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[Form].[Gender]', N'Status', N'COLUMN'
GO
ALTER TABLE [dbo].[Form] ALTER COLUMN [Languages] [nvarchar] (50) NULL
GO
PRINT N'Altering [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP
COLUMN [AreaId]
GO
PRINT N'Altering [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD
[StudentId] [uniqueidentifier] NULL
GO
ALTER TABLE [dbo].[User] DROP
COLUMN [Email],
COLUMN [Phone],
COLUMN [Gender]
GO
EXEC sp_rename N'[dbo].[User].[FullName]', N'Username', N'COLUMN'
GO
PRINT N'Creating [dbo].[Student]'
GO
CREATE TABLE [dbo].[Student]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL,
[Dob] [date] NOT NULL,
[Gender] [bit] NOT NULL,
[EthnicId] [uniqueidentifier] NULL,
[TownId] [uniqueidentifier] NULL,
[PlaceOfBirth] [nvarchar] (50) NULL,
[Identify] [nvarchar] (20) NOT NULL,
[HighSchoolId] [uniqueidentifier] NULL,
[Address] [nvarchar] (500) NULL,
[Phone] [nvarchar] (20) NULL,
[Email] [nvarchar] (50) NOT NULL,
[Maths] [float] NULL,
[Literature] [float] NULL,
[Languages] [float] NULL,
[Physics] [float] NULL,
[Chemistry] [float] NULL,
[Biology] [float] NULL,
[History] [float] NULL,
[Geography] [float] NULL,
[CivicEducation] [float] NULL
)
GO
PRINT N'Creating index [CX_Student] on [dbo].[Student]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Student] ON [dbo].[Student] ([CX])
GO
PRINT N'Creating primary key [PK_Student] on [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK_Student] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD
[Quantity] [int] NULL
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_User] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[User] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Ethnic] FOREIGN KEY ([EthnicId]) REFERENCES [dbo].[Ethnic] ([Id])
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Town] FOREIGN KEY ([TownId]) REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_HighSchool] FOREIGN KEY ([HighSchoolId]) REFERENCES [dbo].[HighSchool] ([Id])
GO
