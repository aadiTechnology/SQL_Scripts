UPDATE Reports
SET Is_Deleted = 'N'
WHERE Report_Id = 331

INSERT INTO [dbo].[StandardwiseProgressReportMaster]
           ([Report_Id]
           ,[Standard_Id]
           ,[Original_Standard_Id]
           ,[School_Id]
           ,[academic_Year_Id]
           ,[Is_Deleted])
     VALUES
           (331,1104,10,11,15,'N')

		   INSERT INTO [dbo].[StandardwiseProgressReportMaster]
           ([Report_Id],[Standard_Id] ,[Original_Standard_Id] ,[School_Id] ,[academic_Year_Id] ,[Is_Deleted])
     VALUES
           (331,1105,864,11,15,'N')

		     INSERT INTO [dbo].[StandardwiseProgressReportMaster]
           ([Report_Id],[Standard_Id] ,[Original_Standard_Id] ,[School_Id] ,[academic_Year_Id] ,[Is_Deleted])
     VALUES
           (331,1106,865,11,15,'N')
GO