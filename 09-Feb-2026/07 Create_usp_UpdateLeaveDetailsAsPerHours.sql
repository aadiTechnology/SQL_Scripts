SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================
-- Author:		Sachin
-- Create date: 02-Feb-2026
-- Description:	This USP is used to update leave details as per working hours.
-- ===============================================================================
CREATE PROCEDURE [dbo].[usp_UpdateLeaveDetailsAsPerHours]
	@SchoolID INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UpdatedById INT = 1,
			@AcademicYearId INT	

	SELECT @AcademicYearId = Academic_Year_ID 
	from SchoolWise_Academic_Year_Master 
	where School_Id = @SchoolID 
	AND Is_Current_Year = 'Y'

   DECLARE @tblUserAttendance AS TABLE
	(
		Id INT IDENTITY(1,1),
		UserID INT,
		EventDate DATE
	)

	INSERT INTO @tblUserAttendance
	select EAS.UserID, EventDate
	from EmployeeAttendanceStatus EAS
	INNER JOIN UserShiftsAssociation USA
	ON EAS.UserID = USA.UserId
	INNER JOIN SchoolShifts SH
	ON USA.ShiftId = SH.ShiftId
	where CheckInTime is not null
	and CheckInTime <> ''
	and CheckOutTime is not null
	and CheckOutTime <> ''
	and IsHalfLeave = 1
	AND EAS.IsDeleted = 0
	AND USA.Is_Deleted = 'N'
	AND SH.Is_Deleted = 'N'
	AND SH.AcademicYearId = @AcademicYearId
	and EAS.SchoolId = @SchoolID
	AND DATEDIFF(MINUTE, CONVERT(TIME, CheckInTime), CONVERT(TIME, CheckOutTime)) >= DATEDIFF(MINUTE, CONVERT(TIME, ShiftStartTime), CONVERT(TIME, ShiftEndTime))
	AND NOT EXISTS
	(
		SELECT 1
		FROM SalaryPublishStatus SPS
		WHERE SPS.Is_Deleted = 'N'
		AND SPS.IsPublished = 1
		AND YEAR(EAS.EventDate) = SPS.Year
		AND MONTH(EAS.EventDate) = SPS.MonthId
	)

	DECLARE @UserID INT,
		@EventDate DATE,
		@Id INT,
		@LWPLeaveId INT,
		@LeaveYearId INT

	SELECT @LWPLeaveId = LeaveId 
	FROM StaffLeaves 
	WHERE SchoolId = @SchoolID 
	AND OriginalLeaveId = 5 -- LWP
	AND Is_Deleted = 'N'

	WHILE EXISTS
	(
		SELECT TOP 1 1
		FROM @tblUserAttendance
	)
	BEGIN
		SELECT TOP 1 @Id = Id, @UserID = UserId, @EventDate = EventDate
		FROM @tblUserAttendance

		SELECT @LeaveYearId = Id 
		from LeaveYears 
		WHERE CONVERT(DATE,@EventDate) BETWEEN StartDate AND EndDate

		update EmployeeAttendanceStatus
		set IsHalfLeave = 0,
			UpdatedByID = @UpdatedById,
			UpdatedDate = dbo.GetLocalDate(DEFAULT)
		where UserID = @UserID
		AND CONVERT(DATE,EventDate) = @EventDate
		and SchoolId = @SchoolID

		UPDATE StaffAttendance
		SET PresentDays = PresentDays + 0.5,
			UpdateDate = DBO.GetLocalDate(DEFAULT),
			UpdatedById = @UpdatedById
		WHERE UserId = @UserID
		AND Year = YEAR(@EventDate)
		AND MonthId = MONTH(@EventDate)
		AND Is_Deleted = 'N'
		and SchoolId = @SchoolID

		UPDATE SLD
		SET Days = Days - 0.5,
			UpdateDate = DBO.GetLocalDate(DEFAULT),
			UpdatedById = @UpdatedById
		from StaffLeaveDetails SLD
		INNER JOIN StaffAttendance SA
		ON SLD.StaffAttendanceId = SA.StaffAttendanceId
		WHERE SA.UserId = @UserID
		AND SA.Year = YEAR(@EventDate)
		AND SA.MonthId = MONTH(@EventDate)
		AND SA.Is_Deleted = 'N'
		AND SLD.Is_Deleted = 'N'
		AND SLD.LeaveId = @LWPLeaveId
		and SA.SchoolId = @SchoolID
	
		UPDATE DatewiseStaffLeaves
		set Is_Deleted = 'Y',
			UpdateDate = DBO.GetLocalDate(DEFAULT),
			UpdatedById = @UpdatedById
		WHERE UserId = @UserID
		and convert(date,date) = @EventDate
		and Is_Deleted = 'N'
		and LeaveId = @LWPLeaveId
		and IsHalfLeave = 1
		and SchoolId = @SchoolID

		UPDATE UserLeavesYearwiseConfiguration
		set LeaveBalance = LeaveBalance + 0.5,
			UpdateDate = DBO.GetLocalDate(DEFAULT),
			UpdatedById = @UpdatedById
		WHERE UserId = @UserID
		AND LeaveId = @LWPLeaveId
		and Is_Deleted = 'N'
		and Year = @LeaveYearId
		and SchoolId = @SchoolID

		DELETE FROM @tblUserAttendance
		WHERE Id = @Id
	END
END
GO
