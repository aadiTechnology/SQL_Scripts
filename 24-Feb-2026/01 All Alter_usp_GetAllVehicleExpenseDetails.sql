/****** Object:  StoredProcedure [dbo].[usp_GetAllVehicleExpenseDetails]    Script Date: 2/24/2026 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sachin
-- Create date: 06-Feb-2026
-- Description:	Get all vehicle expense details with previous and current month comparisons
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetAllVehicleExpenseDetails]
	@School_Id			INT,
	@Academic_Year_Id	INT,
	@VehicleId			INT = 0,
	@MonthId			INT = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF @VehicleId IS NULL
		SET @VehicleId = 0

	IF @MonthId IS NULL
		SET @MonthId = 0

	DECLARE @tblDriverDesignations AS TABLE
	(
		Teacher_Designation_Id INT
	)

	INSERT INTO @tblDriverDesignations
	SELECT Teacher_Designation_Id
	FROM Teacher_Designation_Master
	WHERE Is_Deleted = 'N'
	--AND User_Role_Id = 8
	AND UPPER(Teacher_Designation_Name) LIKE '%DRIVER%'

	--DECLARE @DriverDesignationId INT
	--SELECT @DriverDesignationId = Teacher_Designation_Id
	--FROM Teacher_Designation_Master
	--WHERE Is_Deleted = 'N'
	--AND User_Role_Id = 8
	--AND UPPER(Teacher_Designation_Name) = 'DRIVER'

	DECLARE @CurrentMonthStart DATE,
			@CurrentMonthEnd DATE,
			@PreviousMonthStart DATE,
			@PreviousMonthEnd DATE,
			@CurrentYear INT,
			@AcademicStartDate DATE,
			@AcademicEndDate DATE			

	-- Determine month ranges based on MonthId parameter
	IF @MonthId > 0
	BEGIN
		-- MonthId provided: treat as current month (MonthId is month number 1-12)
		SET @CurrentYear = YEAR(DBO.GetLocalDate(DEFAULT));

		SELECT @AcademicStartDate = Start_date,
			   @AcademicEndDate = End_Date
		FROM SchoolWise_Academic_Year_Master
		WHERE School_Id = @School_Id
		AND Academic_Year_ID  =@Academic_Year_Id
		AND Is_Deleted = 'N'

		-- If MonthId is valid (1-12), use it; otherwise default to current month
		IF @MonthId BETWEEN 4 AND 12
		BEGIN
			SET @CurrentMonthStart = DATEFROMPARTS(YEAR(@AcademicStartDate), @MonthId, 1);
			SET @CurrentMonthEnd = EOMONTH(@CurrentMonthStart);
			SET @PreviousMonthStart = DATEADD(MONTH, -1, @CurrentMonthStart);
			SET @PreviousMonthEnd = EOMONTH(@PreviousMonthStart);
		END
		ELSE IF @MonthId BETWEEN 1 AND 3
		BEGIN
			SET @CurrentMonthStart = DATEFROMPARTS(YEAR(@AcademicEndDate), @MonthId, 1);
			SET @CurrentMonthEnd = EOMONTH(@CurrentMonthStart);
			SET @PreviousMonthStart = DATEADD(MONTH, -1, @CurrentMonthStart);
			SET @PreviousMonthEnd = EOMONTH(@PreviousMonthStart);
		END
		ELSE
		BEGIN
			-- Invalid MonthId, use current month
			SET @CurrentMonthStart = DATEFROMPARTS(@CurrentYear, MONTH(DBO.GetLocalDate(DEFAULT)), 1);
			SET @CurrentMonthEnd = EOMONTH(@CurrentMonthStart);
			SET @PreviousMonthStart = DATEADD(MONTH, -1, @CurrentMonthStart);
			SET @PreviousMonthEnd = EOMONTH(@PreviousMonthStart);
		END
	END

	-- Common CTE for base vehicle and staff information
	;WITH BaseVehicleStaff AS
	(
		SELECT
			VM.VehicleId,
			VM.VehicleNumber,
			VSD.TransportStaffId,			
			LTRIM(RTRIM(
				ISNULL(TSM.FirstName, '') + 
				CASE 
					WHEN TSM.MiddleName IS NULL OR LTRIM(RTRIM(TSM.MiddleName)) = '' THEN ''
					WHEN LEN(LTRIM(RTRIM(TSM.MiddleName))) = 1 THEN ' ' + LTRIM(RTRIM(TSM.MiddleName)) + '.'
					ELSE ' ' + LTRIM(RTRIM(TSM.MiddleName))
				END +
				CASE 
					WHEN TSM.LastName IS NULL OR LTRIM(RTRIM(TSM.LastName)) = '' THEN ''
					ELSE ' ' + LTRIM(RTRIM(TSM.LastName))
				END
			)) AS StaffName
		FROM Transport.VehicleMaster VM WITH(NOLOCK)
		INNER JOIN Transport.VehicleStaffDetails VSD WITH(NOLOCK)
			ON VM.VehicleId = VSD.VehicleId
		INNER JOIN Transport.TransportStaffMaster TSM WITH(NOLOCK)
			ON VSD.TransportStaffId = TSM.TransportStaffId			
		INNER JOIN Teacher_Designation_Master TDM WITH(NOLOCK)
		ON TSM.DesignationId = TDM.Teacher_Designation_Id
		INNER JOIN @tblDriverDesignations TDD
		ON TDM.Teacher_Designation_Id =TDD.Teacher_Designation_Id
		WHERE VM.SchoolId = @School_Id
			AND VM.Academic_Year_Id = @Academic_Year_Id
			AND VM.Is_Deleted = 0
			AND TDM.Is_Deleted = 'N'
			AND VSD.Is_Deleted = 0
			AND TSM.Is_Deleted = 0
			--AND TDM.Teacher_Designation_Id = @DriverDesignationId
			--AND UPPER(TDM.Teacher_Designation_Name) = 'DRIVER'
			AND (@VehicleId = 0 OR VM.VehicleId = @VehicleId)
	),
	-- Common CTE for route information
	RouteInfo AS
	(
		SELECT DISTINCT
			RSVD.VehicleId,
			RM.RouteNo,
			RM.RouteId,
			ROW_NUMBER() OVER (PARTITION BY RSVD.VehicleId ORDER BY RSVD.RouteShiftVehicleDetailsId) AS RN
		FROM Transport.RouteShiftVehicleDetails RSVD WITH(NOLOCK)
		INNER JOIN Transport.RouteStopDetails RSD WITH(NOLOCK)
			ON RSVD.RouteStopId = RSD.RouteStopId			
		INNER JOIN Transport.RouteMaster RM WITH(NOLOCK)
			ON RSD.RouteId = RM.RouteId			
		WHERE RSVD.SchoolId = @School_Id
			AND RSVD.AcademicYearId = @Academic_Year_Id
			AND RSVD.Is_Deleted = 0
			AND RSD.Is_Deleted = 0
			AND RM.Is_Deleted = 0
	),
	-- CTE for reading allocation data grouped by month
	ReadingData AS
	(
		SELECT 
			VSD.VehicleId,
			VSD.TransportStaffId,
			YEAR(VRAD.ReadingDate) AS YearVal,
			MONTH(VRAD.ReadingDate) AS MonthVal,
			DATEFROMPARTS(YEAR(VRAD.ReadingDate), MONTH(VRAD.ReadingDate), 1) AS MonthYear,
			SUM(VRAD.ReadingTo - VRAD.ReadingFrom) AS Distance,			
			SUM(VRAD.Litters) AS Liters,
			SUM(VRAD.TotalCost) AS Cost,
			UPPER(LEFT(DATENAME(MONTH, VRAD.ReadingDate), 3)) + '-' + CAST(YEAR(VRAD.ReadingDate) AS VARCHAR(4)) AS MonthName,
			LEFT(DATENAME(MONTH, VRAD.ReadingDate), 3) AS CurrentMonthName,
			LEFT(DATENAME(MONTH, DATEADD(MONTH,-1,VRAD.ReadingDate)), 3) AS PreviousMonthName,
			CONVERT(DECIMAL(10,1),ROUND(SUM(ROUND((VRAD.ReadingTo - VRAD.ReadingFrom)/VRAD.Litters,1))/COUNT(1),1)) AS Average
		FROM Transport.VehicleReadingAllocationDetails VRAD WITH(NOLOCK)
		INNER JOIN Transport.VehicleStaffDetails VSD WITH(NOLOCK)
			ON VRAD.VehicleId = VSD.VehicleId	
		INNER JOIN Transport.TransportStaffMaster TSM WITH(NOLOCK)
			ON VSD.TransportStaffId = TSM.TransportStaffId
		INNER JOIN @tblDriverDesignations TDD
			ON TSM.DesignationId =TDD.Teacher_Designation_Id
		WHERE VRAD.SchoolId = @School_Id
			AND VRAD.AcademicYearId = @Academic_Year_Id
			AND VRAD.IsDeleted = 0
			AND VSD.Is_Deleted = 0
			AND TSM.Is_Deleted = 0
			--AND TSM.DesignationId = @DriverDesignationId
			AND (@VehicleId = 0 OR VRAD.VehicleId = @VehicleId)
			AND (
				@MonthId = 0 
				OR (
					@MonthId > 0 				
					AND ((MONTH(VRAD.ReadingDate) = MONTH(@CurrentMonthStart) AND YEAR(VRAD.ReadingDate) = YEAR(@CurrentMonthStart)) OR
					(MONTH(VRAD.ReadingDate) = MONTH(@PreviousMonthStart) AND YEAR(VRAD.ReadingDate) = YEAR(@PreviousMonthStart))
					)
				)
			)
		GROUP BY 
			VSD.VehicleId,
			VSD.TransportStaffId,
			YEAR(VRAD.ReadingDate),
			UPPER(LEFT(DATENAME(MONTH, VRAD.ReadingDate), 3)),
			MONTH(VRAD.ReadingDate),
			DATEFROMPARTS(YEAR(VRAD.ReadingDate), MONTH(VRAD.ReadingDate), 1),
			LEFT(DATENAME(MONTH, VRAD.ReadingDate), 3),
			LEFT(DATENAME(MONTH, DATEADD(MONTH,-1,VRAD.ReadingDate)), 3)
	),
	---- CTE for maintenance expenses grouped by month
	MaintenanceData AS
	(
		SELECT 
			VSD.VehicleId,
			VSD.TransportStaffId,
			YEAR(VME.MaintenanceDate) AS YearVal,
			MONTH(VME.MaintenanceDate) AS MonthVal,
			DATEFROMPARTS(YEAR(VME.MaintenanceDate), MONTH(VME.MaintenanceDate), 1) AS MonthYear,
			SUM(VME.TotalAmount) AS MaintenanceAmount
		FROM Transport.VehicleMaintenanceExpenses VME WITH(NOLOCK)
		INNER JOIN Transport.VehicleStaffDetails VSD WITH(NOLOCK)
			ON VME.VehicleId = VSD.VehicleId
		INNER JOIN Transport.TransportStaffMaster TSM WITH(NOLOCK)
			ON VSD.TransportStaffId = TSM.TransportStaffId
		INNER JOIN @tblDriverDesignations TDD
		ON TSM.DesignationId =TDD.Teacher_Designation_Id
		WHERE VME.IsDeleted = 0
			AND VSD.Is_Deleted = 0
			AND TSM.Is_Deleted = 0
			--AND TSM.DesignationId = @DriverDesignationId
			AND (@VehicleId = 0 OR VME.VehicleId = @VehicleId)
			AND (
				@MonthId = 0 
				OR (
					@MonthId > 0 					
					AND ((MONTH(VME.MaintenanceDate) = MONTH(@CurrentMonthStart) AND YEAR(VME.MaintenanceDate) = YEAR(@CurrentMonthStart)) OR
					(MONTH(VME.MaintenanceDate) = MONTH(@PreviousMonthStart) AND YEAR(VME.MaintenanceDate) = YEAR(@PreviousMonthStart))
					)
				)
			)
		GROUP BY 
			VSD.VehicleId,
			VSD.TransportStaffId,
			YEAR(VME.MaintenanceDate),
			MONTH(VME.MaintenanceDate),
			DATEFROMPARTS(YEAR(VME.MaintenanceDate), MONTH(VME.MaintenanceDate), 1)
	)
	-- Main query - handles both single month and monthwise scenarios
	SELECT ROW_NUMBER() OVER ( PARTITION BY RD.YearVal, RD.MonthVal ORDER BY BVS.VehicleNumber ) AS SerialNumber,
		BVS.StaffName,
		BVS.VehicleNumber,
		ISNULL(RI.RouteNo, '') AS RouteNo,
		-- Previous month data
		ISNULL(PrevMonth.Distance, 0) AS PreviousMonthTotalDistance,
		ISNULL(RD.Distance, 0) AS CurrentMonthTotalDistance,
		ISNULL(PrevMonth.Liters, 0) AS PreviousMonthTotalLiters,
		ISNULL(RD.Liters, 0) AS CurrentMonthTotalLiters,
		ISNULL(PrevMonth.Cost, 0) AS PreviousMonthTotalCost,
		ISNULL(RD.Cost, 0) AS CurrentMonthTotalCost,
		ISNULL(PrevMonthMaint.MaintenanceAmount, 0) AS PreviousMonthMaintenanceTotalAmount,
		ISNULL(CurrMonthMaint.MaintenanceAmount, 0) AS CurrentMonthMaintenanceTotalAmount,
		-- Month serial number and name		
		ISNULL(RD.YearVal,0) AS Year, 
		ISNULL(RD.MonthVal,0) AS MonthId,
		CASE WHEN @MonthId > 0 THEN UPPER(LEFT(DATENAME(MONTH, @CurrentMonthStart), 3)) + '-' + CAST(YEAR(@CurrentMonthStart) AS VARCHAR(4))
			ELSE RD.MonthName
		END AS MonthName,
		RD.CurrentMonthName,
		RD.PreviousMonthName,
		RD.Average		
	FROM BaseVehicleStaff BVS
	LEFT JOIN RouteInfo RI
		ON BVS.VehicleId = RI.VehicleId
		AND RI.RN = 1
	---- Current month reading data (drives the result set when @MonthId = 0)
	LEFT JOIN ReadingData RD
		ON BVS.VehicleId = RD.VehicleId
		AND BVS.TransportStaffId = RD.TransportStaffId
		AND (
			(@MonthId > 0 AND RD.MonthYear = @CurrentMonthStart)
			OR (@MonthId = 0)
		)
	---- Previous month reading data
	LEFT JOIN ReadingData PrevMonth
		ON BVS.VehicleId = PrevMonth.VehicleId
		AND BVS.TransportStaffId = PrevMonth.TransportStaffId
		AND (
			(@MonthId > 0 AND PrevMonth.MonthYear = @PreviousMonthStart)
			OR (@MonthId = 0 AND RD.MonthYear IS NOT NULL AND PrevMonth.MonthYear = DATEADD(MONTH, -1, RD.MonthYear))
		)
	---- Current month maintenance data
	LEFT JOIN MaintenanceData CurrMonthMaint
		ON BVS.VehicleId = CurrMonthMaint.VehicleId
		AND BVS.TransportStaffId = CurrMonthMaint.TransportStaffId
		AND (
			(@MonthId > 0 AND CurrMonthMaint.MonthYear = @CurrentMonthStart)
			OR (@MonthId = 0 AND RD.MonthYear IS NOT NULL AND CurrMonthMaint.MonthYear = RD.MonthYear)
		)
	---- Previous month maintenance data
	LEFT JOIN MaintenanceData PrevMonthMaint
		ON BVS.VehicleId = PrevMonthMaint.VehicleId
		AND BVS.TransportStaffId = PrevMonthMaint.TransportStaffId
		AND (
			(@MonthId > 0 AND PrevMonthMaint.MonthYear = @PreviousMonthStart)
			OR (@MonthId = 0 AND RD.MonthYear IS NOT NULL AND PrevMonthMaint.MonthYear = DATEADD(MONTH, -1, RD.MonthYear))
		)
	WHERE (@MonthId = 0 AND RD.VehicleId IS NOT NULL)
		OR (@MonthId > 0)
		AND (RD.Cost > 0 OR PrevMonth.Cost > 0 OR CurrMonthMaint.MaintenanceAmount > 0 OR PrevMonthMaint.MaintenanceAmount > 0)	
END