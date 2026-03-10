DECLARE @SchoolId INT = 71
DECLARE @AcademicYearId INT = 13

Update LeaveApprovalConfigurationDetails
set IsDeleted=1
    ,UpdatedById=2
	,UpdateDate=dbo.GetLocalDate(default)
Where SchoolId=@SchoolId
  AND IsDeleted=0

---- 1st Approval : Vikrant
INSERT INTO LeaveApprovalConfigurationDetails
(
UserId,
ReportingUserId,
ApproverSortOrder,
IsFinalApprover,
IsSubmitted,
SchoolId,
AcademicYearId,
IsDeleted,
InsertedById,
InsertDate
)
SELECT 
USGA.UserId,
175,
1,
1,
1,
@SchoolId,
@AcademicYearId,
0,
2,
dbo.GetLocalDate(default)
FROM  UsersStaffGroupsAssociation USGA
WHERE USGA.Is_Deleted= 'N'
AND USGA.SchoolId=@SchoolId
AND USGA.Is_Locked=0
AND NOT EXISTS
(
    SELECT   1 
    FROM LeaveApprovalConfigurationDetails LAC
    WHERE LAC.UserId = USGA.UserId
    AND LAC.ReportingUserId = 175
    AND LAC.SchoolId = @SchoolId
    AND LAC.IsDeleted= 0
)


INSERT INTO LeaveApprovalConfigurationDetails
(
UserId,
ReportingUserId,
ApproverSortOrder,
IsFinalApprover,
IsSubmitted,
SchoolId,
AcademicYearId,
IsDeleted,
InsertedById,
InsertDate
)
SELECT 
USGA.UserId,
4, 
2,
1,
1,
@SchoolId,
@AcademicYearId,
0,
1,
dbo.GetLocalDate(default)
FROM  UsersStaffGroupsAssociation USGA
WHERE USGA.Is_Deleted= 'N'
AND USGA.SchoolId=71
AND USGA.Is_Locked=0
AND NOT EXISTS
(
    SELECT  Top 1 1 
    FROM LeaveApprovalConfigurationDetails LAC
    WHERE LAC.UserId = USGA.UserId
    AND LAC.ReportingUserId = 4
    AND LAC.SchoolId = @SchoolId
  )


