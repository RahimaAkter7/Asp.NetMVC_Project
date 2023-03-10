USE [master]
GO
/****** Object:  Database [DCMDb]    Script Date: 30-Nov-22 11:45:18 PM ******/
CREATE DATABASE [DCMDb]
 
GO
CREATE TABLE [dbo].[EntryTests](
	[EntryTestsId] [int] IDENTITY(1,1) NOT NULL,
	[TestEntryId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EntryTests] PRIMARY KEY CLUSTERED 
(
	[TestEntryId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestEntries]    Script Date: 30-Nov-22 11:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestEntries](
	[TestEntryId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](150) NOT NULL,
	[Age] [int] NOT NULL,
	[MobileNo] [nvarchar](20) NOT NULL,
	[TestDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
 CONSTRAINT [PK_dbo.TestEntries] PRIMARY KEY CLUSTERED 
(
	[TestEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 30-Nov-22 11:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](50) NOT NULL,
	[Fee] [money] NOT NULL,
	[Available] [bit] NOT NULL,
	[TestTypeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Tests] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 30-Nov-22 11:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTypes](
	[TestTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.TestTypes] PRIMARY KEY CLUSTERED 
(
	[TestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_TestEntryId]    Script Date: 30-Nov-22 11:45:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_TestEntryId] ON [dbo].[EntryTests]
(
	[TestEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TestId]    Script Date: 30-Nov-22 11:45:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_TestId] ON [dbo].[EntryTests]
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TestTypeId]    Script Date: 30-Nov-22 11:45:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_TestTypeId] ON [dbo].[Tests]
(
	[TestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntryTests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EntryTests_dbo.TestEntries_TestEntryId] FOREIGN KEY([TestEntryId])
REFERENCES [dbo].[TestEntries] ([TestEntryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntryTests] CHECK CONSTRAINT [FK_dbo.EntryTests_dbo.TestEntries_TestEntryId]
GO
ALTER TABLE [dbo].[EntryTests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EntryTests_dbo.Tests_TestId] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([TestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntryTests] CHECK CONSTRAINT [FK_dbo.EntryTests_dbo.Tests_TestId]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tests_dbo.TestTypes_TestTypeId] FOREIGN KEY([TestTypeId])
REFERENCES [dbo].[TestTypes] ([TestTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_dbo.Tests_dbo.TestTypes_TestTypeId]
GO
USE [master]
GO
ALTER DATABASE [DCMDb] SET  READ_WRITE 
GO
