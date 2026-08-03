 DECLARE @PickupRouteTimingDetailsId INT;
 DECLARE @DropRouteTimingDetailsId INT;

SELECT @PickupRouteTimingDetailsId = RSTD.RouteTimingDetailsId
FROM Transport.RouteShiftTimingDetails RSTD
INNER JOIN Transport.RouteShiftVehicleDetails RSVD
    ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
INNER JOIN Transport.RouteStopDetails RSD
    ON RSVD.RouteStopId = RSD.RouteStopId
INNER JOIN Transport.RouteMaster RM
    ON RSD.RouteId = RM.RouteId
INNER JOIN Transport.StopMaster SM
    ON RSD.StopId = SM.StopId
INNER JOIN Transport.VehicleMaster VM
    ON RSVD.VehicleId = VM.VehicleId
INNER JOIN Transport.ShiftMaster SHM
    ON RSVD.TransportShiftId = SHM.TransportShiftId
WHERE RM.RouteName = '00 DEFAULT ROUTE'
  AND SM.StopName = 'Outside City'
  AND VM.VehicleNumber = 'MH00A0000'
  AND SHM.TransportShiftName = '00-PICKUP'
  AND RSTD.AcademicYearID=13
   AND RSTD.Is_Deleted=0
  AND RSVD.Is_Deleted=0
  AND RSD.Is_Deleted=0
  AND RM.Is_Deleted=0
  AND SM.Is_Deleted=0
  AND VM.Is_Deleted=0
  AND SHM.Is_Deleted=0;

SELECT 
    @DropRouteTimingDetailsId = RSTD.RouteTimingDetailsId
FROM Transport.RouteShiftTimingDetails RSTD
INNER JOIN Transport.RouteShiftVehicleDetails RSVD
    ON RSTD.RouteShiftVehicleDetailsId = RSVD.RouteShiftVehicleDetailsId
INNER JOIN Transport.RouteStopDetails RSD
    ON RSVD.RouteStopId = RSD.RouteStopId
INNER JOIN Transport.RouteMaster RM
    ON RSD.RouteId = RM.RouteId
INNER JOIN Transport.StopMaster SM
    ON RSD.StopId = SM.StopId
INNER JOIN Transport.VehicleMaster VM
    ON RSVD.VehicleId = VM.VehicleId
INNER JOIN Transport.ShiftMaster SHM
    ON RSVD.TransportShiftId = SHM.TransportShiftId
WHERE RM.RouteName = '00 DEFAULT ROUTE'
  AND SM.StopName = 'Outside City'
  AND VM.VehicleNumber = 'MH00A0000'
  AND SHM.TransportShiftName = '00-DROP'
  AND RSTD.AcademicYearID=13AND RSTD.IsDeleted=0
  AND RSTD.Is_Deleted=0
  AND RSVD.Is_Deleted=0
  AND RSD.Is_Deleted=0
  AND RM.Is_Deleted=0
  AND SM.Is_Deleted=0
  AND VM.Is_Deleted=0
  AND SHM.Is_Deleted=0;

 UPDATE Transport.TravelerTransportDetails
SET RouteTimingDetailsId = @PickupRouteTimingDetailsId
WHERE UserId = 8908
  AND AcademicYearId = 13
  AND TravelerTypeId = 1;


UPDATE Transport.TravelerTransportDetails
SET RouteTimingDetailsId = @DropRouteTimingDetailsId
WHERE UserId = 8908
  AND AcademicYearId = 13
  AND TravelerTypeId = 2;


  
