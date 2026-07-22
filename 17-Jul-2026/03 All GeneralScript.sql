/****** Object:  Table [dbo].[DepartmentMaster]    Script Date: 15-07-2026 09:36:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepartmentMaster]') AND type in (N'U'))
DROP TABLE [dbo].[DepartmentMaster]
GO
/****** Object:  Table [dbo].[AcademicProgrammeMaster]    Script Date: 15-07-2026 09:36:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcademicProgrammeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[AcademicProgrammeMaster]
GO
/****** Object:  Table [dbo].[AcademicProgrammeMaster]    Script Date: 15-07-2026 09:36:09 ******/
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
/****** Object:  Table [dbo].[DepartmentMaster]    Script Date: 15-07-2026 09:36:10 ******/
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
SET IDENTITY_INSERT [dbo].[AcademicProgrammeMaster] ON 
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (1, N'B.A', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (2, N'B.Sc', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (3, N'B.Voc', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (4, N'M.A.', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (5, N'M.Sc', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (6, N'Ph.D', 18)
GO
INSERT [dbo].[AcademicProgrammeMaster] ([ProgrammeId], [ProgrammeName], [SchoolId]) VALUES (7, N'Other', 18)
GO
SET IDENTITY_INSERT [dbo].[AcademicProgrammeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentMaster] ON 
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (1, N'Animation', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (2, N'B. Voc. Digital Art and Animation', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (3, N'B. VOC. MEDIA & COM', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (4, N'B. Voc. Media and Communication', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (5, N'B.Voc. Fashion Technology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (6, N'B.Voc. Interior Design', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (7, N'Biology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (8, N'Biotechnology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (9, N'Botany', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (10, N'Chemistry', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (11, N'Computer Science', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (12, N'Economics', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (13, N'Electronics & Computer & IT', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (14, N'Electronics Science', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (15, N'English', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (16, N'Environmental science', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (17, N'EVS', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (18, N'French', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (19, N'Geography', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (20, N'Geology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (21, N'German', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (22, N'Gymkhana', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (23, N'Hindi', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (24, N'History', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (25, N'IT', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (26, N'Library', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (27, N'Logic & Philosophy', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (28, N'M.A. ECO SEM 3', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (29, N'M.A. ENG SEM 3', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (30, N'M.A. MAR SEM 3', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (31, N'M.A. PSYCHOLOGY', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (32, N'M.SC BOTANY', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (33, N'M.SC IMCA', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (34, N'M.SC PHYSICS', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (35, N'M.SC. ANALY CHEM', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (36, N'M.SC. BIOCHEMISTRY', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (37, N'M.SC. BIOTECH', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (38, N'M.SC. COM APP', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (39, N'M.SC. DATA SCI', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (40, N'M.SC. ELECTRONICS', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (41, N'M.SC. EVS', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (42, N'M.SC. GEOLOGY', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (43, N'M.SC. MICRO', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (44, N'M.SC. PHY SEM 3 AID', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (45, N'M.SC.(ORGANIC CHEMISTRY)', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (46, N'M.SC.CS', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (47, N'Marathi', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (48, N'Mathematics', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (49, N'Microbiology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (50, N'NewDepart', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (51, N'Philosophy', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (52, N'Photography', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (53, N'Physical Training', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (54, N'Physics', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (55, N'Political science', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (56, N'Psychology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (57, N'Sanskrit', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (58, N'Sociology', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (59, N'Statistics', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (60, N'T.Y. B.SC(CS) SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (61, N'T.Y.B.A SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (62, N'T.Y.B.A. ENG SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (63, N'T.Y.B.A. MAR SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (64, N'T.Y.B.SC SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (65, N'TY B.SC BT SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (66, N'TY B.SC EVS SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (67, N'TY B.SC MICRO SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (68, N'TY B.SC. (ANIMATION) SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (69, N'TY B.VOC(DIG. ART & ANI.) SEM 5', 18)
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [DepartmentName], [SchoolId]) VALUES (70, N'Zoology', 18)
GO
SET IDENTITY_INSERT [dbo].[DepartmentMaster] OFF
GO
