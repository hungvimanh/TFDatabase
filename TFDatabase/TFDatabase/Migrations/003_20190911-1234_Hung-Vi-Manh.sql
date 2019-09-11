-- <Migration ID="3d1d2c9d-1c69-4da9-aabe-0c567e2abcb8" />
GO

PRINT N'Dropping foreign keys from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Graduation]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Register]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_Student]
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [FK_Form_UniversityAdmission]
GO
PRINT N'Dropping foreign keys from [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] DROP CONSTRAINT [FK_ReserveMark_Graduation]
GO
PRINT N'Dropping foreign keys from [dbo].[PersonalInformation]'
GO
ALTER TABLE [dbo].[PersonalInformation] DROP CONSTRAINT [FK_Student_HighSchoolReference]
GO
ALTER TABLE [dbo].[PersonalInformation] DROP CONSTRAINT [FK_Student_Town]
GO
PRINT N'Dropping foreign keys from [dbo].[HighSchoolReference]'
GO
ALTER TABLE [dbo].[HighSchoolReference] DROP CONSTRAINT [FK_HighSchoolReference_HighSchool10]
GO
ALTER TABLE [dbo].[HighSchoolReference] DROP CONSTRAINT [FK_HighSchoolReference_HighSchool11]
GO
ALTER TABLE [dbo].[HighSchoolReference] DROP CONSTRAINT [FK_HighSchoolReference_HighSchool12]
GO
PRINT N'Dropping foreign keys from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [FK_HighSchool_Province]
GO
PRINT N'Dropping foreign keys from [dbo].[TestExam]'
GO
ALTER TABLE [dbo].[TestExam] DROP CONSTRAINT [FK_Test_NaturalSciences]
GO
ALTER TABLE [dbo].[TestExam] DROP CONSTRAINT [FK_Test_SocialScience]
GO
PRINT N'Dropping foreign keys from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Student]
GO
PRINT N'Dropping foreign keys from [dbo].[RegisterInformation]'
GO
ALTER TABLE [dbo].[RegisterInformation] DROP CONSTRAINT [FK_Register_Province]
GO
ALTER TABLE [dbo].[RegisterInformation] DROP CONSTRAINT [FK_Register_HighSchool]
GO
ALTER TABLE [dbo].[RegisterInformation] DROP CONSTRAINT [FK_Register_Test]
GO
PRINT N'Dropping foreign keys from [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_UniversityAdmission]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_Majors]
GO
ALTER TABLE [dbo].[University_Majors] DROP CONSTRAINT [FK_University_Majors_University]
GO
PRINT N'Dropping constraints from [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] DROP CONSTRAINT [PK_Form]
GO
PRINT N'Dropping constraints from [dbo].[GraduationInformation]'
GO
ALTER TABLE [dbo].[GraduationInformation] DROP CONSTRAINT [PK_Graduation]
GO
PRINT N'Dropping constraints from [dbo].[HighSchoolReference]'
GO
ALTER TABLE [dbo].[HighSchoolReference] DROP CONSTRAINT [PK_HighSchoolReference]
GO
PRINT N'Dropping constraints from [dbo].[NaturalSciences]'
GO
ALTER TABLE [dbo].[NaturalSciences] DROP CONSTRAINT [PK_NaturalSciences]
GO
PRINT N'Dropping constraints from [dbo].[PersonalInformation]'
GO
ALTER TABLE [dbo].[PersonalInformation] DROP CONSTRAINT [PK_Student]
GO
PRINT N'Dropping constraints from [dbo].[RegisterInformation]'
GO
ALTER TABLE [dbo].[RegisterInformation] DROP CONSTRAINT [PK_Register]
GO
PRINT N'Dropping constraints from [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] DROP CONSTRAINT [PK_ReserveMark]
GO
PRINT N'Dropping constraints from [dbo].[SocialScience]'
GO
ALTER TABLE [dbo].[SocialScience] DROP CONSTRAINT [PK_SocialScience]
GO
PRINT N'Dropping constraints from [dbo].[TestExam]'
GO
ALTER TABLE [dbo].[TestExam] DROP CONSTRAINT [PK_Test]
GO
PRINT N'Dropping constraints from [dbo].[UniversityAdmission]'
GO
ALTER TABLE [dbo].[UniversityAdmission] DROP CONSTRAINT [PK_UniversityAdmission]
GO
PRINT N'Dropping index [IX_University_Majors] from [dbo].[University_Majors]'
GO
DROP INDEX [IX_University_Majors] ON [dbo].[University_Majors]
GO
PRINT N'Dropping index [CX_Form] from [dbo].[Form]'
GO
DROP INDEX [CX_Form] ON [dbo].[Form]
GO
PRINT N'Dropping index [CX_Graduation] from [dbo].[GraduationInformation]'
GO
DROP INDEX [CX_Graduation] ON [dbo].[GraduationInformation]
GO
PRINT N'Dropping index [CX_HighSchoolReference] from [dbo].[HighSchoolReference]'
GO
DROP INDEX [CX_HighSchoolReference] ON [dbo].[HighSchoolReference]
GO
PRINT N'Dropping index [CX_NaturalSciences] from [dbo].[NaturalSciences]'
GO
DROP INDEX [CX_NaturalSciences] ON [dbo].[NaturalSciences]
GO
PRINT N'Dropping index [CX_Student] from [dbo].[PersonalInformation]'
GO
DROP INDEX [CX_Student] ON [dbo].[PersonalInformation]
GO
PRINT N'Dropping index [CX_Register] from [dbo].[RegisterInformation]'
GO
DROP INDEX [CX_Register] ON [dbo].[RegisterInformation]
GO
PRINT N'Dropping index [CX_ReserveMark] from [dbo].[ReserveMark]'
GO
DROP INDEX [CX_ReserveMark] ON [dbo].[ReserveMark]
GO
PRINT N'Dropping index [CX_SocialScience] from [dbo].[SocialScience]'
GO
DROP INDEX [CX_SocialScience] ON [dbo].[SocialScience]
GO
PRINT N'Dropping index [CX_Test] from [dbo].[TestExam]'
GO
DROP INDEX [CX_Test] ON [dbo].[TestExam]
GO
PRINT N'Dropping index [CX_UniversityAdmission] from [dbo].[UniversityAdmission]'
GO
DROP INDEX [CX_UniversityAdmission] ON [dbo].[UniversityAdmission]
GO
PRINT N'Dropping [dbo].[SocialScience]'
GO
DROP TABLE [dbo].[SocialScience]
GO
PRINT N'Dropping [dbo].[NaturalSciences]'
GO
DROP TABLE [dbo].[NaturalSciences]
GO
PRINT N'Dropping [dbo].[ReserveMark]'
GO
DROP TABLE [dbo].[ReserveMark]
GO
PRINT N'Dropping [dbo].[TestExam]'
GO
DROP TABLE [dbo].[TestExam]
GO
PRINT N'Dropping [dbo].[HighSchoolReference]'
GO
DROP TABLE [dbo].[HighSchoolReference]
GO
PRINT N'Dropping [dbo].[UniversityAdmission]'
GO
DROP TABLE [dbo].[UniversityAdmission]
GO
PRINT N'Dropping [dbo].[PersonalInformation]'
GO
DROP TABLE [dbo].[PersonalInformation]
GO
PRINT N'Dropping [dbo].[RegisterInformation]'
GO
DROP TABLE [dbo].[RegisterInformation]
GO
PRINT N'Dropping [dbo].[GraduationInformation]'
GO
DROP TABLE [dbo].[GraduationInformation]
GO
PRINT N'Altering [dbo].[HighSchool]'
GO
EXEC sp_rename N'[dbo].[HighSchool].[ProvinceId]', N'DistrictId', N'COLUMN'
GO
PRINT N'Rebuilding [dbo].[Form]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Form]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[NumberForm] [nvarchar] (50) NOT NULL,
[DepartmentCode] [nchar] (2) NOT NULL,
[Date] [date] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[FullName] [nvarchar] (100) NOT NULL,
[Dob] [date] NOT NULL,
[Gender] [bit] NOT NULL,
[PlaceOfBirth] [nvarchar] (50) NOT NULL,
[Ethnic] [nvarchar] (50) NOT NULL,
[Identify] [nchar] (12) NOT NULL,
[TownId] [uniqueidentifier] NOT NULL,
[IsPermanentResidenceMore18] [bit] NULL,
[IsPermanentResidenceSpecialMore18] [bit] NULL,
[HighSchoolGrade10Id] [uniqueidentifier] NOT NULL,
[HighSchoolGrade11Id] [uniqueidentifier] NOT NULL,
[HighSchoolGrade12Id] [uniqueidentifier] NOT NULL,
[Grade12Name] [nvarchar] (50) NOT NULL,
[Phone] [nvarchar] (15) NOT NULL,
[Email] [nvarchar] (50) NOT NULL,
[Address] [nvarchar] (500) NOT NULL,
[ResultForUniversity] [bit] NULL,
[StudyAtHighSchool] [bit] NOT NULL,
[Graduated] [bit] NULL,
[ClusterContestId] [uniqueidentifier] NOT NULL,
[RegisterPlaceOfExamId] [uniqueidentifier] NOT NULL,
[Maths] [bit] NULL,
[Literature] [bit] NULL,
[Languages] [nchar] (2) NULL,
[NaturalSciences] [bit] NULL,
[SocialSciences] [bit] NULL,
[Physics] [bit] NULL,
[Chemistry] [bit] NULL,
[Biology] [bit] NULL,
[History] [bit] NULL,
[Geography] [bit] NULL,
[CivicEducation] [bit] NULL,
[ExceptLanguages] [nvarchar] (500) NULL,
[Mark] [int] NULL,
[ReserveMaths] [int] NULL,
[ReservePhysics] [int] NULL,
[ReserveChemistry] [int] NULL,
[ReserveLiterature] [int] NULL,
[ReserveHistory] [int] NULL,
[ReserveGeography] [int] NULL,
[ReserveBiology] [int] NULL,
[ReserveCivicEducation] [int] NULL,
[ReserveLanguages] [int] NULL,
[PriorityType] [nchar] (2) NOT NULL,
[Area] [nvarchar] (10) NOT NULL,
[GraduateYear] [nchar] (4) NOT NULL,
[Connected] [bit] NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Form] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Form]([Id], [CX], [NumberForm], [DepartmentCode], [Date], [UserId], [TownId], [HighSchoolGrade10Id], [HighSchoolGrade11Id]) SELECT [Id], [CX], [NumberForm], [DepartmentCode], [Date], [PersonalInfomartionId], [RegisterInformationId], [GraduationInformationId], [UniversityAdmissionId] FROM [dbo].[Form]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Form] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Form]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Form]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Form]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Form]', N'Form', N'OBJECT'
GO
PRINT N'Creating index [CX_Form] on [dbo].[Form]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Form] ON [dbo].[Form] ([CX])
GO
PRINT N'Creating primary key [PK_Form] on [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [PK_Form] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP
COLUMN [StudentId]
GO
PRINT N'Altering [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD
[Year] [nchar] (4) NULL
GO
EXEC sp_rename N'[dbo].[University_Majors].[UniversityAdmissionId]', N'FormId', N'COLUMN'
GO
PRINT N'Creating index [IX_University_Majors] on [dbo].[University_Majors]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_University_Majors] ON [dbo].[University_Majors] ([MajorsId], [UniversityId], [SubjectGroupType], [Year])
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
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Province] FOREIGN KEY ([ClusterContestId]) REFERENCES [dbo].[Province] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Town] FOREIGN KEY ([TownId]) REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Form] FOREIGN KEY ([FormId]) REFERENCES [dbo].[Form] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_University] FOREIGN KEY ([UniversityId]) REFERENCES [dbo].[University] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_District] FOREIGN KEY ([DistrictId]) REFERENCES [dbo].[District] ([Id])
GO
