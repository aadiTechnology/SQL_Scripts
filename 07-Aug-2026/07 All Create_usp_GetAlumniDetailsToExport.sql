/****** Object:  StoredProcedure [Mobile].[usp_GetAlumniDetailsToExport] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Exports all non-deleted alumni matching the list search filter (no pagination).
-- Excludes AchievementImage and AlumniPhoto binary columns.
CREATE PROCEDURE [Mobile].[usp_GetAlumniDetailsToExport]
    @SchoolId   INT,
    @Filter     NVARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  AM.FirstName                                            AS [First Name],
            ISNULL(AM.MiddleName, N'')                              AS [Middle Name],
            AM.LastName                                             AS [Last Name],
            AM.MobileNumber                                         AS [Mobile No],
            AM.Email                                                AS [Email],
            CASE AM.Gender
                WHEN N'M' THEN N'Male'
                WHEN N'F' THEN N'Female'
                WHEN N'O' THEN N'Other'
                ELSE AM.Gender
            END                                                     AS [Gender],
            CONVERT(VARCHAR(10), AM.BirthDate, 105)                 AS [DOB],
            AM.Nationality                                          AS [Nationality],
            CASE AM.ResidingIn
                WHEN N'I' THEN N'India'
                WHEN N'A' THEN N'Abroad'
                ELSE AM.ResidingIn
            END                                                     AS [Residing In],
            ISNULL(AM.City, N'')                                    AS [City],
            ISNULL(AM.[State], N'')                                 AS [State],
            AM.Country                                              AS [Country],
            ISNULL(DM.DepartmentName, N'')                          AS [Department],
            ISNULL(Prog.ProgrammeNames, N'')                        AS [Academic Programme Completed],
            AM.SchoolPassingYear                                    AS [School Passing Year],
            CASE AM.CurrentStatus
                WHEN N'ST' THEN N'Student'
                WHEN N'SE' THEN N'Self Employed'
                WHEN N'EM' THEN N'Employee'
                ELSE AM.CurrentStatus
            END                                                     AS [Current Status],
            CASE AM.CurrentStatus
                WHEN N'ST' THEN ISNULL(AM.InstituteName, N'')
                WHEN N'EM' THEN ISNULL(AM.CompanyName, N'')
                ELSE ISNULL(NULLIF(AM.InstituteName, N''), ISNULL(AM.CompanyName, N''))
            END                                                     AS [Institute / Company Name],
            ISNULL(AM.SelfEmployedDetails, N'')                     AS [Self Employee Details],
            ISNULL(AM.CurrentDesignation, N'')                      AS [Designation],
            ISNULL(AM.SpecialMentions, N'')                         AS [Achievements],
            ISNULL(AM.HowCanHelp, N'')                              AS [How can help?]
    FROM    dbo.AlumniMaster AM
            LEFT JOIN dbo.DepartmentMaster DM
                ON  DM.DepartmentId = AM.DepartmentId
                AND DM.SchoolId     = AM.SchoolId
-- Programme name source table follows the same naming pattern as DepartmentMaster.
-- If deployment fails on this join, align table name with [Mobile].[usp_GetAcademicProgrammes].
            OUTER APPLY
            (
                SELECT  STUFF((
                            SELECT  N', ' + AP.ProgrammeName
                            FROM    dbo.AlumniAcademicProgrammes AAP
                                    INNER JOIN dbo.AcademicProgrammeMaster AP
                                        ON AP.ProgrammeId = AAP.ProgrammeId
                            WHERE   AAP.AlumniId  = AM.AlumniId
                              AND   AAP.IsDeleted = 0
                            FOR XML PATH(N''), TYPE
                        ).value(N'.', N'NVARCHAR(MAX)'), 1, 2, N'') AS ProgrammeNames
            ) Prog
    WHERE   AM.SchoolId  = @SchoolId
      AND   AM.IsDeleted = 0
      AND   (
                @Filter IS NULL
                OR LTRIM(RTRIM(@Filter)) = N''
                OR (AM.FirstName + N' ' + ISNULL(AM.MiddleName + N' ', N'') + AM.LastName) LIKE N'%' + @Filter + N'%'
                OR DM.DepartmentName LIKE N'%' + @Filter + N'%'
                OR CAST(AM.SchoolPassingYear AS NVARCHAR(4)) LIKE N'%' + @Filter + N'%'
                OR AM.MobileNumber LIKE N'%' + @Filter + N'%'
            )
    ORDER BY AM.CreatedDate DESC;
END
GO
