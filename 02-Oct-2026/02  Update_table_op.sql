UPDATE op
    SET 
        op.IsDeleted = 1,
        op.UpdatedById = 1,
        op.UpdateDate = dbo.getlocaldate(default)
    FROM ObservationParameters op
    INNER JOIN ObservationSkills os
        ON os.Id = op.SkillId
    INNER JOIN Standard_Master sm
    ON sm.Standard_Id=OS.StandardId
    WHERE os.SchoolId = 172
      AND os.AcademicYearId = 1
      AND sm.Standard_Name  In ('Nursery','Junior KG')
      AND sm.Is_Deleted='N'
      AND os.IsDeleted = 0
      AND op.IsDeleted = 0;

  UPDATE  os
    SET 
        IsDeleted = 1,
        UpdatedById = 1,
        UpdateDate = dbo.getlocaldate(default)
     From    ObservationSkills OS
      INNER JOIN Standard_Master sm
    ON sm.Standard_Id=OS.StandardId
    WHERE SchoolId = 172
      AND AcademicYearId = 1
      AND sm.Standard_Name In ('Nursery','Junior KG')
      AND sm.Is_Deleted='N'
      AND IsDeleted = 0;


