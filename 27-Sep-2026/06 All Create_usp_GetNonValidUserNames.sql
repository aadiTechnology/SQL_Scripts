/****** Object:  StoredProcedure [dbo].[usp_GetNonValidUserNames]    Script Date: 9/18/2026 4:30:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vishakha
-- Create date: 11 sept 2026
-- Description:	This USP is used to get valid user names.
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetNonValidUserNames]
	@UserNames XML,
	@SchoolId INT,
	@AcademicYearId INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @tblUserName AS TABLE
	(
		UserName NVARCHAR(300)
	)

	INSERT INTO @tblUserName
	SELECT T.c.value('.','nvarchar(300)') AS UserName
	FROM @UserNames.nodes('ArrayOfString/string') T(c)
	
	select TR.UserName,ISNULL(UserId,0) AS UserId, ISNULL(User_Role_Id,0) AS User_Role_Id
	from @tblUserName TR
	LEFT OUTER JOIN
	(
		select UserName, UserId, User_Role_Id
		FROM vw_AllPayrollUsers A
		inner join User_Master UM
		on A.UserId = UM.User_Id
		where A.Is_Deleted = 'N'
		and UM.Is_Deleted = 'N'
		AND SchoolId = @SchoolId
	)VAPU
	ON TR.UserName = VAPU.UserName

END
