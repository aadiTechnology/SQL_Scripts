/****** Object:  Table [dbo].[AcademicProgrammeMaster]    Script Date: 15-07-2026 09:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicProgrammeMaster](
	[ProgrammeId] [int] IDENTITY(1,1) NOT NULL,
	[ProgrammeName] [nvarchar](200) NOT NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_AcademicProgrammeMaster] PRIMARY KEY CLUSTERED 
(
	[ProgrammeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumniAcademicProgrammes]    Script Date: 15-07-2026 09:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumniAcademicProgrammes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlumniId] [int] NOT NULL,
	[ProgrammeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AlumniAcademicProgrammes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumniMaster]    Script Date: 15-07-2026 09:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumniMaster](
	[AlumniId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[MobileNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[ResidingIn] [char](1) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[PassportNumber] [nvarchar](50) NULL,
	[PermanentAddress] [nvarchar](max) NOT NULL,
	[CorrespondenceAddress] [nvarchar](max) NULL,
	[IsSameAddress] [bit] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SchoolPassingYear] [int] NOT NULL,
	[CurrentStatus] [char](2) NOT NULL,
	[InstituteName] [nvarchar](200) NULL,
	[SelfEmployedDetails] [nvarchar](max) NULL,
	[CurrentDesignation] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[SpecialMentions] [nvarchar](max) NULL,
	[AchievementImage] [varbinary](max) NULL,
	[AlumniPhoto] [varbinary](max) NULL,
	[PhotoPermissionGranted] [bit] NOT NULL,
	[HowCanHelp] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[SubmissionMode] [char](1) NOT NULL,
 CONSTRAINT [PK_AlumniMaster] PRIMARY KEY CLUSTERED 
(
	[AlumniId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumniPublicTokens]    Script Date: 15-07-2026 09:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumniPublicTokens](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[TokenValue] [nvarchar](500) NOT NULL,
	[EncryptedPayload] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AlumniPublicTokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentMaster]    Script Date: 15-07-2026 09:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentMaster](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](200) NOT NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlumniAcademicProgrammes] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AlumniMaster] ADD  DEFAULT ((0)) FOR [IsSameAddress]
GO
ALTER TABLE [dbo].[AlumniMaster] ADD  DEFAULT ((0)) FOR [PhotoPermissionGranted]
GO
ALTER TABLE [dbo].[AlumniMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AlumniMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AlumniMaster] ADD  DEFAULT ('A') FOR [SubmissionMode]
GO
ALTER TABLE [dbo].[AlumniPublicTokens] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AlumniPublicTokens] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AlumniAcademicProgrammes]  WITH CHECK ADD  CONSTRAINT [FK_AlumniAcademicProgrammes_Alumni] FOREIGN KEY([AlumniId])
REFERENCES [dbo].[AlumniMaster] ([AlumniId])
GO
ALTER TABLE [dbo].[AlumniAcademicProgrammes] CHECK CONSTRAINT [FK_AlumniAcademicProgrammes_Alumni]
GO
