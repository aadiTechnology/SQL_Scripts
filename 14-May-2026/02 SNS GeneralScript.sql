Declare @tbl as table
(
StudentId int,
RowNumber int
)
Insert Into @tbl
     select SchoolWise_Student_Id,
	 ROW_NUMBER() OVER( ORDER BY VSD.Original_Standard_Id, VSD.Original_Division_Id, YSD.Roll_No) AS RowNumber 
      from SchoolWise_Student_Master SSM
inner Join YearWise_Student_Details YSD
        on SSM.SchoolWise_Student_Id=YSD.Student_Id
 inner Join vw_standard_division VSD
         on VSD.Standard_Id=Ysd.Standard_Id
		 And vsd.Division_Id=YSD.Division_id
  where  vsd.className in ('12 Com-Y','12 Sci-Y')
    and YSD.School_Id=122
	and YSD.Academic_Year_ID=13
	and YSD.Is_Deleted='N'
	order by VSD.Original_Standard_Id ,VSD.Original_Division_Id ,YSD.Roll_No

Declare @SchoolwiseStudentId int
DECLARE @RowCount INT = (SELECT COUNT(1) FROM @tbl);
 
WHILE @RowCount > 0
BEGIN
   SELECT TOP 1 @SchoolwiseStudentId = StudentId FROM @tbl order by RowNumber;

    EXEC usp_DeleteStudent 
        @SchoolId = 122,
        @AcademicYearId = 13,
        @SchoolWise_Student_ID = @SchoolwiseStudentId,
        @Left_Date = '2026-05-14 00:00:00',
        @Permanent_Delete = N'N',
        @IsForm = 0,
        @CancellationFormNo = 0,
        @UpdatedById = 2100,
        @IsIncludeinBlackList = 0,
        @Comment = N''

		DELETE FROM @tbl WHERE StudentId = @SchoolwiseStudentId;
        SELECT @RowCount = COUNT(1) FROM @tbl;
	END

