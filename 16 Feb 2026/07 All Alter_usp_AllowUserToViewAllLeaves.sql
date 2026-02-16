SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ======================================================================================================
-- Author:		Sachin
-- Create date: 16-feb-2026
-- Description:	This usp is used to check whether login user is last final approver for any user.
-- ======================================================================================================
CREATE PROCEDURE [dbo].[usp_AllowUserToViewAllLeaves]
	@SchoolId INT,
	@AcademicYearId INT,
	@LoginUserId INT,
	@AllowToViewAllLeave BIT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @AllowToViewAllLeave = 0
	IF EXISTS
	(
		SELECT TOP 1 1
		FROM LeaveApprovalConfigurationDetails LACD WITH(NOLOCK)
		INNER JOIN
		(
			SELECT UserId, MAX(ApproverSortOrder) AS MaxSortOrder
			FROM LeaveApprovalConfigurationDetails WITH(NOLOCK)
			WHERE SchoolId = @SchoolId
			AND AcademicYearId = @AcademicYearId
			AND IsDeleted = 0
			AND ReportingUserId = @LoginUserId
			AND IsFinalApprover = 1	
			GROUP BY UserId
		)S
		ON LACD.UserId = S.UserId
		AND LACD.ApproverSortOrder = S.MaxSortOrder
		WHERE SchoolId = @SchoolId
		AND AcademicYearId = @AcademicYearId
		AND IsDeleted = 0
		AND ReportingUserId = @LoginUserId
		AND IsFinalApprover = 1	
	)
	BEGIN
		SET @AllowToViewAllLeave = 1
	END
END