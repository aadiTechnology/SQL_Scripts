/****** Object:  Table [dbo].[AlumniSchoolBranding]    Script Date: 16-07-2026 12:30:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AlumniSchoolBranding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[SchoolNameToDisplay] [nvarchar](200) NOT NULL,
	[ExternalLink] [nvarchar](500) NULL,
	[LogoFileName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AlumniSchoolBranding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_AlumniSchoolBranding_SchoolId] UNIQUE NONCLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


