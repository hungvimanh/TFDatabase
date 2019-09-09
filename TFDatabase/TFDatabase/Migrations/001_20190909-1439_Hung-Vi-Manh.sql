-- <Migration ID="12997d42-a323-42ba-bf2f-6ff6bf10e22e" />
GO

PRINT N'Creating [dbo].[UniversityAdmission]'
GO
CREATE TABLE [dbo].[UniversityAdmission]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[PriorityType] [nchar] (2) NOT NULL,
[Area] [nvarchar] (10) NOT NULL,
[GraduateYear] [nchar] (4) NOT NULL,
[Connected] [int] NULL
)
GO
PRINT N'Creating index [CX_UniversityAdmission] on [dbo].[UniversityAdmission]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_UniversityAdmission] ON [dbo].[UniversityAdmission] ([CX])
GO
PRINT N'Creating primary key [PK_UniversityAdmission] on [dbo].[UniversityAdmission]'
GO
ALTER TABLE [dbo].[UniversityAdmission] ADD CONSTRAINT [PK_UniversityAdmission] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Aspiration]'
GO
CREATE TABLE [dbo].[Aspiration]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[UniversityCode] [nvarchar] (50) NOT NULL,
[MajorsCode] [nvarchar] (50) NOT NULL,
[MajorsName] [nvarchar] (50) NOT NULL,
[SubjectGroupType] [nvarchar] (50) NOT NULL,
[UniversityAdmissionId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_Aspiration] on [dbo].[Aspiration]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Aspiration] ON [dbo].[Aspiration] ([CX])
GO
PRINT N'Creating primary key [PK_Aspiration] on [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [PK_Aspiration] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Province]'
GO
CREATE TABLE [dbo].[Province]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating index [CX_Province] on [dbo].[Province]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Province] ON [dbo].[Province] ([CX])
GO
PRINT N'Creating primary key [PK_Province] on [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] ADD CONSTRAINT [PK_Province] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[District]'
GO
CREATE TABLE [dbo].[District]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[ProvinceId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_Table_1] on [dbo].[District]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Table_1] ON [dbo].[District] ([CX])
GO
PRINT N'Creating primary key [PK_District] on [dbo].[District]'
GO
ALTER TABLE [dbo].[District] ADD CONSTRAINT [PK_District] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Graduation]'
GO
CREATE TABLE [dbo].[Graduation]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[ExceptLanguages] [nvarchar] (500) NULL,
[Mark] [int] NULL
)
GO
PRINT N'Creating index [CX_Graduation] on [dbo].[Graduation]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Graduation] ON [dbo].[Graduation] ([CX])
GO
PRINT N'Creating primary key [PK_Graduation] on [dbo].[Graduation]'
GO
ALTER TABLE [dbo].[Graduation] ADD CONSTRAINT [PK_Graduation] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Form]'
GO
CREATE TABLE [dbo].[Form]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[NumberForm] [nvarchar] (50) NOT NULL,
[DepartmentCode] [nchar] (2) NOT NULL,
[Date] [date] NOT NULL,
[PersonalInfomartionId] [uniqueidentifier] NOT NULL,
[RegisterInformationId] [uniqueidentifier] NOT NULL,
[GraduationInformationId] [uniqueidentifier] NOT NULL,
[UniversityAdmissionId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_Form] on [dbo].[Form]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Form] ON [dbo].[Form] ([CX])
GO
PRINT N'Creating primary key [PK_Form] on [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [PK_Form] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Register]'
GO
CREATE TABLE [dbo].[Register]
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
PRINT N'Creating index [CX_Register] on [dbo].[Register]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Register] ON [dbo].[Register] ([CX])
GO
PRINT N'Creating primary key [PK_Register] on [dbo].[Register]'
GO
ALTER TABLE [dbo].[Register] ADD CONSTRAINT [PK_Register] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Student]'
GO
CREATE TABLE [dbo].[Student]
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
PRINT N'Creating index [CX_Student] on [dbo].[Student]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Student] ON [dbo].[Student] ([CX])
GO
PRINT N'Creating primary key [PK_Student] on [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK_Student] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[HighSchool]'
GO
CREATE TABLE [dbo].[HighSchool]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (3) NOT NULL,
[Name] [nvarchar] (500) NOT NULL,
[ProvinceId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_HighSchool] on [dbo].[HighSchool]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_HighSchool] ON [dbo].[HighSchool] ([CX])
GO
PRINT N'Creating primary key [PK_HighSchool] on [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [PK_HighSchool] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[HighSchoolReference]'
GO
CREATE TABLE [dbo].[HighSchoolReference]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL,
[Grade10Id] [uniqueidentifier] NOT NULL,
[Grade11Id] [uniqueidentifier] NOT NULL,
[Grade12Id] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_HighSchoolReference] on [dbo].[HighSchoolReference]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_HighSchoolReference] ON [dbo].[HighSchoolReference] ([CX])
GO
PRINT N'Creating primary key [PK_HighSchoolReference] on [dbo].[HighSchoolReference]'
GO
ALTER TABLE [dbo].[HighSchoolReference] ADD CONSTRAINT [PK_HighSchoolReference] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Test]'
GO
CREATE TABLE [dbo].[Test]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Maths] [bit] NOT NULL,
[Literature] [bit] NOT NULL,
[ForeignLanguage] [nchar] (2) NOT NULL,
[ScienceId] [uniqueidentifier] NULL
)
GO
PRINT N'Creating index [CX_Test] on [dbo].[Test]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Test] ON [dbo].[Test] ([CX])
GO
PRINT N'Creating primary key [PK_Test] on [dbo].[Test]'
GO
ALTER TABLE [dbo].[Test] ADD CONSTRAINT [PK_Test] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ReserveMark]'
GO
CREATE TABLE [dbo].[ReserveMark]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Maths] [int] NULL,
[Literature] [int] NULL,
[History] [int] NULL,
[Geography] [int] NULL,
[CivicEducation] [int] NULL,
[Physics] [int] NULL,
[Chemistry] [int] NULL,
[Biology] [int] NULL,
[Languages] [int] NULL,
[GraduationId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_ReserveMark] on [dbo].[ReserveMark]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_ReserveMark] ON [dbo].[ReserveMark] ([CX])
GO
PRINT N'Creating primary key [PK_ReserveMark] on [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] ADD CONSTRAINT [PK_ReserveMark] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Town]'
GO
CREATE TABLE [dbo].[Town]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (2) NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[DistrictId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [IX_Town] on [dbo].[Town]'
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Town] ON [dbo].[Town] ([CX])
GO
PRINT N'Creating primary key [PK_Town] on [dbo].[Town]'
GO
ALTER TABLE [dbo].[Town] ADD CONSTRAINT [PK_Town] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[NaturalSciences]'
GO
CREATE TABLE [dbo].[NaturalSciences]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Physics] [bit] NOT NULL,
[Chemistry] [bit] NOT NULL,
[Biology] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_NaturalSciences] on [dbo].[NaturalSciences]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_NaturalSciences] ON [dbo].[NaturalSciences] ([CX])
GO
PRINT N'Creating primary key [PK_NaturalSciences] on [dbo].[NaturalSciences]'
GO
ALTER TABLE [dbo].[NaturalSciences] ADD CONSTRAINT [PK_NaturalSciences] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[SocialScience]'
GO
CREATE TABLE [dbo].[SocialScience]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[History] [bit] NOT NULL,
[Geography] [bit] NOT NULL,
[CivicEducation] [bit] NOT NULL
)
GO
PRINT N'Creating index [CX_SocialScience] on [dbo].[SocialScience]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_SocialScience] ON [dbo].[SocialScience] ([CX])
GO
PRINT N'Creating primary key [PK_SocialScience] on [dbo].[SocialScience]'
GO
ALTER TABLE [dbo].[SocialScience] ADD CONSTRAINT [PK_SocialScience] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Majors]'
GO
CREATE TABLE [dbo].[Majors]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (15) NOT NULL,
[Name] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating index [CX_Majors] on [dbo].[Majors]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_Majors] ON [dbo].[Majors] ([CX])
GO
PRINT N'Creating primary key [PK_Majors] on [dbo].[Majors]'
GO
ALTER TABLE [dbo].[Majors] ADD CONSTRAINT [PK_Majors] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[University_Majors]'
GO
CREATE TABLE [dbo].[University_Majors]
(
[UniversityId] [uniqueidentifier] NOT NULL,
[MajorsId] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Benchmark] [float] NULL
)
GO
PRINT N'Creating index [CX_University_Majors] on [dbo].[University_Majors]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_University_Majors] ON [dbo].[University_Majors] ([UniversityId])
GO
PRINT N'Creating primary key [PK_University_Majors] on [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [PK_University_Majors] PRIMARY KEY NONCLUSTERED  ([UniversityId], [MajorsId])
GO
PRINT N'Creating [dbo].[University]'
GO
CREATE TABLE [dbo].[University]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Code] [nchar] (3) NOT NULL,
[Name] [nvarchar] (100) NOT NULL,
[Address] [nvarchar] (500) NULL
)
GO
PRINT N'Creating index [CX_University] on [dbo].[University]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_University] ON [dbo].[University] ([CX])
GO
PRINT N'Creating primary key [PK_University] on [dbo].[University]'
GO
ALTER TABLE [dbo].[University] ADD CONSTRAINT [PK_University] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[User]'
GO
CREATE TABLE [dbo].[User]
(
[Id] [uniqueidentifier] NOT NULL,
[CX] [bigint] NOT NULL IDENTITY(1, 1),
[Username] [nvarchar] (50) NOT NULL,
[Password] [nvarchar] (50) NOT NULL,
[IsAdmin] [bit] NOT NULL,
[StudentId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating index [CX_User] on [dbo].[User]'
GO
CREATE UNIQUE CLUSTERED INDEX [CX_User] ON [dbo].[User] ([Id])
GO
PRINT N'Creating primary key [PK_User] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Aspiration]'
GO
ALTER TABLE [dbo].[Aspiration] ADD CONSTRAINT [FK_Aspiration_UniversityAdmission] FOREIGN KEY ([UniversityAdmissionId]) REFERENCES [dbo].[UniversityAdmission] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Town]'
GO
ALTER TABLE [dbo].[Town] ADD CONSTRAINT [FK_Town_District] FOREIGN KEY ([DistrictId]) REFERENCES [dbo].[District] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[District]'
GO
ALTER TABLE [dbo].[District] ADD CONSTRAINT [FK_District_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Form]'
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Student] FOREIGN KEY ([PersonalInfomartionId]) REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Register] FOREIGN KEY ([RegisterInformationId]) REFERENCES [dbo].[Register] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_Graduation] FOREIGN KEY ([GraduationInformationId]) REFERENCES [dbo].[Graduation] ([Id])
GO
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [FK_Form_UniversityAdmission] FOREIGN KEY ([UniversityAdmissionId]) REFERENCES [dbo].[UniversityAdmission] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ReserveMark]'
GO
ALTER TABLE [dbo].[ReserveMark] ADD CONSTRAINT [FK_ReserveMark_Graduation] FOREIGN KEY ([GraduationId]) REFERENCES [dbo].[Graduation] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Student]'
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_HighSchoolReference] FOREIGN KEY ([HighSchoolId]) REFERENCES [dbo].[HighSchoolReference] ([Id])
GO
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [FK_Student_Town] FOREIGN KEY ([TownId]) REFERENCES [dbo].[Town] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[HighSchoolReference]'
GO
ALTER TABLE [dbo].[HighSchoolReference] ADD CONSTRAINT [FK_HighSchoolReference_HighSchool10] FOREIGN KEY ([Grade10Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[HighSchoolReference] ADD CONSTRAINT [FK_HighSchoolReference_HighSchool11] FOREIGN KEY ([Grade11Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[HighSchoolReference] ADD CONSTRAINT [FK_HighSchoolReference_HighSchool12] FOREIGN KEY ([Grade12Id]) REFERENCES [dbo].[HighSchool] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Register]'
GO
ALTER TABLE [dbo].[Register] ADD CONSTRAINT [FK_Register_HighSchool] FOREIGN KEY ([ContestUnitId]) REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Register] ADD CONSTRAINT [FK_Register_Province] FOREIGN KEY ([ContestGroupId]) REFERENCES [dbo].[Province] ([Id])
GO
ALTER TABLE [dbo].[Register] ADD CONSTRAINT [FK_Register_Test] FOREIGN KEY ([TestId]) REFERENCES [dbo].[Test] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University_Majors]'
GO
ALTER TABLE [dbo].[University_Majors] ADD CONSTRAINT [FK_University_Majors_Majors] FOREIGN KEY ([MajorsId]) REFERENCES [dbo].[Majors] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Test]'
GO
ALTER TABLE [dbo].[Test] ADD CONSTRAINT [FK_Test_NaturalSciences] FOREIGN KEY ([ScienceId]) REFERENCES [dbo].[NaturalSciences] ([Id])
GO
ALTER TABLE [dbo].[Test] ADD CONSTRAINT [FK_Test_SocialScience] FOREIGN KEY ([ScienceId]) REFERENCES [dbo].[SocialScience] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[University]'
GO
ALTER TABLE [dbo].[University] ADD CONSTRAINT [FK_University_University_Majors] FOREIGN KEY ([Id]) REFERENCES [dbo].[University_Majors] ([UniversityId])
GO
