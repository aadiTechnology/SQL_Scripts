/****** Object:  StoredProcedure [Mobile].[usp_SaveAlumni] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [Mobile].[usp_SaveAlumni]
    @AlumniId               INT = NULL,
    @SchoolId               INT,
    @FirstName              NVARCHAR(100),
    @MiddleName             NVARCHAR(100) = NULL,
    @LastName               NVARCHAR(100),
    @MobileNumber           NVARCHAR(15),
    @Email                  NVARCHAR(150),
    @Gender                 CHAR(1),
    @BirthDate              DATE,
    @Nationality            NVARCHAR(100),
    @ResidingIn             CHAR(1),
    @Country                NVARCHAR(100),
    @PassportNumber         NVARCHAR(50) = NULL,
    @PermanentAddress       NVARCHAR(MAX) = NULL,
    @CorrespondenceAddress  NVARCHAR(MAX) = NULL,
    @IsSameAddress          BIT = 0,
    @City                   NVARCHAR(100),
    @State                  NVARCHAR(100),
    @DepartmentId           INT,
    @OtherDepartment        NVARCHAR(100) = NULL,
    @SchoolPassingYear      INT,
    @CurrentStatus          CHAR(2),
    @InstituteName          NVARCHAR(200) = NULL,
    @SelfEmployedDetails    NVARCHAR(MAX) = NULL,
    @CurrentDesignation     NVARCHAR(200) = NULL,
    @CompanyName            NVARCHAR(200) = NULL,
    @SpecialMentions        NVARCHAR(MAX) = NULL,
    @AchievementImage       VARBINARY(MAX) = NULL,
    @AlumniPhoto            VARBINARY(MAX) = NULL,
    @PhotoPermissionGranted BIT,
    @HowCanHelp             NVARCHAR(MAX) = NULL,
    @SubmissionMode         CHAR(1),
    @UserId                 INT = NULL,
    @ProgrammeIds           NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ResultAlumniId INT;

    -- ============================
    -- DUPLICATE CHECK
    -- ============================
    IF EXISTS (
        SELECT  1
        FROM    dbo.AlumniMaster
        WHERE   SchoolId            = @SchoolId
          AND   IsDeleted           = 0
          AND   LOWER(FirstName)    = LOWER(@FirstName)
          AND   LOWER(LastName)     = LOWER(@LastName)
          AND   MobileNumber        = @MobileNumber
          AND   (@AlumniId IS NULL OR AlumniId <> @AlumniId)
    )
    BEGIN
        SELECT CAST(-1 AS INT) AS AlumniId;
        RETURN;
    END

    -- ============================
    -- INSERT or UPDATE
    -- ============================
    IF @AlumniId IS NULL
    BEGIN
        INSERT INTO dbo.AlumniMaster
        (
            SchoolId,       FirstName,          MiddleName,         LastName,
            MobileNumber,   Email,              Gender,             BirthDate,
            Nationality,    ResidingIn,         Country,            PassportNumber,
            PermanentAddress, CorrespondenceAddress, IsSameAddress,
            City,           [State],
            DepartmentId,   OtherDepartment,    SchoolPassingYear,  CurrentStatus,
            InstituteName,  SelfEmployedDetails, CurrentDesignation, CompanyName,
            SpecialMentions, AchievementImage,  AlumniPhoto,        PhotoPermissionGranted,
            HowCanHelp,     SubmissionMode,     CreatedBy,          CreatedDate
        )
        VALUES
        (
            @SchoolId,      @FirstName,         @MiddleName,        @LastName,
            @MobileNumber,  @Email,             @Gender,            @BirthDate,
            @Nationality,   @ResidingIn,        @Country,           @PassportNumber,
            @PermanentAddress, @CorrespondenceAddress, @IsSameAddress,
            @City,          @State,
            @DepartmentId,  @OtherDepartment,   @SchoolPassingYear, @CurrentStatus,
            @InstituteName, @SelfEmployedDetails, @CurrentDesignation, @CompanyName,
            @SpecialMentions, @AchievementImage, @AlumniPhoto,      @PhotoPermissionGranted,
            @HowCanHelp,    @SubmissionMode,    @UserId,            dbo.GetLocalDate(DEFAULT)
        );

        SET @ResultAlumniId = SCOPE_IDENTITY();
    END
    ELSE
    BEGIN
        UPDATE  dbo.AlumniMaster
        SET     FirstName              = @FirstName,
                MiddleName             = @MiddleName,
                LastName               = @LastName,
                MobileNumber           = @MobileNumber,
                Email                  = @Email,
                Gender                 = @Gender,
                BirthDate              = @BirthDate,
                Nationality            = @Nationality,
                ResidingIn             = @ResidingIn,
                Country                = @Country,
                PassportNumber         = @PassportNumber,
                PermanentAddress       = @PermanentAddress,
                CorrespondenceAddress  = @CorrespondenceAddress,
                IsSameAddress          = @IsSameAddress,
                City                   = @City,
                [State]                = @State,
                DepartmentId           = @DepartmentId,
                OtherDepartment        = @OtherDepartment,
                SchoolPassingYear      = @SchoolPassingYear,
                CurrentStatus          = @CurrentStatus,
                InstituteName          = @InstituteName,
                SelfEmployedDetails    = @SelfEmployedDetails,
                CurrentDesignation     = @CurrentDesignation,
                CompanyName            = @CompanyName,
                SpecialMentions        = @SpecialMentions,
                AchievementImage       = ISNULL(@AchievementImage, AchievementImage),
                AlumniPhoto            = ISNULL(@AlumniPhoto, AlumniPhoto),
                PhotoPermissionGranted = @PhotoPermissionGranted,
                HowCanHelp             = @HowCanHelp,
                UpdatedBy              = @UserId,
                UpdatedDate            = dbo.GetLocalDate(DEFAULT)
        WHERE   AlumniId = @AlumniId
          AND   SchoolId = @SchoolId;

        SET @ResultAlumniId = @AlumniId;
    END

    -- ============================
    -- PROGRAMME ASSOCIATIONS
    -- ============================
    IF @ProgrammeIds IS NOT NULL AND LEN(@ProgrammeIds) > 0
    BEGIN
        UPDATE dbo.AlumniAcademicProgrammes
        SET IsDeleted = 1
        WHERE AlumniId = @ResultAlumniId
        AND AlumniId NOT IN
        (
            SELECT Ids
            FROM dbo.udf_GetTableFromList(@ProgrammeIds)
        );

        INSERT INTO dbo.AlumniAcademicProgrammes (AlumniId, ProgrammeId, IsDeleted)
        SELECT @ResultAlumniId, Ids, 0
        FROM dbo.udf_GetTableFromList(@ProgrammeIds)
        WHERE Ids NOT IN
        (
            SELECT ProgrammeId
            FROM AlumniAcademicProgrammes
            WHERE AlumniId = @ResultAlumniId
            AND IsDeleted = 0
        );
    END

    SELECT @ResultAlumniId AS AlumniId;
END
GO
