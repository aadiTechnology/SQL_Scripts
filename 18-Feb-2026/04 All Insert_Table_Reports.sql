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
		     326,
		    'VehicleExpenditureDetails.rpt',
		    'Fuel & Maintenance Expenses',
		    'Displays Fuel & Maintenance Expenses.',
		    30,
		    2100,
		    'usp_GetAllVehicleExpenseDetails',
		     1,
		    'N',
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
           (1174,
		   '{usp_GetAllVehicleExpenseDetails;1.VehicleId}',
		    'Vehicle No.',
			'DropDownList',
			 2,
			'Transport.vw_VehicleMaster',
			'Display_Member',
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
           (1175,
		   '{usp_GetAllVehicleExpenseDetails;1.MonthId}',
		    'Month',
			'DropDownList',
			 2,
			'usp_GetAcademicYearMonthList',
			'Display_Member',
			'N',
			'N',
		    NULL,
		    NULL,
			'Y',
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
           (1174,
		    326,
			1174,
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
           (1175,
		    326,
			1175,
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
           (326,
		     1,
		    'N',
		    dbo.GetLocalDate(default),
		    dbo.GetLocalDate(default))
GO

