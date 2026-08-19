-------------------------------------------------------------
-- Computer Studies - 10-D
-------------------------------------------------------------
UPDATE STSMD
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Details STSMD
INNER JOIN SchoolWise_Test_Subject_Marks_Master STSMM
    ON STSMM.TestWise_Subject_Marks_Id=STSMD.TestWise_Subject_Marks_Id
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.ClassName='10-D'
AND STSMD.Is_Deleted='N'
AND SM.Subject_Name='Computer Studies';
 
UPDATE STSMM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Master STSMM
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.ClassName='10-D'
AND SM.Subject_Name='Computer Studies';
 
UPDATE SDSM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM Schoolwise_Division_Subject_Master SDSM
INNER JOIN vw_standard_division VSD
    ON SDSM.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
INNER JOIN Subject_Master SM
    ON SDSM.Subject_Id=SM.Subject_Id
WHERE SDSM.Academic_Year_Id=57
AND SDSM.Is_Deleted='N'
AND SDSM.School_Id=18
AND SM.Is_Deleted='N'
AND VSD.ClassName='10-D'
AND SM.Subject_Name='Computer Studies';
 
-------------------------------------------------------------
-- Economics - 9-C, 10-C
-------------------------------------------------------------
 
UPDATE STSMD
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Details STSMD
INNER JOIN SchoolWise_Test_Subject_Marks_Master STSMM
    ON STSMM.TestWise_Subject_Marks_Id=STSMD.TestWise_Subject_Marks_Id
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.ClassName IN ('9-C','10-C')
AND SM.Subject_Name='Economics';
 
UPDATE STSMM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Master STSMM
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.ClassName IN ('9-C','10-C')
AND SM.Subject_Name='Economics';
 
UPDATE SDSM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM Schoolwise_Division_Subject_Master SDSM
INNER JOIN vw_standard_division VSD
    ON SDSM.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
INNER JOIN Subject_Master SM
    ON SDSM.Subject_Id=SM.Subject_Id
WHERE SDSM.Academic_Year_Id=57
AND SDSM.Is_Deleted='N'
AND SDSM.School_Id=18
AND SM.Is_Deleted='N'
AND VSD.ClassName IN ('9-C','10-C')
AND SM.Subject_Name='Economics';
 
-------------------------------------------------------------
-- Art-I - All 9th & 10th Divisions
-------------------------------------------------------------
 
UPDATE STSMD
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Details STSMD
INNER JOIN SchoolWise_Test_Subject_Marks_Master STSMM
    ON STSMM.TestWise_Subject_Marks_Id=STSMD.TestWise_Subject_Marks_Id
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.Standard_Name IN ('9','10')
AND SM.Subject_Name IN ('Art-I','Art-II');
 
UPDATE STSMM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM SchoolWise_Test_Subject_Marks_Master STSMM
INNER JOIN vw_standard_division VSD
    ON VSD.SchoolWise_Standard_Division_Id=STSMM.Standard_Division_Id
INNER JOIN Subject_Master SM
    ON STSMM.Subject_Id=SM.Subject_Id
WHERE STSMM.Is_Deleted='N'
AND VSD.School_Id=18
AND VSD.Academic_Year_Id=57
AND SM.Is_Deleted='N'
AND VSD.Standard_Name  IN ('9','10')
AND SM.Subject_Name IN ('Art-I','Art-II');
 
UPDATE SDSM
SET Is_Deleted='Y',
    Update_Date=dbo.GetLocalDate(DEFAULT),
    Updated_By_Id=2
FROM Schoolwise_Division_Subject_Master SDSM
INNER JOIN vw_standard_division VSD
    ON SDSM.Standard_Division_Id=VSD.SchoolWise_Standard_Division_Id
INNER JOIN Subject_Master SM
    ON SDSM.Subject_Id=SM.Subject_Id
WHERE SDSM.Academic_Year_Id=57
AND SDSM.Is_Deleted='N'
AND SDSM.School_Id=18
AND SM.Is_Deleted='N'
AND VSD.Standard_Name  IN ('9','10')
AND SM.Subject_Name IN ('Art-I','Art-II');
 
Update SSSM
Set Is_Deleted='Y'
    ,Update_Date=dbo.GetLocalDate(default)
	,Updated_By_Id=2
	from SchoolWise_Standard_Subject_Master SSSM
Inner join Subject_Master SM
On SM.Subject_Id=SSSM.Subject_Id
WHERE Subject_Name IN ('Art-I', 'Art-II')
AND SM.School_Id=18
AND SM.academic_Year_Id=57
AND SM.Is_Deleted='N'
AND SSSM.Is_Deleted='N'
 
UPDATE Subject_Master
SET Is_Deleted = 'Y',
    Update_Date = dbo.GetLocalDate(DEFAULT),
    Updated_By_Id = 2
WHERE Subject_Name IN ('Art-I', 'Art-II')
AND academic_Year_Id=57
And Is_Deleted='N'
AND School_Id = 18;