/****** Object:  Table [dbo].[ConfigMenuAssociatedClasses]    Script Date: 28-02-2026 10:38:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConfigMenuAssociatedClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OriginalStandardId] [int] NOT NULL,
	[OriginalDivisionId] [int] NOT NULL,
	[ConfigMenuId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[UpdatedById] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConfigMenuAssociatedClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ConfigMenuAssociatedClasses] ADD  CONSTRAINT [DF_ConfigMenuAssociatedClasses_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO


