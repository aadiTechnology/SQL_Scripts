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
    328,
    'StudentIdentityCardNew_PPSN.rpt',
    'Student Identity Card',
    'Displays Student Identity Card.',
    8,
    2200,
    'usp_GetStudentIdentityCardDetails_Report_PPSN',
    1,
    'Y',
    ''
    );


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
(1178,'{usp_GetStudentIdentityCardDetails_Report;1.Standard_Id}','Standard','Dropdownlist',2,'vw_Standard','Original_Standard_Id','N','N',NULL,NULL,'Y','Y',NULL,NULL),

(1179,'{usp_GetStudentIdentityCardDetails_Report;1.Division_Id}','Division','Dropdownlist',2,'vw_standard_division','Original_Division_Id','N','Y',1178,'{usp_GetStudentIdentityCardDetails_Report;1.Standard_Id}','Y','Y',NULL,NULL),

(1180,'{usp_GetStudentIdentityCardDetails_Report;1.Student_Id}','Student','Dropdownlist',0,'usp_GetAllActiveStudents','Name','N','Y',1179,'{usp_GetStudentIdentityCardDetails_Report;1.SchoolWise_Standard_Division_Id}','N','Y',NULL,NULL),

(1181,'{usp_GetStudentIdentityCardDetails_Report;1.Enrolment_Number}','Reg. No.','textbox',0,'','','N','N',NULL,NULL,'N','Y',NULL,NULL),

(1182,'{usp_GetStudentIdentityCardDetails_Report;1.StudentsWithoutPhoto}','Include users without Photo','CheckBoxList','','',NULL,'N','N',NULL,NULL,'N','Y',NULL,NULL)


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
(1178,328,1178,1,'Y','N'),
(1179,328,1179,2,'Y','N'),
(1180,328,1180,3,'N','N'),
(1181,328,1181,4,'N','N'),
(1182,328,1182,5,'N','N');

INSERT INTO [dbo].[Report_UserRole_Details]
           ([Report_Id]
           ,[User_Role_Id]
           ,[Is_Deleted]
           ,[Insert_Date]
           ,[Update_Date])
     VALUES
           (328,
		     1,
		    'N',
		    dbo.GetLocalDate(default),
		    dbo.GetLocalDate(default))