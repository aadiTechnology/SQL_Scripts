 Update RSTD
    SET  Is_Deleted=1
	    ,UpdateDate=dbo.GetLocalDate(default) 
	    ,UpdatedById=2
  from  Transport.RouteShiftTimingDetails RSTD 
  Inner Join  Transport.RouteShiftVehicleDetails RSVD
  ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
Inner Join Transport.RouteStopDetails  RSD
	  On RSD.RouteStopId=RSTD.RouteStopId
 Inner Join Transport.RouteMaster RM 
      ON RM.RouteId=RSD.RouteId
 INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
      Where RSVD.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND VM.VehicleNumber='MH09FJ0778'
	   AND RouteName='29 MANGALWAR PETH - BELBAG'
	   AND RSVD.AcademicYearId=13
	   AND RSVD.SchoolId=122
	   AND RSTD.Is_Deleted=0

 Update RSVD
    SET Is_Deleted=1
	   ,UpdateDate=dbo.GetLocalDate(default) 
	   ,UpdatedById=2
   from Transport.RouteShiftVehicleDetails RSVD
Inner Join Transport.RouteStopDetails  RSD
	 On RSD.RouteStopId=RSVD.RouteStopId
Inner Join Transport.RouteMaster RM 
     ON RM.RouteId=RSD.RouteId
 INNER JOIN  Transport.VehicleMaster VM
	 ON RSVD.VehicleId=VM.VehicleId
    Where RSVD.Is_Deleted=0
	AND VM.Is_Deleted=0
	AND VM.VehicleNumber='MH09FJ0778'
	AND RouteName='29 MANGALWAR PETH - BELBAG'
	AND RSVD.AcademicYearId=13
	AND RSVD.SchoolId=122


	