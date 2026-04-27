INSERT INTO Reports
(
    Report_Id,
    Report_Name,
    Report_Display_Name,
    Report_Description,
    Report_Folder_Id,
    Sort_Order,
    UsedVwOrUSPList,
    IsSearchGridConsidered,
    Is_Deleted,
    SchemaName
)
VALUES
(
    327, 
    'HolisticProgressReportFor6To8SNS.rpt',
    'Holistic Progress Report',
    'Displays holistic progress report of students.',
    5,
    2150,
    'usp_GetHolisticProgressReportDetailsFor6To8SNS',
    1,
    'Y',
    ''
)


INSERT INTO Report_Fields
(
    Report_Field_Id,
    Field_name,
    Display_name,
    Data_type,
    Display_Filter_Values,
    View_Name_For_Filter_values,
    OrderBYColumn,
    Is_Deleted,
    Is_Dependent,
    Parent_Field_Id,
    Filter_Field_Name,
    Is_Parent,
    Is_Report_Filter_Field,
    Additional_Parent_Field_Id,
    Additional_Filter_Field_Name
)
VALUES
(1183,'usp_GetHolisticProgressReportDetailsFor6To8SNS;1.Standard_Id}','Standard','Dropdownlist',2,'usp_GetStandardsForProgressReport','Original_Standard_Id','N','N',NULL,NULL,'Y','Y',NULL,NULL),

(1184,'{usp_GetHolisticProgressReportDetailsFor6To8SNS;1.Division_Id}','Division','Dropdownlist',2,'vw_standard_division','Original_Division_Id','N','Y',1183,
'{usp_GetHolisticProgressReportDetailsFor6To8SNS;1.Standard_Id}','Y','Y',NULL,NULL),

(1185,'{usp_GetHolisticProgressReportDetailsFor6To8SNS;1.StudentId}','Student','Dropdownlist',0,'vw_StudentDetailedInformation','Name','N','Y',1184,
'{usp_GetHolisticProgressReportDetailsFor6To8SNS;1.Schoolwise_Standard_Division_Id}','N','Y',NULL,NULL);



INSERT INTO Report_Field_Selection
(
   Report_Field_Selection_Id,
    Report_Id,
    Report_Field_Id,
    Display_Order,
    Is_Requried,
    Is_Deleted
)
VALUES
(1183,327,1183,1,'Y','N'),
(1184,327,1184,2,'Y','N'),
(1185,327,1185,3,'N','N');


INSERT INTO [dbo].[Report_UserRole_Details]
           ([Report_Id]
           ,[User_Role_Id]
           ,[Is_Deleted]
           ,[Insert_Date]
           ,[Update_Date])
     VALUES
           (327,
		     1,
		    'N',
		    dbo.GetLocalDate(default),
		    dbo.GetLocalDate(default))
GO
INSERT INTO StandardwiseProgressReportMaster
(
    Report_Id,
    Standard_Id,
    Original_Standard_Id,
    School_Id,
    Academic_Year_Id,
    Is_Deleted
)
VALUES
(327,1190,10,122,11,'N'),
(327,1191,864,122,11,'N'),
(327,1192,865,122,11,'N');