/****** Object:  Table [dbo].[CautionMoneyStandardDetails]    Script Date: 10-06-2026 14:25:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CautionMoneyStandardDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CautionMoneyDetailsId] [int] NOT NULL,
	[StandardId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CautionMoneyStandardDetails] ADD  CONSTRAINT [DF_CautionMoneyStandardDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO


