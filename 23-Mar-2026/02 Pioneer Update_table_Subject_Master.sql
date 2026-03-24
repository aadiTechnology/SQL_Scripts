update Subject_Master
set Is_CoCurricularActivity = 1
WHERE academic_Year_Id  = 3
AND Is_Deleted = 'N'
and Subject_Name IN ('CO-CURRICULAR ACTIVITIES','SPORTS','Personal & Social Traits')