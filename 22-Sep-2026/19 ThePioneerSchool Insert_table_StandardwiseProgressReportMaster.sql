update Reports
set Report_Name = 'StudentHalfYearlyReportFor3To9ForTPS.rpt',
UsedVwOrUSPList = 'usp_GetDetailsForHalfYearlyReport_TPS'
where report_id = 324

update Report_Fields
set Field_name = replace(Field_name,'usp_GetDetailsForHalfYearlyReport_Pioneer','usp_GetDetailsForHalfYearlyReport_TPS'),
Filter_Field_Name = replace(Filter_Field_Name,'usp_GetDetailsForHalfYearlyReport_Pioneer','usp_GetDetailsForHalfYearlyReport_TPS')
where Report_Field_Id IN (1162,1163,1164)

INSERT INTO StandardwiseProgressReportMaster
select 324,Standard_Id,Original_Standard_Id,172,1,'N'
from Standard_Master
where academic_Year_Id = 1
and Is_Deleted = 'N'
and Standard_Name IN ('3','4','5','6','7','8')
