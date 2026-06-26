Declare @SourceVehicleNumber nvarchar(30) ='MH09EM0667', @DestinationVehicleNUmber nvarchar(30)='MH09EM3425'

   UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01A-PICKUP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34A-PICKUP'
	
UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01B-PICKUP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34B-PICKUP'

   --3
    UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01C-PICKUP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34C-PICKUP'

    --4
    UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01A-DROP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34A-DROP'
	
    --5
   UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01B-DROP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34B-DROP'
    
	--6
   UPDATE TTD
      SET TTD.RouteTimingDetailsId = S.RouteTimingDetailsId,
          TTD.UpdatedById = 2,
          TTD.UpdateDate = dbo.GetLocalDate(default)
      from  Transport.TravelerTransportDetails TTD 
INNER JOIN Transport.RouteShiftTimingDetails RSTD 
		ON TTD.RouteTimingDetailsId=RSTD.RouteTimingDetailsId
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
Inner JOIN vw_BaseStudentDetails BSD
		ON BSD.User_Id=TTD.UserId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
         AND TTD.Is_Deleted=0
INNER JOIN( select RM.RouteName,StopName,ROW_NUMBER() OVER (ORDER BY TransportShiftName) AS RowNum,RSTD.RouteTimingDetailsId
      from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
INNER JOIN  Transport.ShiftMaster SM 
		ON RSVD.TransportShiftId=SM.TransportShiftId 
INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@DestinationVehicleNUmber
	   AND TransportShiftName='01C-DROP'
	   )s
       ON S.StopName=SM1.StopName
	  Where TTD.AcademicYearId=13
	   AND TTD.SchoolId=122
	   AND TTD.Is_Deleted=0
	   AND RSTD.Is_Deleted=0
	   AND RSVD.Is_Deleted=0
	   AND SM.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND BSD.Is_Deleted='N'
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND SM.TransportShiftName='34C-DROP'

	   Update RSTD
    SET  RSTD.Is_Deleted=1
	    ,UpdateDate=dbo.GetLocalDate(default) 
	    ,UpdatedById=2
  from  Transport.RouteShiftTimingDetails RSTD 
INNER JOIN  Transport.RouteShiftVehicleDetails RSVD 
		ON RSTD.RouteShiftVehicleDetailsId=RSVD.RouteShiftVehicleDetailsId
 INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
Inner join Transport.RouteStopDetails RSD
        ON RSD.RouteStopId=RSTD.RouteStopId
Inner join Transport.RouteMaster RM
        ON Rm.RouteId=RSD.RouteId
INNER JOIN Transport.StopMaster SM1
	     ON RSD.StopId=SM1.StopId 
	  Where RSTD.Is_Deleted=0
	   AND RSTD.AcademicYearId=13
	   AND RSTD.SchoolId=122
	   AND RSVD.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND RSD.Is_Deleted=0
	   AND SM1.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	  
   Update RSVD
    SET  Is_Deleted=1
	    ,UpdateDate=dbo.GetLocalDate(default) 
	    ,UpdatedById=2
  from  Transport.RouteShiftVehicleDetails RSVD 
 INNER JOIN  Transport.VehicleMaster VM
		ON RSVD.VehicleId=VM.VehicleId
      Where RSVD.Is_Deleted=0
	   AND VM.Is_Deleted=0
	   AND VM.VehicleNumber=@SourceVehicleNumber
	   AND RSVD.AcademicYearId=13
	   AND RSVD.SchoolId=122


	      Update VM
	      SET Is_Deleted=1
		      ,UpdateDate=dbo.GetLocalDate(default)
			  ,UpdatedById=2
	   from Transport.VehicleMaster VM
	    WHERE  Is_Deleted=0
	   AND VehicleNumber=@SourceVehicleNumber
	   AND Academic_Year_Id=13
	   AND SchoolId=122
