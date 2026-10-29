  Update SEAD 
  Set AcademicYearId=14,
  UpdatedById=1
  ,UpdatedDate=dbo.GetLocalDate(default)
 from SchoolEnquiryDetails SED
  INNER JOIN StudentEnquiryAdditionalDetails SEAD 
  On SED.Id=SEAD.EnquiryId
  WHERE SED.Academic_Year_Id=14
  AND SED.Is_Deleted='N'
  AND SEAD.IsDeleted=0
  AND SED.SchoolId=122
  AND SEAD.AcademicYearId=0