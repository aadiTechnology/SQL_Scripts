SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sachin
-- Create date: 20-Apr-2026
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserRolewisePPSIdentyCard]
	@School_Id INT,
	@academic_Year_Id INT,
	@UserRoleId INT,
	@UserId INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @UserId IS NULL
		SET @UserId = 0

	DECLARE @tblUserDetails AS TABLE
	(
			UserRoleId INT,
			UserId INT,		
			UserName NVARCHAR(150), 		
			DesignationName NVARCHAR(100),
			EmployeeNo NVARCHAR(50),
			Mobile_Number NVARCHAR(20),
			PersonAddress NVARCHAR(500),
			EmergencyNo  NVARCHAR(20) ,
			DateOfBirth DATE,
			DateOfJoining DATE,
			BloodGroup Nvarchar(20),
			DesignationSortOrder INT,
			BinaryPhotoImage Image		
	)
	
		-- Admin
	IF @UserRoleId = 1
	BEGIN
			INSERT INTO @tblUserDetails
			SELECT UM.User_Role_Id,
				   UM.User_Id,
				   UM.User_First_Name + ' '+UM.User_Middle_Name + ' '+ UM.User_Last_Name,	   
				   TDM.Teacher_Designation_Name,
				   UBD.EmployeeNo,
				   UM.Mobile_Number,
				   UM.Address,
				   UM.EmergencyContactNumber,
				   UM.DOB,
				   UBD.JoiningDate,
				   ISNULL(BG.BloodGroup,''),
				   TDM.SortOrder,
				   UM.BinaryPhotoImage	   
			FROM User_Master UM
			INNER JOIN Teacher_Designation_Master TDM
			ON UM.DesignationId = TDM.Teacher_Designation_Id
			INNER JOIN UserBasicDetails UBD
			ON UM.User_Id = UBD.UserId
			LEFT OUTER JOIN BloodGroups BG
			ON UBD.BloodGroupId = BG.Id
			AND BG.IsDeleted = 0
			WHERE UM.School_Id = @School_Id
			AND UM.Is_Deleted = 'N'
			AND UM.IsInternalUser = 0
			AND UM.Is_Locked = 'N'
			AND TDM.Is_Deleted = 'N'
			AND (UM.User_Id = @UserId OR @UserId = 0)
			AND UM.User_Role_Id = 1
	END
	-- Teacher
	IF @UserRoleId = 2
	BEGIN
			INSERT INTO @tblUserDetails
			SELECT UM.User_Role_Id,
				   UM.User_Id,
				   BTD.TeacherName,	   
				   TDM.Teacher_Designation_Name,
				   UBD.EmployeeNo,
				   BTD.Mobile_Number,
				   BTD.Local_Address, 
				   UM.EmergencyContactNumber,
				   BTD.Date_of_Birth,
				   UBD.JoiningDate,
				   ISNULL(BG.BloodGroup,''),
				   TDM.SortOrder,
				   BTD.BinaryPhotoImage
			FROM vw_BaseTeacherDetails BTD
			INNER JOIN User_Master UM
			ON BTD.User_Id = UM.User_Id
			INNER JOIN Teacher_Designation_Master TDM
			ON BTD.Designation_Id = TDM.Teacher_Designation_Id
			INNER JOIN UserBasicDetails UBD
			ON BTD.User_Id = UBD.UserId
			LEFT OUTER JOIN BloodGroups BG
			ON UBD.BloodGroupId = BG.Id
			AND BG.IsDeleted = 0
			WHERE BTD.School_Id = @School_Id
			and btd.academic_year_id = @academic_Year_Id
			and btd.Is_Deleted = 'N'
			AND UM.Is_Deleted = 'N'
			AND UM.IsInternalUser = 0
			AND UM.Is_Locked = 'N'
			AND TDM.Is_Deleted = 'N'
			AND (BTD.User_Id = @UserId OR @UserId = 0)
			AND UM.User_Role_Id = 2
	END

	-- Admin staff
	IF @UserRoleId = 6
	BEGIN
			INSERT INTO @tblUserDetails
			SELECT UM.User_Role_Id,
				   UM.User_Id,
				   BSD.SupervisorName,	   
				   TDM.Teacher_Designation_Name,
				   UBD.EmployeeNo,
				   BSD.Mobile_Number,
				   UM.Address,
				   UM.EmergencyContactNumber,
				   UM.DOB,
				   UBD.JoiningDate,
				   ISNULL(BG.BloodGroup,''),
				   TDM.SortOrder,
				   UM.BinaryPhotoImage
			FROM vw_BaseSupervisorDetails BSD
			INNER JOIN User_Master UM
			ON BSD.User_Id = UM.User_Id
			INNER JOIN Teacher_Designation_Master TDM
			ON BSD.Designation_Id = TDM.Teacher_Designation_Id
			INNER JOIN UserBasicDetails UBD
			ON BSD.User_Id = UBD.UserId
			LEFT OUTER JOIN BloodGroups BG
			ON UBD.BloodGroupId = BG.Id
			AND BG.IsDeleted = 0
			WHERE BSD.School_Id = @School_Id
			and BSD.Is_Deleted = 'N'
			AND UM.Is_Deleted = 'N'
			AND UM.IsInternalUser = 0
			AND UM.Is_Locked = 'N'
			AND TDM.Is_Deleted = 'N'
			AND (BSD.User_Id = @UserId OR @UserId = 0)
			AND UM.User_Role_Id = 6
	END

	-- Other Staff
	IF @UserRoleId = 7
	BEGIN
			INSERT INTO @tblUserDetails
			SELECT UM.User_Role_Id,
				   UM.User_Id,
				   BOSD.OtherStaffName,	   
				   TDM.Teacher_Designation_Name,
				   UBD.EmployeeNo,
				   BOSD.MobileNo,
				   UM.Address,
				   UM.EmergencyContactNumber,
				   UM.DOB,
				   UBD.JoiningDate,
				   ISNULL(BG.BloodGroup,''),
				   TDM.SortOrder,
				   UM.BinaryPhotoImage
			FROM vw_BaseOtherStaffDetails BOSD
			INNER JOIN User_Master UM
			ON BOSD.UserId = UM.User_Id
			INNER JOIN Teacher_Designation_Master TDM
			ON BOSD.DesignationId = TDM.Teacher_Designation_Id
			INNER JOIN UserBasicDetails UBD
			ON BOSD.UserId = UBD.UserId
			LEFT OUTER JOIN BloodGroups BG
			ON UBD.BloodGroupId = BG.Id
			AND BG.IsDeleted = 0
			WHERE BOSD.SchoolId = @School_Id
			and BOSD.Is_Deleted = 'N'
			AND UM.Is_Deleted = 'N'
			AND UM.IsInternalUser = 0
			AND UM.Is_Locked = 'N'
			AND TDM.Is_Deleted = 'N'
			AND (BOSD.UserId = @UserId OR @UserId = 0)
			AND UM.User_Role_Id = 7
	END

	SELECT ROW_NUMBER() OVER (ORDER BY UserRoleId, DesignationSortOrder) as RowNo,
		UserRoleId,
		UserId,
		UPPER(UserName) AS UserName,
		UPPER(DesignationName) AS DesignationName,
		ISNULL(EmployeeNo,'') AS EmployeeNo,
		Mobile_Number,
		PersonAddress,
		EmergencyNo,
		CASE WHEN DateOfBirth IS NULL THEN '' ELSE FORMAT(DateOfBirth,'dd/MM/yyyy') END AS DateOfBirth,
		CASE WHEN DateOfJoining IS NULL THEN '' ELSE FORMAT(DateOfJoining,'dd/MM/yyyy') END AS DateOfJoining,
		BloodGroup,
		DesignationSortOrder,
		SM.Address + ', '+ SM.City+' '+ SM.Pincode AS SchoolAddress,
		'Tel : '+SM.Phone_Number AS SchoolContactNo,
		'Email : '+SM.Email AS SchoolEmailAddress,
		BinaryPhotoImage 
	FROM @tblUserDetails
	INNER JOIN School_Master SM
	ON SM.School_Id = @School_Id
	WHERE SM.Is_Deleted = 'N'   
END