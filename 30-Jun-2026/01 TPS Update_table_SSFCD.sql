UPDATE SSFCD
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from Schoolwise_Fee_Type_Configuration SFTC
INNER JOIN Schoolwise_Standard_Fee_Configuration_Master SSFCM
ON SFTC.Fee_Type_Id = SSFCM.Fee_Type_Id
INNER JOIN Schoolwise_Standard_Fee_Configuration_Details SSFCD
ON SSFCM.Schoolwise_Standard_Fee_Configuration_Id = SSFCD.Schoolwise_Standard_Fee_Configuration_Id
INNER JOIN Standard_Master SM
ON SSFCM.Standard_Id = SM.Standard_Id
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SSFCM.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'
AND SM.Is_Deleted = 'N'
AND SSFCD.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8')

UPDATE SSFCM
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from Schoolwise_Fee_Type_Configuration SFTC
INNER JOIN Schoolwise_Standard_Fee_Configuration_Master SSFCM
ON SFTC.Fee_Type_Id = SSFCM.Fee_Type_Id
INNER JOIN Standard_Master SM
ON SSFCM.Standard_Id = SM.Standard_Id
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SSFCM.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'
AND SM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8')

UPDATE SSLDD
SET IsDeleted = 1,
	UpdatedDate = DBO.GetLocalDate(DEFAULT),
	UpdatedById = 1
from SchoolWise_Standard_LateFee_DueDates_Master SSLDM
INNER JOIN Schoolwise_Standard_FeeType_Master SSFTM
ON SSLDM.SchoolWise_Standard_FeeType_Id = SSFTM.SchoolWise_Standard_FeeType_Id
INNER JOIN Schoolwise_Fee_Type_Configuration SFTC
ON SSFTM.Fee_Type_Id = SFTC.Fee_Type_Id
INNER JOIN Standard_Master SM
ON SSFTM.Standard_Id = SM.Standard_Id
INNER JOIN SchoolWise_Standard_LateFee_DueDates_Details SSLDD
ON SSLDM.SchoolWise_Standard_LateFee_DueDates_Id = SSLDD.SchoolWise_Standard_LateFee_DueDates_Id
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SSFTM.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'
AND SM.Is_Deleted = 'N'
AND SSLDM.Is_Deleted = 'N'
AND SSLDD.IsDeleted = 0
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8')

UPDATE SSLDM
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from SchoolWise_Standard_LateFee_DueDates_Master SSLDM
INNER JOIN Schoolwise_Standard_FeeType_Master SSFTM
ON SSLDM.SchoolWise_Standard_FeeType_Id = SSFTM.SchoolWise_Standard_FeeType_Id
INNER JOIN Schoolwise_Fee_Type_Configuration SFTC
ON SSFTM.Fee_Type_Id = SFTC.Fee_Type_Id
INNER JOIN Standard_Master SM
ON SSFTM.Standard_Id = SM.Standard_Id
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SSFTM.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'
AND SM.Is_Deleted = 'N'
AND SSLDM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8')

UPDATE SSFTM
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from Schoolwise_Standard_FeeType_Master SSFTM
INNER JOIN Schoolwise_Fee_Type_Configuration SFTC
ON SSFTM.Fee_Type_Id = SFTC.Fee_Type_Id
INNER JOIN Standard_Master SM
ON SSFTM.Standard_Id = SM.Standard_Id
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SSFTM.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'
AND SM.Is_Deleted = 'N'
AND SM.Standard_Name IN ('1','2','3','4','5','6','7','8')

UPDATE SFTC
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from Schoolwise_Fee_SUBType_Configuration SFTC
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SFTC.Fee_SubType = 'TERM FEES'

UPDATE SFTC
SET Is_Deleted = 'Y',
	Update_Date = DBO.GetLocalDate(DEFAULT),
	Updated_By_Id = 1
from Schoolwise_Fee_Type_Configuration SFTC
WHERE SFTC.School_Id = 172
AND SFTC.Academic_Year_Id = 1
AND SFTC.Is_Deleted = 'N'
AND SFTC.Fee_Type = 'TERM FEES'