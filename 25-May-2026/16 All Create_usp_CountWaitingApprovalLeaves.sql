-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CountWaitingApprovalLeaves]
	-- Add the parameters for the stored procedure here
	  @SchoolId INT,
      @UserId INT,
      @AcademicYearId INT,
      @Cnt INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @tblLeaves TABLE
(
    LeaveID INT,
    StatusId INT
)

INSERT INTO @tblLeaves
SELECT ULD.Id,
       CASE WHEN LAD.StatusId IS NULL THEN 6 ELSE LAD.StatusId END
FROM LeaveApprovalConfigurationDetails LACD
INNER JOIN UserLeaveDetails ULD
    ON LACD.UserId=ULD.UserId
LEFT OUTER JOIN LeaveApprovalDetails LAD
    ON LAD.ReportingUserId=LACD.ReportingUserId
    AND LAD.SchoolId=LACD.SchoolId
    AND LAD.AcademicYearID=LACD.AcademicYearId
    AND LAD.UserLeaveDetailsId=ULD.Id
    AND LAD.IsDeleted=0
WHERE LACD.IsDeleted=0
    AND LACD.SchoolId=@SchoolId
    AND LACD.ReportingUserId=@UserId
    AND ULD.IsDeleted=0
    AND ULD.StatusId=1
    AND LACD.AcademicYearId=@AcademicYearId
    AND ULD.AcademicYearId=@AcademicYearId
    AND LAD.ReportingUserId IS NULL

DELETE FROM @tblLeaves
WHERE LeaveID NOT IN
(
    SELECT Submitted.LeaveID
    FROM
    (
        SELECT TL.LeaveID,
               ULD.UserId,
               COUNT(1) AS SubmittedCount
        FROM LeaveApprovalDetails LAD
        INNER JOIN @tblLeaves TL
            ON LAD.UserLeaveDetailsId=TL.LeaveID
        INNER JOIN UserLeaveDetails ULD
            ON LAD.UserLeaveDetailsId=ULD.Id
            AND LAD.SchoolId=ULD.SchoolId
        WHERE LAD.IsDeleted=0
        GROUP BY TL.LeaveID,ULD.UserId
    )Submitted
    INNER JOIN
    (
        SELECT LA.UserId,
               COUNT(1) AS ReportingCount
        FROM LeaveApprovalConfigurationDetails LA
        INNER JOIN
        (
            SELECT UserId,
                   ApproverSortOrder
            FROM LeaveApprovalConfigurationDetails
            WHERE ReportingUserId=@UserId
                AND IsDeleted=0
                AND SchoolId=@SchoolId
                AND AcademicYearId=@AcademicYearId
        )SS
            ON SS.UserId=LA.UserId
            AND SS.ApproverSortOrder>=LA.ApproverSortOrder
        WHERE LA.IsDeleted=0
            AND LA.SchoolId=@SchoolId
            AND LA.AcademicYearId=@AcademicYearId
        GROUP BY LA.UserId
    )Reporting
        ON Submitted.UserId=Reporting.UserId
        AND Submitted.SubmittedCount=Reporting.ReportingCount
)
SELECT @Cnt=COUNT(1)
FROM @tblLeaves
 
END





