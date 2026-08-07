/****** Object:  Table [dbo].[StandardWiseGradeMaster]    Script Date: 03-08-2026 09:52:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StandardWiseGradeMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StandardId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsParentEngagement] [bit] NULL,
 CONSTRAINT [PK_StandardWiseGradeMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


