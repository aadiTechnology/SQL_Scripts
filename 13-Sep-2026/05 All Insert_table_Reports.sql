INSERT INTO [dbo].[Reports]
           ([Report_Id]
           ,[Report_Name]
           ,[Report_Display_Name]
           ,[Report_Description]
           ,[Report_Folder_Id]
           ,[Sort_Order]
           ,[UsedVwOrUSPList]
           ,[IsSearchGridConsidered]
           ,[Is_Deleted]
           ,[SchemaName])
     VALUES
           (332
           ,''
           ,'Leave Approval Details'
           ,'Displays leave Approval details as per selected user and date range.'
           ,20
           ,340
           ,'usp_GetLeaveApprovalDetailsForReport'
           ,2
           ,'N'
           ,'')
GO

INSERT INTO [dbo].[Report_Fields]
           ([Report_Field_Id]
           ,[Field_name]
           ,[Display_name]
           ,[Data_type]
           ,[Display_Filter_Values]
           ,[View_Name_For_Filter_values]
           ,[OrderBYColumn]
           ,[Is_Deleted]
           ,[Is_Dependent]
           ,[Parent_Field_Id]
           ,[Filter_Field_Name]
           ,[Is_Parent]
           ,[Is_Report_Filter_Field]
           ,[Additional_Parent_Field_Id]
           ,[Additional_Filter_Field_Name])
     VALUES
           (1197
           ,'{usp_GetLeaveApprovalDetailsForReport;1.StartDate}'
           ,'From Date'
           ,'datetime'
           ,0
           ,''
           ,NULL
           ,'N'
           ,'N'
           ,NULL
           ,NULL
           ,'Y'
           ,'Y'
           ,NULL
           ,NULL)
GO

INSERT INTO [dbo].[Report_Fields]
           ([Report_Field_Id]
           ,[Field_name]
           ,[Display_name]
           ,[Data_type]
           ,[Display_Filter_Values]
           ,[View_Name_For_Filter_values]
           ,[OrderBYColumn]
           ,[Is_Deleted]
           ,[Is_Dependent]
           ,[Parent_Field_Id]
           ,[Filter_Field_Name]
           ,[Is_Parent]
           ,[Is_Report_Filter_Field]
           ,[Additional_Parent_Field_Id]
           ,[Additional_Filter_Field_Name])
     VALUES
           (1198
           ,'{usp_GetLeaveApprovalDetailsForReport;1.EndDate}'
           ,'To Date'
           ,'datetime'
           ,1
           ,''
           ,NULL
           ,'N'
           ,'N'
           ,NULL
           ,NULL
           ,'Y'
           ,'Y'
           ,NULL
           ,NULL)
GO


INSERT INTO [dbo].[Report_Fields]
           ([Report_Field_Id]
           ,[Field_name]
           ,[Display_name]
           ,[Data_type]
           ,[Display_Filter_Values]
           ,[View_Name_For_Filter_values]
           ,[OrderBYColumn]
           ,[Is_Deleted]
           ,[Is_Dependent]
           ,[Parent_Field_Id]
           ,[Filter_Field_Name]
           ,[Is_Parent]
           ,[Is_Report_Filter_Field]
           ,[Additional_Parent_Field_Id]
           ,[Additional_Filter_Field_Name])
     VALUES
           (1199
           ,'{usp_GetLeaveApprovalDetailsForReport;1.StaffGroupsId}'
           ,'Staff Group'
           ,'DropDownList'
           ,2
           ,'usp_GetAllStaffGroupsForReport'
           ,'OriginalStaffGroupsId'
           ,'N'
           ,'Y'
           ,1197
           ,'{usp_GetLeaveApprovalDetailsForReport;1.StartDate}'
           ,'Y'
           ,'Y'
           ,1198
           ,'{usp_GetLeaveApprovalDetailsForReport;1.EndDate}')
GO

INSERT INTO [dbo].[Report_Fields]
           ([Report_Field_Id]
           ,[Field_name]
           ,[Display_name]
           ,[Data_type]
           ,[Display_Filter_Values]
           ,[View_Name_For_Filter_values]
           ,[OrderBYColumn]
           ,[Is_Deleted]
           ,[Is_Dependent]
           ,[Parent_Field_Id]
           ,[Filter_Field_Name]
           ,[Is_Parent]
           ,[Is_Report_Filter_Field]
           ,[Additional_Parent_Field_Id]
           ,[Additional_Filter_Field_Name])
     VALUES
           (1200
           ,'{usp_GetLeaveApprovalDetailsForReport;1.UserId}'
           ,'User'
           ,'DropDownList'
           ,2
           ,'usp_GetUsersDetails'
           ,NULL
           ,'N'
           ,'Y'
           ,1199
           ,'{usp_GetLeaveApprovalDetailsForReport;1.StaffGroupsId}'
           ,'N'
           ,'Y'
           ,'1197,1198'
           ,'{usp_GetLeaveApprovalDetailsForReport;1.StartDate},{usp_GetLeaveApprovalDetailsForReport;1.EndDate}')
GO


INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1197
           ,332
           ,1197
           ,1
           ,'Y'
           ,'N')
GO

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1198
           ,332
           ,1198
           ,2
           ,'Y'
           ,'N')
GO

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1199
           ,332
           ,1199
           ,3
           ,'N'
           ,'N')
GO

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1200
           ,332
           ,1200
           ,4
           ,'N'
           ,'N')
GO

INSERT INTO [dbo].[Report_UserRole_Details]
           ([Report_Id]
           ,[User_Role_Id]
           ,[Is_Deleted]
           ,[Insert_Date]
           ,[Update_Date])
     VALUES
           (332
           ,1
           ,'N'
           ,dbo.GetLocalDate(default)
           ,dbo.GetLocalDate(default))
GO

