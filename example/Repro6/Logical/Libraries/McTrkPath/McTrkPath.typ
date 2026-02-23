
TYPE
	McTrkPathPLCopenStateEnum :
		(
		mcTRKPATH_STARTUP,
		mcTRKPATH_READY,
		mcTRKPATH_ERRORSTOP,
		mcTRKPATH_INVALID_CONFIGURATION
		);
	McTrkFrmGetModEnum :
		(
		mcTRKPATH_GET_MOD_ALL_FRAMES := 0, (*Get all TrackingFrame*)
		mcTRKPATH_GET_MOD_CERTAIN_FRAME := 1 (*Get TrackingFrame with a certain ID*)
		);
	McTrkFrmInfoModEnum :
		(
		mcTRKPATH_INFO_MOD_ALL := 0, (*Everything*)
		mcTRKPATH_INFO_MOD_ID_ONLY := 1, (*Only TrackingFrame ID and attribute*)
		mcTRKPATH_INFO_MOD_POSE := 2, (*TrackingFrame orientation and translation (+ TrackingFrame ID and attribute) *)
		mcTRKPATH_INFO_MOD_DIST := 3, (*Distance to tracking path (+ TrackingFrame ID and attribute) *)
		mcTRKPATH_INFO_MOD_POSE_DIST := 4 (*TrackingFrame orientation, translation and distance to tracking path (+TrackingFrame ID and attribute) *)
		);
	McTrkFrmDeleteModEnum :
		(
		mcTRKFRM_DELETE_MOD_FRAME := 0, (*Delete TrackingFrame with given TrackingFrame ID*)
		mcTRKFRM_DELETE_MOD_ALL := 1 (*Delete all TrackingFrames existing on the tracking path*)
		);
	McTrkPathBasicCmdConsiderEnum :
		(
		mcTRKPATH_AXCMDC_NOT_SUPPORTED := 0,
		mcTRKPATH_AXCMDC_TARGET_POS := 1,
		mcTRKPATH_AXCMDC_TARGET_VEL :=2
		);
	McTrkFrmInfoType : 	STRUCT
		TrackingFrameID : McTrkFrmIdentType; (*TrackingFrame ID*)
		CurrentPosition : McPosType; (*Current position of the TrackingFrame*)
		CurrentOrientation : McOrientType; (*Current orientation of the TrackingFrame*)
		Distance : LREAL; (*Distance from tracking path coordinate system to the TrackingFrame along the x-axis*)
		Attribute : UDINT; (*Attribute which was given to the TrackingFrame*)
	END_STRUCT;
	McTrkFramesCreateParType : 	STRUCT
		DataAddress : {REDUND_UNREPLICABLE} UDINT; (*Address of McTrkFrmCreateParType array. *)
		NumberOfFrames : UINT; (*Defines the number of TrackingFrames to be created. The value must not exceed the number of array elements referenced at DataAddress input*)
	END_STRUCT;
	McTrkFrmCreateParType : 	STRUCT
		LatchedPath : McTrkFrmLatPathType; (*Parameter for latched path position*)
		Translation : McPosType; (*Translation of current TrackingFrame to tracking path coordinate system*)
		Orientation : McOrientType; (*Orientation of current TrackingFrame relative to tracking path coordinate system*)
		Attribute : UDINT; (*Optional attribute which can be added to the TrackingFrame. E.g. productID, quality or color *)
		UserDataAddress : UDINT; (*Optional address to a user data process variable which content will be copied to the created TrackingFrame. The size must match with the configured user data size in TrackingPath configuration*)
	END_STRUCT;
	McTrkFrmLatPathType : 	STRUCT
		Position : LREAL; (*Latched tracking path position*)
	END_STRUCT;
	McTrkPathGetFrmParType : 	STRUCT
		GetMode : McTrkFrmGetModEnum; (*Mode to define which TrackingFrames are to be read*)
		InfoMode : McTrkFrmInfoModEnum; (*Mode to define which TrackingFrame information is needed*)
		TrackingFrameID : McTrkFrmIdentType; (*TrackingFrame ID (GetMode = mcTRKPATH_GET_MOD_CERTAIN_FRAME)*)
		CoordSystem : UDINT; (*Coordinate system in which translation and orientation is given. mcMCS defines the tracking path coordinate system*)
		DataAddress : {REDUND_UNREPLICABLE} UDINT; (*Address of McTrkFrmInfoType array. *)
		NumberOfFrames : UINT; (*Defines the number of array elements of McTrkFrmInfoType array referenced at DataAddress input*)
	END_STRUCT;
	McTrkFrmIdentType : UDINT; (*TrackingFrame identification type*)
	McTrkPathEstimatedMotionState : 	STRUCT
		Position : LREAL;	(*Estimated position*)
		Velocity : REAL;	(*Estimated velocity*)
	END_STRUCT;
	McTrkPathInfoType : 	STRUCT
		PLCopenState : McTrkPathPLCopenStateEnum; (*TrackingPath PLCopen state*)
		TrackingFrameCount : UINT; (*Number of TrackingFrames currently existing in TrackingPath*)
		TrackingFrameLimitReached : BOOL; (* Configured maximum number of TrackingFrames reached*)
		TrackingPathEstimatedMotionState : McTrkPathEstimatedMotionState; (*Estimated TrackingPath motion state*)
		AxisCommandConsideration : McTrkPathAxisCmdConsiderType; (*Config of Axis Command Consideration*)
		PositionError : LREAL; (*Position error*)
	END_STRUCT;
	McTrkPathAxisCmdConsiderType : STRUCT
		Active : BOOL; (*De- and activate*)
		BasicCommands : McTrkPathBasicCmdConsiderType;(*Considered movement type and target value*)
	END_STRUCT;
	McTrkPathBasicCmdConsiderType : STRUCT
		CurrentMovementType : McTrkPathBasicCmdConsiderEnum; (*position or velocity*)
		TargetValue : LREAL; (*target value*)
	END_STRUCT;
	McTrkFrmCpyUserDatModeEnum :
		(
		mcTRKFRM_USERDATA_MOD_GET := 0, (*Reads user data*)
		mcTRKFRM_USERDATA_MOD_SET := 1 (*Writes user data*)
		);
END_TYPE
