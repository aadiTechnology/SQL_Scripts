SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Author:		Sachin
-- Create date: 9-Sep-2026
-- Description:	This USP is used to return leave approval details
-- =================================================================
CREATE PROCEDURE [dbo].[usp_GetLeaveApprovalDetailsForReport]
	@School_Id INT,
	@Academic_Year_Id INT,
	@StartDate DATE,
	@EndDate DATE,
	@StaffGroupId INT,
	@UserId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @tblLeaveDetails AS TABLE
	(
		UserLeaveDetailsId INT,
		UserId INT,
		DesignationSortOrder INT,
		StaffName NVARCHAR(200),
		FirstName NVARCHAR(100),
		MiddleName NVARCHAR(100),
		LastName NVARCHAR(100),
		Designation NVARCHAR(100),
		OriginalStaffGroupsId INT,
		LeaveName NVARCHAR(100),
		LeaveStartDate DATE,
		LeaveEndDate DATE,
		TotalDays INT,
		Description NVARCHAR(100),
		LeaveSubmittedDate DATETIME,
		LeaveApprovedDate DATETIME,
		ApprovedBy NVARCHAR(150)
	)

	INSERT INTO @tblLeaveDetails
	SELECT ULD.Id, apu.UserId, APU.DesignationSortOrder, APU.UserName, APU.FirstName, APU.MiddleName, APU.LastName, apu.Designation, SG.OriginalStaffGroupsId, SL.ShortName,
	StartDate,EndDate, TotalDays, 
	CASE WHEN LEN(Description) > 100 THEN left(Description,98)+'..' ELSE Description END AS Description,
	ULD.InsertDate,NULL,NULL
	FROM UserLeaveDetails ULD
	INNER JOIN UsersStaffGroupsAssociation USGA
	ON ULD.UserId = USGA.UserId
	INNER JOIN vw_AllPayrollUsers APU
	ON USGA.UserId = APU.UserId
	INNER JOIN StaffLeaves SL
	ON ULD.LeaveId = SL.LeaveId
	INNER JOIN StaffGroups SG
	ON USGA.StaffGroupsId = SG.StaffGroupsId
	where ULD.SchoolId = @School_Id
	and ULD.AcademicYearId = @Academic_Year_Id
	AND IsDeleted = 0
	and (ULD.UserId = @UserId OR @UserId = 0)
	and StatusId = 3
	and convert(date,StartDate) between @StartDate and @EndDate
	AND USGA.Is_Deleted = 'N'
	AND (USGA.StaffGroupsId = @StaffGroupId OR @StaffGroupId = 0)
	
	UPDATE TLD
	SET LeaveApprovedDate = SS.InsertDate,
	ApprovedBy = SS.UserName
	FROM @tblLeaveDetails TLD
	INNER JOIN
	(
		select LAD.UserLeaveDetailsId, APU.UserName, InsertDate
		from LeaveApprovalDetails LAD
		LEFT OUTER JOIN vw_AllPayrollUsers APU
		ON LAD.ReportingUserId = APU.UserId
		INNER JOIN
		(
			SELECT LAD.UserLeaveDetailsId, MAX(LAD.Id) AS MaxId
			FROM LeaveApprovalDetails LAD
			INNER JOIN @tblLeaveDetails TLD
			ON LAD.UserLeaveDetailsId = TLD.UserLeaveDetailsId
			--INNER JOIN LeaveApprovalConfigurationDetails LACD
			--ON TLD.UserId = LACD.UserId
			--AND LAD.ReportingUserId = LACD.ReportingUserId
			WHERE LAD.SchoolId = @School_Id
			AND LAD.AcademicYearID = @Academic_Year_Id
			AND LAD.IsDeleted = 0
			AND LAD.StatusId = 3
			--AND LACD.IsDeleted = 0
			--AND LACD.IsFinalApprover = 1
			GROUP BY LAD.UserLeaveDetailsId
		)S
		ON LAD.Id = S.MaxId
		AND LAD.UserLeaveDetailsId = S.UserLeaveDetailsId
	)SS
	ON TLD.UserLeaveDetailsId = SS.UserLeaveDetailsId

	SELECT TLD.UserLeaveDetailsId, SS.SrNo,
			StaffName,
			Designation,			
			LeaveStartDate,
			LeaveEndDate,			
			LeaveSubmittedDate as SubmittedDate,
			LeaveApprovedDate as ApprovedDate,
			LeaveName,
			TotalDays,			
			ISNULL(ApprovedBy,'') AS ApprovedBy,
			Description
	FROM @tblLeaveDetails TLD
	INNER JOIN
	(
		select UserId,ROW_NUMBER() OVER (ORDER BY OriginalStaffGroupsId,DesignationSortOrder,FirstName,MiddleName,LastName) AS SrNo
		from
		(
			SELECT DISTINCT UserId,OriginalStaffGroupsId,DesignationSortOrder,FirstName,MiddleName,LastName
			FROM @tblLeaveDetails
		)S
	)SS
	ON TLD.UserId = SS.UserId
END
GO