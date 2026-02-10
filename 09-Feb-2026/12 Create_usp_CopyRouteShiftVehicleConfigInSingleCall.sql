/****** Object:  StoredProcedure [Transport].[usp_CopyRouteShiftVehicleConfig]    Script Date: 06-02-2026 14:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sachin
-- Create date: 26-Oct-2023
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Transport].[usp_CopyRouteShiftVehicleConfigInSingleCall]
	@SchoolId			INT,
	@AcademicYearId		INT,
	@UpdatedById		INT,
	@SourceId			INT,
	@VehicleIds			XML,
	@DisplayName		NVARCHAR(100)
AS
BEGIN
	/********************************************************************************************
		Purpose:
			Copy configuration from a source vehicle/journey/route override
			to one or more target vehicle/journey/route combinations.

		Notes:
			- Compatible with Azure SQL Database (v12+).
			- Uses minimal NOLOCK hints on read-mostly/config tables where
			  short-lived dirty reads are acceptable to reduce blocking.
			- Core logic is preserved; changes are for clarity and performance only.
	*********************************************************************************************/

	-- Prevent extra result sets from interfering with callers
	SET NOCOUNT ON;

	-- Fail the whole batch if any runtime error occurs inside a statement
	SET XACT_ABORT ON;

	DECLARE @SourceVehicleId INT,
			@SourceJourneyId INT,
			@Name NVARCHAR(100),
			@StartDate DATE,
		    @EndDate DATE,
		    @TypeId INT,
			@SourceRouteId INT,
			@WeekdayIds NVARCHAR(100) =''

	/*********************************************
		Get source override master configuration
	**********************************************/
	SELECT TOP (1)
		   @SourceVehicleId = SourceVehicleId,
		   @SourceJourneyId = SourceJourneyId,
		   @Name			= Name,
		   @StartDate		= StartDate,
		   @EndDate			= EndDate,
		   @TypeId			= TypeId,
		   @SourceRouteId	= SourceRouteId
	FROM Transport.ConfigOverrideMaster WITH (NOLOCK)
	WHERE SchoolId		= @SchoolId
	  AND AcademicYearId = @AcademicYearId
	  AND IsDeleted		= 0
	  AND Id			= @SourceId;

	IF @TypeId = -2
	BEGIN
		-- Build comma-separated weekday list for the source override
		SET @WeekdayIds = 
		(
			SELECT ',' + WeekdayId
			FROM TRANSPORT.ConfigOverrideWeekdayMaster WITH (NOLOCK)
			WHERE ConfigOverrideMasterId = @SourceId
			  AND IsDeleted = 0
			FOR XML PATH(''), TYPE
		).value('.','nvarchar(4000)');

		IF LEN(@WeekdayIds) > 0
			SET @WeekdayIds = SUBSTRING(@WeekdayIds, 2, LEN(@WeekdayIds));
	END
	ELSE
		SET @WeekdayIds = '';
	
	/*********************************************
		Shred incoming XML list of target vehicles
	**********************************************/
	DECLARE @tblVehicles TABLE
	(
		Id INT IDENTITY(1,1) PRIMARY KEY,
		VehicleId INT,
		JourneyId INT,
		RouteId INT,
		VehicleNo NVARCHAR(50)
	)

	INSERT INTO @tblVehicles
	SELECT T.c.value('./VehicleId[1]','INT'),
		   T.c.value('./JourneyId[1]','INT'),
		   T.c.value('./RouteId[1]','INT'),
		   ''
	FROM @VehicleIds.nodes('ArrayOfVehicleJourney/VehicleJourney') T(c);
	
	-- Resolve vehicle numbers once, up-front
	UPDATE TS
	SET VehicleNo = VM.VehicleNumber
	FROM @tblVehicles TS
	INNER JOIN TRANSPORT.VehicleMaster VM WITH (NOLOCK)
		ON TS.VehicleId = VM.VehicleId
	WHERE VM.Academic_Year_Id = @AcademicYearId
	  AND VM.SchoolId = @SchoolId
	  AND VM.Is_Deleted = 0;

	DECLARE @Id INT,
		   @VehicleNo NVARCHAR(50),
		   @VehicleId INT,
		   @TargetJourneyId INT,
		   @TargetRouteId INT,
		   @NameFormat NVARCHAR(100) = '';

	/*********************************************
		Temp tables used across vehicle iterations
		(using temp tables instead of table variables
		allows better cardinality estimates and indexing
		on Azure SQL Database for larger datasets)
	**********************************************/

	IF OBJECT_ID('tempdb..#tblTransportDetails') IS NOT NULL
		DROP TABLE #tblTransportDetails;

	CREATE TABLE #tblTransportDetails
	(
		UserId					INT,
		VehicleId				INT,
		TransportShiftId		INT,
		RouteId					INT,
		TravelerTypeId			INT,
		RouteName				NVARCHAR(100),
		JourneyName				NVARCHAR(100),
		VehicleNo				NVARCHAR(100),
		MinTime					NVARCHAR(50),
		MaxTime					NVARCHAR(50),
		IsDoubleOverrideCase	BIT,
		ExistingOverrideMasterId INT,
		CONSTRAINT PK_tblTransportDetails PRIMARY KEY CLUSTERED
		(
			UserId,
			TravelerTypeId,
			VehicleId,
			TransportShiftId,
			RouteId
		)
	);

	IF OBJECT_ID('tempdb..#tblStudentTransportDetails') IS NOT NULL
		DROP TABLE #tblStudentTransportDetails;

	CREATE TABLE #tblStudentTransportDetails
	(
		UserId					INT,
		TravelerTypeId			INT,
		MinTime					NVARCHAR(50),
		MaxTime					NVARCHAR(50),
		IsDoubleOverrideCase	BIT,
		ExistingOverrideMasterId INT,
		CONSTRAINT PK_tblStudentTransportDetails PRIMARY KEY CLUSTERED
		(
			UserId,
			TravelerTypeId
		)
	);

	DECLARE @tbltempRouteShiftTiming TABLE
		(
			TempId INT IDENTITY(1,1) PRIMARY KEY,
			RouteStopId INT,
			RouteShiftVehicleDetailsId INT,
			RouteTimingDetailsId INT,
			TransportShiftId INT,
			VehicleId INT,
			SortOrder INT,
			PickUpTime NVARCHAR(20),
			DropTime NVARCHAR(20),
			InsertedById INT
		)

		DECLARE @NewRSVOverride TABLE
		(	
			RouteStopId INT,
			TransportShiftId INT,
			VehicleId INT,
			RouteShiftVehicleDetailsId INT
		);

		DECLARE @Id_U1 INT = 0
		DECLARE @RouteId_U1 INT=0

	/*********************************************
		Loop through each target vehicle/journey/route
	**********************************************/
	WHILE EXISTS (SELECT 1 FROM @tblVehicles)
	BEGIN
		-- Fetch next target combination (lowest identity)
		SELECT TOP (1)
			   @Id = Id,
			   @VehicleNo = VehicleNo,
			   @VehicleId = VehicleId,
			   @TargetJourneyId = JourneyId,
			   @TargetRouteId = RouteId
		FROM @tblVehicles
		ORDER BY Id;

		SET @NameFormat = @DisplayName + ' for ' + @VehicleNo;

		------- First USP start---------------

		INSERT INTO @tbltempRouteShiftTiming
		(
			RouteStopId,
			RouteShiftVehicleDetailsId,
			RouteTimingDetailsId,
			SortOrder,
			PickUpTime,
			DropTime
		)
		select RSD1.RouteStopId,
				   0 AS RouteShiftVehicleDetailsId,
				   0 AS RouteTimingDetailsId,
				   RSTD.SortOrder,
				   RSTD.PickupTime AS PickUpTime,
				   RSTD.DropTime
			from Transport.RouteShiftTimingOverrideDetails RSTD
			INNER JOIN TRANSPORT.RouteShiftVehicleOverrideDetails RSVD
				ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
			INNER JOIN Transport.RouteStopDetails RSD
				ON RSVD.RouteStopId = RSD.RouteStopId
			INNER JOIN Transport.RouteStopDetails RSD1
				ON RSD.StopId = RSD1.StopId
			WHERE RSTD.SchoolId			= @SchoolId
			  AND RSTD.AcademicYearId	= @AcademicYearId
			  AND RSTD.Is_Deleted		= 0
			  AND RSVD.Is_Deleted		= 0
			  AND RSVD.VehicleId		= @SourceVehicleId
			  AND RSVD.TransportShiftId = @SourceJourneyId
			  AND RSD.Is_Deleted		= 0
			  AND RSD1.Is_Deleted		= 0
			  AND RSD1.RouteId			= @TargetRouteId
			  AND RSD.RouteId			= @SourceRouteId			
			  AND RSVD.OverrideMasterId = @SourceId

		SET @Id_U1 = 0
		SET @RouteId_U1 = 0
		
		-- Determine route from first stop in the configuration
		SELECT TOP (1) @RouteId_U1 =  RSD.RouteId
		FROM Transport.RouteStopDetails RSD WITH (NOLOCK)
		INNER JOIN Transport.RouteMaster RM WITH (NOLOCK)
				ON RSD.RouteId = RM.RouteId
		WHERE RSD.Is_Deleted = 0
		  AND RM.Is_Deleted = 0
		  AND RSD.RouteStopId =(SELECT TOP 1 RouteStopId FROM @tbltempRouteShiftTiming);

		-- Insert new override master record for the current target combination
		INSERT INTO Transport.ConfigOverrideMaster
			SELECT @NameFormat,
					@StartDate,
					@EndDate,
					@RouteId_U1,
					@VehicleId,
					@TargetJourneyId,					
					@TypeId,
					@SchoolId,
					@AcademicYearId,
					0,
					dbo.GetLocalDate(DEFAULT),
					@UpdatedById,
					NULL,
					NULL;

			SELECT @Id_U1 = SCOPE_IDENTITY();

			IF @TypeId = -2
			BEGIN
				INSERT INTO  Transport.ConfigOverrideWeekdayMaster
				SELECT @Id_U1, Ids, 0
				FROM DBO.udf_GetTableFromList(@WeekdayIds);
			END

	-- Insert override RouteShiftVehicle rows and capture their identities
	INSERT INTO Transport.RouteShiftVehicleOverrideDetails
	(
		OverrideMasterId,
		RouteStopId,
		TransportShiftId,
		VehicleId,
		Is_Deleted,
		InsertDate,
		InsertedById,
		UpdateDate,
		UpdatedById,
		SchoolId,
		AcademicYearId
	)
	OUTPUT inserted.RouteStopId,inserted.TransportShiftId,inserted.VehicleId, inserted.RouteShiftVehicleDetailsId
	INTO @NewRSVOverride (RouteStopId,TransportShiftId,VehicleId, RouteShiftVehicleDetailsId)
	SELECT	@Id_U1,
			T.RouteStopId,
			@TargetJourneyId,
			@VehicleId,
			0,
			dbo.GetLocalDate(DEFAULT),
			@UpdatedById,
			dbo.GetLocalDate(DEFAULT),
			@UpdatedById,
			@SchoolId,
			@AcademicYearId
	FROM @tbltempRouteShiftTiming T
	WHERE T.RouteShiftVehicleDetailsId = 0
	  AND T.RouteTimingDetailsId = 0;

	-- Insert timing records for newly created override vehicle rows
	INSERT INTO Transport.RouteShiftTimingOverrideDetails
	(
		RouteStopId,
		RouteShiftVehicleDetailsId,
		SortOrder,
		PickupTime,
		DropTime,
		Is_Deleted,
		InsertDate,
		InsertedById,
		UpdateDate,
		UpdatedById,
		SchoolId,
		AcademicYearId
	)
	SELECT  T.RouteStopId,
			N.RouteShiftVehicleDetailsId,
			T.SortOrder,
			T.PickUpTime,
			T.DropTime,
			0,
			dbo.GetLocalDate(DEFAULT),
			@UpdatedById,
			dbo.GetLocalDate(DEFAULT),
			@UpdatedById,
			@SchoolId,
			@AcademicYearId
	FROM @tbltempRouteShiftTiming T
	INNER JOIN @NewRSVOverride N
		ON T.RouteStopId = N.RouteStopId

		-- Update existing timing override rows when they already exist
		UPDATE RTOD
	SET   RTOD.SortOrder = T.SortOrder,
		  RTOD.PickUpTime = T.PickUpTime,
		  RTOD.DropTime = T.DropTime,
		  RTOD.UpdatedById = @UpdatedById,
		  RTOD.SchoolId = @SchoolId,
		  RTOD.AcademicYearId = @AcademicYearId
	FROM Transport.RouteShiftTimingOverrideDetails RTOD
	INNER JOIN @tbltempRouteShiftTiming T
		ON RTOD.RouteTimingDetailsId = T.RouteTimingDetailsId
	WHERE T.RouteTimingDetailsId <> 0;

		-- Reset temp tables for this vehicle iteration
		TRUNCATE TABLE #tblTransportDetails;
		TRUNCATE TABLE #tblStudentTransportDetails;

		INSERT INTO #tblTransportDetails
			SELECT DISTINCT TTD.UserId, RSVD.VehicleId, RSVD.TransportShiftId, RSD.RouteId, TTD.TravelerTypeId, N'', N'', N'', N'', N'',0,0
			FROM Transport.TravelerTransportDetails TTD
			INNER JOIN Transport.RouteShiftTimingDetails RSTD
			ON TTD.RouteTimingDetailsId = RSTD.RouteTimingDetailsId
			INNER JOIN TRANSPORT.RouteShiftVehicleDetails RSVD
			ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
			INNER JOIN Transport.RouteStopDetails RSD
			ON RSVD.RouteStopId = RSD.RouteStopId
			WHERE RSTD.SchoolId = @SchoolId
			AND rstd.AcademicYearId = @AcademicYearId
			AND rstd.Is_Deleted = 0
			AND RSVD.Is_Deleted = 0
			AND RSD.Is_Deleted = 0
			AND TTD.Is_Deleted = 0
			AND (RSD.RouteId = @RouteId_U1 OR @RouteId_U1 = 0)
			AND (RSVD.TransportShiftId = @TargetJourneyId OR @TargetJourneyId = 0)
			AND (RSVD.VehicleId = @VehicleId OR @VehicleId = 0)			
			OPTION (RECOMPILE);

			INSERT INTO #tblTransportDetails
			SELECT TJOD.UserId, COM.SourceVehicleId,COM.SourceJourneyId,COM.SourceRouteId,TJOD.TravelerTypeId, N'', N'', N'', N'', N'', 1,OM.Id
			FROM transport.ConfigOverrideMaster COM
			INNER JOIN transport.OverrideMaster OM
			ON OM.StartDate BETWEEN COM.StartDate AND COM.EndDate
			AND OM.EndDate BETWEEN COM.StartDate AND COM.EndDate
			AND OM.TargetVehicleId = COM.SourceVehicleId
			AND OM.TargetJourneyId = COM.SourceJourneyId
			AND OM.TargetRouteId = COM.SourceRouteId
			INNER JOIN Transport.TravelerJourneyOverrideDetails TJOD
			ON OM.Id = TJOD.OverrideMasterId
			LEFT OUTER JOIN #tblTransportDetails TTD
			ON TJOD.UserId = TTD.UserId
			AND TJOD.TravelerTypeId = TTD.TravelerTypeId
			where COM.SchoolId = @SchoolId
			AND COM.AcademicYearId = @AcademicYearId
			AND COM.IsDeleted = 0
			AND TJOD.IsDeleted = 0
			AND TJOD.CategoryId = 3
			and COM.Id = @Id_U1
			AND TTD.UserId IS NULL

			UPDATE SS1
			SET MinTime = SS2.MinPickUpTime,
				MaxTime = SS2.MaxPickupTime,
				RouteName = ss2.RouteName,
				VehicleNo = ss2.VehicleNumber,
				JourneyName = ss2.TransportShiftName
			FROM #tblTransportDetails SS1
			INNER JOIN
			(
				select RSVD.VehicleId, rsvd.TransportShiftId,rm.RouteId,
					RM.RouteNo, RM.RouteName, SM.TransportShiftName, VM.VehicleNumber, MIN(CONVERT(TIME,RSTD.PickupTime)) AS MinPickUpTime, max(CONVERT(TIME,rstd.PickupTime)) as MaxPickupTime
				FROM Transport.RouteShiftTimingOverrideDetails RSTD
				INNER JOIN TRANSPORT.RouteShiftVehicleOverrideDetails RSVD
				ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
				INNER JOIN Transport.RouteStopDetails RSD
				ON RSVD.RouteStopId = RSD.RouteStopId
				INNER JOIN Transport.ShiftMaster SM
				ON RSVD.TransportShiftId = SM.TransportShiftId
				INNER JOIN Transport.RouteMaster RM
				ON RSD.RouteId = RM.RouteId
				INNER JOIN TRANSPORT.VehicleMaster VM
				ON RSVD.VehicleId = VM.VehicleId
				where RSTD.SchoolId = @SchoolId
				and rstd.AcademicYearId = @AcademicYearId
				and rstd.Is_Deleted = 0
				and RSVD.Is_Deleted = 0
				and RSD.Is_Deleted = 0
				and SM.Is_Deleted = 0
				AND RM.Is_Deleted = 0
				AND VM.Is_Deleted = 0
				AND RSVD.OverrideMasterId = @Id_U1
				AND (RSD.RouteId = @RouteId_U1 OR @RouteId_U1 = 0)
				AND (RSVD.TransportShiftId = @TargetJourneyId OR @TargetJourneyId = 0)
				AND (RSVD.VehicleId = @VehicleId OR @VehicleId = 0)
				AND SM.TransportShiftName LIKE '%PICKUP%'
				group  by RSVD.VehicleId, rsvd.TransportShiftId,rm.RouteId,RM.RouteNo, RM.RouteName, SM.TransportShiftName, VM.VehicleNumber
			)SS2
			ON SS1.RouteId = SS2.RouteId
			AND SS1.VehicleId = SS2.VehicleId
			AND SS1.TransportShiftId = SS2.TransportShiftId
			AND SS1.TravelerTypeId = 1

			UPDATE SS1
			SET MinTime = SS2.MinDropTime,
				MaxTime = SS2.MaxDropTime,
				RouteName = ss2.RouteName,
				VehicleNo = ss2.VehicleNumber,
				JourneyName = ss2.TransportShiftName
			FROM #tblTransportDetails SS1
			INNER JOIN
			(
				select RSVD.VehicleId, rsvd.TransportShiftId,rm.RouteId,
					RM.RouteNo, RM.RouteName, SM.TransportShiftName, VM.VehicleNumber, MIN(CONVERT(TIME,RSTD.DropTime)) AS MinDropTime, max(CONVERT(TIME,rstd.DropTime)) as MaxDropTime
				FROM Transport.RouteShiftTimingOverrideDetails RSTD
				INNER JOIN TRANSPORT.RouteShiftVehicleOverrideDetails RSVD
				ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
				INNER JOIN Transport.RouteStopDetails RSD
				ON RSVD.RouteStopId = RSD.RouteStopId
				INNER JOIN Transport.ShiftMaster SM
				ON RSVD.TransportShiftId = SM.TransportShiftId
				INNER JOIN Transport.RouteMaster RM
				ON RSD.RouteId = RM.RouteId
				INNER JOIN TRANSPORT.VehicleMaster VM
				ON RSVD.VehicleId = VM.VehicleId
				where RSTD.SchoolId = @SchoolId
				and rstd.AcademicYearId = @AcademicYearId
				and rstd.Is_Deleted = 0
				and RSVD.Is_Deleted = 0
				and RSD.Is_Deleted = 0
				and SM.Is_Deleted = 0
				AND RM.Is_Deleted = 0
				AND VM.Is_Deleted = 0
				AND RSVD.OverrideMasterId = @Id_U1
				AND (RSD.RouteId = @RouteId_U1 OR @RouteId_U1 = 0)
				AND (RSVD.TransportShiftId = @TargetJourneyId OR @TargetJourneyId = 0)
				AND (RSVD.VehicleId = @VehicleId OR @VehicleId = 0)
				AND SM.TransportShiftName LIKE '%DROP%'
				group  by RSVD.VehicleId, rsvd.TransportShiftId,rm.RouteId,RM.RouteNo, RM.RouteName, SM.TransportShiftName, VM.VehicleNumber
			)SS2
			ON SS1.RouteId = SS2.RouteId
			AND SS1.VehicleId = SS2.VehicleId
			AND SS1.TransportShiftId = SS2.TransportShiftId
			AND SS1.TravelerTypeId = 2

			INSERT INTO #tblStudentTransportDetails
			SELECT tsd.UserId, tsd.TravelerTypeId			
			,CONVERT(nvarchar(8), CAST(tsd.MinTime AS time), 108)			
			,CONVERT(nvarchar(8), CAST(tsd.MaxTime AS time), 108)
			,IsDoubleOverrideCase
			,ExistingOverrideMasterId
			FROM #tblTransportDetails tsd
			INNER JOIN vw_BaseStudentDetails BSD
			ON TSD.UserId = BSD.User_Id
			inner join YearWise_Student_Details ysd
			on bsd.SchoolWise_Student_Id = ysd.Student_Id
			where bsd.SchoolLeft_Date is null
			and ysd.School_Id = @SchoolId
			and ysd.Academic_Year_ID = @AcademicYearId
			and ysd.Is_Deleted = 'N'

				update TJD
				set MinTime = STD.MinTime,
					MaxTime = std.MaxTime,
					UpdatedById = @UpdatedById,
					UpdateDate = DBO.GetLocalDate(DEFAULT)
				from Transport.TravelerJourneyOverrideDetails TJD
				INNER JOIN #tblStudentTransportDetails STD
				ON TJD.UserId = STD.UserId
				and TJD.TravelerTypeId = STD.TravelerTypeId
				where tjd.SchoolId = @SchoolId
				and TJD.IsDeleted = 0
				AND OverrideMasterId = @Id_U1
				and CategoryId = @TypeId
				AND STD.IsDoubleOverrideCase = 0

				update TJD
				set MinTime = STD.MinTime,
					MaxTime = std.MaxTime,					
					UpdatedById = @UpdatedById,
					UpdateDate = DBO.GetLocalDate(DEFAULT)
				from Transport.TravelerJourneyOverrideDetails TJD
				INNER JOIN #tblStudentTransportDetails STD
				ON TJD.UserId = STD.UserId
				and TJD.TravelerTypeId = STD.TravelerTypeId
				AND TJD.OverrideMasterId = STD.ExistingOverrideMasterId
				where tjd.SchoolId = @SchoolId
				and TJD.IsDeleted = 0				
				and CategoryId = 3
				AND STD.IsDoubleOverrideCase = 1
				
				insert into Transport.TravelerJourneyOverrideDetails
				SELECT STD.UserId,
					   STD.TravelerTypeId,
					   STD.MinTime,
					   STD.MaxTime,
					   @Id_U1,
					   @TypeId,
					   @StartDate,
					   @EndDate,
					   0,
					   @SchoolId,
					   @AcademicYearId,
					   @UpdatedById,
					   dbo.GetLocalDate(default),
					   NULL,
					   NULL
				from #tblStudentTransportDetails STD
				LEFT OUTER JOIN Transport.TravelerJourneyOverrideDetails TJD
				ON TJD.UserId = STD.UserId
				and TJD.TravelerTypeId = STD.TravelerTypeId
				AND tjd.SchoolId = @SchoolId
				and TJD.IsDeleted = 0
				AND OverrideMasterId = @Id_U1
				and CategoryId = @TypeId				
				WHERE TJD.USERID IS NULL
				AND STD.IsDoubleOverrideCase = 0

		---------end usp 2 -----------------

		---------First USP end----------------

		DELETE FROM @NewRSVOverride
		DELETE FROM @tbltempRouteShiftTiming

		DELETE FROM @tblVehicles
		WHERE Id = @Id
	END   
END