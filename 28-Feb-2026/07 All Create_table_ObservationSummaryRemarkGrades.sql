/****** Object:  Table [dbo].[ObservationSummaryRemarkGrades]    Script Date: 26-02-2026 18:27:46 ******/
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
/****** Object:  Table [dbo].[StudentObservationSummmaryRemarkDetails]    Script Date: 26-02-2026 18:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentObservationSummmaryRemarkDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[Comment] [nvarchar](2000) NULL,
	[SchoolId] [int] NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[InsertedById] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
	[UpdatedById] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_StudentObservationSummmaryRemarkDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentObservationSummmaryRemarkSubmitStatus]    Script Date: 26-02-2026 18:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentObservationSummmaryRemarkSubmitStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StdDivId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[InsertedById] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
	[UpdatedById] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_StudentObservationSummmaryRemarkSubmitStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ObservationSummaryRemarkGrades] ADD  CONSTRAINT [DF_ObservationSummaryRemarkGrades_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentObservationSummmaryRemarkDetails] ADD  CONSTRAINT [DF_StudentObservationSummmaryRemarkDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentObservationSummmaryRemarkSubmitStatus] ADD  CONSTRAINT [DF_StudentObservationSummmaryRemarkSubmitStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
