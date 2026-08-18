/****** Object:  StoredProcedure [Mobile].[usp_GetAlumniList]    Script Date: 8/4/2026 2:12:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [Mobile].[usp_GetAlumniList]
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
                ISNULL(
                    CASE
                        WHEN LOWER(LTRIM(RTRIM(DM.DepartmentName))) = N'other'
                             AND ISNULL(AM.OtherDepartment, N'') <> N''
                        THEN AM.OtherDepartment
                        ELSE DM.DepartmentName
                    END,
                    N''
                ) AS Department,
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
                    OR AM.OtherDepartment             LIKE N'%' + @Filter + N'%'
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

