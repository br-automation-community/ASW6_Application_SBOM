TYPE
	McAcpTrakAdvAsmCmdErrParType : STRUCT (*Additional parameters for generating an assembly error command.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvAsmDeleteShParType : STRUCT (*Additional parameters for deleting a selection of shuttles on the assembly.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
		SuppressFollowUpErrLogEntries : BOOL; (*Omit logger entries of failing functions block due to deletion of the shuttle.*)
	END_STRUCT;

	McAcpTrakAdvAsmGetSecParType : STRUCT (*Additional parameters for reading out sectors of the assembly.*)
		SelectionMode : McAcpTrakGetSectorModeEnum; (*Criteria according to which the sectors to be output are selected.*)
	END_STRUCT;

	McAcpTrakAdvAsmGetSegParType : STRUCT (*Additional parameters for reading out segments of the assembly.*)
		SelectionMode : McAcpTrakGetSegmentModeEnum; (*Criteria according to which the segments to be output are selected.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvAsmGetShParType : STRUCT (*Additional parameters for reading out a selection of shuttles on the assembly.*)
		SelectionMode : McAcpTrakGetShuttleModeEnum; (*Criteria according to which the shuttles to be output are selected.*)
		VirtualSelectionMode : McAcpTrakGetShuttleVirtModeEnum; (*Additional criteria regarding property "Virtual" used to select the shuttles to be output.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvAsmOverrideParType : STRUCT (*Additional parameters for setting an override for shuttle movement on the assembly.*)
		VirtualSelectionMode : McAcpTrakGetShuttleVirtModeEnum; (*Additional criteria regarding property "Virtual" used to select the shuttles to be output.*)
	END_STRUCT;

	McAcpTrakAdvAsmPowerOffParType : STRUCT (*Additional parameters for powering off the assembly or a subset of its segments.*)
		StopMode : McStopModeEnum; (*Determines whether jerk limits are used.*)
		Deceleration : REAL; 	   (*Maximum deceleration of a moving shuttle.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvAsmPowerOnParType : STRUCT (*Additional parameters for powering on the assembly or a subset of its segments.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
		HomingMode : McAcpTrakAsmHomingModeEnum; (*Specifies for which segments the initial shuttle identification should be processed.*)
	END_STRUCT;

	McAcpTrakAdvAsmReadInfoParType : STRUCT (*Additional parameters for reading out information about the assembly.*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvAsmStopParType : STRUCT (*Additional parameters for stopping shuttles on the assembly or segment group.*)
		StopMode : McStopModeEnum; (*determines whether jerk limits are used*)
		Deceleration : REAL; (*maximum deceleration of a moving shuttle*)
		SegmentGroup : STRING[32]; (*Segment group reference specifying a set of segments of the assembly.*)
	END_STRUCT;

	McAcpTrakAdvBarrierGetShParType : STRUCT (*Additional parameters for reading out shuttles in front of a barrier.*)
		SelectionMode : McAcpTrakBarrierGetShModeEnum; (*Criteria according to which the shuttles to be output are selected.*)
	END_STRUCT;

	McAcpTrakAdvBarrierParType : STRUCT (*Additional parameters for a barrier command.*)
		TicketCount : DINT; (*Number of tickets to be added to or subtracted from the barrier.*)
	END_STRUCT;

	McAcpTrakAdvConDeleteParType : STRUCT (*Additional parameters for deleting a convoy.*)
		Mode : McAcpTrakConDeleteModeEnum; (*The mode specifies whether the convoy is deleted in any case or only if it is empty except for the convoy master.*)
	END_STRUCT;

	McAcpTrakAdvConGetShParType : STRUCT (*Additional parameters for reading out convoy member shuttles.*)
		Mode : McAcpTrakConGetShuttleModeEnum; (*Criteria according to which the shuttles to be output are sorted.*)
		SelectionMode : McAcpTrakConGetShSelectModeEnum; (*Criteria according to which the shuttles to be output are selected.*)
	END_STRUCT;

	McAcpTrakAdvCopySegDataType : STRUCT (*Additional parameters for copying segment data.*)
		SegmentID : UDINT;		           (*Index of segment. Ignored if and only if mcACPTRAK_SEG_DATA_ALL is chosen*)
		Trigger : McAcpTrakCopySegDataTriggerEnum; (*Trigger for saving data*)
		DataAddress : UDINT; 			   (*Address of first element of an array of type McAcpTrakSegmentData*)
		DataSize : UDINT; 			   (*Size of the array of type McAcpTrakSegmentData*)
		NoLog : BOOL;		(*No logger entries are made. If an error occurs, an entry is still created.*)
	END_STRUCT;

	McAcpTrakAdvCopyShDataType : STRUCT (*Additional parameters for copying shuttle data.*)
		ShuttleID : UDINT;		(*Index of the shuttle whose data should be copied.*)
		Trigger : McAcpTrakCopyShDataTriggerEnum; (*Specifies the event that triggers the copying of data.*)
		DataAddress : UDINT; 		(*Address of array of the userdata.*)
		DataSize : UDINT; 		(*Size of array of userdata.*)
		NoLog : BOOL;		(*No logger entries are made. If an error occurs, an entry is still created.*)
	END_STRUCT;

	McAcpTrakAdvGetMinShDistParType : STRUCT (*Additional parameters for reading out the minimal distance between shuttles.*)
	 	MeasurePointsMode : McAcpTrakShRelativeRefPointEnum; (*Selects the mode how the distance is measured.*)
		Shuttle1 : REFERENCE TO McAxisType; (*First shuttle whose shape is used to calculate the minimum distance.*)
		Shuttle2 : REFERENCE TO McAxisType; (*Second shuttle whose shape is used to calculate the minimum distance.*)
	END_STRUCT;

	McAcpTrakAdvGetPositionParType : STRUCT (*Additional parameters for translating positions to other components.*)
		Position	  : LREAL; (*Position on the source component.*)
		StartPosition : LREAL; (*Start position of the sector position interval for search.*)
		EndPosition : LREAL; (*End position of the sector position interval for search.*)
	END_STRUCT;

  	McAcpTrakAdvRouteInfoBarrierType : STRUCT (*Information about barriers along a route.*)
		Blocked : BOOL; (*Set to false if all user barriers along the route are mcACPTRAK_BARRIER_OPENED.*)
  	END_STRUCT;

	McAcpTrakAdvRouteInfoSectorType : STRUCT (*Information about a route sector.*)
  		RouteLength : LREAL; (*The length of route.*)
  		HasDiverter : BOOL; (*Set to true if the route crosses a diverter.*)
  	END_STRUCT;

  	McAcpTrakAdvRouteInfoSegmentType : STRUCT (*Information about segments along a route.*)
    	Blocked : BOOL;
  		NumberDisabled : UDINT; (*The number of disabled segments on the route.*)
    	NumberErrorStop : UDINT; (*The number of segments in error stop on the route.*)
    	Number : UDINT; (*Total number of segments on the route.*)
  	END_STRUCT;

  	McAcpTrakAdvRouteInfoShuttleType : STRUCT (*Information about shuttles along a route.*)
    	Blocked : BOOL;
		NumberDisabled : UDINT; (*The number of disabled shuttles on the route.*)
    	NumberErrorStop : UDINT; (*The number of shuttles in error stop on the route.*)
    	Number : UDINT; (*Total number of shuttles on the route.*)
  	END_STRUCT;

	McAcpTrakAdvRouteInfoProcPntType : STRUCT (*Information about process points along a route.*)
		Number : UDINT; (*Total number of process points on the route.*)
  	END_STRUCT;

	McAcpTrakAdvRouteInfoType : STRUCT (*Information about a route.*)
		Validity         : McAcpTrakAdvRouteInfoValidEnum;
		SectorInfo       : McAcpTrakAdvRouteInfoSectorType;
		SegmentInfo      : McAcpTrakAdvRouteInfoSegmentType;
		ShuttleInfo      : McAcpTrakAdvRouteInfoShuttleType;
		BarrierInfo      : McAcpTrakAdvRouteInfoBarrierType;
		ProcessPointInfo : McAcpTrakAdvRouteInfoProcPntType;
		Blocked        : BOOL; (*Set to true if any of the info Blocked outputs is true.*)
  	END_STRUCT;

	McAcpTrakRouteInfoComponentsType : STRUCT (*Address and size of an array of components for GetRouteInfo.*)
		DataAddress : UDINT; (*Address of the first element of the array.*)
		DataSize : UDINT;	 (*Size of the array (sizeof).*)
	END_STRUCT;

	McAcpTrakRouteInfoParameters : STRUCT (*Segments, shuttles, and user barriers computed by MC_BR_GetRouteInfo_AcpTrak, and additional parameters.*)
		ProcessPoints : McAcpTrakRouteInfoComponentsType;
		Segments : McAcpTrakRouteInfoComponentsType;
		Shuttles : McAcpTrakRouteInfoComponentsType;
		Horizon : LREAL; (*Extension of target position*)
	END_STRUCT;

	McAcpTrakAdvRouteParType : STRUCT (*Additional parameters for reading information about a route.*)
		StartDirection : McDirectionEnum;			      (*Direction in which the shuttle starts moving, based on the counting direction of the starting sector.*)
		EndDirection : McDirectionEnum;				      (*Direction in which the shuttle stops moving, based on the counting direction of the target sector.*)
		ShuttleOrientation : McDirectionEnum;			      (*Orientation of the shuttle on the target sector.*)
		TransitPoints : REFERENCE TO McAcpTrakRouteTransitPointsType; (*Points a shuttle should pass before reaching its destination.*)
		NumberOfTransitPoints : UINT; 				      (*Number of transit points to be passed.*)
		PosRelativeTo :  McAcpTrakRoutePosRelToEnum;		      (*Defines wheather the end position is calculated relative to the start or end of the sector.*)
		RouteInfoParameters : McAcpTrakRouteInfoParameters; (*Additional input to GetRouteInfo*)
	END_STRUCT;

	McAcpTrakAdvMoveCycParType : STRUCT
		Velocity : REAL; (*Maximum velocity [Measurement units/s]*)
		Acceleration : REAL; (*Maximum acceleration [Measurement units/s]*)
		Deceleration : REAL; (*Maximum deceleration [Measurement units/s]*)
		DisableMotionFilter : McSwitchEnum; (*Disable the motion filter*)
	END_STRUCT;

	McAcpTrakAdvSecAddShuttleType : STRUCT (*Additional parameters for adding a shuttle to a sector.*)
		MoveCmd :  McAcpTrakMoveCmdEnum; (*Movement command which should be executed after the shuttle has been created.*)
		Position : LREAL; 		 (*Target position for the movement.*)
		Velocity : REAL; 		 (*Maximum velocity.*)
		Acceleration : REAL; 		 (*Maximum acceleration.*)
		Deceleration : REAL; 		 (*Maximum deceleration.*)
		Jerk : REAL; 			 (*Maximum jerk.*)
		Direction : McDirectionEnum; 	 (*Orientation  of the shuttle on the sector.*)
		Virtual : BOOL; 		 (*If this field is set, the created shuttle is virtual.*)
		Mode: McAcpTrakShAddModeEnum;    (*Mode selector for adding shuttles.*)
		UserID : STRING[32]; 		 (*User ID of the shuttle.*)
		UserState : UDINT;			(*State of the shuttle set by user.*)
		VirtualShuttleID : UDINT; 	(*ID of the virtual shuttle to be converted into a physical shuttle.*)
	END_STRUCT;

	McAcpTrakAdvSecGetShParType : STRUCT (*Additional parameters for reading out shuttles on a sector.*)
		SelectionMode : McAcpTrakGetShuttleModeEnum; 		(*Criteria according to which the shuttles to be output are selected.*)
		VirtualSelectionMode : McAcpTrakGetShuttleVirtModeEnum; (*Additional criteria regarding property "Virtual" used to select the shuttles to be output.*)
		StartPosition : LREAL; 					(*Start position of the sector position interval used for the search.*)
		EndPosition : LREAL; 					(*End position of the sector position interval used for the search.*)
	END_STRUCT;

	McAcpTrakAdvSecStopParType : STRUCT (*Additional parameters for stopping shuttles on a sector.*)
		StopMode : McStopModeEnum; 	(*Stop mode*)
		StartPosition : LREAL; 		(*Start position of the sector position interval used for the search.*)
		EndPosition : LREAL; 		(*End position of the sector position interval used for the search.*)
		Deceleration : REAL; 		(*Maximum deceleration used for stopping a shuttle.*)
	END_STRUCT;

	McAcpTrakAdvSegPowerOffParType : STRUCT (*Additional parameters for powering off a segment.*)
		StopMode : McStopModeEnum; (*determines whether jerk limits are used*)
		Deceleration : REAL; (*maximum deceleration of a moving shuttle*)
	END_STRUCT;

	McAcpTrakAdvSegSimParType : STRUCT (*Additional parameters for overriding segment parameters for simulation purpose.*)
		SegmentEnable : BOOL; 		(*Overrides the 'segment enable' bit of the segment.*)
		MovementDetected : BOOL; 	(*Overrides the 'movement detected' bit of the segment.*)
		UnknownMovementDetected : BOOL; (*Overrides the 'unknown movement detected' bit of the segment.*)
		NetworkFailure : BOOL;		(*override network available*)
		PositionLag : LREAL; 		(*Override position lag of all segment channels.*)
	END_STRUCT;

	McAcpTrakAdvShCamAutCmdParType : STRUCT (*Additional parameters for the transmission of commands to a shuttle's cam automat.*)
		Elastic : BOOL; 	(*Defines whether the movement is performed elastically or rigidly.*)
		Deceleration : REAL; 	(*Maximum deceleration.*)
	END_STRUCT;

	McAcpTrakAdvShConvoyParType : STRUCT (*Additional parameters for adding or updating convoy member shuttles.*)
		ConvoyMaster : REFERENCE TO McAxisType; 	(*Convoy master shuttle of the convoy to which the shuttle should be added.*)
		TargetDistance : LREAL; 			(*Target distance to the reference shuttle.*)
		Velocity : REAL; 				(*Maximum velocity*)
		Acceleration : REAL; 				(*Maximum acceleration*)
		Deceleration : REAL; 				(*Maximum deceleration*)
		Tcp : McPosType;				(*TCP of the shuttle, relative to the shuttle-internal coordinate system.*)
		ReferenceTcp : McPosType;			(*TCP of the reference shuttle, relative to the shuttle-internal coordinate system.*)
		MovementRestriction: McAcpTrakMovRestrModeEnum; (*Selector for movement restrictions.*)
	END_STRUCT;

	McAcpTrakAdvShReadFrameParType : STRUCT (*Additional parameters for reading out a shuttle's frame.*)
		CenterPointMode : McAcpTrakCenterPointEnum ;  (*Selector for center point the frame refers to.*)
	END_STRUCT;

	McAcpTrakAdvShReadRecInfoParType : STRUCT (*Additional parameters for reading recovery information of a shuttle.*)
		Trigger : McAcpTrakShReadRecInfoTrigEnum; (*Trigger of the recovery info update.*)
	END_STRUCT;

	McAcpTrakAdvShReadSecPosParType : STRUCT (*Additional parameters for reading the sector position of a shuttle.*)
		StartPosition : LREAL; 	(*Start of the sector position interval used for the position search.*)
		EndPosition : LREAL; 	(*End of the sector position interval used for the position search.*)
	END_STRUCT;

	McAcpTrakAdvShRemoveConParType : STRUCT (*Additional parameters for removing shuttles from a convoy.*)
		Deceleration : REAL; (*Maximum deceleration*)
	END_STRUCT;

	McAcpTrakAdvShSwitchSecParType : STRUCT (*Additional parameters for a shuttles switching its reference sector.*)
		Deceleration : REAL;	(*Maximum deceleration*)
		StartPosition : LREAL; 	(*Start of the sector position interval used for positioning the shuttle.*)
		EndPosition : LREAL;	(*End of the sector position interval used for positioning the shuttle.*)
		FlipOrientation : BOOL;	(*Defines whether the orientation of the shuttle on the target sector should be reversed relative to its orientation on the current sector.*)
	END_STRUCT;

	McAcpTrakAsmErrorEncdiffInfoType : STRUCT (*Information about an encoder discrepancy error.*)
		Difference : LREAL; 			 (*Difference of actual segment positions of the shuttle on which the error occurred.*)
		LowPosition : McAcpTrakSegPositionType;  (*Actual segment position resulting in the smallest sector position (with respect to the current reference sector of the shuttle).*)
		HighPosition : McAcpTrakSegPositionType; (*Actual segment position resulting in the largest sector position (with respect to the current reference sector of the shuttle).*)
	END_STRUCT;

	McAcpTrakAsmErrorInfoType : STRUCT  (*Information about an error response of an assembly.*)
		Reason : McAcpTrakAsmErrorReasonEnum; 				 (*Reason for the error response.*)
		EncdiffErrorInfo : McAcpTrakAsmErrorEncdiffInfoType; 		 (*Information about an encoder discrepancy error.*)
		SegmentErrorInfo : McAcpTrakAsmErrorSegmentInfoType; 		 (*Information about an error that is the result of a segment ErrorStop.*)
		UnobservableShuttleErrorInfo : McAcpTrakAsmErrorUnobsShInfoType; (*Information about an error related to an unobservable shuttle.*)
		Initiator: BOOL; 					    	 (*The error response was initiated by the assembly.*)
	END_STRUCT;

	McAcpTrakAsmErrorSegmentInfoType : STRUCT (*Information about an error that is the result of a segment ErrorStop.*)
		Segment : McSegmentType; (*Reference to the segment whose error resulted in an error response of the assembly.*)
		SegmentName : STRING[32]; (*Name of the segment whose error resulted in an error response of the assembly.*)
	END_STRUCT;

	McAcpTrakAsmErrorUnobsShInfoType : STRUCT (*Information about an error related to an unobservable shuttle.*)
		Shuttle : McAxisType; (*Reference to the shuttle that could not allocate a gripper on a segment.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle on the assembly.*)
		UserID : STRING[32]; (*User ID of the shuttle.*)
		SegmentPosition : McAcpTrakSegPositionType; (*Last known segment position of the unobservable shuttle.*)
	END_STRUCT;

	 McAcpTrakAsmGetInfoType : STRUCT (*Information about an assembly.*)
	 	Name : STRING[32]; (*Assembly name*)
	 	SimulationOnPlcMode : McAcpTrakSimulationOnPlcEnum; (*Information about whether simulation mode is used.*)
	 END_STRUCT;

	McAcpTrakAsmGetMinShDistType : STRUCT (*Information about the minimum distance two shuttles can have on a given assembly.*)
		Curve : LREAL; (*Minimum distance in a curved section.*)
		Diverter : LREAL; (*Minimum distance in a diverter area.*)
		Straight : LREAL; (*Minimum distance on a straight line.*)
	END_STRUCT;

	McAcpTrakAsmGetShAddInfoType : STRUCT (*Additional information about shuttles on an assembly.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle on the assembly.*)
		UserState : UDINT; (*State of the shuttle set by user.*)
	END_STRUCT;

	 McAcpTrakAsmInfoType : STRUCT (*Current information about an assembly.*)
	 	CommunicationReady : BOOL; 		  (*Network of all segments of the assembly is initialized and ready for communication.*)
		ReadyForPowerOn : BOOL;			  (*The controllers of all segments of the assembly are ready to be switched on.*)
		PowerOn : BOOL; 		   	  (*The controllers of all segments of the assembly are switched on.*)
		StartupCount : UDINT; 			  (*Number of completed switch-on operations of the assembly.*)
		ShuttleCount : McAcpTrakShuttleCountType; (*Counter for shuttles based on state and property*)
		SegmentCount : McAcpTrakSegmentCountType; (*counter for segments based on state*)
	 	PLCopenState : McAcpTrakPLCopenStateEnum; (*Extended PLCopen assembly state.*)
		MovementDetected : BOOL; 		  (*At least one segment has detected motion.*)
		Override : McAcpTrakCurrentOverrideType;	  (*Currently set override factor*)
	 END_STRUCT;

	McAcpTrakAssemblyMonData : STRUCT (*Monitoring data of an assembly.*)
		Shuttle : ARRAY[0..249] OF McAcpTrakShuttleMonData;  (*Monitoring data of the shuttles.*)
	END_STRUCT;

	McAcpTrakAssemblyVisData  : STRUCT (*Visualization data of an assembly.*)
		Shuttle : ARRAY[0..249] OF McAcpTrakShuttleVisData; (*Visualization data of the shuttles.*)
	END_STRUCT;

	McAcpTrakBarrierGetShInfoType : STRUCT (*Additional information about shuttles in front of a barrier.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle on the assembly.*)
		UserState : UDINT; (*State of the shuttle set by the user.*)
		Distance : LREAL;  (*Distance of the shuttle from the barrier.*)
	END_STRUCT;

	McAcpTrakBarrierInfoType : STRUCT (*Information about a barrier.*)
		Status : McAcpTrakBarrierStatusEnum; (*Barrier state*)
		RemainingTickets : UDINT; (*Number of remaining tickets.*)
	END_STRUCT;

	McAcpTrakProcPointInfoType : STRUCT (*Information about a process point.*)
		Enabled : BOOL; (*The process point is enabled.*)
		Throughput : LREAL; (*The averaged current throughput at this process point.*)
	END_STRUCT;

	McAcpTrakConGetShAddInfoType : STRUCT (*Additional information about a member shuttle of a convoy.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle on the assembly.*)
		Position : LREAL; (*Position of the shuttle on the sector of the convoy.*)
		Orientation : McDirectionEnum; (*Orientation of the shuttle on the sector of the convoy.*)
	END_STRUCT;

	McAcpTrakConInfoType	: STRUCT (*Information about a convoy.*)
		MemberCount : UINT; 		(*Current number of direct members (shuttles and convoys) of the convoy.*)
		ShuttleCount : UINT; 		(*Current number of shuttles in the convoy.*)
		ActualPositiveOffset : LREAL; 	(*Actual maximum position offset of the convoy in positive direction (with respect to the orientation of the convoy master).*)
		ActualNegativeOffset : LREAL; 	(*Actual maximum position offset of the convoy in negative direction (with respect to the orientation of the convoy master).*)
		InRest : BOOL;			(*All convoy members are at a standstill with respect to their setpoint specification.*)
	END_STRUCT;

	McAcpTrakConvoyParType : STRUCT (*Parameters used when creating or updating a convoy.*)
		PositiveOffset : LREAL; 	 (*Maximum position offset of the convoy in positive direction with respect to the orientation of the convoy master.*)
		NegativeOffset : LREAL;  	 (*Maximum position offset of the convoy in negative direction with respect to the orientation of the convoy master.*)
		Elastic : BOOL; 	 	 (*Specifies whether the convoy master behaves elastically towards the other shuttles of the convoy.*)
		Separable : BOOL; 		 (*Specifies whether other shuttles are permitted between the shuttles of the convoy in the diverter area.*)
		MasterVelocityAdjustment : BOOL; (*Specifies whether the master shuttle adjusts its velocity if at least one shuttle in the convoy cannot reach its specified distance to the master.*)
		TargetDistDeceleration: REAL; 	 (*Alternative maximum deceleration for convoy members to maintain the target distance when using TCP coupling.*)
	END_STRUCT;

	McAcpTrakCopySegDataInfoType : STRUCT (*Information stored when copying segment data.*)
		TimeStamp : McAcpTrakDateTimeType; (*Information about the time when the data was copied.*)
	END_STRUCT;

	McAcpTrakCopyShDataInfoType : STRUCT (*Information stored when copying shuttle data.*)
		TimeStamp : McAcpTrakDateTimeType; (*Information about the time when the data was copied.*)
	END_STRUCT;

	McAcpTrakCurrentOverrideType : STRUCT (*Information about the current override.*)
		Velocity : REAL;		(*Used factor for velocity override.*)
	END_STRUCT;

	McAcpTrakDateTimeType : STRUCT (*Time stamp (e.g., used to store when data was copied).*)
		Year : UINT; 		(*Year*)
		Month : UINT;		(*Month*)
		Day : UINT;			(*Day*)
		Hour : UINT;		(*Hour*)
		Minute : UINT;		(*Minutes*)
		Second : UINT;		(*Seconds*)
		Millisec : UINT;	(*Milliseconds*)
	END_STRUCT;

	McAcpTrakDualTrackInfoType : STRUCT (*Information about intervals on two opposite segments forming a dual track area.*)
		Segment1 : McAcpTrakSegIntervalType; (*Segment interval of the first segment of the dual track area.*)
		Segment2 : McAcpTrakSegIntervalType; (*Segment interval of the second segment of the dual track area.*)
	END_STRUCT;

	McAcpTrakGetPositionInfoType : STRUCT (*Information about a position on another component which corresponds to a given component position.*)
		TargetPosition : McAcpTrakTargetPositionType; (*Orientation on target component.*)
		SegmentPosition : McAcpTrakSegPositionType;   (*Lowest index segment and segment position.*)
	END_STRUCT;

	McAcpTrakProcPointGetInfoType : STRUCT (*Information about a process point.*)
		SectorPosition : McAcpTrakSecPositionType; (*The sector position the process point was generated at.*)
	END_STRUCT;

	McAcpTrakRouteTransitPointsType : STRUCT (*Information about points a shuttle passes before reaching its destination.*)
		Sector : REFERENCE TO McSectorType; (*Sector on which the transit point is to be located.*)
		Position : LREAL; 		    (*Position on the given sector where the transit point is located.*)
		TransitDirection : McDirectionEnum; (*Direction in which the shuttle passes the transit point, relative to the sector of the transit point.*)
	END_STRUCT;

	McAcpTrakSecAddShuttleInfoType : STRUCT (*Information about a shuttle that has been added to a sector.*)
		PLCopenState : McAxisPLCopenStateEnum; (*Extended PLCopen axis state.*)
	END_STRUCT;

	McAcpTrakSecGetInfoType : STRUCT (*Information about a sector.*)
	 	Length : LREAL;		      (*Length of the sector.*)
	 	SectorClosed : BOOL; 	      (*Set to true if the sector is closed.*)
	 	Name : STRING[32]; 	      (*Name of the sector.*)
	 	Type :  McAcpTrakSecTypeEnum; (*Type of the sector.*)
	END_STRUCT;

	McAcpTrakSecGetShAddInfoType : STRUCT (*Information about a shuttle on a sector.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle on the assembly.*)
		UserState : UDINT; (*State of the shuttle set by user.*)
		Position : LREAL; (*Position of the shuttle on the sector.*)
		Orientation : McDirectionEnum; (*Orientation of the shuttle on the sector at the given position.*)
	END_STRUCT;

	McAcpTrakSecInfoType : STRUCT (*Information about the shuttles on a sector.*)
		ShuttleCount : McAcpTrakShuttleCountType; (*Counter for shuttles based on state and property.*)
		InRest : BOOL; 				  (*Set to true if the setpoint of all shuttles on the sector is in rest*)
	END_STRUCT;

	McAcpTrakSecPositionType : STRUCT (*Sector position.*)
		Sector : McSectorType;	(*Reference to the sector to which the position refers.*)
		Name : STRING[32]; 	(*Name of the sector.*)
		Position : LREAL;	(*Position on the sector.*)
	END_STRUCT;

	McAcpTrakSegErrorChannelInfoType : STRUCT (*Information about a shuttle that triggered a channel error on a segment.*)
		Shuttle : McAxisType; (*Reference to the shuttle that triggered a channel error on the segment.*)
		ShuttleID : UDINT; (*Unique ID of the shuttle.*)
		UserID : STRING[32]; (*User ID of the shuttle.*)
		Position : LREAL; (*Position of the shuttle on the segment*)
	END_STRUCT;

	McAcpTrakSegErrorInfoType : STRUCT (*Information about an error response of a segment.*)
		Reason : McAcpTrakSegErrorReasonEnum; (*Reason for the error response.*)
		ChannelErrorInfo : McAcpTrakSegErrorChannelInfoType; (*Information about an error that was triggered attributed to a specific segment channel.*)
		Initiator: BOOL; (*The segment which is the initator of the error reaction.*)
	END_STRUCT;

	McAcpTrakSegGetInfoType : STRUCT  (*Information about a segment.*)
	 	Name : STRING[32];		(*Name of the segment.*)
	 	ID : UINT;			(*Unique segment ID on the assembly.*)
	 	Type : McAcpTrakSegTypeEnum;	(*Type of the segment.*)
		Appearance: McAcpTrakSegAppearanceEnum;	(*Appearance of the segment.*)
	 	Length : LREAL;			(*Length of the segment.*)
	 	NodeNumber : UDINT;		(*Assigned node number.*)
	 	PlkInterface : STRING[32];	(*Name of the POWERLINK interface.*)
	 	ChannelCount : USINT;		(*Number of channels on the segment.*)
	 	StartFrame : McFrameType;	(*Frame at the start position of the segment.*)
	 	EndFrame : McFrameType;		(*Frame at the end position of the segment.*)
	END_STRUCT;

	McAcpTrakSegInfoType : STRUCT (*Status information of a segment.*)
		CommunicationReady : BOOL; 	(*The network is initialized and ready for communication.*)
		ReadyForPowerOn : BOOL; 	(*The segment is ready to be enabled.*)
		HomingActive : BOOL; 	(*Shuttle identification is being processed.*)
		PowerOn : BOOL; 		(*The power output stage is switched on.*)
		StartupCount : UDINT; 		(*Number of times the segment was started up since the last PLC start.*)
		CommunicationState : McCommunicationStateEnum; (*Status of network communication.*)
		SegmentEnable : BOOL; 		(*Enable input on the segment is active.*)
		MovementDetected: BOOL; 	(*Movement was detected on the segment.*)
		UnknownMovementDetected: BOOL; 	(*Unknown movement is detected on segment*)
		PLCopenState : McAcpTrakPLCopenStateEnum; (*PLCopenState of the segment*)
		PositionControllerLagWarning: BOOL; (*The warning limit of position control deviation monitoring has been exceeded.*)
	END_STRUCT;

	McAcpTrakSegIntervalType : STRUCT (*Segment interval.*)
		Segment : McSegmentType; (*Reference to the segment to which the position refers.*)
		Name : STRING[32];	 (*Name of the segment.*)
		StartPosition : LREAL;	 (*Starting position of the interval on the segment.*)
		EndPosition : LREAL;	 (*End position of the interval on the segment.*)
	END_STRUCT;

	McAcpTrakSegmentCountType : STRUCT (*Information about the number of segments of an assembly being in a certain state.*)
		InDisabled : UINT;	(*Number of segments in state Disabled.*)
		InStopping : UINT;	(*Number of segments in state Stopping.*)
		InErrorStop : UINT;	(*Number of segments in state ErrorStop.*)
	END_STRUCT;

	McAcpTrakSegmentData : STRUCT 			   	   (*General segment data.*)
		SegmentID : UDINT;                         (*ID of the segment*)
		PLCopenState : McAcpTrakPLCopenStateEnum;  (*The segment's PLCopen status*)
		ErrorReason : McAcpTrakSegErrorReasonEnum; (*The specific reason for the error reaction.*)
		CommunicationReady : BOOL; 	           (*The network is initialized and ready for communication.*)
		ReadyForPowerOn : BOOL; 	           (*The segment is ready to be enabled.*)
		PowerOn : BOOL; 			   (*The power output stage is switched on.*)
		SegmentEnable : BOOL; 		           (*Enable input on the segment is active.*)
		MovementDetected: BOOL; 	           (*Set to true if a movement was detected on the segment.*)
		ErrorInitiator: BOOL;                      (*The segment is the initiator of the error reaction.*)
	END_STRUCT;

	McAcpTrakSegPositionType : STRUCT (*Segment position.*)
		Segment : McSegmentType; (*Reference to the segment to which the position refers.*)
		Name : STRING[32];	 (*Name of the segment.*)
		Position : LREAL;	 (*Position on the segment.*)
	END_STRUCT;

	McAcpTrakSegProcessParIDType : STRUCT (*Structure for processing ParIDs.*)
		ParID : UINT;			     (*Parameter ID number to be read or written.*)
		VariableAddress : UDINT;	     (*Address of the variable the value of the ParID is written to or read from.*)
		DataType : McAcpTrakSegDataTypeEnum; (*Data type of the variable.*)
	END_STRUCT;

	McAcpTrakShAddInfoType : STRUCT (*Additional information about a shuttle.*)
		ID : UDINT;				  (*ID of the shuttle*)
		UserID : STRING[32];			  (*User ID of the shuttle*)
		PLCopenState : McAxisPLCopenStateEnum; 	  (*Extended PLCopen axis state.*)
		Controllable : BOOL;			(*Set to true if the shuttle is controllable.*)
		Virtual : BOOL;					(*Set to true if the shuttle is virtual.*)
		ErrorReason : McAcpTrakShErrorReasonEnum; (*Reason for the failure of the shuttle, if there is one.*)
	END_STRUCT;

	McAcpTrakShCamAutCmdCommandsType : STRUCT (*Commands for shuttles to be given to a cam automat.*)
		Start : BOOL;		(*Start the configured cam automat.*)
		Stop : BOOL;		(*Stop the movement of the slave axis with the configured deceleration.*)
		Restart : BOOL;		(*Re-couple the cam automat.*)
		EndAutomat : BOOL;	(*Stop the cam automat after stopping an active movement of the slave axis if it was started by this function block.*)
		SetSignal1 : BOOL;	(*Set signal 1 on a rising edge.*)
		SetSignal2 : BOOL;	(*Set signal 2 on a rising edge.*)
		SetSignal3 : BOOL;	(*Set signal 3 on a rising edge.*)
		SetSignal4 : BOOL; 	(*Set signal 4 on a rising edge.*)
		ResetSignal1 : BOOL;	(*Reset signal 1 on a rising edge.*)
		ResetSignal2 : BOOL;	(*Reset signal 2 on a rising edge.*)
		ResetSignal3 : BOOL;	(*Reset signal 3 on a rising edge.*)
		ResetSignal4 : BOOL;	(*Reset signal 4 on a rising edge.*)
	END_STRUCT;

	McAcpTrakShCamAutCmdInfoType : STRUCT (*Information about a cam automat.*)
		Running : BOOL;		(*Specify whether the cam automat is active.*)
		Standby : BOOL;		(*Specify whether the cam automat can be restarted with "Restart".*)
		ActualStateIndex : USINT; (*Index for the current state.*)
		ActualStateCamIndex : UINT; (*Index of the cam data for the current state.*)
		InCam : BOOL;		(*Specify whether the cam of the current state is active.*)
		InCompensation : BOOL;	(*Specify whether compensation for the current state is active.*)
		InPosition : BOOL;	(*Specify whether the shuttle has met the current cyclic position setpoint.*)
	END_STRUCT;

	McAcpTrakShConvoyInfoType : STRUCT (*Convoy-related information about a shuttle.*)
		IsConvoyMaster : BOOL;				(*Set to true if the shuttle is the convoy master shuttle of a convoy.*)
		ConvoyMaster : McAxisType;			(*The master shuttle of the shuttle's convoy.*)
		ReferenceShuttle : McAxisType;			(*The reference shuttle in the convoy on which the position of the shuttle depends.*)
		ReferenceObjectType : McAcpTrakObjectTypeEnum;  (*Specifies whether the reference shuttle is a single shuttle or the convoy master shuttle of a convoy and this convoy is considered as the reference in the convoy.*)
		Distance : LREAL;				(*The current distance between the position setpoints of the shuttle and its reference shuttle in the convoy.*)
		CouplingTargetLag : LREAL;			(*The deviation of the current distance from the target distance between the shuttle and its reference shuttle.*)
	END_STRUCT;

	McAcpTrakShConvoyParType : STRUCT (*Information about the coupling of a shuttle in a convoy.*)
		ReferenceShuttle : REFERENCE TO McAxisType; (*The reference shuttle in the convoy on which the position of the shuttle depends.*)
		CouplingMode : McAcpTrakCouplingModeEnum;   (*Mode of coupling to the reference shuttle.*)
		Elastic : BOOL;				    (*Specifies whether the shuttle behaves elastically towards the other shuttles of the convoy.*)
	END_STRUCT;

	McAcpTrakShCurrentValuesType : STRUCT (*Information about current values of a shuttle.*)
		Position : LREAL; 					(*Position setpoint of the shuttle on the sector.*)
		ActualPosition : LREAL; 			(*Actual position of the shuttle on the sector.*)
		ModuloPosition : LREAL; 			(*Position setpoint of the shuttle on the sector, modulo the length of the sector.*)
		ActualModuloPosition : LREAL; 		(*Actual position of the shuttle on the sector, modulo the length of the sector.*)
		PositionControllerLag : LREAL; 		(*Maximum control deviation of the position controllers of all segments of this shuttle projected to the current sector.*)
		Sector : McSectorType; 				(*Reference sector on which the shuttle is located.*)
		SectorName : STRING[32]; 			(*Name of the reference sector.*)
		SectorType : McAcpTrakSecTypeEnum; 	(*Type of the reference sector.*)
		SectorLength : LREAL; 				(*Length of the reference sector.*)
		Orientation : McDirectionEnum; 		(*Orientation of the shuttle at the reference sector.*)
		Velocity : REAL; 					(*Current speed setpoint of the shuttle.*)
		Acceleration : REAL; 				(*Current acceleration setpoint of the shuttle.*)
		JerkTime : REAL; 					(*Current jerk filter time of the shuttle.*)
		ZeroVibrationFltrTime : REAL; 		(*Current zero vibration filter time of the shuttle.*)
		ZeroVibrationFltrCoeff : REAL;		(*Current zero vibration filter coefficient of the shuttle.*)
		InRest : BOOL; 						(*Shuttle is at a standstill with respect to the setpoint specification.*)
		SegmentPosition : McAcpTrakSegPositionType;	(*Segment position of the shuttle.*)
		EncoderDiscrepancy : LREAL; 		(*Maximum deviation between all actual segment positions of the shuttle projected onto the sector.*)
		MovementType : McAcpTrakShMovementTypeEnum;	(*Movement type of shuttle.*)
		CtrlParSetLeft : USINT;				(*Active parameter set for the left side of the shuttle.*)
		CtrlParSetRight : USINT;			(*Active parameter set for the right side of the shuttle.*)
		Override : McAcpTrakCurrentOverrideType; (*Currently set override factor*)
	END_STRUCT;

	McAcpTrakShErrorBarrierInfoType : STRUCT (*Information about a maneuver due to a barrier.*)
	    BarrierType : McAcpTrakBarrierTypeEnum; (*Type of barrier that caused an ErrorStop to be initiated.*)
		ProcessPoint : McProcessPointType; 	(*Process point containing the barrier that caused the ErrorStop.*)
		Name : STRING[32];			(*Name of the process point containing the barrier.*)
		Status : McAcpTrakBarrierStatusEnum;	(*Status of the barrier at the time the ErrorStop was initiated.*)
	END_STRUCT;

	McAcpTrakShErrorChannelInfoType : STRUCT (*Information about an error on a segment, which can be assigned to a specific segment channel.*)
		Segment : McSegmentType;  (*Reference to the segment on which an error was triggered for the shuttle.*)
		SegmentName : STRING[32]; (*Name of the segment on which an error was triggered for the shuttle.*)
	END_STRUCT;

	McAcpTrakShErrorConvoyInfoType : STRUCT (*Information about a maneuver due to a convoy.*)
		ConvoyMaster : McAxisType; (*Master shuttle of the convoy in which the shuttle is or was located.*)
		Shuttle : McAxisType; 	   (*Shuttle that caused an error within the convoy.*)
	END_STRUCT;

	McAcpTrakShErrorEncdiffInfoType : STRUCT (*Information about an error caused by a difference between segment positions that is too large.*)
		Difference : LREAL;			 (*Difference of segment actual positions of the shuttle that resulted in the error.*)
		LowPosition : McAcpTrakSegPositionType;  (*Segment actual position that results in the smallest position on the shuttle's reference sector.*)
		HighPosition : McAcpTrakSegPositionType; (*Segment actual position that results in the largest position on the shuttle's reference sector.*)
	END_STRUCT;

	McAcpTrakShErrorGripperInfoType : STRUCT (*Information about an error that was triggered because the shuttle could not allocate a gripper on a segment.*)
		Segment : McSegmentType;  (*Reference to the segment for which no gripper could be allocated.*)
		SegmentName : STRING[32]; (*Name of the segment for which no gripper could be allocated.*)
	END_STRUCT;

	McAcpTrakShErrorInfoType : STRUCT  (*Information about an error response of a shuttle.*)
		SegmentPosition : McAcpTrakSegPositionType; 	      (*Position setpoint of the shuttle on a segment at the time the error response was initiated.*)
		Velocity : REAL; 				      				  (*Velocity of the shuttle at the time the error response was initiated.*)
		Acceleration : REAL;				     			  (*Acceleration of the shuttle at the time the error response was initiated.*)
		Reason : McAcpTrakShErrorReasonEnum;				  (*Reason for the error response.*)
		ManeuverErrorInfo : McAcpTrakShErrorManeuverInfoType; (*Information about an error caused by a maneuver.*)
		EncdiffErrorInfo : McAcpTrakShErrorEncdiffInfoType;   (*Information about an error caused by a difference between segment positions that is too large.*)
		GripperErrorInfo : McAcpTrakShErrorGripperInfoType;   (*Information about an error that was triggered because the shuttle could not allocate a gripper on a segment.*)
		ChannelErrorInfo : McAcpTrakShErrorChannelInfoType;   (*Information about an error that is the result of an ErrorStop on the segment, where the error could be assigned to a specific segment channel.*)
		SegmentErrorInfo : McAcpTrakShErrorSegmentInfoType;   (*Information about an error that is the result of a segment ErrorStop.*)
		Initiator: BOOL;									  (*True if the shuttle is the initator of the error reaction.*)
	END_STRUCT;

	McAcpTrakShErrorLocLimitInfoType : STRUCT (*Information about a maneuver due to a local limit.*)
		Name : STRING[32]; (*Name of the local limit that caused the ErrorStop to be initiated.*)
		VelocityLimit : REAL; (*Permissible velocity in the area of the local limit.*)
		AccelerationLimit : REAL; (*Permissible acceleration in the area of the local limit.*)
		DecelerationLimit : REAL; (*Permissible deceleration in the area of the local limit.*)
		InRange : BOOL; (*True if the shuttle was in the area of the local limit at the time of error.*)
	END_STRUCT;

	McAcpTrakShErrorManeuverInfoType : STRUCT (*Information about an error caused by a maneuver.*)
		Reason : McAcpTrakShManeuverReasonEnum;			(*Reason for the maneuver.*)
		ShuttleManInfo : McAcpTrakShErrorShuttleInfoType;	(*Information about a maneuver due to another shuttle.*)
		BarrierManInfo : McAcpTrakShErrorBarrierInfoType;	(*Information about a maneuver due to a barrier.*)
		LocalLimitManInfo : McAcpTrakShErrorLocLimitInfoType;	(*Information about a maneuver due to a local limit.*)
		ConvoyManInfo : McAcpTrakShErrorConvoyInfoType;		(*Information about a maneuver due to a convoy.*)
	END_STRUCT;

	McAcpTrakShErrorSegmentInfoType : STRUCT (*Information about an error that is the result of a segment ErrorStop.*)
		Segment : McSegmentType;  (*Reference to the segment whose error resulted in an error response of the shuttle.*)
		SegmentName : STRING[32]; (*Name of the segment whose error resulted in an error response of the shuttle.*)
	END_STRUCT;

	McAcpTrakShErrorShuttleInfoType : STRUCT (*Information about a maneuver due to another shuttle.*)
		Shuttle : McAxisType;			    (*Reference to the shuttle that caused an ErrorStop to be initiated.*)
		SegmentPosition : McAcpTrakSegPositionType; (*Segment position setpoint where the shuttle was located.*)
	END_STRUCT;

	McAcpTrakShFilterParType : STRUCT (*Parameters for the setpoint generation filter.*)
		Mode : McAcpTrakShFilterModeEnum; (*The mode determines when the new filter parameters are set.*)
		JerkTime : REAL;		  (*Jerk time*)
		ZeroVibrationFilter : McAcpTrakZeroVibrFilterParType; (*Parameter of the zero vibration filter.*)
	END_STRUCT;

	McAcpTrakZeroVibrFilterParType : STRUCT (*Parameters of the zero vibration filter.*)
		ZeroVibrationFltrTime : REAL; 		(*Zero vibration filter time.*)
		ZeroVibrationFltrCoeff : REAL;		(*Zero vibration filter coefficient.*)
	END_STRUCT;

	McAcpTrakShInfoType	: STRUCT							 (*Current information about a shuttle.*)
		CurrentValues : McAcpTrakShCurrentValuesType;	     (*Current shuttle values.*)
		RouteDestinationInfo : McAcpTrakShRouteDestInfoType; (*Information about the target of the shuttle's routed movement.*)
		ManeuverInfo : McAcpTrakShManeuverInfoType;	     (*Information about the shuttle maneuver.*)
		LifeCycleInfo : McAcpTrakShLifeCycleInfoType;	     (*Information about the shuttle's lifecycle.*)
		ConvoyInfo : McAcpTrakShConvoyInfoType;		     (*Information about a convoy in which the shuttle is included.*)
		AdditionalInfo : McAcpTrakShAddInfoType;	     (*Additional information about the shuttle.*)
	END_STRUCT;

	McAcpTrakShLifeCycleInfoType : STRUCT (*Information about a shuttle's life cycle.*)
		AbsoluteMovementDistance : LREAL; (*Distance traveled since the last shuttle identification.*)
	END_STRUCT;

	McAcpTrakShManeuverInfoType : STRUCT (*Information about a shuttle maneuver.*)
		Type : McAcpTrakShManeuverTypeEnum; (*Type of executed maneuver.*)
		Reason : McAcpTrakShManeuverReasonEnum; (*Reason for executed maneuver.*)
		Shuttle : McAxisType; (*Reference to a shuttle*)
		Barrier : McProcessPointType; (*Reference to a barrier*)
	END_STRUCT;

	McAcpTrakShReadSecPosInfoType : STRUCT (*Information about a sector position of a shuttle.*)
		Position : LREAL; 	       (*Position setpoint on the specified sector.*)
		Orientation : McDirectionEnum; (*Orientation of the shuttle on the specified sector.*)
	END_STRUCT;

	McAcpTrakShRecoveryInfoType	: STRUCT (*Information about position and target position of a shuttle, read before transition to a faulty state.*)
		SectorPosition : McAcpTrakSecPositionType;  (*Sector position where the shuttle was controlled before the last transition to state Disabled.*)
		OnSector : BOOL; 			    (*Specifies whether the shuttle is still located on the sector specified in "SectorPosition".*)
		Destination : McAcpTrakSecPositionType;	    (*Target sector position of the shuttle at the time of transition to state Disabled.*)
		SegmentPosition : McAcpTrakSegPositionType; (*Segment position where the shuttle was controlled before the last transition to state Disabled.*)
	END_STRUCT;

	McAcpTrakShResizeParamType : STRUCT (*Parameters for the dimensions of a shuttle.*)
		Mode :  McAcpTrakShResizeModeEnum; (*The mode determines when the new shuttle dimensions are set.*)
		ExtentToFront : LREAL;		   (*Spacing from the midpoint of the magnetic plate up to the front of the shuttle.*)
		ExtentToBack : LREAL;		   (*Spacing from the midpoint of the magnetic plate up to the back of the shuttle.*)
		Width : LREAL;			   (*Symmetric width relative to the shuttle center point.*)
	END_STRUCT;

	McAcpTrakShRouteDestInfoType : STRUCT (*Information about the target of the shuttle's routed movement.*)
		Position : LREAL;		   (*Target position of current routed movement on the target sector.*)
		Sector : McSectorType; 		   (*Target sector of current routed movement.*)
		SectorName : STRING[32]; 	   (*Name of target sector.*)
		SectorType : McAcpTrakSecTypeEnum; (*Type of target sector.*)
		VelocityAtDestination : REAL; 	   (*Maximum velocity of the shuttle at the target position.*)
		TotalDistance : LREAL; 		   (*Total distance that the shuttle must travel in order to reach the target.*)
		RemainingDistance : LREAL; 	   (*Remaining distance that the shuttle must travel in order to reach the target.*)
	END_STRUCT;

	McAcpTrakShSegCurrentValuesType : STRUCT (*Information about a shuttle's actual segment position, read out from segments.*)
		Valid : BOOL; 			(*The values of "SegmentName", "Position" and "PositionControllerLag" are valid.*)
		SegmentName : STRING[32];	(*Name of the segment.*)
		Position : LREAL;		(*Actual position of the shuttle on the segment.*)
		PositionControllerLag : LREAL;  (*Deviation between controlled setpoint and actual positions on the segment.*)
	END_STRUCT;

	McAcpTrakShSegmentInfoType	: STRUCT (*Information about the segments on which a shuttle is currently located.*)
		SegmentSetValues : ARRAY[0..3] OF McAcpTrakShSegSetValuesType; (*Setpoints that are transferred to the segments.*)
		SegmentCurrentValues : ARRAY[0..3] OF McAcpTrakShSegCurrentValuesType; (*Actual values that are read from the segments.*)
	END_STRUCT;

	McAcpTrakShSegSetValuesType : STRUCT (*Setpoints of a shuttle which are transferred to segments.*)
		Valid : BOOL;			    (*The values of "SegmentName", "SegmentID", "Position", "Channel", "Controlled" and "FieldMode" are valid.*)
		SegmentName : STRING[32];	    (*Name of the segment.*)
		SegmentID : UINT;		    (*ID of the segment.*)
		Position : LREAL;		    (*Position of the shuttle on the segment.*)
		Channel : USINT;		    (*Channel used to transmit the data.*)
		Controlled : BOOL;		    (*The shuttle is controlled by this segment.*)
		FieldMode : McAcpTrakFieldModeEnum; (*Active field mode.*)
		Orientation : McDirectionEnum; (* Orientation of the shuttle on the segment*)
	END_STRUCT;

	McAcpTrakShSizeInfoType	: STRUCT (*Information about the dimensions of a shuttle.*)
		ExtentToFront : LREAL; (*Spacing from the midpoint of the magnetic plate up to the front of the shuttle.*)
		ExtentToBack : LREAL;  (*Spacing from the midpoint of the magnetic plate up to the back of the shuttle.*)
		Width : LREAL;	       (*Symmetric width relative to the shuttle center point.*)
	END_STRUCT;

	McAcpTrakShSwitchSecInfoType : STRUCT (*Information about a sector position of a shuttle.*)
		Position : LREAL;	       (*Position on the sector after the sector change.*)
		Orientation : McDirectionEnum; (*Orientation  of the shuttle on the sector after the sector change.*)
	END_STRUCT;

	McAcpTrakShuttleCountType : STRUCT (*Information about the number of shuttles on the assembly.*)
		Count : UINT; (*number of shuttles*)
		InStandstill : UINT;	(*Number of shuttles without active movement command.*)
		InDisabled : UINT;	(*Number of shuttles in state Disabled.*)
		InStopping : UINT;	(*Number of shuttles in state Stopping.*)
		InErrorStop : UINT;	(*Number of shuttles in state ErrorStop.*)
		VirtualShuttles : UINT; (*Number of virtual shuttles.*)
		Convoys : UINT;		(*Number of convoys.*)
	END_STRUCT;

	McAcpTrakShuttleData : STRUCT (*General shuttle data.*)
		Index : UDINT;				(*Index of the shuttle or 0 if the array element was not yet in use.*)
		UserID : STRING[32];			(*User ID of the shuttle.*)
		UserState : UDINT; 			(*State of the shuttle set by user.*)
		Active : BOOL;				(*Specifies whether the shuttle exists on the assembly. FALSE is displayed if it was deleted.*)
		Virtual : BOOL;				(*Specifies whether this is a virtual shuttle.*)
		Controlled : BOOL;			(*Specifies whether the shuttle is controlled.*)
		ErrorInitiator : BOOL;			(*Error was initiated by this shuttle.*)
		PLCopenState : McAxisPLCopenStateEnum;  (*Extended PLCopen axis state.*)
		SegmentName : STRING[32];		(*Name of a segment on which the shuttle is currently located or was located at the time of deletion.*)
		SegmentID : UINT;			(*Index of the segment within the assembly.*)
		SegmentPosition : LREAL;		(*Position of the shuttle on the segment with the corresponding segment index.*)
		Frame : McFrameType; 			(*Information about the position and orientation of the shuttle.*)
		SectorName : STRING[32]; 		(*Name of a user-defined sector in which the shuttle is currently located or was located at the time of deletion.*)
		SectorPosition : LREAL;			(*Position of the shuttle in the sector.*)
	END_STRUCT;

	McAcpTrakShuttleMonData : STRUCT (*Monitoring data of a shuttle.*)
		Available : BOOL;
		Position : McPosType;
		Orientation : McOrientType;
		ExtentToFront : LREAL;
		ExtentToBack : LREAL;
		Width : LREAL;
		UserData : UDINT;
		Index : UDINT;
	END_STRUCT;

	McAcpTrakShuttleVisData : STRUCT (*Visualization data of a shuttle.*)
		Available : BOOL; (*The shuttle is displayed in the scene.*)
		Reserved : ARRAY[0..2] OF USINT;
		PositionX : REAL; (*X position of the shuttle.*)
		PositionY : REAL; (*Y position of the shuttle.*)
		RotationZ : REAL; (*Rotation of the shuttle around Z axis.*)
		Text : STRING[31]; (*Text to be displayed for the shuttle.*)
		ColorRed : REAL; (*Red component of the shuttle color.*)
		ColorGreen : REAL; (*Blue component of the shuttle color.*)
		ColorBlue : REAL; (*Green component of the shuttle color.*)
		ExtentToFront : REAL; (*Extent from shuttle center point to front.*)
		ExtentToBack : REAL; (*Extent from shuttle center point to back.*)
		Width : REAL; (*Symmetric width of the shuttle.*)
	END_STRUCT;

	McAcpTrakTargetPositionType : STRUCT (*Position on a target component.*)
		Valid: BOOL; (*The values of "Position" and "Orientation" are valid.*)
		Position : LREAL; (*The position on the target component.*)
		Orientation : McDirectionEnum; (*The orientation on the target component.*)
	END_STRUCT;

	McAcpTrakTrgPointReadInfoType : STRUCT (*Information about a trigger event.*)
		Axis : McAxisType; 		    (*The determined axis reference.*)
		Event : McAcpTrakTrgPointEventEnum; (*Direction of movement in which the trigger point was passed.*)
		ShuttleControlled : BOOL;	    (*Specifies whether the shuttle was controlled at the time it passed.*)
		ConvoyMaster : McAxisType;	    (*The master shuttle of the convoys in which the shuttle was included at the time of passing.*)
		UserState : UDINT;		    (*State of the shuttle set by the user.*)
	END_STRUCT;

	McAssemblyType : STRUCT (*Assembly reference.*)
		controlif : REFERENCE TO McInternalAssemblyIfType;
	END_STRUCT;

	McInternalAssemblyIfType : STRUCT (*Assembly interface type.*)
		vtable : DWORD;
	END_STRUCT;

	McInternalProcessPointIfType : STRUCT (*Process point interface type.*)
		vtable : DWORD;
	END_STRUCT;

	McInternalSectorIfType : STRUCT (*Sector interface type.*)
		vtable : DWORD;
	END_STRUCT;

	McInternalSegmentIfType : STRUCT (*Segment interface type.*)
		vtable : DWORD;
	END_STRUCT;

	McProcessPointType : STRUCT (*Process point reference.*)
		controlif : REFERENCE TO McInternalProcessPointIfType;
	END_STRUCT;

	McSectorType : STRUCT (*Sector reference.*)
		controlif : REFERENCE TO McInternalSectorIfType;
	END_STRUCT;

	McSegmentType : STRUCT (*Segment reference.*)
		controlif : REFERENCE TO McInternalSegmentIfType;
	END_STRUCT;

	McAcpTrakAdvRouteInfoValidEnum :
	(
		mcACPTRAK_ROUTE_VALID,           (*No failure computing the route.*)
		mcACPTRAK_ROUTE_DIFF_WORKSPACES, (*Source sector or destination sector or transit point not contained in the same workspace.*)
		mcACPTRAK_ROUTE_OPTS_NOT_SATISF, (*Routing options not satisfiable.*)
		mcACPTRAK_ROUTE_DST_NOT_IN_INT,  (*Destination position not in destination sector interval.*)
		mcACPTRAK_ROUTE_TP_NOT_IN_INT,   (*Transit point not in destination sector interval.*)
		mcACPTRAK_ROUTE_NO_ROUTE,        (*No route available.*)
		mcACPTRAK_ROUTE_CON_LONG_SRC,    (*Convoy is longer than source sector.*)
		mcACPTRAK_ROUTE_CON_LONG_DST,    (*Convoy is longer than destination sector.*)
		mcACPTRAK_ROUTE_CON_EXTR_DSTPOS  (*Invalid position on destination sector due to convoy's maximum position offsets.*)
	); (*Validity of the route or the cause of the route calculation failure.*)

	McAcpTrakAsmDeleteShCmdEnum :
	(
		mcACPTRAK_SH_DELETE_SPECIFIC,	(*Delete one specific shuttle, given at the input "Axis".*)
		mcACPTRAK_SH_DELETE_ALL,		(*Delete all shuttles on the assembly.*)
		mcACPTRAK_SH_DELETE_VIRTUAL,	(*Delete all virtual shuttles on the assembly.*)
		mcACPTRAK_SH_DELETE_NONVIRTUAL	(*Delete all non-virtual shuttles on the assembly.*)
	); (*Specifies which shuttles should be deleted.*)

	McAcpTrakAsmErrorReasonEnum :
	(
		mcACPTRAK_ASM_ERROR_NONE, (*There is no error on the assembly.*)
		mcACPTRAK_ASM_ERROR_UNSPECIFIED, (*There is an undefined error.*)
		mcACPTRAK_ASM_ERROR_ENCDIFF, (*The difference between two segment actual positions associated to one shuttle is too large.*)
		mcACPTRAK_ASM_ERROR_COMMAND, (*The error was triggered by a user command.*)
		mcACPTRAK_ASM_ERROR_SEGMENT, (*The error was triggered by a segment error.*)
		mcACPTRAK_ASM_ERROR_UNOBSERVABLE (*The error is due to an unobservable shuttle (i.e. a shuttle without a valid segment actual position).*)
	); (*Reason for the error response.*)

	McAcpTrakBarrierCmdEnum :
	(
		mcACPTRAK_BARRIER_OPEN,		(*Open the barrier.*)
		mcACPTRAK_BARRIER_CLOSE,	(*Close the barrier.*)
		mcACPTRAK_BARRIER_ADD_TICKETS,	(*Add tickets to or subtracts tickets from the barrier.*)
		mcACPTRAK_BARRIER_CLEAR_TICKETS	(*close the barrier, clear the list of accepted shuttles, and reset the number of tickets to zero*)
	); (*Barrier command.*)

	McAcpTrakBarrierGetShModeEnum :
	(
		mcACPTRAK_BARR_GET_SH_ALL := 0, (*Output all shuttles waiting in front of the barrier or braking because of it.*)
		mcACPTRAK_BARR_GET_SH_STANDSTILL, (*Output all shuttles waiting at a standstill in front of the barrier.*)
		mcACPTRAK_BARR_GET_SH_CLOSEST (*Output the closest shuttle waiting in front of the barrier or braking because of it.*)
	); (*Specifies which shuttles in front of a barrier should be output.*)

	McAcpTrakBarrierStatusEnum :
	(
		mcACPTRAK_BARRIER_OPENED,	(*Barrier is open.*)
		mcACPTRAK_BARRIER_CLOSED,	(*Barrier is closed.*)
		mcACPTRAK_BARRIER_TICKETING	(*Barrier assigns tickets to shuttles.*)
	); (*Status of a barrier.*)

	McAcpTrakBarrierTypeEnum:
	(
		mcACPTRAK_BARRIER_USER := 0,		(*Barrier belonging to a process point created by the user.*)
		mcACPTRAK_BARRIER_CONFLICTZONE := 1,	(*Internal barrier that controls shuttle access to a diverter area.*)
		mcACPTRAK_BARRIER_SEGMENT := 2		(*Internal barrier that controls shuttle access to a segment.*)
	); (*Type of a barrier.*)

	McAcpTrakCenterPointEnum :
	(
		mcACPTRAK_PNT_SCP := 0, (*Shuttle center point.*)
		mcACPTRAK_PNT_TCP 	(*Tool center point.*)
	); (*Type of a center point.*)

	McAcpTrakConDeleteModeEnum :
	(
		mcACPTRAK_CON_DELETE_ANY_CASE, 	(*The convoy is deleted in any case.*)
		mcACPTRAK_CON_DELETE_EMPTY	(*The convoy is only deleted if it contains no shuttle except the convoy master.*)
	); (*Specifies in which case a convoy should be deleted.*)

	McAcpTrakConGetShSelectModeEnum :
	(
		mcACPTRAK_CON_GET_SH_MEMBERS, (*Output only direct members of the convoy. These can be shuttles or other convoys. In the case of a convoy, the convoy master shuttles is output.*)
		mcACPTRAK_CON_GET_SH_SHUTTLES (*Output all shuttles that are directly in the convoy or in another convoy that is included in it.*)
	); (*Specifies which shuttles of the convoy should be output.*)

	McAcpTrakConGetShuttleModeEnum :
	(
		mcACPTRAK_CON_GET_SH_SECPOS_ASC, (*The shuttles are sorted in ascending order according to their position on the sector of the convoy.*)
		mcACPTRAK_CON_GET_SH_SECPOS_DESC (*The shuttles are sorted in descending order according to their position on the sector of the convoy.*)
	); (*Specifies in which order shuttles of the convoy should be output.*)

  	McAcpTrakCopySegDataModeEnum :
	(
		mcACPTRAK_SEG_DATA_ALL, 	(*Copy the data of all shuttles.*)
		mcACPTRAK_SEG_DATA_SPECIFIC	(*Copy only the data of a specific shuttle.*)
	); (*Specifies for which segments the data should be copied.*)

	McAcpTrakCopySegDataTriggerEnum:
	(
		mcACPTRAK_SEG_DATA_TRIGGER_IMM	(*Trigger copying of the data immediately.*)
	); (*Event that triggers the copying of segment data.*)

	McAcpTrakCopyShDataModeEnum :
	(
		mcACPTRAK_SH_DATA_ALL, 		(*Copy the data of all shuttles.*)
		mcACPTRAK_SH_DATA_SPECIFIC	(*Copy only the data of a specific shuttle.*)
	); (*Specifies for which shuttles data should be copied.*)

	McAcpTrakCopyShDataTriggerEnum:
	(
		mcACPTRAK_TRIGGER_IMMEDIATELY	(*Trigger copying of the data immediately.*)
	); (*Event that triggers the copying of shuttle data.*)

	McAcpTrakCopyUserDataModeEnum :
	(
		mcACPTRAK_USERDATA_GET, (*Read user data.*)
		mcACPTRAK_USERDATA_SET 	(*Write user data.*)
	); (*Specifies whether the user data for a shuttle should be read or written.*)

	 McAcpTrakCouplingModeEnum :
	(
		mcACPTRAK_COUPL_DIST,	 (*Try to keep the target distance to the reference shuttle with respect to the distance on the sector.*)
		mcACPTRAK_COUPL_TCP_DIST (*Try to keep the target distance from the shuttle's TCP to the TCP of the reference shuttle.*)
	); (*Coupling mode.*)

	McAcpTrakCouplingObjCmdEnum :
	(
		mcACPTRAK_COUPLE_OBJ_SET,    (*Sets a coupling object for the shuttle.*)
		mcACPTRAK_COUPLE_OBJ_REMOVE, (*Removes a coupling object from the shuttle.*)
		mcACPTRAK_COUPLE_OBJ_RESET   (*Sets the coupling object for a shuttle and removes the current coupling object, if present.*)
	); (*Coupling object command.*)

	McAcpTrakFieldModeEnum :
	 (
	 	mcACPTRAK_FIELD_NORMAL,		(*Magnetic field behaving normally.*)
	 	mcACPTRAK_FIELD_WEAKENING,	(*Magnetic field weakening.*)
	 	mcACPTRAK_FIELD_STRENGTHENING	(*Magnetic field strengthening.*)
	 ); (*Field mode.*)

	McAcpTrakGetSectorModeEnum :
	(
		mcACPTRAK_GET_SEC_ALL := 0, (*Output all sectors of the assembly.*)
		mcACPTRAK_GET_SEC_CLOSED,   (*Output all closed sectors of the assembly.*)
		mcACPTRAK_GET_SEC_NONCLOSED (*Output all non-closed sectors of the assembly.*)
	); (*Specifies which sectors should be output.*)

	McAcpTrakGetSegmentModeEnum :
	(
		mcACPTRAK_GET_SEG_ALL := 0, (*Output all segments of the assembly.*)
		mcACPTRAK_GET_SEG_DISABLED, (*Output all segments that are in state Disabled.*)
		mcACPTRAK_GET_SEG_STOPPING, (*Output all segments that are in state Stopping.*)
		mcACPTRAK_GET_SEG_ERRORSTOP (*Output all segments that are in state ErrorStop.*)
	); (*Specifies which segments should be output.*)

	McAcpTrakGetShuttleModeEnum :
	(
		mcACPTRAK_GET_SH_ALL := 0, 	  (*Output all shuttles on the assembly.*)
		mcACPTRAK_GET_SH_STANDSTILL, 	  (*Output all shuttles that are in state Standstill.*)
		mcACPTRAK_GET_SH_DISABLED, 	  (*Output all shuttles that are in state Disabled.*)
		mcACPTRAK_GET_SH_STOPPING, 	  (*Output all shuttles that are in state Stopping.*)
		mcACPTRAK_GET_SH_ERRORSTOP, 	  (*Output all shuttles that are in state ErrorStop.*)
		mcACPTRAK_GET_SH_ERROR_MANEUVER,  (*Output all shuttles that are in state ErrorStop due to a standstill maneuver or emergency stop.*)
		mcACPTRAK_GET_SH_ERROR_ENCDIFF,   (*Output all shuttles that are in state ErrorStop due to an encoder error.*)
		mcACPTRAK_GET_SH_ERROR_NOGRIPPER, (*Output all shuttles that are in state ErrorStop because they could not allocate a gripper on a segment.*)
		mcACPTRAK_GET_SH_ERROR_COMMAND,   (*Output all shuttles that are in state ErrorStop due to a user command.*)
		mcACPTRAK_GET_SH_ERROR_SEGMENT,   (*Output all shuttles that are in state ErrorStop due to a segment error.*)
		mcACPTRAK_GET_SH_ERROR_ASSEMBLY,  (*Output all shuttles that are in state ErrorStop due to an assembly error.*)
		mcACPTRAK_GET_SH_ERROR_INVMOV,    (*Output all shuttles that are in state ErrorStop due to an invalid movement command.*)
		mcACPTRAK_GET_SH_ERROR_COUPLING,  (*Output all shuttles that are in state ErrorStop due to an error on coupling function blocks.*)
		mcACPTRAK_GET_SH_CONVOYMASTER,    (*Output all shuttles that are masters of a convoy.*)
		mcACPTRAK_GET_SH_ERROR_CHANNEL    (*Output all shuttles that are in state ErrorStop due to a channel error.*)
	); (*Specifies which shuttles should be output.*)

	McAcpTrakGetShuttleVirtModeEnum :
	(
		mcACPTRAK_GET_SH_VIRT_ALL := 0,  (*Output all (virtual and non-virtual) shuttles of the assembly.*)
		mcACPTRAK_GET_SH_VIRT_VIRTUAL, 	 (*Output only virtual shuttles.*)
		mcACPTRAK_GET_SH_VIRT_NONVIRTUAL (*Output only non-virtual shuttles.*)
	); (*Specifies if virtual or non-virtual shuttles should be output.*)

	McAcpTrakAsmHomingModeEnum:
	(
		mcACPTRAK_HOME_DISABLED := 0, (*Identification for all disabled segments of the selection and power on.*)
		mcACPTRAK_HOME_ALL			  (*Identification for all segments of the selection and power on the disabled ones.*)
	); (*Specifies which segments should be considered for initial shuttle identification.*)

	McAcpTrakMoveCmdEnum :
	(
		mcACPTRAK_MOV_CMD_HALT,		  (*Execute a halt command.*)
		mcACPTRAK_MOV_CMD_MOVEABS,	  (*Execute a move absolute command.*)
		mcACPTRAK_MOV_CMD_ELASTICMOVEABS, (*Execute an elastic move absolute command.*)
		mcACPTRAK_MOV_CMD_MOVEVEL,	  (*Execute a move velocity command.*)
		mcACPTRAK_MOV_CMD_ELASTICMOVEVEL  (*Execute an elastic move velocity command.*)
	); (*Movement command to be executed after a shuttle has been created.*)

	McAcpTrakMovRestrModeEnum :
	(
	 	 mcACPTRAK_NONE, 	(*no movement restrictions*)
	 	 mcACPTRAK_TOWARDS_REF	(*suppress active increasement of the distance to the reference shuttle*)
	); (*Limitation of movement of a shuttle relative to its reference shuttle.*)

	McAcpTrakObjectTypeEnum :
	(
		mcACPTRAK_OBJECT_SHUTTLE, (*Object type Shuttle.*)
		mcACPTRAK_OBJECT_CONVOY   (*Object type Convoy. The convoy is addressed by its convoy master shuttle.*)
	); (*Reference object type.*)

	McAcpTrakOverrideEnum :
	(
		mcACPTRAK_OVERRIDE_VELOCITY (*Override velocity.*)
	); (*Override type.*)

	McAcpTrakPLCopenStateEnum :
	(
		mcACPTRAK_DISABLED,		(*The power level is switched off.*)
		mcACPTRAK_HOMING,		(*The component carries out referencing, identification of shuttles is active.*)
		mcACPTRAK_READY,		(*The component is switched on.*)
		mcACPTRAK_STOPPING,		(*The component is stopped. Shuttle movements are stopped.*)
		mcACPTRAK_ERRORSTOP,		(*The component is in an error state. Shuttle movements are stopped.*)
		mcACPTRAK_STARTUP,		(*The component is in the startup phase.*)
		mcACPTRAK_INVALID_CONFIGURATION (*The configuration of the component is incorrect.*)
	); (*Extended PLCopen assembly state.*)

	McAcpTrakRoutePosRelToEnum :
	(
		mcACPTRAK_SEC_START,	(*The target position is calculated with respect to the start of the sector.*)
	 	mcACPTRAK_SEC_END	(*The target position is calculated with respect to the end of the sector.*)
	); (*Determines whether the end position is calculated in relation to the start or end of a sector.*)

	McAcpTrakSearchModeEnum :
	(
		mcACPTRAK_SEARCH_FORWARD, (*Search beginning at the starting point to the endpoint of the sector.*)
		mcACPTRAK_SEARCH_BACKWARD (*Search beginning at the endpoint to the starting point of the sector.*)
	); (*Direction for listing shuttles.*)

	McAcpTrakSecTypeEnum :
	(
		mcACPTRAK_SEC_USER_DEFINED, (*User-defined sector.*)
		mcACPTRAK_SEC_SEGMENT,      (*Segment sector*)
		mcACPTRAK_SEC_INTERNAL	    (*Internal sector (route).*)
	); (*Type of a sector.*)

	McAcpTrakSegAppearanceEnum :
	(
	 	mcACPTRAK_SEG_APPEAR_PHYSICAL,	(*Segment represents a physical segment.*)
	 	mcACPTRAK_SEG_APPEAR_VIRTUAL,	(*Segment is virtual and does not represent a physical segment.*)
	 	mcACPTRAK_SEG_APPEAR_EMULATED	(*Segment is virtual and emulates a physical segment.*)
	); (*Type of segment appearance.*)

	McAcpTrakSegDataTypeEnum :
	(
		mcACPTRAK_SEG_PARTYPE_BOOL := 1,	(*Data type: Digital information, 1 bit (1 byte).*)
		mcACPTRAK_SEG_PARTYPE_SINT, 	 	(*Data type: Floating point, 4 bytes.*)
		mcACPTRAK_SEG_PARTYPE_INT,		(*Data type: Floating-point number, 8 bytes.*)
		mcACPTRAK_SEG_PARTYPE_DINT,		(*Data type: Whole number, 4 bytes.*)
		mcACPTRAK_SEG_PARTYPE_USINT,		(*Data type: Whole number, 1 byte, positive numbers only.*)
		mcACPTRAK_SEG_PARTYPE_UINT,		(*Data type: Whole number, 2 bytes, positive numbers only.*)
		mcACPTRAK_SEG_PARTYPE_UDINT,		(*Data type: Whole number, 4 bytes, positive numbers only.*)
		mcACPTRAK_SEG_PARTYPE_REAL,		(*Data type: Floating point, 4 bytes.*)
		mcACPTRAK_SEG_PARTYPE_LREAL := 17,	(*Data type: Floating-point number, 8 bytes.*)
		mcACPTRAK_SEG_PARTYPE_VOID := 65535	(*General data type*)
	); (*Data type of variables.*)

	McAcpTrakSegErrorReasonEnum :
	(
		mcACPTRAK_SEG_ERROR_NONE,	  (*No error has been triggered.*)
		mcACPTRAK_SEG_ERROR_UNSPECIFIED,  (*There is an undefined error.*)
		mcACPTRAK_SEG_ERROR_COMMAND,	  (*The error was triggered by user command.*)
		mcACPTRAK_SEG_ERROR_SEGMENT,	  (*The error was reported by the segment.*)
		mcACPTRAK_SEG_ERROR_ASSEMBLY,	  (*The error was triggered as part of an assembly error reaction.*)
		mcACPTRAK_SEG_ERROR_CHANNEL,	  (*The error was triggered by a segment error on a single channel. It can be uniquely assigned to a shuttle.*)
		mcACPTRAK_SEG_ERROR_UNOBSERVABLE, (*The error is triggered due to an unobservable shuttle.*)
		mcACPTRAK_SEG_ERROR_ENCDIFF 	  (*The error is due to an encoder error.*)
	); (*Reason for an error response on a segment.*)

	McAcpTrakSegLimitErrorScopeMode :
	(
		mcACPTRAK_UNOBSERV_SH_ACTIVATE,  (*Activate error response for shuttles that cannot be observed. Uncontrolled shuttles without an actual position do not trigger an assembly error response.*)
		mcACPTRAK_UNOBSERV_SH_DEACTIVATE (*Deactivate error response for shuttles that cannot be observed. Uncontrolled shuttles without an actual position trigger an assembly error response.*)
	); (*Error response scope for errors on a segment.*)

	McAcpTrakSegProcessParIDModeEnum :
	(
		mcACPTRAK_SEG_PARID_GET := 0,  (*Read ParID from the segment*)
		mcACPTRAK_SEG_PARID_SET,       (*Write ParID to the segment*)
		mcACPTRAK_SEG_PARID_GET_NO_NCT, (*Read ParID from the segment without network trace entry. If an error occurs while reading, an entry is still created.*)
		mcACPTRAK_SEG_PARID_GET_NO_LOG (*Read ParID from the segment without NCT and logger entry. If an error occurs while reading, an entry is still created.*)
	); (*Defines whether a parameter IDs should be read or written (once only).*)

	McAcpTrakSegTypeEnum :
	(
		mcACPTRAK_SEG_CIRC,		(*Circular segment.*)
		mcACPTRAK_SEG_STR_660,		(*Straight segment of length 660 mm.*)
		mcACPTRAK_SEG_STR_105_TO_CIRC,	(*Curved segment starting with a straight section of length 105 mm.*)
		mcACPTRAK_SEG_CIRC_TO_STR_105,	(*Curved segment ending with a straight section of length 105 mm.*)
		mcACPTRAK_SEG_COMPACT_CURVE_180 (*Compact circular segment with curvature of 180 degrees.*)
	); (*Type of a segment.*)

	McAcpTrakSelectShSideEnum:
	(
		 mcACPTRAK_SIDE_BOTH := 0 (*Affects both sides of the shuttle.*)
	); (*Shuttle side to be changed.*)

	McAcpTrakShAddModeEnum :
	(
	 	mcACPTRAK_ADD_IMMEDIATE, (*Add the shuttle immediately.*)
	 	mcACPTRAK_ADD_CATCH,	 (*Add and catch the shuttle.*)
	 	mcACPTRAK_ABORT_CATCH	 (*Abort an activated catch of a shuttle.*)
	); (*Mode for adding a shuttle.*)

	McAcpTrakShErrorReasonEnum :
	(
		mcACPTRAK_SH_ERROR_NONE,	(*There is no error.*)
		mcACPTRAK_SH_ERROR_UNSPECIFIED, (*There is an undefined error.*)
		mcACPTRAK_SH_ERROR_MANEUVER,	(*The error was triggered by a standstill maneuver or an emergency stop.*)
		mcACPTRAK_SH_ERROR_ENCDIFF,	(*The difference between two actual segment positions associated to the shuttles is too large.*)
		mcACPTRAK_SH_ERROR_NOGRIPPER,	(*The shuttle could not allocate a gripper on a segment because all channels are used.*)
		mcACPTRAK_SH_ERROR_COMMAND,	(*The error was triggered by a user command.*)
		mcACPTRAK_SH_ERROR_SEGMENT,	(*The error was triggered by a segment error.*)
		mcACPTRAK_SH_ERROR_ASSEMBLY,	(*The error was triggered as part of an assembly error response.*)
		mcACPTRAK_SH_ERROR_INVALIDMOVE, (*The error was triggered due to an invalid movement command.*)
		mcACPTRAK_SH_ERROR_COUPLING,	(*The error was triggered by an error on a coupling function block.*)
		mcACPTRAK_SH_ERROR_CHANNEL	(*The error was triggered by a segment error on a single channel. It can be uniquely assigned to a shuttle.*)
	); (*Reason for the error response of a shuttle.*)

	McAcpTrakShFilterModeEnum :
	(
	 	 mcACPTRAK_SET_IMMEDIATE, 	(*Changed filter parameters are applied immediately.*)
	 	 mcACPTRAK_SET_AVOID_ERRORSTOP	(*The filter parameters are applied as soon as ErrorStop and shuttle collisions can be avoided.*)
	); (*Determines when new filter parameters are set.*)

	McAcpTrakShInteractCmdEnum :
	(
		mcACPTRAK_SH_ACT_COLLAVOID,  (*Enable collision avoidance with the specified shuttle.*)
		mcACPTRAK_SH_DEACT_COLLAVOID (*Disabled collision avoidance with the specified shuttle.*)
	); (*Specifies whether collision avoidance should be activated or deactivated.*)

	McAcpTrakShLocalLimitCmdEnum :
	(
		mcACPTRAK_LL_ADD_SHUTTLE,	(*Enable local movement limit for the shuttle.*)
		mcACPTRAK_LL_REMOVE_SHUTTLE,	(*Disable local movement limit for the shuttle.*)
		mcACPTRAK_LL_ADD_CONVOY,	(*Enable local movement limit for the shuttle's convoy.*)
		mcACPTRAK_LL_REMOVE_CONVOY	(*Disable local movement limit for the shuttle's convoy.*)
	); (*Local movement limit command.*)

	McAcpTrakShManeuverReasonEnum:
	(
		mcACPTRAK_REASON_UNSPECIFIED := 0,	(*The reason for the maneuver is unspecified.*)
		mcACPTRAK_REASON_SHUTTLE := 1,		(*Another shuttle caused a maneuver to be executed.*)
		mcACPTRAK_REASON_LOCAL_VEL_LIMIT := 2,	(*Local speed limiting caused a maneuver to be executed.*)
		mcACPTRAK_REASON_BARRIER := 3,		(*A barrier caused a maneuver to be executed (sector end reached, diverter blocked, etc.).*)
		mcACPTRAK_REASON_SECTOREND := 4,	(*A shuttle leaving its current sector caused a maneuver to be executed.*)
		mcACPTRAK_REASON_SECTORSWITCH := 5,	(*A change of sector caused a maneuver to be executed.*)
		mcACPTRAK_REASON_LOGISTICS := 6,	(*A logistics command caused a maneuver to be executed.*)
		mcACPTRAK_REASON_NONE := 7,		(*No maneuver is executed.*)
		mcACPTRAK_REASON_LOCAL_ACC_LIMIT := 8,	(*Local acceleration limitation caused a maneuver to be executed.*)
		mcACPTRAK_REASON_UNCONTROLLED := 9,	(*A previously controlled shuttle is now uncontrolled and caused a maneuver to be executed.*)
		mcACPTRAK_REASON_RECONTROLLED := 10,	(*A previously uncontrolled shuttle is now controlled and caused a maneuver to be executed.*)
		mcACPTRAK_REASON_CONVOY := 11,		(*The speed of a shuttle in a convoy is adapted to another shuttle of the convoy.*)
		mcACPTRAK_REASON_CON_DIFF_SECTOR := 12,	(*A shuttle is on a different sector than the master of the convoy in which it is included triggering a standstill maneuver.*)
		mcACPTRAK_REASON_CON_INV_REF := 13,	(*A shuttle has no reference shuttle within the convoy, triggering a standstill maneuver.*)
		mcACPTRAK_REASON_CON_SECSWITCH := 14,	(*A shuttle cannot change sectors due to it not being on the sector to which the convoy is changing, triggering a standstill maneuver.*)
		mcACPTRAK_REASON_CON_UNCONTR := 15,	(*At least one shuttle of a convoy is uncontrolled, triggering a standstill maneuver.*)
		mcACPTRAK_REASON_CON_RIGID_MOVE := 16,	(*The set parameter "Elastic" conflicts with the selected movement command, triggering a standstill maneuver.*)
		mcACPTRAK_REASON_CON_TCP := 17,		(*The iterative method for calculating the shuttle position based on the TCP of the reference shuttle does not converge to any result, triggering a standstill maneuver.*)
		mcACPTRAK_REASON_LOCAL_DEC_LIMIT := 18	(*Local deceleration limitation caused a maneuver to be executed.*)
	); (*Reason for a shuttle maneuver.*)

	McAcpTrakShManeuverTypeEnum :
	(
		mcACPTRAK_MANEUVER_NONE := 0, 		(*No maneuver executed.*)
		mcACPTRAK_MANEUVER_ADJUSTMENT := 1,	(*Adjustment maneuver executed.*)
		mcACPTRAK_MANEUVER_STANDSTILL := 2,	(*Standstill maneuver executed.*)
		mcACPTRAK_MANEUVER_EMERGENCY := 3 	(*Emergency stop executed.*)
	); (*Type of a shuttle maneuver.*)

	McAcpTrakShMovementTypeEnum :
	(
		mcACPTRAK_MOVEMENT_STANDSTILL,	(*No movement active.*)
		mcACPTRAK_MOVEMENT_ELASTIC,	(*An elastic movement is active.*)
		mcACPTRAK_MOVEMENT_RIGID	(*A rigid movement is active.*)
	); (*Type of movement of a shuttle.*)

	McAcpTrakShReadRecInfoTrigEnum :
	(
		mcACPTRAK_UNCONTROLLEDERRORSTOP, (*Recovery info saved in the cycle in which the shuttle was controlled and not in error stop, but became uncontrolled or had an error stop in the following cycle*)
		mcACPTRAK_UNCONTROLLED (*Recovery info saved in the cycle in which the shuttle was controlled, but became uncontrolled in the following cycle*)
	); (*Event that triggers saving of recovery information for a shuttle.*)

	McAcpTrakShRelativeAlignmentEnum :
	(
		mcACPTRAK_ALIGNED_FRONT_TO_BACK,  (*The front of the shuttle is turned towards the back of the other shuttle.*)
		mcACPTRAK_ALIGNED_BACK_TO_FRONT,  (*The back of the shuttle is turned towards the front of the other shuttle.*)
		mcACPTRAK_ALIGNED_FRONT_TO_FRONT, (*The front of the shuttle is turned towards the front of the other shuttle.*)
		mcACPTRAK_ALIGNED_BACK_TO_BACK    (*The back of the shuttle is turned towards the back of the other shuttle.*)
	); (*Type of alignment of two shuttles to each other.*)

	McAcpTrakShRelativeRefPointEnum :
	(
	 	mcACPTRAK_DIST_CENTER_TO_CENTER, (*Distance between the center of the first shuttle and the center of the second shuttle.*)
		mcACPTRAK_DIST_CENTER_TO_EXTENT, (*Distance between the center of the first shuttle and the extent of the second shuttle.*)
		mcACPTRAK_DIST_EXTENT_TO_CENTER, (*Distance between the extent of the first shuttle and the center of the second shuttle.*)
		mcACPTRAK_DIST_EXTENT_TO_EXTENT  (*Distance between the extent of the first shuttle and the dimension of the second shuttle.*)
	); (*Points in relation to which distance between shuttles is to be measured.*)

	McAcpTrakShResizeCmdEnum :
	(
		mcACPTRAK_RESIZE_DIMENSIONS (*Change parameters for the shuttle dimensions*)
	); (*Command for resizing a shuttle.*)

	McAcpTrakShResizeModeEnum :
	(
		mcACPTRAK_RESIZE_IMMEDIATE, 	 (*The shuttle dimensions are applied immediately.*)
		mcACPTRAK_RESIZE_AVOID_ERRORSTOP (*The shuttle dimensions are applied as soon as ErrorStop can be avoided.*)
	); (*Time when shuttle dimensions will be changed.*)

	McAcpTrakSimulationOnPlcEnum :
	(
		mcACPTRAK_SIM_STATE_OFF, (*Simulation disabled*)
		mcACPTRAK_SIM_STATE_ON   (*Simulation enabled*)
	); (*Specifies whether simulation mode is used.*)

	McAcpTrakTrgPointEventEnum :
	(
		mcACPTRAK_TP_PASSED_NEGATIVE, (*Trigger point passed in negative direction by the shuttle.*)
		mcACPTRAK_TP_PASSED_POSITIVE  (*Trigger point passed in positive direction by the shuttle.*)
	); (*Direction of movement in which the trigger point was passed.*)

	McAcpTrakMoveCycTcpVelModeEnum :
	(
		mcACPTRAK_TCP_COORDSYS_X_VEL, (*TCP velocity wrt the x-axis of the specified coordinate system.*)
		mcACPTRAK_TCP_ABS_VEL (*Absolute velocity of the TCP.*)
	); (*Mode to specify the TCP velocity.*)
END_TYPE
