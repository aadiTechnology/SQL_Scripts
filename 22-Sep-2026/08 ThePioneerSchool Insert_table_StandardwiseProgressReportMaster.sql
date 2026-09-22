UPDATE Reports
SET 
    Report_Name = 'StudentwiseTermProgressReportPrimaryTPS.rpt',
    UsedVwOrUSPList = 'usp_GetProgressReportDetailsForPrePrimaryTPS'
WHERE Report_Id = 315;

UPDATE Report_Fields
SET 
    Field_name = REPLACE(
        Field_name,
        'usp_GetProgressReportDetailsForPrePrimaryPioneer',
        'usp_GetProgressReportDetailsForPrePrimaryTPS'
    ),
    Filter_Field_Name = REPLACE(
        Filter_Field_Name,
        'usp_GetProgressReportDetailsForPrePrimaryPioneer',
        'usp_GetProgressReportDetailsForPrePrimaryTPS'
    )
WHERE Report_Field_Id IN (1129, 1130, 1131, 1132);


INSERT INTO [dbo].[StandardwiseProgressReportMaster]
(
    [Report_Id],
    [Standard_Id],
    [Original_Standard_Id],
    [School_Id],
    [academic_Year_Id],
    [Is_Deleted]
)
VALUES
    (315, 1099, 2,   172, 1, 'N'),
    (315, 1100, 3,   172, 1, 'N'),
    (315, 1101, 4,   172, 1, 'N'),
    (315, 1102, 5,  172, 1, 'N'),
	(315, 1103, 6,  172, 1, 'N');

