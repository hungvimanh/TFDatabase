-- <Migration ID="d58458bd-405e-4644-aa96-e04e690645a1" />
GO

PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_User]
GO
PRINT N'Dropping foreign keys from [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Ethnic]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_HighSchool]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Town]
GO
PRINT N'Dropping foreign keys from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Student]
GO
PRINT N'Dropping constraints from [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [PK_Student]
GO
PRINT N'Dropping index [CX_Student] from [dbo].[Student]'
GO
DROP INDEX [CX_Student] ON [dbo].[Student]
GO
PRINT N'Rebuilding [dbo].[Student]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Student]
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
[CivicEducation] [float] NULL,
[Status] [bit] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Student] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Student]([Id], [CX], [Name], [Dob], [Gender], [EthnicId], [TownId], [PlaceOfBirth], [Identify], [HighSchoolId], [Address], [Phone], [Email], [Maths], [Literature], [Languages], [Physics], [Chemistry], [Biology], [History], [Geography], [CivicEducation]) SELECT [Id], [CX], [Name], [Dob], [Gender], [EthnicId], [TownId], [PlaceOfBirth], [Identify], [HighSchoolId], [Address], [Phone], [Email], [Maths], [Literature], [Languages], [Physics], [Chemistry], [Biology], [History], [Geography], [CivicEducation] FROM [dbo].[Student]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Student] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Student]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Student]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Student]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Student]', N'Student', N'OBJECT'
GO
PRINT N'Creating index [CX_Student] on [dbo].[Student]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Student] ON [dbo].[Student] ([CX])
GO
PRINT N'Creating primary key [PK_Student] on [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK_Student] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD
[Email] [nvarchar] (50) NULL
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Ethnic] FOREIGN KEY ([EthnicId]) REFERENCES [dbo].[Ethnic] ([Id])
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_HighSchool] FOREIGN KEY ([HighSchoolId]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Town] FOREIGN KEY ([TownId]) REFERENCES [dbo].[Town] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student] ([Id])
GO
