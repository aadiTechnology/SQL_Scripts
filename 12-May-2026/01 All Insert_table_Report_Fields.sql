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
	 (1188,
	 '{usp_GetStudents_Export_Details;1.ShowOnlyRTEStudent}'
	  ,'Show Only RTE Student'
	  ,'CheckBoxList'
	   ,''
	   ,''
	   ,2
	   ,'N'
	   ,'N'
	   ,NULL
	   ,NULL
	   ,'N'
	   ,'Y'
	   ,NULL
       ,NULL
       )

	   
INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1188
		   ,149
		   ,1188
		   ,5
		   ,'N'
		   ,'N')
GO