INSERT INTO ObservationSummaryRemarkGrades
select Name,ShortName,Description,OriginalGradeId,SortOrder,StartFromRange,EndToRange,SchoolId,13,0,1,dbo.GetLocalDate(default),null,null 
from ObservationSummaryRemarkGrades
where AcademicYearId = 11
and IsDeleted = 0