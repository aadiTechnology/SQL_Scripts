-- ============================================
-- Procedure: [Mobile].[usp_GetAlumniList]
-- Purpose:   Returns paginated alumni list for a school along with total count.
--            Excludes soft-deleted rows.
--            Single @Filter parameter searches across Name, Department, Passing Year, Mobile.
-- Compatible with: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- ============================================

IF OBJECT_ID(N'[Mobile].[usp_GetAlumniList]', N'P') IS NOT NULL
    DROP PROCEDURE [Mobile].[usp_GetAlumniList];
GO

CREATE PROCEDURE [Mobile].[usp_GetAlumniList]
    @SchoolId    INT,
    @StartIndex  INT,
    @EndIndex    INT,
    @Filter      NVARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH FilteredAlumni AS
    (
        SELECT  AM.AlumniId,
                LTRIM(RTRIM(AM.FirstName + N' ' + ISNULL(AM.MiddleName + N' ', N'') + AM.LastName)) AS FullName,
                ISNULL(DM.DepartmentName, N'')  AS Department,
                AM.SchoolPassingYear,
                AM.Email,
                AM.MobileNumber,
                AM.SubmissionMode,
                AM.CreatedDate,
                ROW_NUMBER() OVER (ORDER BY AM.CreatedDate DESC) AS RowNum,
                COUNT(*) OVER ()                                 AS TotalCount
        FROM    dbo.AlumniMaster AM
                LEFT JOIN dbo.DepartmentMaster DM
                    ON  DM.DepartmentId = AM.DepartmentId
                    AND DM.SchoolId     = AM.SchoolId
        WHERE   AM.SchoolId  = @SchoolId
          AND   AM.IsDeleted = 0
          AND   (
                    @Filter IS NULL
                    OR (AM.FirstName + N' ' + ISNULL(AM.MiddleName + N' ', N'') + AM.LastName) LIKE N'%' + @Filter + N'%'
                    OR DM.DepartmentName              LIKE N'%' + @Filter + N'%'
                    OR CAST(AM.SchoolPassingYear AS NVARCHAR(4)) LIKE N'%' + @Filter + N'%'
                    OR AM.MobileNumber                LIKE N'%' + @Filter + N'%'
                )
    )
    SELECT  AlumniId,
            FullName,
            Department,
            SchoolPassingYear,
            Email,
            MobileNumber,
            SubmissionMode,
            CreatedDate,
            TotalCount
    FROM    FilteredAlumni
    WHERE   RowNum BETWEEN @StartIndex AND @EndIndex
    ORDER BY RowNum;
END
GO
