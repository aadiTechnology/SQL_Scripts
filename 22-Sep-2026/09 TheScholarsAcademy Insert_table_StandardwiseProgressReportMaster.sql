--Pri-Primary


UPDATE Reports
SET 
    Report_Name = 'StudentwiseTermProgressReportPrimaryTSA.rpt',
    UsedVwOrUSPList = 'usp_GetProgressReportDetailsForPrePrimaryTSA'
WHERE Report_Id = 315;

UPDATE Report_Fields
SET 
    Field_name = REPLACE(
        Field_name,
        'usp_GetProgressReportDetailsForPrePrimaryPioneer',
        'usp_GetProgressReportDetailsForPrePrimaryTSA'
    ),
    Filter_Field_Name = REPLACE(
        Filter_Field_Name,
        'usp_GetProgressReportDetailsForPrePrimaryPioneer',
        'usp_GetProgressReportDetailsForPrePrimaryTSA'
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
    (315, 1100, 2,   173, 1, 'N'),
    (315, 1101, 3,   173, 1, 'N'),
    (315, 1102, 4,   173, 1, 'N'),
    (315, 1103, 5,   173, 1, 'N'),
    (315, 1104, 6,  173, 1, 'N');

