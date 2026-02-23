
TYPE
	Mc6DAssemblyType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalAssemblyIfType;
	END_STRUCT;
	Mc6DInternalAssemblyIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	Mc6DShuttleType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalShuttleIfType;
	END_STRUCT;
	Mc6DShuttleGroupType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalShuttleGroupIfType;
	END_STRUCT;
	Mc6DSegmentType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalSegmentIfType;
	END_STRUCT;
	Mc6DZoneType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalZoneIfType;
	END_STRUCT;
	Mc6DInternalZoneIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	Mc6DInternalSegmentIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	Mc6DInternalShuttleIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	Mc6DInternalShuttleGroupIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	Mc6DControllerFBIOType : 	STRUCT
		Array : ARRAY[0..199]OF UINT;
	END_STRUCT;
	McAcp6DControllerStateEnum :
		(
		mcACP6D_STATE_BOOTING := 0,
		mcACP6D_STATE_INACTIVE := 1,
		mcACP6D_STATE_ACTIVATING := 2,
		mcACP6D_STATE_DISCOVERY := 3,
		mcACP6D_STATE_SERVICE := 4,
		mcACP6D_STATE_OPERATION := 5,
		mcACP6D_STATE_DEACTIVATING := 7,
		mcACP6D_STATE_ERROR_HANDLING := 8,
		mcACP6D_STATE_ERROR := 9	
		);
	McAcp6DShStereotypeDeleteCmdEnum :
		(
		mcACP6D_SH_ST_DELETE_SPECIFIC := 0,
		mcACP6D_SH_ST_DELETE_ALL := 1
		);
	McAcp6DShGetInfoOptionEnum :
		(
		mcACP6D_POSITION_FEEDBACK := 0,
		mcACP6D_FORCE_FEEDBACK := 1
		);
	McAcp6DMacroDeleteCmdEnum :
		(
		mcACP6D_MACRO_DELETE_SPECIFIC := 0,
		mcACP6D_MACRO_DELETE_ALL := 1
		);
	McAcp6dPLCopenStateEnum :
		(
		mcACP6D_DISABLED := 0,
		mcACP6D_HOMING := 1,
		mcACP6D_READY := 2,
		mcACP6D_STOPPING := 3,
		mcACP6D_ERRORSTOP := 4,
		mcACP6D_STARTUP := 5,
		mcACP6D_INVALID_CONFIGURATION := 6
		);
	McAcp6DShStateEnum :
		(
		mcACP6D_SH_STATE_UNDETECTED := 0,
		mcACP6D_SH_STATE_DISCOVERING := 1,
		mcACP6D_SH_STATE_LANDED := 2,
		mcACP6D_SH_STATE_IDLING := 3,
		mcACP6D_SH_STATE_DISABLED := 4,
		mcACP6D_SH_STATE_MOTION := 5,
		mcACP6D_SH_STATE_WAIT := 6,
		mcACP6D_SH_STATE_STOPPING := 7,
		mcACP6D_SH_STATE_OBSTACLE := 8,
		mcACP6D_SH_STATE_HOLD := 9,
		mcACP6D_SH_STATE_STOPPED := 10,
		mcACP6D_SH_STATE_ERROR := 14,
		mcACP6D_SH_STATE_RESERVED := 15
		);
	McAcp6DZoneStateEnum :
		(
		mcACP6D_ZONE_NOT_AVAILABLE := 0,
		mcACP6D_ZONE_ACTIVE_OPEN := 1,
		mcACP6D_ZONE_DEACTIVATING := 2,
		mcACP6D_ZONE_LOADING := 3,
		mcACP6D_ZONE_ACTIVATING := 4,
		mcACP6D_ZONE_ACTIVE_CLOSED := 5,
		mcACP6D_ZONE_ERROR := 6
		);
	McAcp6DAutoZoneCtrlCmdEnum :
		(
		mcACP6D_AUTO_ZONE_CREATE := 0,
		mcACP6D_AUTO_ZONE_DELETE := 1,
		mcACP6D_AUTO_ZONE_ACTIVATE := 2,
		mcACP6D_AUTO_ZONE_DEACTIVATE := 3
		);
	McAcp6DAutoZoneStateEnum :
		(
		mcACP6D_AUTO_ZONE_UNDEFINED := 0,
		mcACP6D_AUTO_ZONE_DEFINED := 1,
		mcACP6D_AUTO_ZONE_UNLOADING_ZONE := 2,
		mcACP6D_AUTO_ZONE_LOADING_ZONE := 3
		);
	McAcp6DAutoZoneOpStateEnum :
		(
		mcACP6D_AUTO_ZONE_BUSY := 0,
		mcACP6D_AUTO_ZONE_READY := 1
		);
	McAcp6DAutoZoneInfoTyp : 	STRUCT
		ZoneState : McAcp6DAutoZoneStateEnum; (* 0: undefined, 1: defined, 2: unloading zone, 3: loading zone*)
		EntranceExitState : McAcp6DAutoZoneOpStateEnum; (*0: busy, 1: ready (if loading zone is ready, a shuttle is ready to fetch,if an unloading zone and ready than ready to receive new shuttle)*)
		numShuttles : USINT; (* # of Shuttles in the zone*)
		Shuttle : Mc6DShuttleType; (* Shuttle ID added to unloading zone or ready to fetch from loading zone *)
		ZoneX : REAL; (* X coordinate of entrance or exit (m)*)
		ZoneY : REAL; (* Y coordinate of entrance or exit (m) *)
	END_STRUCT;
	McAcp6DAutoZoneCtrlParType : 	STRUCT
		ZoneMode : USINT; (* 0: unloading zone, 1: loading zone*)
		UnloadingMode : USINT; (* 0: soft-landing mode, 1: hard-landing mode*)
		LoadFailResetMode : USINT; (* 0: manual reset loading zone, 1: auto reset loading zone*)
		ZoneCenterX : REAL; (* X coordinate of zone center at flyway boundary (m)*)
		ZoneCenterY : REAL; (* Y coordinate of zone center at flyway boundary (m)*)
		ZoneLength : REAL; (* zone length in loading/unloading direction (m)*)
		ZoneWidth : REAL; (* zone width (m)*)
		MaxShuttleSizeX : REAL; (* max mover size in X (m)*)
		MaxShuttleSizeY : REAL; (* max mover size in Y (m)*)
		Velocity : REAL; (* max travilling speed inside the zone (m/s)*)
		Acceleration : REAL; (* max travelling acceleration inside the zone (m/s^s)*)
		MaxHeight : REAL; (* max detection height (m) (0 = no limit)*)
	END_STRUCT;
	McAcp6DJogVelocityParType : 	STRUCT
		Jog : BOOL;
		Direction : REAL; (*Direction in rad. 0 rad = positive x*)
		Velocity : REAL;
	END_STRUCT;
	McAcp6DAsmInfoType : 	STRUCT
		AssemblyState : McAcp6dPLCopenStateEnum;
		Controller6DState : McAcp6DControllerStateEnum; (*Current system state*)
		ShuttlesInAccidentCount : USINT; (*Number of shuttles with accident.*)
		ShuttlesCount : USINT; (*Number of shuttles on the assembly.*)
		CommunicationReady : BOOL; (*Communication to the ACOPOS 6D controller is ready.*)
	END_STRUCT;
	McAcp6DAsmGetInfoType : 	STRUCT
		State : McAcp6DControllerStateEnum; (*Current system state*)
		NumberOfShuttles : UINT; (*Number of shuttles recognized by the controller*)
		Power : REAL; (*Total power consumption. Sum of all segment power.*)
		MaxCPUTemp : REAL; (*Maximum CPU temperature of all segments. CPU temperature refers to the internal CPU inside the segment.*)
		MaxAmplifierTemp : REAL; (*Maximum Amplifier temperature of all segments. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MaxMotorTemp : REAL; (*Maximum Motor temperature of all segments. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
		StatusPowerlink : McAcp6DStatusPowerlinkEnum; (* Powerlink connection state between PLC and 6D Controller *)
		Status6DLink : McAcp6DStatus6DLinkEnum; (* 6D-Link connection state between 6D Controller and Assembly *)
		StatusShuttleHoming : McAcp6DStatusShuttleHomingEnum; (* Status of shuttle homing *)
		ErrorCode : UDINT; (* Persistent error codes of 6D Controller, System Error Codes *)
	END_STRUCT;
	McAcp6DSerialNumType : 	STRUCT
		SerialNumHigh : UDINT; (* High 32 bits of serial number (left 4 bytes)*)
		SerialNumLow : UDINT; (* Low 32 bits of serial number (right 4 bytes)*)
	END_STRUCT;
	McAcp6DVersionNumType : 	STRUCT
		VersionNumHigh : UDINT; (* High 32 bits of version number (left 4 bytes)*)
		VersionNumLow : UDINT; (* Low 32 bits of version number (right 4 bytes)*)
	END_STRUCT;
	McAcp6DSegPositionType : STRUCT
		X : REAL; (*Segment position of left side. Unit in m*)
		Y : REAL; (*Segment position of bottom side. Unit in m*)
	END_STRUCT;
	McAcp6DSegTypesEnum :
		(
		mcACP6D_SEG_TYPE_240_240 := 0,
		mcACP6D_SEG_TYPE_480_120 := 1,
		mcACP6D_SEG_TYPE_120_480 := 2,
		mcACP6D_SEG_TYPE_320_320 := 3,
		mcACP6D_SEG_TYPE_640_160 := 4,
		mcACP6D_SEG_TYPE_160_640 := 5
		);
	McAcp6DSegInfoType : 	STRUCT
		Power : REAL; (*Total power consumption. Sum of all segment power.*)
		CPUTemp : REAL; (*CPU temperature of all segments. CPU temperature refers to the internal CPU inside the segment.*)
		AmplifierTemp : REAL; (*Amplifier temperature of all segments. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MotorTemp : REAL; (*Motor temperature of all segments. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
		Position : McAcp6DSegPositionType; (*Provides segment position in X and Y direction*)
		Type : McAcp6DSegTypesEnum; (*Types of segment*)
	END_STRUCT;
	McAcp6DAsyncPosType : 	STRUCT
		X : REAL;
		Y : REAL;
		Shuttle : REFERENCE TO Mc6DShuttleType;
	END_STRUCT;
	McAcp6DMoveInPlaneAsyncParType : 	STRUCT
		Velocity : REAL;
		Acceleration : REAL;
		AsyncPar : ARRAY[0..77]OF McAcp6DAsyncPosType;
		Zone : REFERENCE TO Mc6DZoneType;
		Mode : McAcp6DMoveInPlaneAsyncModeEnum;
		MoveOnlySelectedShuttles : BOOL;
		Overhang : BOOL;
	END_STRUCT;
	McAcp6DShGroupShListParType : 	STRUCT
		Shuttle : REFERENCE TO Mc6DShuttleType;
	END_STRUCT;
	McAcp6DShGroupAddShParType : 	STRUCT
		ShuttleList : ARRAY[0..31]OF McAcp6DShGroupShListParType;
	END_STRUCT;
	McAcp6DPlanetCtrlOptionEnum :
		(
		mcACP6D_PLANET_REMOVE_SH := 0,
		mcACP6D_PLANET_ADD_SH := 1
		);
	McAcp6DPlanetParType : 	STRUCT
		Option : McAcp6DPlanetCtrlOptionEnum;
		ShuttleList : ARRAY[0..31]OF McAcp6DShGroupShListParType;
	END_STRUCT;
	McAcp6DShGroupCoupleStateEnum :
		(
		mcACP6D_SH_GROUP_DECOUPLED := 0,
		mcACP6D_SH_GROUP_COUPLED := 1
		);
	McAcp6DShGroupCoupleOptionEnum :
		(
		mcACP6D_SH_GROUP_DECOUPLE := 0,
		mcACP6D_SH_GROUP_COUPLE := 1
		);
	McAcp6DShGroupCoupleModeEnum :
		(
		mcACP6D_SH_GROUP_INDV_ROT_REF := 0,
		mcACP6D_SH_GROUP_CMN_ROT_REF := 1
		);
	McAcp6DShGroupCoupleCtrlParType : 	STRUCT
		Mode : McAcp6DShGroupCoupleModeEnum;
		Option : McAcp6DShGroupCoupleOptionEnum;
	END_STRUCT;
	McAcp6DShGroupInfoType : 	STRUCT
		CoupleState : McAcp6DShGroupCoupleStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
	McAcp6DSegBarrierInfoType : 	STRUCT
		State : McAcp6DZoneStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
	McAcp6DZoneBarrierInfoType : 	STRUCT
		State : McAcp6DZoneStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
	McAcp6DZoneTypeEnum :
		(
		mcACP6D_ZONE_TYPE_NORMAL := 0,
		mcACP6D_ZONE_TYPE_KEEP_OUT := 1,
		mcACP6D_ZONE_TYPE_INTERSECTION := 2
		);
	McAcp6DForceModeOptionEnum :
		(
		mcACP6D_FORCE_MODE_EXIT := 0,
		mcACP6D_FORCE_MODE_Z := 1,
		mcACP6D_FORCE_MODE_X := 2,
		mcACP6D_FORCE_MODE_Y := 3,
		mcACP6D_FORCE_MODE_XY := 4,
		mcACP6D_FORCE_MODE_RZ := 5,
		mcACP6D_FORCE_MODE_RZX := 8,
		mcACP6D_FORCE_MODE_RZY := 9,
		mcACP6D_FORCE_MODE_RZXY := 11
		);
	McAcp6DCreateZoneParType : 	STRUCT
		Name : STRING[32];
		ZoneType : McAcp6DZoneTypeEnum;
		MaxShuttleCount : UINT; (*Maximum number of shuttles inside the zone (mcACP6D_ZONE_TYPE_INTERSECTION only)*)
		ActivateLevitationLimit : BOOL; (*Allow only shuttles below the specified levitation height inside the zone (mcACP6D_ZONE_TYPE_INTERSECTION only)*)
		LevitationLimit : REAL; (*Maximum levitation height allowed for shuttles to enter the zone (mcACP6D_ZONE_TYPE_INTERSECTION only)*)
		BottomLeft : McAcp6DInPlaneAxesType;
		TopRight : McAcp6DInPlaneAxesType;
	END_STRUCT;
	McAcp6DZoneOverrideParType : 	STRUCT
		Mode : McAcp6DZoneOverrideModeEnum;
		MaxVelocity : REAL; (*Velocity limit. This value is either absolute [m/s] or multiplicative factor depending on the mode set.*)
		MaxAcceleration : REAL; (*Acceleration limit. This value is either absolute [m/s²] or multiplicative factor depending on the mode set.*)
	END_STRUCT;
	McAcp6DZoneOverrideModeEnum :
		(
		mcACP6D_ZONE_OVERRIDE_FACTOR := 0,
		mcACP6D_ZONE_OVERRIDE_ABSOLUTE := 1
	);
	McAcp6DGetShAddInfoType : 	STRUCT
		ShuttleID : UINT;
	END_STRUCT;
	McAcp6DGetSegAddInfoType : 	STRUCT
		SegmentID : UINT;
	END_STRUCT;
	McAcp6DGetZoneAddInfoType : 	STRUCT
		ZoneID : UINT;
		ZoneType : McAcp6DZoneTypeEnum;
		Name : STRING[32];
	END_STRUCT;
	McAcp6DGetShGroupAddInfoType : 	STRUCT
		GroupID : UINT;
	END_STRUCT;
	McAcp6DMoveModeEnum :
		(
		mcACP6D_MOVE_ABSOLUTE := 0,
		mcACP6D_MOVE_RELATIVE := 1
		);
	McAcp6DInPlanePathEnum :
		(
		mcACP6D_PATH_DIRECT := 0,
		mcACP6D_PATH_X_THEN_Y := 1,
		mcACP6D_PATH_Y_THEN_X := 2
		);
	McAcp6DArcDirectionEnum :
		(
		mcACP6D_ARC_CLOCKWISE := 0,
		mcACP6D_ARC_COUNTER_CLOCKWISE := 1
		);
	McAcp6DArcOptionEnum :
		(
		mcACP6D_ARC_RADIUS := 0,
		mcACP6D_ARC_ANGULAR := 1
		);
	McAcp6DArcTypeEnum :
		(
		mcACP6D_ARC_MINOR, (*Minor Arc (shortest arc path) to the target position*)
		mcACP6D_ARC_MAJOR (*Major Arc (longest arc path) to the target position*)
		);
	McAcp6DShortAxRotEnum :
		(
		mcACP6D_SHORT_AX_ROT_ONLY,
		mcACP6D_SHORT_AX_ROT_CENTER
		);
	McAcp6DLevitationLevelEnum :
		(
		mcACP6D_LEVEL_LAND := 0,
		mcACP6D_LEVEL_LEVITATE := 1
		);
	McAcp6DBufferStateEnum :
		(
		mcACP6D_BUFFER_STATE_BLOCKED := 0,
		mcACP6D_BUFFER_STATE_OPEN := 1
		);
	McAcp6DHaltOptionEnum :
		(
		mcACP6D_CONTINUE := 0,
		mcACP6D_HALT := 1
		);
	McAcp6DGetPayloadModeEnum :
		(
		mcACP6D_PAYLOAD_DIRECT := 0,
		mcACP6D_PAYLOAD_DURATION := 1,
		mcACP6D_PAYLOAD_DURATION_ASYNC := 2
		);
	McAcp6DAsmBufferOptionEnum :
		(
		mcACP6D_BUFFER_ASM_BLOCK := 0,
		mcACP6D_BUFFER_ASM_RELEASE := 1,
		mcACP6D_BUFFER_ASM_CLEAR := 2
		);
	McAcp6DShGroupBufferOptionEnum :
		(
		mcACP6D_BUFFER_SHGROUP_BLOCK := 0,
		mcACP6D_BUFFER_SHGROUP_RELEASE := 1
		);
	McAcp6DBufferOptionEnum :
		(
		mcACP6D_BUFFER_BLOCK := 0,
		mcACP6D_BUFFER_RELEASE := 1,
		mcACP6D_BUFFER_CLEAR := 2,
		mcACP6D_BUFFER_GET_STATUS := 3
		);
	McAcp6DBarrierCmdEnum :
		(
		mcACP6D_BARRIER_OPEN := 0,
		mcACP6D_BARRIER_CLOSE := 1
		);
	McAcp6DBarrierCmdParType : 	STRUCT
		Command : McAcp6DBarrierCmdEnum;
	END_STRUCT;
	McAcp6DInPlaneAxesType : 	STRUCT
		X : REAL;
		Y : REAL;
	END_STRUCT;
	McAcp6DShortAxAxesType : 	STRUCT
		Z : REAL;
		Rx : REAL;
		Ry : REAL;
		Rz : REAL;
	END_STRUCT;
	McAcp6DInPlaneParType : 	STRUCT
		Position : McAcp6DInPlaneAxesType;
		Velocity : REAL;
		EndVelocity : REAL;
		Acceleration : REAL;
		Radius : REAL;
		Mode : McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Path : McAcp6DInPlanePathEnum;
	END_STRUCT;
	McAcp6DAxisBoolType : 	STRUCT
		X : BOOL;
		Y : BOOL;
		Z : BOOL;
		RX : BOOL;
		RY : BOOL;
		RZ : BOOL;
	END_STRUCT;
	McAcp6DMoveCyclicParType : 	STRUCT
		DisableAxis : McAcp6DAxisBoolType;
	END_STRUCT;
	McAcp6DValueSrcEnum :
		(
		mcACP6D_VALUE_ACTUAL := 0
		);
	McAcp6DReadCyclicParType : 	STRUCT
		ValueSource : McAcp6DValueSrcEnum;
	END_STRUCT;
	McAcp6DShortAxRotType : 	STRUCT
		Type : McAcp6DShortAxRotEnum;
		Center : McAcp6DInPlaneAxesType;
	END_STRUCT;
	McAcp6DShortAxParType : 	STRUCT
		Position : McAcp6DShortAxAxesType;
		Velocity : McAcp6DShortAxAxesType;
		Mode : McAcp6DMoveModeEnum;
		Rotation : McAcp6DShortAxRotType;
	END_STRUCT;
	McAcp6DArcAngularType : 	STRUCT
		Center : McAcp6DInPlaneAxesType;
		Angle : REAL;
	END_STRUCT;
	McAcp6DArcRadiusType : 	STRUCT
		Position : McAcp6DInPlaneAxesType;
		Radius : REAL;
		ArcType : McAcp6DArcTypeEnum;
	END_STRUCT;
	McAcp6DArcParType : 	STRUCT
		Direction : McAcp6DArcDirectionEnum;
		Velocity : REAL;
		EndVelocity : REAL;
		Acceleration : REAL;
		Mode : McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Option : McAcp6DArcOptionEnum;
		Angular : McAcp6DArcAngularType;
		Radius : McAcp6DArcRadiusType;
	END_STRUCT;
	McAcp6DLevitationParType : 	STRUCT
		Level : McAcp6DLevitationLevelEnum;
		Speed : USINT;
		ZForce : REAL;
	END_STRUCT;
	McAcp6DShortAx6DParType : 	STRUCT
		Position : McAcp6DShortAxAxesType;
		Velocity : McAcp6DShortAxAxesType;
	END_STRUCT;
	McAcp6DInPlane6DParType : 	STRUCT
		Position : McAcp6DInPlaneAxesType;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	McAcp6DMove6DParType : 	STRUCT
		InPlane : McAcp6DInPlane6DParType;
		ShortAxis : McAcp6DShortAx6DParType;
	END_STRUCT;
	McAcp6DShPositionType : 	STRUCT
		X : REAL;
		Y : REAL;
		Z : REAL;
		Rx : REAL;
		Ry : REAL;
		Rz : REAL;
	END_STRUCT;
	McAcp6DShForceType : 	STRUCT
		Fx : REAL;
		Fy : REAL;
		Fz : REAL;
		Tx : REAL;
		Ty : REAL;
		Tz : REAL;
	END_STRUCT;
	McAcp6DForceModeParType : 	STRUCT
		Option : McAcp6DForceModeOptionEnum;
		Force : McAcp6DShForceType;
	END_STRUCT;
	McAcp6DShInfoMotionBufferType : 	STRUCT
		NumberOfCommands : UINT;
		IsBlocked : BOOL;
		CommandLabel : UINT;
	END_STRUCT;
	McAcp6DShInfoType : 	STRUCT
		ShuttleID : UINT;
		State : McAcp6DShStateEnum;
		Position : McAcp6DShPositionType;
		Discovered : BOOL;
	END_STRUCT;
	McAcp6DShGetInfoType : 	STRUCT
		ShuttleID : UINT;
		State : McAcp6DShStateEnum;
		Position : McAcp6DShPositionType;
		Force : McAcp6DShForceType;
		IsHalt : BOOL;
		MotionBuffer : McAcp6DShInfoMotionBufferType;
		ForceMode : McAcp6DAxisBoolType;
		StarShuttle : Mc6DShuttleType;
	END_STRUCT;
	McAcp6DShGetPropertyType : 	STRUCT
		ShuttleType : McAcp6DShTypesEnum;
	END_STRUCT;
	McAcp6DBufferInfoType : 	STRUCT
		NumberOfCommands : UINT;
		State : McAcp6DBufferStateEnum;
		NextCmdLabel : UINT;
		LatestCmdLabel : UINT;
	END_STRUCT;
	McAcp6DErrInfoType : 	STRUCT
		NumberOfErrors : USINT;
		ErrorCode : ARRAY[0..8]OF DINT;
	END_STRUCT;
	McAcp6DShTypesEnum :
		(
		mcACP6D_SH_TYPE_120_120 := 0,
		mcACP6D_SH_TYPE_180_120 := 2,
		mcACP6D_SH_TYPE_120_180 := 3,
		mcACP6D_SH_TYPE_240_120 := 4,
		mcACP6D_SH_TYPE_180_180 := 6,
		mcACP6D_SH_TYPE_210_180 := 8,
		mcACP6D_SH_TYPE_180_210 := 9,
		mcACP6D_SH_TYPE_210_210 := 12,
		mcACP6D_SH_TYPE_240_240 := 14,
		mcACP6D_SH_TYPE_330_210 := 16,
		mcACP6D_SH_TYPE_300_300 := 18,
		mcACP6D_SH_TYPE_330_330 := 20,
		mcACP6D_SH_TYPE_450_450 := 22,
		mcACP6D_SH_TYPE_S4_160_160 := 30,
		mcACP6D_SH_TYPE_S4_160_240 := 32,
		mcACP6D_SH_TYPE_S4_160_320 := 34,
		mcACP6D_SH_TYPE_S4_240_240 := 36,
		mcACP6D_SH_TYPE_S4_240_280 := 38,
		mcACP6D_SH_TYPE_S4_280_280 := 42,
		mcACP6D_SH_TYPE_S4_320_320 := 44,
		mcACP6D_SH_TYPE_S4_280_440 := 46,
		mcACP6D_SH_TYPE_S4_400_400 := 48,
		mcACP6D_SH_TYPE_S4_440_440 := 50,
		mcACP6D_SH_TYPE_S4_600_600 := 52
		);
	McAcp6DShPerformanceLevelEnum :
		(
		mcACP6D_SH_PERF_STABILITY := 0,
		mcACP6D_SH_PERF_SEMI_STABILITY := 1,
		mcACP6D_SH_PERF_SEMI_AGGRESSIVE := 2,
		mcACP6D_SH_PERF_AGGRESSIVE := 3
		);
	McAcp6DPayloadSizeType : 	STRUCT
		XOffsetPos : REAL;
		XOffsetNeg : REAL;
		YOffsetPos : REAL;
		YOffsetNeg : REAL;
	END_STRUCT;
	McAcp6DCoGType : 	STRUCT
		X : REAL;
		Y : REAL;
		Z : REAL;
	END_STRUCT;
	McAcp6DShStereotypeTypeEnum :
		(
		mcACP6D_SH_STEREOTYPE_CUSTOM := 0,
		mcACP6D_SH_STEREOTYPE_DEFAULT := 1
		);
	McAcp6DShStereotypeParType : 	STRUCT
		Name : STRING[32];
		ShuttleType : McAcp6DShTypesEnum;
		Type: McAcp6DShStereotypeTypeEnum;
		PerformanceLevel : McAcp6DShPerformanceLevelEnum;
		Payload : REAL;
		PayloadSize : McAcp6DPayloadSizeType;
		CenterOfGravity : McAcp6DCoGType;
		Deceleration : REAL;
	END_STRUCT;
	McAcp6DStereotypeGetInfoType : 	STRUCT
		ShuttleType : McAcp6DShTypesEnum;
		PerformanceLevel : McAcp6DShPerformanceLevelEnum;
		Payload : REAL;
		PayloadSize : McAcp6DPayloadSizeType;
		CenterOfGravity : McAcp6DCoGType;
		Deceleration : REAL;
	END_STRUCT;
	McAcp6DMacroCreateParType : 	STRUCT
		Name : STRING[32];
	END_STRUCT;	
	McAcp6DShWaitFBDITriggerEnum :
		(
		mcACP6D_SH_WAIT_FBDI_RE := 0, (* Rising edge *)
		mcACP6D_SH_WAIT_FBDI_FE := 1, (* Falling edge *)
		mcACP6D_SH_WAIT_FBDI_HL := 2, (* High level *)
		mcACP6D_SH_WAIT_FBDI_LL := 3 (* Low level *)
		);		
	McAcp6DShWaitZoneTriggerEnum :
	(
		mcACP6D_SH_WAIT_ZONE_RE := 0, (* Rising edge *)
		mcACP6D_SH_WAIT_ZONE_FE := 1, (* Falling edge *)
		mcACP6D_SH_WAIT_ZONE_GT := 2, (* Greater than *)
		mcACP6D_SH_WAIT_ZONE_LT := 3 (* Lower than *)
	);
	McAcp6DRotaryMotionModeEnum :
		(
		mcACP6D_ROTATE_ABSOLUTE_POS := 0,
		mcACP6D_ROTATE_COUNTER_CLOCKWISE := 1,
		mcACP6D_ROTATE_CLOCKWISE := 2
		);
	McAcp6DRotaryMotionParType : 	STRUCT
		Mode : McAcp6DRotaryMotionModeEnum;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	McAcp6DRotaryMotionSpinParType : 	STRUCT
		Duration : REAL;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	McAcp6DShWaitCmdLbTriggerEnum :
		(
		mcACP6D_SH_WAIT_CMDLB_START := 0, (* Start of command execution *)
		mcACP6D_SH_WAIT_CMDLB_END := 1, (* End of command execution *)
		mcACP6D_SH_WAIT_CMDLB_ANY := 2 (* Any point during command execution *)
		);
	McAcp6DShWaitCmdLbLabelEnum :
		(
		mcACP6D_SH_WAIT_CMDLB_REGULAR := 0, (* Regular Motion Cmd Label *)
		mcACP6D_SH_WAIT_CMDLB_MACRO := 1 (* Run Macro Cmd Label *)
		);
	McAcp6DShWaitDispModeEnum :
		(
		mcACP6D_SH_WAIT_DISP_X_ONLY := 0, (* Using X only *)
		mcACP6D_SH_WAIT_DISP_Y_ONLY := 1, (* Using Y only *)
		mcACP6D_SH_WAIT_DISP_STRLINE := 2 (* A straight line of arbitrary orientation *)
		);
	McAcp6DShWaitDispTypeEnum :
		(
		mcACP6D_SH_WAIT_DISP_GT := 0, (* Greater than boundary value *)
		mcACP6D_SH_WAIT_DISP_LT := 1, (* Less than boundary value *)
		mcACP6D_SH_WAIT_DISP_RE := 2, (* Rising above boundary value *)
		mcACP6D_SH_WAIT_DISP_FE := 3 (* Falling below boundary value *)
		);
	Mc6DPowerSecType : 	STRUCT
		controlif : REFERENCE TO Mc6DInternalPowerSecIfType;
	END_STRUCT;
	Mc6DInternalPowerSecIfType : 	STRUCT  (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	McAcp6DGetPowerSecAddInfoType : 	STRUCT
		SectorID : UINT;
		Name : STRING[32];
	END_STRUCT;
	McAcp6DPowerSecInfoType : 	STRUCT
	        Name : STRING[32];
		SectorID : UINT;
		State : McAcp6PowerSecStateEnum;
	END_STRUCT;
	McAcp6PowerSecStateEnum :
		(
		mcACP6D_POWER_SEC_UNDEFINED := 0,
		mcACP6D_POWER_SEC_DISCONNECTED := 1,
		mcACP6D_POWER_SEC_INACTIVE_CLOSE := 2,
		mcACP6D_POWER_SEC_DEACTIVATING := 3,
		mcACP6D_POWER_SEC_ACTIVATING := 5,
		mcACP6D_POWER_SEC_ACTIVE_CLOSE := 6,
		mcACP6D_POWER_SEC_OPERATION := 7
		);
	McAcp6DAxisEnum :
		(
		mcACP6D_AXIS_X := 1,
		mcACP6D_AXIS_Y := 2,
		mcACP6D_AXIS_Z := 3,
		mcACP6D_AXIS_Rx := 4,
		mcACP6D_AXIS_Ry := 5,
		mcACP6D_AXIS_Rz := 6
		);
	McAcp6DSetJerkLimitParType : 	STRUCT
		Axis : McAcp6DAxisEnum;
		JerkLimit : REAL;
	END_STRUCT;
	McAcp6DShRecovBufferOptEnum :
		(
		mcACP6D_SH_RECOV_BUFFER_RESUME := 0, (* Resume previous motions after recovery. Default. *)
		mcACP6D_SH_RECOV_BUFFER_PAUSE := 1, (* Pause previous motions after recovery. Motion commands are stored in motion buffer. *)
		mcACP6D_SH_RECOV_BUFFER_CLEAR := 2 (* Clears motion buffer after recovery. *)
		);
	McAcp6DShRecovShortAxesOptEnum :
		(
		mcACP6D_SH_RECOV_SHORTAX_DEF:= 0, (* Resume to default levitation position and 0 rotation axis position after recovery. Default. *)
		mcACP6D_SH_RECOV_SHORTAX_PREV := 1 (* Resume to previous short axis position after recovery. *)
		);
	McAcp6DMoveInPlaneAsyncModeEnum :
		(
		mcACP6D_SHUTTLE_SORTED:= 0, (* Shuttles are moved to the specified target position (shuttle position pair). Default. *)
		mcACP6D_SHUTTLE_UNSORTED := 1 (* Shuttles are moved to the closest target position to them. *)
		);
	McAcp6DAsmActivationOptionEnum :
		(
		mcACP6D_ASMPOWERON_AUTO := 0, (* All steps for power on of assembly are done automatically. Default. *)
		mcACP6D_ASMPOWERON_TO_LANDED := 1, (* Assembly powers on, shuttles remain landed. *)
		mcACP6D_ASMPOWERON_TO_LEVITATION := 2, (* Assembly powers on and shuttles levitate. Absolute shuttle IDs are not identifed. *)
		mcACP6D_ASMPOWERON_TO_IDENT := 3, (* Identfies all absolute shuttle IDs in the defined Zone. Zone = 0 identifies whole assembly. *)
		mcACP6D_ASMPOWERON_TO_READY:= 4 (* Sets the assembly to state ready after identification is done. *)
		);
	McAcp6DAutoZoneStateType : 	STRUCT
		ZoneID : USINT; (* ZoneID of AutoZone *)
		ZoneState : McAcp6DAutoZoneStateEnum; (* 0: undefined, 1: defined, 2: unloading zone, 3: loading zone*)
		EntranceExitState : McAcp6DAutoZoneOpStateEnum; (*0: busy, 1: ready (if loading zone is ready, a shuttle is ready to fetch,if an unloading zone and ready than ready to receive new shuttle)*)
		Shuttle : Mc6DShuttleType; (* Shuttle ID added to unloading zone or ready to fetch from loading zone *)
		LastLoadingStatus : McAcp6DAutoZoneLoadingStatusEnum; (* Status of last loaded shuttle *)
	END_STRUCT;
	McAcp6DAutoZoneAllInfoType : 	STRUCT
		NumberOfZones : UINT; (* Number of zones recognized by the controller *)
		AutoZoneStatusPar : ARRAY[0..39]OF McAcp6DAutoZoneStateType;
	END_STRUCT;
	McAcp6DAutoZoneLoadingStatusEnum :
	(
		mcACP6D_AUTO_ZONE_LOAD_NO_ERROR := 0, (* No error detected*)
		mcACP6D_AUTO_ZONE_LOAD_ERROR := 2 (* Auto loading failed *)
	);
	McAcp6DReadArrivedShAddInfoType : 	STRUCT
		ShuttleID : UINT; (* ID of the shuttle on the assembly. *)
		BorderID : UINT; (* Border ID that shuttle has crossed. Border ID of the destination assembly. *)
	END_STRUCT;
	McAcp6DAsmBorderStateEnum :
	(
		mcACP6D_BORDER_INACTIVE  := 0, (* This 6D controller is not activated or border is not configured *)
		mcACP6D_BORDER_NOT_READY  := 1, (* Neighboring 6D controller is not activated *)
		mcACP6D_BORDER_READY   := 2 (* Ready for shuttle exchange *)
	);
	McAcp6DStatus6DLinkEnum :
	(
		mcACP6D_6DLINK_CONNECTED  := 0, (* 6D Controller is connected to Assembly via 6D Link *)
		mcACP6D_6DLINK_DISCONNECTED  := 1 (* 6D Controller is disconnected from Assembly *)
	);
	McAcp6DStatusPowerlinkEnum :
	(
		mcACP6D_PLK_CONNECTED_SYNC  := 0, (* 6D Controller is connected and synchronized via Powerlink *)
		mcACP6D_PLK_DISCONNECTED  := 1, (* 6D Controller is disconnected from Powerlink *)
		mcACP6D_PLK_CONNECTED_NOT_SYNC  := 2 (* 6D Controller is connected via Powerlink but not synchronized *)
	);
	McAcp6DStatusShuttleHomingEnum :
	(
		mcACP6D_SH_HOMING_INPROGRESS  := 0, (* At least one shuttle doesn't finish homing *)
		mcACP6D_SH_HOMING_DONE  := 1 (* All shuttles finished homing *)
	);
	McAcp6DChangeShIDParType : 	STRUCT
		NumberOfShuttles : USINT; (* Number of shuttles to change *)
		CurrentShuttleIDs : ARRAY[0..199]OF USINT;
		NewShuttleIDs : ARRAY[0..199]OF USINT;
	END_STRUCT;
	McAcp6DReadShIDTableType : 	STRUCT
		NumberOfEntries : USINT; (*Number of table entries*)
		ShuttleIDs : ARRAY[0..149]OF USINT; (*IDs of shuttles*)
		UIDHigh : ARRAY[0..149]OF UDINT; (*High 32 bits of Unique identifier (left 4 bytes)*)
		UIDLow : ARRAY[0..149]OF UDINT; (*Low 32 bits of Unique identifier (right 4 bytes)*)
	END_STRUCT;
	McAcp6DWriteShIDTableType : 	STRUCT
		NumberOfEntries : USINT; (*Number of table entries*)
		ShuttleIDs : ARRAY[0..149]OF USINT; (*IDs of shuttles*)
		UIDHigh : ARRAY[0..149]OF UDINT; (*High 32 bits of Unique identifier (left 4 bytes)*)
		UIDLow : ARRAY[0..149]OF UDINT; (*Low 32 bits of Unique identifier (right 4 bytes)*)
		Orientation : ARRAY[0..149]OF USINT; (*0: East, 1: North, 2: West, 3: South*)
	END_STRUCT;
	McAcp6DUserDataModeEnum :
	(
		mcACP6D_USERDATA_GET := 0, (* Read user data *)
		mcACP6D_USERDATA_SET := 1 (* Write user data *)
	);
END_TYPE