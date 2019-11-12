-- <Migration ID="a1316a5a-fe19-4702-b750-09b3bad0da06" />
GO

PRINT N'Dropping foreign keys from [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] DROP CONSTRAINT [FK_HighSchool_District]
GO
PRINT N'Altering [dbo].[University]'
GO
ALTER TABLE [dbo].[University] ADD
[Website] [nvarchar] (50) NULL
GO
PRINT N'Altering [dbo].[District]'
GO
ALTER TABLE [dbo].[District] ALTER COLUMN [Code] [nchar] (3) NOT NULL
GO
PRINT N'Altering [dbo].[HighSchool]'
GO
EXEC sp_rename N'[dbo].[HighSchool].[DistrictId]', N'ProvinceId', N'COLUMN'
GO
PRINT N'Altering [dbo].[Town]'
GO
ALTER TABLE [dbo].[Town] ALTER COLUMN [Code] [nchar] (5) NOT NULL
GO
PRINT N'Adding foreign keys to [dbo].[HighSchool]'
GO
ALTER TABLE [dbo].[HighSchool] ADD CONSTRAINT [FK_HighSchool_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province] ([Id])
GO
