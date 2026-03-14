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
           (1177
           ,'{usp_GetOldPendingFeeDetailsForAllYears;1.PendingTillDate}'
           ,'Pending Till Date'
           ,'datetime'
           ,''
           ,''
           ,''
           ,'N'
           ,'N'
           ,NULL
           ,NULL
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
           (1177
           ,267
           ,1177
           ,7
           ,'N'
           ,'N')

Update Report_Field_Selection
 set Display_Order=8
 where Report_Field_Selection_Id=1168

  Update Report_Field_Selection
 set Display_Order=9
 where Report_Field_Selection_Id=1168