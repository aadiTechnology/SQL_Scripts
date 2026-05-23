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
           (329
           ,'UserRolewisePPSIdentyCard.rpt'
           ,'Users Identity Cards - New'
           ,'Displays the identity cards of the selected user role and user.'
           ,1
           ,2250
           ,'usp_GetUserRolewisePPSIdentyCard'
           ,4
           ,'Y'
           ,'')

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
           (1186
           ,'{usp_GetUserRolewisePPSIdentyCard;1.UserRoleId}'
           ,'User Role'
           ,'Dropdownlist'
           ,2
           ,'usp_EmployeeUserRole'
           ,'Value_Member'
           ,'N'
           ,'N'
           ,NULL
           ,NULL
           ,'Y'
           ,'Y'
           ,NULL
           ,NULL)

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
           (1187
           ,'{usp_GetUserRolewisePPSIdentyCard;1.UserId}'
           ,'User'
           ,'Dropdownlist'
           ,2
           ,'usp_GetUserRolwiseEmployeeDetails'
           ,NULL
           ,'N'
           ,'Y'
           ,1186
           ,'{usp_GetUserRolewisePPSIdentyCard;1.UserRoleId}'
           ,'N'
           ,'Y'
           ,NULL
           ,NULL)


INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1186
           ,329
           ,1186
           ,1
           ,'Y'
           ,'N')

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1187
           ,329
           ,1187
           ,2
           ,'N'
           ,'N')
GO