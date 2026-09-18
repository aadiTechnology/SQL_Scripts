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
		     331,
		    'StudentHolisticReportFor6to8PPSH.rpt',
		    'Final Holistic Progress Card for 6 to 8',
		    'Displays holistic progress report.',
		    5,
		    2265,
		    'usp_GetDetailsForHolisticReportFor6To8PPSHStd',
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
           (1193,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.Standard_Id}',
           'Standard',
           'DropDownList',
           2,
           'usp_GetStandardsForProgressReport',
           'Original_Standard_Id',
           'N',
           'N',
           NULL,
           NULL,
           'Y',
           'Y',
           NULL,
           NULL);

		
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
           (1194,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.Division_Id}',
           'Division',
           'DropDownList',
           2,
           'vw_standard_division',
           'Original_Division_Id',
           'N',
           'Y',
           1193,
           '{GetDetailsForHolisticReportFor6To8PPSHStd;1.Standard_Id}',
           'Y',
           'Y',
           NULL,
           NULL);

			 
			
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
           (1195,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.Student_Id}',
           'Student',
           'DropDownList',
           0,
           'vw_StudentDetailedInformation',
           'Name',
           'N',
           'Y',
           1194,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.SchoolWise_Standard_Division_Id}',
           'N',
           'Y',
           NULL,
           NULL);

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
           (1196,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.Term_Id}',
           'Term',
           'DropDownList',
           1,
           'vw_studentTermwiseTestMaster',
           'Term_Id',
           'N',
           'N',
           1195,
           '{usp_GetDetailsForHolisticReportFor6To8PPSHStd;1.Term_Id}',
           'N',
           'Y',
           NULL,
           NULL);


---====================================================================================================================


INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1193,
            331,
            1193,
            1,
            'Y',
            'N');

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1194,
            331,
            1194,
            2,
            'Y',
            'N');

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1195,
            331,
            1195,
            3,
            'N',
            'N');

INSERT INTO [dbo].[Report_Field_Selection]
           ([Report_Field_Selection_Id]
           ,[Report_Id]
           ,[Report_Field_Id]
           ,[Display_Order]
           ,[Is_Requried]
           ,[Is_Deleted])
     VALUES
           (1196,
            331,
            1196,
            4,
            'Y',
            'N');

--================================================
INSERT INTO [dbo].[Report_UserRole_Details]
           ([Report_Id]
           ,[User_Role_Id]
           ,[Is_Deleted]
           ,[Insert_Date]
           ,[Update_Date])
     VALUES
           (331,
		     1,
		    'N',
		    dbo.GetLocalDate(default),
		    dbo.GetLocalDate(default))
GO