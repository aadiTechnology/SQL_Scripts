ALTER TABLE [dbo].[ObservationSummaryRemarkGrades] DROP CONSTRAINT [DF_ObservationSummaryRemarkGrades_IsDeleted]
GO
/****** Object:  Table [dbo].[ObservationSummaryRemarkGrades]    Script Date: 26-02-2026 18:28:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObservationSummaryRemarkGrades]') AND type in (N'U'))
DROP TABLE [dbo].[ObservationSummaryRemarkGrades]
GO
/****** Object:  Table [dbo].[ObservationSummaryRemarkGrades]    Script Date: 26-02-2026 18:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObservationSummaryRemarkGrades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[OriginalGradeId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StartFromRange] [decimal](10, 2) NULL,
	[EndToRange] [decimal](10, 2) NULL,
	[SchoolId] [int] NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[InsertedById] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
	[UpdatedById] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ObservationSummaryRemarkGrades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ObservationSummaryRemarkGrades] ON 
GO
INSERT [dbo].[ObservationSummaryRemarkGrades] ([Id], [Name], [ShortName], [Description], [OriginalGradeId], [SortOrder], [StartFromRange], [EndToRange], [SchoolId], [AcademicYearId], [IsDeleted], [InsertedById], [InsertDate], [UpdatedById], [UpdateDate]) VALUES (1, N'Advanced', N'Advanced', N'', 1, 1, CAST(5.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), 122, 11, 0, 1, CAST(N'2026-02-25T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ObservationSummaryRemarkGrades] ([Id], [Name], [ShortName], [Description], [OriginalGradeId], [SortOrder], [StartFromRange], [EndToRange], [SchoolId], [AcademicYearId], [IsDeleted], [InsertedById], [InsertDate], [UpdatedById], [UpdateDate]) VALUES (2, N'Proficient', N'Proficient', N'', 2, 2, CAST(3.00 AS Decimal(10, 2)), CAST(4.99 AS Decimal(10, 2)), 122, 11, 0, 1, CAST(N'2026-02-25T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ObservationSummaryRemarkGrades] ([Id], [Name], [ShortName], [Description], [OriginalGradeId], [SortOrder], [StartFromRange], [EndToRange], [SchoolId], [AcademicYearId], [IsDeleted], [InsertedById], [InsertDate], [UpdatedById], [UpdateDate]) VALUES (3, N'Beginner', N'Beginner', N'', 3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(2.99 AS Decimal(10, 2)), 122, 11, 0, 1, CAST(N'2026-02-25T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ObservationSummaryRemarkGrades] OFF
GO
ALTER TABLE [dbo].[ObservationSummaryRemarkGrades] ADD  CONSTRAINT [DF_ObservationSummaryRemarkGrades_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
