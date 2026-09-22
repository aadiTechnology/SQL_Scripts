UPDATE Reports
SET 
    Report_Name = 'StudentHalfYearlyReportFor3To9ForTSA.rpt',
    UsedVwOrUSPList = 'usp_GetDetailsForHalfYearlyReport_TheScholarsAcademy'
WHERE Report_Id = 324;


UPDATE Report_Fields
SET 
    Field_name = REPLACE(
        Field_name,
        'usp_GetDetailsForHalfYearlyReport_Pioneer',
        'usp_GetDetailsForHalfYearlyReport_TheScholarsAcademy'
    ),
    Filter_Field_Name = REPLACE(
        Filter_Field_Name,
        'usp_GetDetailsForHalfYearlyReport_Pioneer',
        'usp_GetDetailsForHalfYearlyReport_TheScholarsAcademy'
    )
WHERE Report_Field_Id IN (1162, 1163, 1164);


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
    (324, 1105, 7,   173, 1, 'N'),
    (324, 1106, 8,   173, 1, 'N'),
    (324, 1107, 9,   173, 1, 'N'),
    (324, 1108, 10,  173, 1, 'N'),
    (324, 1109, 864, 173, 1, 'N'),
    (324, 1110, 865, 173, 1, 'N');

