UPDATE OP
SET
    OP.IsDeleted = 1,
    OP.UpdatedById = 2,        
    OP.UpdateDate = dbo.GetLocalDate(default)
  FROM ObservationParameters OP
INNER JOIN
(
    SELECT
        SkillId,
        Parameter,
        MIN(Id) AS KeepId
    FROM ObservationParameters
    WHERE SchoolId = 165
      AND AcademicYearId = 4
      AND IsDeleted = 0
    GROUP BY SkillId, Parameter
    HAVING COUNT(*) > 1
) D
ON OP.SkillId = D.SkillId
AND OP.Parameter = D.Parameter
WHERE OP.Id <> D.KeepId
  AND OP.SchoolId = 165
  AND OP.AcademicYearId = 4
  AND OP.IsDeleted = 0;