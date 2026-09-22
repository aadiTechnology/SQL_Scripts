UPDATE Reports
SET Is_Deleted = 'N',
Report_Name = 'HolisticProgressReportPPSN.rpt',
UsedVwOrUSPList = 'usp_GetDetailsForHolisticReportPPSN'
where Report_Id = 327

UPDATE Report_Fields
SET Field_name = REPLACE(Field_name, 'usp_GetHolisticProgressReportDetailsFor6To8SNS','usp_GetDetailsForHolisticReportPPSN'),
	Filter_Field_Name = REPLACE(Filter_Field_Name, 'usp_GetHolisticProgressReportDetailsFor6To8SNS','usp_GetDetailsForHolisticReportPPSN')
where Report_Field_Id IN(
1183,
1184,
1185
)

insert into StandardwiseProgressReportMaster
select 327,Standard_Id,Original_Standard_Id,71,14,'N' 
from Standard_Master
where academic_Year_Id = 14
and Standard_Name IN ('3','4','5')

INSERT INTO StandardWiseGradeMaster
select sm.Standard_Id, gd.GradeId,0,0
from
(
SELECT Id as GradeId 
FROM ObservationGrades
WHERE AcademicYearId = 14
and IsDeleted = 0
)gd
cross join
(
SELECT Standard_Id
from Standard_Master
where academic_Year_Id = 14
and Standard_Name IN ('3','4','5')
AND Is_Deleted = 'N'
)sm