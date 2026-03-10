/****** Object:  StoredProcedure [dbo].[usp_GetStaffAttendanceForReport]    Script Date: 3/6/2026 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		RIT
-- Create date: 19-October-2016
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetStaffAttendanceForReport] 
	@School_Id			INT,
	@Academic_Year_id	INT,
	@FromDate			DATETIME,
	@ToDate				DATETIME,
	@StaffGroupsId		INT = NULL,
	@UserId				INT = NULL,
	@IsAbsentChecked	BIT = NULL,
	@IsPresentChecked	BIT = NULL,
	@IsHalfChecked		BIT = NULL,
	@IsLateMarkChecked	BIT = NULL,
	@IncludeCHB			BIT = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@StaffGroupsId IS NULL or @StaffGroupsId = -1)
		SET @StaffGroupsId = 0
		
	IF(@UserId IS NULL)
		SET @UserId = 0

	DECLARE @tblStaffAssoData AS TABLE
	(
		UserId INT,
		StartDate DATE,
		EndDate DATE,
		StaffGroupId INT,
		IsDeleted BIT
	)

	INSERT INTO @tblStaffAssoData
	select USGD.UserId,USGD.StartDate,USGD.EndDate,USGD.StaffGroupId,USGD.IsDeleted
	from UserStaffGroupDetails USGD
	inner join 
	(
		select UserId, MAX(Id) as MaxId
		from UserStaffGroupDetails
		where IsDeleted = 0
		group by UserId
	)S
	ON USGD.UserId = S.UserId
	AND USGD.Id = S.MaxId
	where IsDeleted = 0

		Declare @tblSection AS TABLE
		(
		  UserId Int,
		  SectionId Int,
		  SectionName Nvarchar(100)
		)

IF @School_Id = 122
BEGIN
	Insert into @tblSection
	SELECT USGA.UserId,S.SrNo, S.StaffGroupsName
	FROM UsersStaffGroupsAssociation USGA	
	LEFT OUTER JOIN
	(
		SELECT ROW_NUMBER() OVER (ORDER BY StaffGroupsName) as SrNo, StaffGroupsName, StaffGroupsId
		FROM StaffGroups
		WHERE Is_Deleted = 'N'
		AND SchoolId = @School_Id
	)S
	ON USGA.StaffGroupsId = S.StaffGroupsId
	WHERE USGA.Is_Deleted = 'N'	
	AND USGA.StaffGroupsId <> 0
	AND USGA.SchoolId = @School_Id	
END
ELSE
BEGIN
	Insert into @tblSection 
	select User_Id
		      ,1
			  ,'Pre-Primary'
         from Teacher_Subject_Assignment TSA
    inner join vw_BaseTeacherDetails BTD
            on BTD.Teacher_Id=TSA.Teacher_Id
   inner join  vw_standard_division VSD
           on  VSD.SchoolWise_Standard_Division_Id =TSA.Standard_Division_Id  
   inner join  Standard_Master SM 
           on  VSD.Standard_Id=SM.Standard_Id
		where  TSA.Is_Deleted='N'
		  AND  BTD.Is_Deleted='N'
		  AND  SM.Is_Deleted='N'
		  And  SM.Is_PrePrimary='Y'
		  And  SM.academic_year_id=@Academic_Year_id
		  group by User_Id
    
        Insert into @tblSection 
             select  User_Id
		            ,2
			        ,'Primary Secondary'
               from vw_BaseTeacherDetails BTD
              where BTD.Is_Deleted='N'
		        and User_Id Not In (Select UserId From @tblSection)
  

			Insert INTO @tblSection
				 select  User_Id 
						,3
						,'Admin Staff'
				  from vw_BaseSupervisorDetails
				 where Is_Deleted='N'
				   And School_Id = @School_Id
				   
			   Insert INTO @tblSection
					select UserId 
						   ,4
						   ,'Other Staff'
					  from OtherStaff 
					 where Is_Deleted='N'
					   And SchoolId = @School_Id
	END
	
	DECLARE @tblStaffAttendanceDetails AS TABLE
	(
		EmployeeNo		 NVARCHAR(20),
		EmployeeName	 NVARCHAR(100),
		Eventdate		 Date,
		CheckInTime		 NVARCHAR(15),
		CheckOutTime	 NVARCHAR(15),
		IsPresent		 BIT,
		IsAbsent		 BIT,
		IshalfDay		 BIT,
		IsLateMark		 BIT,
		SchoolId		 INT,
		StaffGroupsName	 NVARCHAR(100),
		UserId			 INT,
		Weekendid		 INT
	)

	IF(@UserId != 0 AND @StaffGroupsId != 0)
		BEGIN
					INSERT INTO @tblStaffAttendanceDetails
						 SELECT DISTINCT EmployeeAttendanceStatus.EmpNo,
								ISNULL(apu.UserFLName, '') AS UserFLName,
								CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
								EmployeeAttendanceStatus.IsPresent,
								EmployeeAttendanceStatus.IsAbsent,
								EmployeeAttendanceStatus.IsHalfLeave,
								EmployeeAttendanceStatus.IsLateMark,
								School_Master.School_Id,
								(
									SELECT StaffGroupsName
									  FROM @tblStaffAssoData USGD
								INNER JOIN StaffGroups SG
										ON SG.StaffGroupsId = USGD.StaffGroupId
									 WHERE ISDELETED = 0
									   AND UserId = APU.UserId
									   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
								) as StaffGroupsName,
								--StaffGroups.StaffGroupsName,
								EmployeeAttendanceStatus.UserId,
								(SELECT Top 1 Original_WeekDays_Id 
										FROM WeekDays_Master 
									   WHERE School_Id IS NULL 
										 AND Is_Deleted = 'N' 
										 AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
								)							
						  FROM  EmployeeAttendanceStatus
			   LEFT OUTER JOIN vw_AllPayrollUsers APU
							ON EmployeeAttendanceStatus.UserId = APU.UserId
							AND APU.Is_Deleted = 'N'
			  RIGHT OUTER JOIN School_Master
							ON School_Master.School_Id = @School_Id
			   LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
							ON EmployeeAttendanceStatus.UserId = USA.UserId
			   LEFT OUTER JOIN StaffGroups
	  						ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId		
			   LEFT OUTER JOIN UserBasicDetails UBD
							ON EmployeeAttendanceStatus.UserId = UBD.UserId
						   AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
						   AND UBD.IsDeleted = 0		
						   AND ISNULL(UBD.IsOnClockHoursBasis,0) = 0
			             WHERE School_Master.School_Id = @School_Id
						   AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
						   AND EmployeeAttendanceStatus.UserId = @UserId
						   AND USA.StaffGroupsId = @StaffGroupsId
						   AND USA.Is_Deleted = 'N'
						  -- AND USA.Is_Locked = 0									   
					  ORDER BY UserFLName

				IF(@IncludeCHB = 1)
					BEGIN
						INSERT INTO @tblStaffAttendanceDetails
							 SELECT DISTINCT EmployeeAttendanceStatus.EmpNo,
									ISNULL(apu.UserFLName, '') AS UserFLName,
									CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
									STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
									STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
									EmployeeAttendanceStatus.IsPresent,
									EmployeeAttendanceStatus.IsAbsent,
									EmployeeAttendanceStatus.IsHalfLeave,
									EmployeeAttendanceStatus.IsLateMark,
									School_Master.School_Id,
									(
										SELECT StaffGroupsName
										  FROM @tblStaffAssoData USGD
									INNER JOIN StaffGroups SG
											ON SG.StaffGroupsId = USGD.StaffGroupId
										 WHERE ISDELETED = 0
										   AND USERID = APU.uSERiD
										   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
									) as StaffGroupsName,
									--StaffGroups.StaffGroupsName,
									EmployeeAttendanceStatus.UserId,
									(SELECT Top 1 Original_WeekDays_Id 
											FROM WeekDays_Master 
										   WHERE School_Id IS NULL 
											 AND Is_Deleted = 'N' 
											 AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
									)								
							  FROM  EmployeeAttendanceStatus
				   LEFT OUTER JOIN vw_AllPayrollUsers APU
								ON EmployeeAttendanceStatus.UserId = APU.UserId
								AND APU.Is_Deleted = 'N'
				  RIGHT OUTER JOIN School_Master
								ON School_Master.School_Id = @School_Id
				   LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
								ON EmployeeAttendanceStatus.UserId = USA.UserId
				   LEFT OUTER JOIN StaffGroups
	  							ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
				   LEFT OUTER JOIN UserBasicDetails UBD
								ON EmployeeAttendanceStatus.UserId = UBD.UserId
							   AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
							   AND UBD.IsDeleted = 0		
							   AND UBD.IsOnClockHoursBasis = 1	
							    			   
							 WHERE School_Master.School_Id = @School_Id
							   AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
							   AND EmployeeAttendanceStatus.UserId = @UserId
							   AND USA.StaffGroupsId = @StaffGroupsId
							   AND USA.Is_Deleted = 'N'						
							 --  AND USA.Is_Locked = 0								   	   
						  ORDER BY UserFLName
					END
		END

		

	ELSE IF(@UserId = 0 AND @StaffGroupsId != 0)
		BEGIN
			INSERT INTO @tblStaffAttendanceDetails
				 SELECT DISTINCT EmployeeAttendanceStatus.EmpNo,
						ISNULL(apu.UserFLName, '') AS UserFLName,
						CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
						EmployeeAttendanceStatus.IsPresent,
						EmployeeAttendanceStatus.IsAbsent,
						EmployeeAttendanceStatus.IsHalfLeave,
						EmployeeAttendanceStatus.IsLateMark, 
						School_Master.School_Id ,
						(
							SELECT StaffGroupsName
							  FROM @tblStaffAssoData USGD
						INNER JOIN StaffGroups SG
								ON SG.StaffGroupsId = USGD.StaffGroupId
							 WHERE ISDELETED = 0
							   AND USERID = APU.uSERiD
							   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
						) as StaffGroupsName,
						--StaffGroups.StaffGroupsName,
						EmployeeAttendanceStatus.UserId,
						(SELECT Top 1 Original_WeekDays_Id 
							   FROM WeekDays_Master 
							  WHERE School_Id IS NULL 
								AND Is_Deleted = 'N' 
								AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
						 ) 
					FROM EmployeeAttendanceStatus
		 LEFT OUTER JOIN vw_AllPayrollUsers APU
					  ON EmployeeAttendanceStatus.UserId = APU.UserId
					  AND APU.Is_Deleted = 'N'
		RIGHT OUTER JOIN School_Master
					  ON School_Master.School_Id = @School_Id
		 LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
					  ON EmployeeAttendanceStatus.UserId = USA.UserId
		 LEFT OUTER JOIN StaffGroups
					  ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId	
		 LEFT OUTER JOIN UserBasicDetails UBD
					  ON EmployeeAttendanceStatus.UserId = UBD.UserId
					 AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
					 AND UBD.IsDeleted = 0	 
					 AND ISNULL(UBD.IsOnClockHoursBasis,0) = 0	
					WHERE School_Master.School_Id = @School_Id
					 AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
					 AND USA.StaffGroupsId = @StaffGroupsId
					 AND USA.Is_Deleted = 'N'
					-- AND USA.Is_Locked = 0							 			 
				ORDER BY UserFLName

				IF(@IncludeCHB = 1)
					BEGIN
						INSERT INTO @tblStaffAttendanceDetails
							 SELECT DISTINCT EmployeeAttendanceStatus.EmpNo,
									ISNULL(apu.UserFLName, '') AS UserFLName,
									CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
									STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
									STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
									EmployeeAttendanceStatus.IsPresent,
									EmployeeAttendanceStatus.IsAbsent,
									EmployeeAttendanceStatus.IsHalfLeave,
									EmployeeAttendanceStatus.IsLateMark, 
									School_Master.School_Id ,
									(
										SELECT StaffGroupsName
										  FROM @tblStaffAssoData USGD
									INNER JOIN StaffGroups SG
											ON SG.StaffGroupsId = USGD.StaffGroupId
										 WHERE ISDELETED = 0
										   AND USERID = APU.uSERiD
										   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
									) as StaffGroupsName,
									--StaffGroups.StaffGroupsName,
									EmployeeAttendanceStatus.UserId,
									(SELECT Top 1 Original_WeekDays_Id 
										   FROM WeekDays_Master 
										  WHERE School_Id IS NULL 
											AND Is_Deleted = 'N' 
											AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
									 ) 
								FROM EmployeeAttendanceStatus
					 LEFT OUTER JOIN vw_AllPayrollUsers APU
								  ON EmployeeAttendanceStatus.UserId = APU.UserId
								  AND APU.Is_Deleted = 'N'
					RIGHT OUTER JOIN School_Master
								  ON School_Master.School_Id = @School_Id
					 LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
								  ON EmployeeAttendanceStatus.UserId = USA.UserId
					 LEFT OUTER JOIN StaffGroups
								  ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
					 LEFT OUTER JOIN UserBasicDetails UBD
								  ON EmployeeAttendanceStatus.UserId = UBD.UserId
								 AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
								 AND UBD.IsDeleted = 0
								 AND ISNULL(UBD.IsOnClockHoursBasis,0) = @IncludeCHB
								  LEFT OUTER JOIN  @tblSection  Ts
			                on Ts.UserId=EmployeeAttendanceStatus.UserId 					 
							   WHERE School_Master.School_Id = @School_Id
								 AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
								 AND USA.StaffGroupsId = @StaffGroupsId
								 AND USA.Is_Deleted = 'N'
								 --AND USA.Is_Locked = 0								 
							ORDER BY UserFLName
					END
		 END
	ELSE IF(@UserId != 0 AND @StaffGroupsId = 0)
		BEGIN
			INSERT INTO @tblStaffAttendanceDetails
				 SELECT DISTINCT  EmployeeAttendanceStatus.EmpNo,
						ISNULL(apu.UserFLName, '') AS UserFLName,
						CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
						EmployeeAttendanceStatus.IsPresent,
						EmployeeAttendanceStatus.IsAbsent,
						EmployeeAttendanceStatus.IsHalfLeave,
						EmployeeAttendanceStatus.IsLateMark,
						School_Master.School_Id ,
						(
							SELECT StaffGroupsName
							  FROM @tblStaffAssoData USGD
						INNER JOIN StaffGroups SG
								ON SG.StaffGroupsId = USGD.StaffGroupId
							 WHERE ISDELETED = 0
							   AND USERID = APU.uSERiD
							   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
						) as StaffGroupsName,
						--StaffGroups.StaffGroupsName,
						EmployeeAttendanceStatus.UserId,
						(SELECT Top 1 Original_WeekDays_Id 
							   FROM WeekDays_Master 
							  WHERE School_Id IS NULL 
								AND Is_Deleted = 'N' 
								AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
						) 
				   FROM EmployeeAttendanceStatus
		LEFT OUTER JOIN vw_AllPayrollUsers APU
					 ON EmployeeAttendanceStatus.UserId = APU.UserId
					 AND APU.Is_Deleted = 'N'
	   RIGHT OUTER JOIN School_Master
					 ON School_Master.School_Id = @School_Id
		LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
					 ON EmployeeAttendanceStatus.UserId = USA.UserId
		LEFT OUTER JOIN StaffGroups
					 ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
		LEFT OUTER JOIN UserBasicDetails UBD
					 ON EmployeeAttendanceStatus.UserId = UBD.UserId
					AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
					AND UBD.IsDeleted = 0
					AND ISNULL(UBD.IsOnClockHoursBasis,0) = 0	
				  WHERE School_Master.School_Id = @School_Id
					AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
					AND EmployeeAttendanceStatus.UserId = @UserId
					AND USA.Is_Deleted = 'N'
					--AND USA.Is_Locked = 0					
			   ORDER BY UserFLName

			   IF(@IncludeCHB = 1)
				  BEGIN
					INSERT INTO @tblStaffAttendanceDetails
						 SELECT DISTINCT  EmployeeAttendanceStatus.EmpNo,
								ISNULL(apu.UserFLName, '') AS UserFLName,
								CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
								EmployeeAttendanceStatus.IsPresent,
								EmployeeAttendanceStatus.IsAbsent,
								EmployeeAttendanceStatus.IsHalfLeave,
								EmployeeAttendanceStatus.IsLateMark,
								School_Master.School_Id ,
								(
										SELECT StaffGroupsName
										  FROM @tblStaffAssoData USGD
									INNER JOIN StaffGroups SG
											ON SG.StaffGroupsId = USGD.StaffGroupId
										 WHERE ISDELETED = 0
										   AND USERID = APU.uSERiD
										   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
								) as StaffGroupsName,
								--StaffGroups.StaffGroupsName,
								EmployeeAttendanceStatus.UserId,
								(SELECT Top 1 Original_WeekDays_Id 
									   FROM WeekDays_Master 
									  WHERE School_Id IS NULL 
										AND Is_Deleted = 'N' 
										AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate)
								)
						   FROM EmployeeAttendanceStatus
				LEFT OUTER JOIN vw_AllPayrollUsers APU
							 ON EmployeeAttendanceStatus.UserId = APU.UserId
							 AND APU.Is_Deleted = 'N'
			   RIGHT OUTER JOIN School_Master
							 ON School_Master.School_Id = @School_Id
				LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
							 ON EmployeeAttendanceStatus.UserId = USA.UserId
				LEFT OUTER JOIN StaffGroups
							 ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
				LEFT OUTER JOIN UserBasicDetails UBD
							 ON EmployeeAttendanceStatus.UserId = UBD.UserId
							AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
							AND UBD.IsDeleted = 0
							AND ISNULL(UBD.IsOnClockHoursBasis,0) = @IncludeCHB	
                           WHERE School_Master.School_Id = @School_Id
							AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
							AND EmployeeAttendanceStatus.UserId = @UserId
							AND USA.Is_Deleted = 'N'
						--	AND USA.Is_Locked = 0							
					   ORDER BY UserFLName
				  END
		END		 
	ELSE IF(@UserId = 0 AND @StaffGroupsId = 0)
		BEGIN		
			INSERT INTO @tblStaffAttendanceDetails
				 SELECT DISTINCT  EmployeeAttendanceStatus.EmpNo,
						ISNULL(apu.UserFLName, '') AS UserFLName,
						CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
						STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
						EmployeeAttendanceStatus.IsPresent,
						EmployeeAttendanceStatus.IsAbsent,
						EmployeeAttendanceStatus.IsHalfLeave,
						EmployeeAttendanceStatus.IsLateMark,
						School_Master.School_Id ,
						(
							SELECT StaffGroupsName
							  FROM @tblStaffAssoData USGD
						INNER JOIN StaffGroups SG
								ON SG.StaffGroupsId = USGD.StaffGroupId
							 WHERE ISDELETED = 0
							   AND USERID = APU.uSERiD
							   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
						) as StaffGroupsName,
						--StaffGroups.StaffGroupsName,
						EmployeeAttendanceStatus.UserId,
						(SELECT Top 1 Original_WeekDays_Id 
							   FROM WeekDays_Master
							   WHERE School_Id IS NULL 
								 AND Is_Deleted = 'N' AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate))
					   FROM  EmployeeAttendanceStatus
						LEFT OUTER JOIN vw_AllPayrollUsers APU
								ON EmployeeAttendanceStatus.UserId = APU.UserId
								AND APU.Is_Deleted = 'N'
						RIGHT OUTER JOIN School_Master
								ON School_Master.School_Id = @School_Id
						LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
								ON 	EmployeeAttendanceStatus.UserId = USA.UserId
						LEFT OUTER JOIN StaffGroups
								ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
						LEFT OUTER JOIN UserBasicDetails UBD
								ON EmployeeAttendanceStatus.UserId = UBD.UserId
							   AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
							   AND UBD.IsDeleted = 0
							   AND ISNULL(UBD.IsOnClockHoursBasis,0) = 0
							WHERE School_Master.School_Id = @School_Id
							  AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
							  AND  USA.Is_Deleted = 'N'
						--	  AND  USA.Is_Locked = 0				
						ORDER BY UserFLName

--select * from @tblStaffAttendanceDetails
--where userid = 1108

		  IF(@IncludeCHB = 1)
			BEGIN
				    INSERT INTO @tblStaffAttendanceDetails
						 SELECT DISTINCT EmployeeAttendanceStatus.EmpNo,
								ISNULL(apu.UserFLName, '') AS UserFLName,
								CONVERT(DATE,EmployeeAttendanceStatus.EventDate),
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckInTime,100),7)),7),6,0, ' ') as CheckInTime,
								STUFF(RIGHT('0'+ LTRIM(RIGHT(CONVERT(varchar(8),EmployeeAttendanceStatus.CheckOutTime,100),7)),7),6,0, ' ') as CheckOutTime,
								EmployeeAttendanceStatus.IsPresent,
								EmployeeAttendanceStatus.IsAbsent,
								EmployeeAttendanceStatus.IsHalfLeave,
								EmployeeAttendanceStatus.IsLateMark,
								School_Master.School_Id ,
								(
										SELECT StaffGroupsName
										  FROM @tblStaffAssoData USGD
									INNER JOIN StaffGroups SG
											ON SG.StaffGroupsId = USGD.StaffGroupId
										 WHERE ISDELETED = 0
										   AND USERID = APU.uSERiD
										   AND ((EventDate BETWEEN USGD.StartDate AND USGD.EndDate) OR ((USGD.StartDate IS NULL AND EventDate <= USGD.EndDate) OR (USGD.EndDate IS NULL AND EventDate >= USGD.StartDate))) 
								) as StaffGroupsName,
								--StaffGroups.StaffGroupsName,
								EmployeeAttendanceStatus.UserId,
								(SELECT Top 1 Original_WeekDays_Id 
									   FROM WeekDays_Master
									   WHERE School_Id IS NULL 
										 AND Is_Deleted = 'N' AND WeekDay_Name = DATENAME(dw, EmployeeAttendanceStatus.EventDate))
									
						  FROM  EmployeeAttendanceStatus
								LEFT OUTER JOIN vw_AllPayrollUsers APU
										ON EmployeeAttendanceStatus.UserId = APU.UserId
										AND APU.Is_Deleted = 'N'
								RIGHT OUTER JOIN School_Master
										ON School_Master.School_Id = @School_Id
								LEFT OUTER JOIN UsersStaffGroupsAssociation AS USA
										ON 	EmployeeAttendanceStatus.UserId = USA.UserId
								LEFT OUTER JOIN StaffGroups
										ON StaffGroups.StaffGroupsId = 	USA.StaffGroupsId
								LEFT OUTER JOIN UserBasicDetails UBD
										ON EmployeeAttendanceStatus.UserId = UBD.UserId
									   AND EmployeeAttendanceStatus.SchoolID = UBD.SchoolId
									   AND UBD.IsDeleted = 0			
									   AND ISNULL(UBD.IsOnClockHoursBasis,0) = @IncludeCHB	
														   		   
					  WHERE School_Master.School_Id = @School_Id
						AND CONVERT(DATE, Eventdate) BETWEEN CONVERT(DATE,@FromDate) AND CONVERt(DATE,@ToDate)
						AND USA.Is_Deleted = 'N'
						--AND USA.Is_Locked = 0						
				  ORDER BY UserFLName
			END
	 END	 
--SELECt * FROM @tblStaffAttendanceDetails

	DECLARE @tblStaffAttendanceData AS TABLE
	(
		EmployeeNo				NVARCHAR(20),
		EmployeeName			NVARCHAR(150),
		Eventdate				Date,
		CheckInTime				NVARCHAR(15),
		CheckOutTime			NVARCHAR(15),
		School_Name				NVARCHAR(200),
		Address1				NVARCHAR(300),
		Address2				NVARCHAR(300),
		City					NVARCHAR(50),
		Pincode					NVARCHAR(10),
		Phone_Number			NVARCHAR(50),
		FaxNumber				NVARCHAR(50),
		WebSite					NVARCHAR(100),
		Email					NVARCHAR(100),
		AttendancStatus			NVARCHAR(50),
		StaffGroupsName			NVARCHAR(100),
		Schoolid				INT,
		IsPresent				BIT,
		IsAbsent				BIT,
		IshalfDay				BIT,
		IsLateMark				BIT,
		SectionId               Int,
		SectionName             nvarchar(100)
		
	)

	INSERT INTO @tblStaffAttendanceData
		SELECT DISTINCT EmployeeNo, 
						EmployeeName, 
						CONVERT(DATE,Eventdate) AS Eventdate, 
						CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
						CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
						School_Name,Address1,Address2,City,Pincode,Phone_Number,FaxNumber,WebSite,Email,
						CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
							CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName, US.SchoolId ,
						IsPresent,
						IsAbsent,
						IshalfDay,
						IsLateMark,
						SectionId,
						Sectionname
				FROM @tblStaffAttendanceDetails  US
				INNER JOIN UserShiftsAssociation 
				ON UserShiftsAssociation.UserId = US.UserId
				RIGHT OUTER JOIN School_Master 
							ON School_Master.School_Id = US.SchoolId
				LEFT OUTER JOIN SchoolShifts
								ON SchoolShifts.SchoolId = @School_Id
                LEFT OUTER JOIN  @tblSection TS
				  on TS.UserId=US.USerId
                WHERE EmployeeNo IS NOT NULL
				AND (EmployeeName != '')
				AND Weekendid NOT IN (SELECT Weekendid FROM User_Weekend_Association WHERE UserId = US.UserId )
	
				--DELETE FROM tad
				--from @tblStaffAttendanceDetails tad
				--left outer join
				--(
				--	select UserID 
				--	from EmployeeAttendanceStatus
				--	where (EventDate >= @FromDate OR @FromDate IS NULL)
				--	and (EventDate <= @ToDate OR @ToDate IS NULL)
				--	group by UserID
				--)S
				--ON TAD.UserId = S.UserID
				--WHERE S.UserID IS NULL
				
				IF(@IsPresentChecked = 1  AND @IsHalfChecked != 1 AND @IsLateMarkChecked != 1 AND @IsAbsentChecked != 1)
					 SELECT EmployeeNo, 
							EmployeeName, 
							CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,
							US.Address1,
							US.Address2,
							US.City,
							US.Pincode,
							US.Phone_Number,
							US.FaxNumber,
							US.WebSite,
							US.Email,
							SectionId,
							Sectionname,
							Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
						    StaffGroupsName							
						FROM @tblStaffAttendanceData  US
		   RIGHT OUTER JOIN School_Master 
						 ON School_Master.School_Id = US.SchoolId
                      WHERE EmployeeNo IS NOT NULL
					    AND (EmployeeName != '')
						AND IsPresent = @IsPresentChecked
				   ORDER By StaffGroupsName, EmployeeName

				ELSE IF(@IsAbsentChecked = 1 AND @IsHalfChecked != 1 AND @IsLateMarkChecked != 1 AND @IsPresentChecked != 1)
					 SELECT EmployeeNo, 
							EmployeeName, 
							CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,
							US.Address1,
							US.Address2,
							US.City,
							US.Pincode,
							US.Phone_Number,
							US.FaxNumber,
							US.WebSite,
							US.Email,
							SectionId,
							Sectionname,
							Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
							StaffGroupsName							
					   FROM @tblStaffAttendanceData  US
		   RIGHT OUTER JOIN School_Master 
						 ON School_Master.School_Id = US.SchoolId
                        WHERE EmployeeNo IS NOT NULL
					    AND (EmployeeName != '')
						AND IsAbsent = @IsAbsentChecked
				   ORDER By StaffGroupsName, EmployeeName

				ELSE IF(@IsHalfChecked = 1 AND @IsAbsentChecked != 1 AND @IsLateMarkChecked != 1 AND @IsPresentChecked != 1)
						SELECT EmployeeNo, 
							   EmployeeName, 
							   CONVERT(DATE,Eventdate) AS Eventdate, 
							   CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							  CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							   US.School_Name,
							   US.Address1,
							   US.Address2,
							   US.City,
							   US.Pincode,
							   US.Phone_Number,
							   US.FaxNumber,
							   US.WebSite,
							   US.Email,
							   SectionId,
							   Sectionname,
							   Logo, 
							   CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
									CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
							   StaffGroupsName							   
                          FROM @tblStaffAttendanceData  US
			  RIGHT OUTER JOIN School_Master 
							ON School_Master.School_Id = US.SchoolId
						 WHERE EmployeeNo IS NOT NULL
						   AND (EmployeeName != '')
						   AND IshalfDay = @IsHalfChecked
					  ORDER By StaffGroupsName, EmployeeName

				ELSE IF(@IsLateMarkChecked = 1 AND @IsAbsentChecked != 1 AND @IsHalfChecked != 1 AND @IsPresentChecked != 1)
						SELECT EmployeeNo, 
							   EmployeeName, 
							   CONVERT(DATE,Eventdate) AS Eventdate, 
							   CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							   CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							   US.School_Name,
							   US.Address1,
							   US.Address2,
							   US.City,
							   US.Pincode,
							   US.Phone_Number,
							   US.FaxNumber,
							   US.WebSite,
							   US.Email,
							   SectionId,
							   Sectionname,
							   Logo, 
							   CASE WHEN  IsPresent= 1  AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
							   StaffGroupsName							   
                          FROM @tblStaffAttendanceData  US
			  RIGHT OUTER JOIN School_Master 
							ON School_Master.School_Id = US.SchoolId
					     WHERE EmployeeNo IS NOT NULL
						   AND (EmployeeName != '')
						   AND IsLateMark = @IsLateMarkChecked
					  ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked = 1  AND @IsHalfChecked = 1 AND @IsLateMarkChecked != 1 AND @IsAbsentChecked != 1)	
					SELECT  EmployeeNo, 
							EmployeeName, 
							CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,
							US.Address1,
							US.Address2,
							US.City,
							US.Pincode,
							US.Phone_Number,
							US.FaxNumber,
							US.WebSite,
							US.Email,
							SectionId,
							Sectionname,
							Logo, 
							CASE WHEN  IsPresent= 1  AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
							StaffGroupsName							
                        FROM @tblStaffAttendanceData  US
		   RIGHT OUTER JOIN School_Master 
						 ON School_Master.School_Id = US.SchoolId
					  WHERE EmployeeNo IS NOT NULL
					    AND (EmployeeName != '')
					    AND (IsPresent = @IsPresentChecked
						 OR IshalfDay = @IsHalfChecked)
				   ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked = 1  AND @IsHalfChecked = 1 AND @IsLateMarkChecked = 1 AND @IsAbsentChecked != 1)	
					SELECT  EmployeeNo, 
							EmployeeName, 
							CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,
							US.Address1,
							US.Address2,
							US.City,
							US.Pincode,
							US.Phone_Number,
							US.FaxNumber,
							US.WebSite,
							US.Email,
							SectionId,
							Sectionname,
							Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IsPresent = @IsPresentChecked
					OR IshalfDay = @IsHalfChecked
					OR IsLateMark = @IsLateMarkChecked)
					ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked = 1  AND @IsHalfChecked = 1 AND @IsLateMarkChecked = 1 AND @IsAbsentChecked = 1)	
				BEGIN
					SELECT EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo,  
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IsPresent = @IsPresentChecked
					OR IshalfDay = @IsHalfChecked
					OR IsLateMark = @IsLateMarkChecked
					OR IsAbsent = @IsAbsentChecked)
					ORDER By StaffGroupsName, EmployeeName
				END
				ELSE IF (@IsPresentChecked = 1  AND @IsHalfChecked != 1 AND @IsLateMarkChecked = 1 AND @IsAbsentChecked != 1)	
					SELECT  EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName 
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IsPresent = @IsPresentChecked
					OR IsLateMark = @IsLateMarkChecked)
					ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked = 1  AND @IsHalfChecked != 1 AND @IsLateMarkChecked != 1 AND @IsAbsentChecked = 1)	
					SELECT  EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IsPresent = @IsPresentChecked
					OR IsAbsent = @IsAbsentChecked)
				ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked != 1  AND @IsHalfChecked = 1 AND @IsLateMarkChecked = 1 AND @IsAbsentChecked != 1)	
					SELECT  EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus,StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IshalfDay = @IsHalfChecked
					OR IsLateMark = @IsLateMarkChecked)
					ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked != 1  AND @IsHalfChecked = 1 AND @IsLateMarkChecked != 1 AND @IsAbsentChecked = 1)	
					SELECT  EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
							CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IshalfDay = @IsHalfChecked
					OR IsAbsent = @IsAbsentChecked)
					ORDER By StaffGroupsName, EmployeeName

				ELSE IF (@IsPresentChecked != 1  AND @IsHalfChecked != 1 AND @IsLateMarkChecked = 1 AND @IsAbsentChecked = 1)	
					SELECT  EmployeeNo, 
							EmployeeName, CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,US.Address1,US.Address2,US.City,US.Pincode,US.Phone_Number,US.FaxNumber,US.WebSite,US.Email,SectionId,Sectionname,Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, StaffGroupsName
					FROM @tblStaffAttendanceData  US
					RIGHT OUTER JOIN School_Master 
								ON School_Master.School_Id = US.SchoolId
					
					WHERE EmployeeNo IS NOT NULL
					AND (EmployeeName != '')
					AND (IsLateMark = @IsLateMarkChecked
					OR IsAbsent = @IsAbsentChecked)
					ORDER By StaffGroupsName, EmployeeName
				ELSE 	
					SELECT  EmployeeNo, 
							EmployeeName, 
							CONVERT(DATE,Eventdate) AS Eventdate, 
							CASE WHEN CheckInTime IS NOT NULL THEN  CheckInTime ELSE '-'  END AS CheckInTime, 
							CASE WHEN CheckOutTime IS NOT NULL THEN CASE WHEN CheckInTime IS NULL THEN CheckOutTime WHEN CheckInTime != CheckOutTime THEN CheckOutTime ELSE '-' END ELSE '-'  END AS CheckOutTime,
							US.School_Name,
							US.Address1,
							US.Address2,
							US.City,
							US.Pincode,
							US.Phone_Number,
							US.FaxNumber,
							US.WebSite,
							US.Email,
							SectionId,
							Sectionname,
							Logo, 
							CASE WHEN  IsPresent= 1 AND IshalfDay = 0 THEN 'Present' ELSE CASE WHEN IsAbsent = 1 THEN 'Absent' ELSE CASE WHEN  IshalfDay= 1 THEN 'Half Day' ELSE
								CASE WHEN IsLateMark = 1 THEN 'Late Mark' ELSE '' END END END END AS AttendanceStatus, 
						    StaffGroupsName							
					   FROM @tblStaffAttendanceData  US
		   RIGHT OUTER JOIN School_Master 
						 ON School_Master.School_Id = US.SchoolId
					  WHERE EmployeeNo IS NOT NULL
					    AND (EmployeeName != '')
				   ORDER By StaffGroupsName, EmployeeName
			END			