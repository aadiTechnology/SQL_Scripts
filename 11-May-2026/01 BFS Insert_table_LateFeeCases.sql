INSERT INTO [dbo].[LateFeeCases]
(
    [LateFeeId],
    [Days],
    [IntervalId],
    [Amount],
    [RepeatCount],
    [ExcludeHolidays],
    [ExcludeWeekends],
    [SortOrder],
    [IsDeleted]
)
SELECT 
    SSLDM.SchoolWise_Standard_LateFee_DueDates_Id, -- LateFeeId
    7,  
    1,   
    0,   
    1,   
    0,   
    0,   
    1,   
    0   
FROM SchoolWise_Standard_LateFee_DueDates_Master SSLDM
INNER JOIN Schoolwise_Standard_FeeType_Master SSFM
    ON SSLDM.SchoolWise_Standard_FeeType_Id = SSFM.SchoolWise_Standard_FeeType_Id
INNER JOIN SchoolWise_Standard_LateFee_DueDates_Details SSLDD
    ON SSLDD.SchoolWise_Standard_LateFee_DueDates_Id = SSLDM.SchoolWise_Standard_LateFee_DueDates_Id
INNER JOIN Standard_Master SM
    ON SSFM.Standard_Id = SM.Standard_Id
WHERE SSLDM.Academic_Year_Id = 13
AND SSLDD.IntervalName = 'Tuition Fees - I'
AND SSLDM.Is_Deleted = 'N'
AND SSFM.Is_Deleted = 'N'
AND SSLDD.IsDeleted = 0
AND SM.Is_Deleted = 'N';

INSERT INTO [dbo].[LateFeeCases]
(
    [LateFeeId],
    [Days],
    [IntervalId],
    [Amount],
    [RepeatCount],
    [ExcludeHolidays],
    [ExcludeWeekends],
    [SortOrder],
    [IsDeleted]
)
SELECT 
    SSLDM.SchoolWise_Standard_LateFee_DueDates_Id, -- LateFeeId
    7,  
    1,   
    0,   
    1,   
    0,   
    0,   
    2,   
    0   
FROM SchoolWise_Standard_LateFee_DueDates_Master SSLDM
INNER JOIN Schoolwise_Standard_FeeType_Master SSFM
    ON SSLDM.SchoolWise_Standard_FeeType_Id = SSFM.SchoolWise_Standard_FeeType_Id
INNER JOIN SchoolWise_Standard_LateFee_DueDates_Details SSLDD
    ON SSLDD.SchoolWise_Standard_LateFee_DueDates_Id = SSLDM.SchoolWise_Standard_LateFee_DueDates_Id
INNER JOIN Standard_Master SM
    ON SSFM.Standard_Id = SM.Standard_Id
WHERE SSLDM.Academic_Year_Id = 13
AND SSLDD.IntervalName = 'Tuition Fees - II'
AND SSLDM.Is_Deleted = 'N'
AND SSFM.Is_Deleted = 'N'
AND SSLDD.IsDeleted = 0
AND SM.Is_Deleted = 'N';


INSERT INTO [dbo].[LateFeeCases]
(
    [LateFeeId],
    [Days],
    [IntervalId],
    [Amount],
    [RepeatCount],
    [ExcludeHolidays],
    [ExcludeWeekends],
    [SortOrder],
    [IsDeleted]
)
SELECT 
    SSLDM.SchoolWise_Standard_LateFee_DueDates_Id, -- LateFeeId
    7,  
    1,   
    0,   
    1,   
    0,   
    0,   
    3,   
    0   
FROM SchoolWise_Standard_LateFee_DueDates_Master SSLDM
INNER JOIN Schoolwise_Standard_FeeType_Master SSFM
    ON SSLDM.SchoolWise_Standard_FeeType_Id = SSFM.SchoolWise_Standard_FeeType_Id
INNER JOIN SchoolWise_Standard_LateFee_DueDates_Details SSLDD
    ON SSLDD.SchoolWise_Standard_LateFee_DueDates_Id = SSLDM.SchoolWise_Standard_LateFee_DueDates_Id
INNER JOIN Standard_Master SM
    ON SSFM.Standard_Id = SM.Standard_Id
WHERE SSLDM.Academic_Year_Id = 13
AND SSLDD.IntervalName = 'Tuition Fees - III'
AND SSLDM.Is_Deleted = 'N'
AND SSFM.Is_Deleted = 'N'
AND SSLDD.IsDeleted = 0
AND SM.Is_Deleted = 'N';

