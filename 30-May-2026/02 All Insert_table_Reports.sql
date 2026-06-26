
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
           ( 
		     330,
		    'ClasswiseExamPercentageAttendanceDetails.rpt',
		    'Classwise Attendance and Exam Percentage Report',
		    'Displays classwise student exam percentage and attendance details report.',
		     5,
		     2260,
		    'usp_GetClasswiseExamPercentageAttendanceDetails',
		     1,
		    'Y',
		     '' ) 
		 
		
-- Reports_Fields========================================================
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
           (1189,
		   '{usp_GetClasswiseExamPercentageAttendanceDetails;1.Standard_Id}',
		    'Standard',
			'CheckBoxList',
			 2,
			'vw_Standard',
			'Original_Standard_Id',
			'N',
			'N',
		    NULL,
			NULL,
			'N',
			'Y',
			NULL,
			NULL)
			  

		
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
           (1190,
		   '{usp_GetClasswiseExamPercentageAttendanceDetails;1.Division_Id}',
		    'Division',
			'CheckBoxList',
			 2,
			'vw_Division_Reports',
			'Original_Division_Id',
			'N',
			'N',
		    NULL,
		    NULL,
			'N',
			'Y',
			NULL,
			NULL)	
	---====================================================================================================================
INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1189,
		    330,
			1189,
			1,
			'N',
			'N'
			)

		
		

	   INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1190,
		    330,
			1190,
			2,
			'N',
			'N'
			)
		
       



INSERT INTO [dbo].[Report_UserRole_Details]
           ([Report_Id]
           ,[User_Role_Id]
           ,[Is_Deleted]
           ,[Insert_Date]
           ,[Update_Date])
     VALUES
           (330,
		     1,
		    'N',
		    dbo.GetLocalDate(default),
		    dbo.GetLocalDate(default))
GO

