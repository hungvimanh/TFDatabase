-- <Migration ID="274e63ce-801e-4dc2-8df7-baca978badf7" />
GO

PRINT N'Dropping foreign keys from [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [FK_Aspiration_UniversityAdmission]
GO
PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Graduation]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Register]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Student]
GO
PRINT N'Dropping foreign keys from [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] DROP CONSTRAINT [FK_ReserveMark_Graduation]
GO
PRINT N'Dropping foreign keys from [dbo].[Register]'
GO
ALTER TABLE [dbo].[Register] DROP CONSTRAINT [FK_Register_Province]
GO
ALTER TABLE [dbo].[Register] DROP CONSTRAINT [FK_Register_HighSchool]
GO
ALTER TABLE [dbo].[Register] DROP CONSTRAINT [FK_Register_Test]
GO
PRINT N'Dropping foreign keys from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Student]
GO
PRINT N'Dropping foreign keys from [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Town]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_HighSchoolReference]
GO
PRINT N'Dropping foreign keys from [dbo].[Test]'
GO
ALTER TABLE [dbo].[Test] DROP CONSTRAINT [FK_Test_NaturalSciences]
GO
ALTER TABLE [dbo].[Test] DROP CONSTRAINT [FK_Test_SocialScience]
GO
PRINT N'Dropping foreign keys from [dbo].[University]'
GO
ALTER TABLE [dbo].[University] DROP CONSTRAINT [FK_University_University_Majors]
GO
PRINT N'Dropping foreign keys from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Majors]
GO
PRINT N'Dropping constraints from [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] DROP CONSTRAINT [PK_Aspiration]
GO
PRINT N'Dropping constraints from [dbo].[Graduation]'
GO
ALTER TABLE [dbo].[Graduation] DROP CONSTRAINT [PK_Graduation]
GO
PRINT N'Dropping constraints from [dbo].[Register]'
GO
ALTER TABLE [dbo].[Register] DROP CONSTRAINT [PK_Register]
GO
PRINT N'Dropping constraints from [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [PK_Student]
GO
PRINT N'Dropping constraints from [dbo].[Test]'
GO
ALTER TABLE [dbo].[Test] DROP CONSTRAINT [PK_Test]
GO
PRINT N'Dropping constraints from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [PK_University_Majors]
GO
PRINT N'Dropping index [CX_Aspiration] from [dbo].[Aspiration]'
GO
DROP INDEX [CX_Aspiration] ON [dbo].[Aspiration]
GO
PRINT N'Dropping index [CX_Graduation] from [dbo].[Graduation]'
GO
DROP INDEX [CX_Graduation] ON [dbo].[Graduation]
GO
PRINT N'Dropping index [CX_Register] from [dbo].[Register]'
GO
DROP INDEX [CX_Register] ON [dbo].[Register]
GO
PRINT N'Dropping index [CX_Student] from [dbo].[Student]'
GO
DROP INDEX [CX_Student] ON [dbo].[Student]
GO
PRINT N'Dropping index [CX_Test] from [dbo].[Test]'
GO
DROP INDEX [CX_Test] ON [dbo].[Test]
GO
PRINT N'Dropping index [CX_University_Majors] from [dbo].[University_Majors]'
GO
DROP INDEX [CX_University_Majors] ON [dbo].[University_Majors]
GO
PRINT N'Dropping [dbo].[Test]'
GO
DROP TABLE [dbo].[Test]
GO
PRINT N'Dropping [dbo].[Student]'
GO
DROP TABLE [dbo].[Student]
GO
PRINT N'Dropping [dbo].[Register]'
GO
DROP TABLE [dbo].[Register]
GO
PRINT N'Dropping [dbo].[Graduation]'
GO
DROP TABLE [dbo].[Graduation]
GO
PRINT N'Dropping [dbo].[Aspiration]'
GO
DROP TABLE [dbo].[Aspiration]
GO
PRINT N'Creating [dbo].[GraduationInformation]'
GO
CREATE TABLE [dbo].[GraduationInformation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ExceptLanguages] [nvarchar] (500) NULL,
[Mark] [int] NULL
)
GO
PRINT N'Creating index [CX_Graduation] on [dbo].[GraduationInformation]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Graduation] ON [dbo].[GraduationInformation] ([CX])
GO
PRINT N'Creating primary key [PK_Graduation] on [dbo].[GraduationInformation]'
GO
ALTER TABLE [dbo].[GraduationInformation] ADD CONSTRAINT [PK_Graduation] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[RegisterInformation]'
GO
CREATE TABLE [dbo].[RegisterInformation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ResultForUniversity] [bit] NULL,
[StudyAtHighSchool] [bit] NOT NULL,
[Passed] [bit] NOT NULL,
[ContestGroupId] [uniqueidentifier] NOT NULL,
[ContestUnitId] [uniqueidentifier] NOT NULL,
[TestId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_Register] on [dbo].[RegisterInformation]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Register] ON [dbo].[RegisterInformation] ([CX])
GO
PRINT N'Creating primary key [PK_Register] on [dbo].[RegisterInformation]'
GO
ALTER TABLE [dbo].[RegisterInformation] ADD CONSTRAINT [PK_Register] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[PersonalInformation]'
GO
CREATE TABLE [dbo].[PersonalInformation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[FullName] [nvarchar] (100) NOT NULL,
[Dob] [date] NOT NULL,
[Gender] [bit] NOT NULL,
[Nation] [nvarchar] (30) NOT NULL,
[Identify] [nchar] (20) NOT NULL,
[TownId] [uniqueidentifier] NOT NULL,
[IsPermanentResidenceMore18] [bit] NULL,
[IsPermanentResidenceSpecialMore18] [bit] NULL,
[HighSchoolId] [uniqueidentifier] NOT NULL,
[Phone] [nvarchar] (15) NOT NULL,
[Email] [nvarchar] (50) NOT NULL,
[Address] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating index [CX_Student] on [dbo].[PersonalInformation]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Student] ON [dbo].[PersonalInformation] ([CX])
GO
PRINT N'Creating primary key [PK_Student] on [dbo].[PersonalInformation]'
GO
ALTER TABLE [dbo].[PersonalInformation] ADD CONSTRAINT [PK_Student] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[TestExam]'
GO
CREATE TABLE [dbo].[TestExam]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Maths] [bit] NOT NULL,
[Literature] [bit] NOT NULL,
[ForeignLanguage] [nchar] (2) NOT NULL,
[ScienceId] [uniqueidentifier] NULL
)
GO
PRINT N'Creating index [CX_Test] on [dbo].[TestExam]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Test] ON [dbo].[TestExam] ([CX])
GO
PRINT N'Creating primary key [PK_Test] on [dbo].[TestExam]'
GO
ALTER TABLE [dbo].[TestExam] ADD CONSTRAINT [PK_Test] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Rebuilding [dbo].[University_Majors]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_University_Majors]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[UniversityId] [uniqueidentifier] NOT NULL,
[MajorsId] [uniqueidentifier] NOT NULL,
[Benchmark] [float] NULL,
[SubjectGroupType] [nvarchar] (10) NULL,
[UniversityAdmissionId] [uniqueidentifier] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_University_Majors] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_University_Majors]([CX], [UniversityId], [MajorsId], [Benchmark]) SELECT [CX], [UniversityId], [MajorsId], [Benchmark] FROM [dbo].[University_Majors]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_University_Majors] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[University_Majors]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_University_Majors]', RESEED, @idVal)
GO
DROP TABLE [dbo].[University_Majors]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_University_Majors]', N'University_Majors', N'OBJECT'
GO
PRINT N'Creating index [CX_University_Majors] on [dbo].[University_Majors]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_University_Majors] ON [dbo].[University_Majors] ([CX])
GO
PRINT N'Creating primary key [PK_University_Majors_1] on [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [PK_University_Majors_1] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_University_Majors] on [dbo].[University_Majors]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_University_Majors] ON [dbo].[University_Majors] ([MajorsId], [UniversityId], [SubjectGroupType])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Graduation] FOREIGN KEY ([GraduationInformationId]) REFERENCES [dbo].[GraduationInformation] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Register] FOREIGN KEY ([RegisterInformationId]) REFERENCES [dbo].[RegisterInformation] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Student] FOREIGN KEY ([PersonalInfomartionId]) REFERENCES [dbo].[PersonalInformation] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] ADD CONSTRAINT [FK_ReserveMark_Graduation] FOREIGN KEY ([GraduationId]) REFERENCES [dbo].[GraduationInformation] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[PersonalInformation] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[PersonalInformation]'
GO
ALTER TABLE [dbo].[PersonalInformation] ADD CONSTRAINT [FK_Student_Town] FOREIGN KEY ([TownId]) REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[PersonalInformation] ADD CONSTRAINT [FK_Student_HighSchoolReference] FOREIGN KEY ([HighSchoolId]) REFERENCES [dbo].[HighSchoolReference] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[RegisterInformation]'
GO
ALTER TABLE [dbo].[RegisterInformation] ADD CONSTRAINT [FK_Register_Province] FOREIGN KEY ([ContestGroupId]) REFERENCES [dbo].[Province] ([Id])
GO
ALTER TABLE [dbo].[RegisterInformation] ADD CONSTRAINT [FK_Register_HighSchool] FOREIGN KEY ([ContestUnitId]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[RegisterInformation] ADD CONSTRAINT [FK_Register_Test] FOREIGN KEY ([TestId]) REFERENCES [dbo].[TestExam] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[TestExam]'
GO
ALTER TABLE [dbo].[TestExam] ADD CONSTRAINT [FK_Test_NaturalSciences] FOREIGN KEY ([ScienceId]) REFERENCES [dbo].[NaturalSciences] ([Id])
GO
ALTER TABLE [dbo].[TestExam] ADD CONSTRAINT [FK_Test_SocialScience] FOREIGN KEY ([ScienceId]) REFERENCES [dbo].[SocialScience] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_UniversityAdmission] FOREIGN KEY ([UniversityAdmissionId]) REFERENCES [dbo].[UniversityAdmission] ([Id])
GO
