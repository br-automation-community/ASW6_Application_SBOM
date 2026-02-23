(*********************** MTGntCrane ************************)

TYPE
	MTGntCraneFeedBackEnum : 
		( (*FeedBack control mode.*)
		mtGNTCRANE_FB_OFF := 0, (*Feedback control is disabled.*)
		mtGNTCRANE_FB_ANTISWAY := 1, (*AntiSway feedback control.*)
		mtGNTCRANE_FB_ANTISWAY_LOADPOS := 2, (*AntiSway plus load-position feedback control.*)
		mtGNTCRANE_FB_AXISPOS := 3 (*Axis-position feedback control.*)
		);
	MTGntCraneFeedForwardModeEnum : 
		( (*Feed-Forward control mode.*)
		mtGNTCRANE_FF_OFF := 0, (*Feed-forward control is disabled.*)
		mtGNTCRANE_FF_VELOCITY := 1 (*Velocity feed-forward control.*)
		);
	MTGntCraneMotionStateEnum : 
		( (*Motion states.*)
		mtGNTCRANE_DEC_NEG_DIR := -3, (*Deceleration phase, negative direction of movement.*)
		mtGNTCRANE_CONST_VEL_NEG_DIR := -2, (*Constant velocity phase, negative direction of movement.*)
		mtGNTCRANE_ACC_NEG_DIR := -1, (*Acceleration phase, negative direction of movement.*)
		mtGNTCRANE_STANDSTILL := 0, (*Standstill.*)
		mtGNTCRANE_ACC_POS_DIR := 1, (*Acceleration phase, positive direction of movement.*)
		mtGNTCRANE_CONST_VEL_POS_DIR := 2, (*Constant velocity phase, positive direction of movement.*)
		mtGNTCRANE_DEC_POS_DIR := 3 (*Deceleration phase, positive direction of movement.*)
		);
	MTGntCraneObserverMeasModeEnum : 
		( (*Observer measurement modes.*)
		mtGNTCRANE_MEAS_LOADPOSITION := 0, (*Load position is measured. Unit of ActLoadMeasurement is [m].*)
		mtGNTCRANE_MEAS_LOADDEVIATION := 1, (*Deviation between load and trolley position is measured. Unit of ActLoadMeasurement is [m].*)
		mtGNTCRANE_MEAS_DEFLECTIONANG := 2 (*Deflection Angle of the rope is measured. Unit of ActLoadMeasurement is [°].*)
		);
	MTGntCraneObserverDistModeEnum : 
		( (*Observer disturbance mode.*)
		mtGNTCRANE_DIST_AXISPOSITION := 0 (*Load position is the absolutely true value.*)
		);
	MTGntCraneObserverStateEnum : 
		( (*Observer states.*)
		mtGNTCRANE_OBSERVER_OFF := 0, (*Observer is off.*)
		mtGNTCRANE_OBSERVER_INIT := 1, (*Observer is in warm up phase.*)
		mtGNTCRANE_OBSERVER_OPENLOOP := 2, (*Trivial Observer is active and estimates the states of the system.*)
		mtGNTCRANE_OBSERVER_CLOSEDLOOP := 3 (*Observer is active and estimates the states of the system.*)
		);
	MTGntCranePIDIntegrationEnum : 
		( (*PID integration enumeration.*)
		mtGNTCRANE_INTEGRATION_FREE := 0, (*PID integration part can increase or decrease.*)
		mtGNTCRANE_HOLD_POSITIVE := +1, (*The output has reached its maximum allowed value and the integration has stopped.*)
		mtGNTCRANE_HOLD_NEGATIVE := -1 (*The output has reached its minimum allowed value and the integration has stopped.*)
		);
	MTGntCrane2DConfigurationType : 	STRUCT  (*Configuration parameters for a gantry crane.*)
		Space : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Configuration space defined by lower left and upper right corner.*)
		TrolleyHeight : REAL; (*Height of the trolley. Unit: [m].*)
	END_STRUCT;
	MTGntCrane2DCoordinatesType : 	STRUCT  (*2D cartesian coordinates (x, y).*)
		x : REAL; (*x-coordinate. Unit: [m].*)
		y : REAL; (*y-coordinate. Unit: [m].*)
	END_STRUCT;
	MTGntCraneCoordinatesXZType : 	STRUCT  (*2D cartesian coordinates (x, z).*)
		x : REAL; (*x-coordinate (trolley movement).*)
		z : REAL; (*z-coordinate (gantry movement).*)
	END_STRUCT;
	MTGntCraneCoordinatesType : 	STRUCT  (*3D cartesian coordinates (x, y, z).*)
		x : REAL; (*x-coordinate (trolley movement).*)
		y : REAL; (*y-coordinate (hoist movement).*)
		z : REAL; (*z-coordinate (gantry movement).*)
	END_STRUCT;
	MTGntCraneCoordType : 	STRUCT  (*Cartesian coordinates.*)
		y : REAL; (*y-coordinate. Unit: [m].*)
	END_STRUCT;
	MTGntCrane2DDynamicParType : 	STRUCT  (*2D dynamic parameters.*)
		TrolleyVelocityLimit : REAL; (*Velocity limit of trolley. Unit: [m/s].*)
		TrolleyAccelerationLimit : REAL; (*Acceleration limit of trolley. Unit: [m/s²].*)
		HoistVelocityLimit : REAL; (*Velocity limit of hoist. Unit: [m/s].*)
		HoistAccelerationLimit : REAL; (*Acceleration limit of hoist. Unit: [m/s²].*)
		MaxDeflectionAngle : REAL; (*Maximum deflection angle of load. Unit: [°].*)
	END_STRUCT;
	MTGntCraneDynamicParType : 	STRUCT  (*3D dynamic parameters.*)
		TrolleyVelocityLimit : REAL; (*Velocity limit of trolley. Unit: [m/s].*)
		TrolleyAccelerationLimit : REAL; (*Acceleration limit of trolley. Unit: [m/s²].*)
		HoistVelocityLimit : REAL; (*Velocity limit of hoist. Unit: [m/s].*)
		HoistAccelerationLimit : REAL; (*Acceleration limit of hoist. Unit: [m/s²].*)
		GantryVelocityLimit : REAL; (*Velocity limit of gantry. Unit: [m/s].*)
		GantryAccelerationLimit : REAL; (*Acceleration limit of gantry. Unit: [m/s²].*)
	END_STRUCT;
	MTGntCraneLoadOffsetsType : 	STRUCT  (*Hoist length offsets.*)
		x : REAL; (*Offset from hoist length to effective (identified) hoist length in x-direction (trolley). Unit: [m].*)
		z : REAL; (*Offset from hoist length to effective (identified) hoist length in z-direction (gantry). Unit: [m].*)
	END_STRUCT;
	MTGntCranePIDPlusDataType : 	STRUCT  (*Collection of all data of PID controller.*)
		Initialize : BOOL; (*Trigger init of PID controller.*)
		HoldIntegration : MTGntCranePIDIntegrationEnum; (*Hold integration of PID.*)
		States : MTGntCranePIDStatesType; (*States of PID controller.*)
		Output : REAL; (*Controller output.*)
	END_STRUCT;
	MTGntCranePIDStatesType : 	STRUCT  (*PID controller internal states.*)
		ProportionalGain : REAL; (*Proportional gain. Unit: [.].*)
		IntegrationTime : REAL; (*Integration time. Unit: [s].*)
		DerivativeTime : REAL; (*Derivative time. Unit: [s].*)
		FilterTime : REAL; (*Filter time. Unit: [s].*)
		FilterTimeFactor : REAL; (*Filter time factor. Unit: [1].*)
		OutputLimit : REAL; (*Limit value of output. Unit: [.].*)
		ControlErrorOld : REAL; (*Old control error.*)
		ProportionalPart : REAL; (*Proportional part of PID output.*)
		IntegrationPart : REAL; (*Integration part of PID output.*)
		DerivativePart : REAL; (*Derivative part of PID output.*)
		IntegrationStatus : MTGntCranePIDIntegrationEnum; (*Status of integration of PID (in limitation or not).*)
	END_STRUCT;
	MTGntCranePIParType : 	STRUCT  (*PI controller parameters.*)
		Gain : REAL; (*Gain factor.*)
		IntegrationTime : REAL; (*Integration time constant. Unit: [s].*)
	END_STRUCT;
	MTGntCraneConfigurationType : 	STRUCT  (*Configuration parameters.*)
		TrolleyHeight : REAL; (*Trolley height. Unit: [m].*)
	END_STRUCT;
END_TYPE

(****************** MTGntCrane2DTrajectory *****************)

TYPE
	MTGntCrane2DGeometricParType : 	STRUCT  (*Geometric parameters.*)
		Load : MTGntCrane2DLoadAreaType; (*Load area.*)
		NumberOfRestrictedAreas : UINT; (*Number of restricted area elements. Valid value range: 0 <= NumberRestrictedAreas <= 50.*)
		RestrictedArea : ARRAY[0..49]OF MTGntCrane2DRestrictedAreaType; (*Restricted area.*)
		StartVerticalLength : REAL; (*Vertical start length. Unit: [m].*)
		EndVerticalLength : REAL; (*Vertical end length. Unit: [m].*)
	END_STRUCT;
	MTGntCrane2DLoadAreaType : 	STRUCT  (*Load area (dimensions).*)
		Height : REAL; (*Height. Unit: [m].*)
		Width : REAL; (*Width. Unit:[m].*)
	END_STRUCT;
	MTGntCrane2DRestrictedAreaType : 	STRUCT  (*Restricted area element (dimensions).*)
		x : REAL; (*x-coordinate of center of restricted area element. Unit: [m].*)
		y : REAL; (*y-coordinate of center of restricted area element. Unit: [m].*)
		Width : REAL; (*Width of restricted area element. Unit:[m].*)
	END_STRUCT;
	MTGntCrane2DTrajectoryInfoType : 	STRUCT  (*Trajectory information.*)
		Duration : REAL; (*Duration of trajectory. Unit: [s].*)
		MaxSetLoadY : REAL; (*Maximal height (y-direction) of the movement. Unit: [m].*)
		NumberOfKeyPoints : UINT; (*Number of key points of trajectory. Value range: 2 <= NumberOfKeyPoints <= 12.*)
		KeyPoints : ARRAY[0..11]OF MTGntCrane2DCoordinatesType; (*Key points of trajectory.*)
		StopArea : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Movement can always be stopped within this stop area.*)
		NextStartPosition : MTGntCrane2DCoordinatesType; (*Suggested start position for the next movement.*)
	END_STRUCT;
	MTGntCrane2DTrajectoryParType : 	STRUCT  (*Dynamic and geometric parameters.*)
		Dynamic : MTGntCrane2DDynamicParType; (*Dynamic parameters.*)
		Geometric : MTGntCrane2DGeometricParType; (*Geometric parameters.*)
	END_STRUCT;
	MTGntCrane2DTrajectoryIntType : 	STRUCT  (*Internal variables of function block MTGntCrane2DTrajectory.*)
		Timer : MTGntCrane2DTrajTimerType; (*Data for internal use.*)
		Configuration : MTGntCrane2DTrajConfigType; (*Data for internal use.*)
		DynamicLimits : MTGntCrane2DTrajDynLimType; (*Data for internal use.*)
		PathConfiguration : MTGntCrane2DTrajPathConfType; (*Data for internal use.*)
		RestrictedAreas : MTGntCrane2DTrajRestAreaType; (*Data for internal use.*)
		Polygon : MTGntCrane2DTrajPolygonType; (*Data for internal use.*)
		HoistUpKeyPoints : MTGntCrane2DTrajHoistKey; (*Data for internal use.*)
		HoistDownKeyPoints : MTGntCrane2DTrajHoistKey; (*Data for internal use.*)
		HoistMovement : MTGntCrane2DTrajDynamicSeq; (*Data for internal use.*)
		TrolleyMovement : MTGntCrane2DTrajDynamicSeq; (*Data for internal use.*)
		MovementData : MTGntCrane2DTrajMovDataType; (*Data for internal use.*)
		StatusVariables : MTGntCrane2DTrajStateVarType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCoordIntType : 	STRUCT  (*Internal data type of function block MTGntCrane2DTrajectory.*)
		x : LREAL; (*Data for internal use.*)
		y : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCranePolygonIntType : 	STRUCT  (*Internal data type of function block MTGntCrane2DTrajectory.*)
		PositionX : LREAL; (*Data for internal use.*)
		PositionY : LREAL; (*Data for internal use.*)
		Length : LREAL; (*Data for internal use.*)
		DirectionX : LREAL; (*Data for internal use.*)
		DirectionY : LREAL; (*Data for internal use.*)
		Angle : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneMoveKeyDataIntType : 	STRUCT  (*Internal data type of function block MTGntCrane2DTrajectory.*)
		MaxSpeed : LREAL; (*Data for internal use.*)
		MaxAcceleration : LREAL; (*Data for internal use.*)
		MaxDeceleration : LREAL; (*Data for internal use.*)
		MovementIdent : SINT; (*Data for internal use.*)
		Duration : LREAL; (*Data for internal use.*)
		TotalStartTime : LREAL; (*Data for internal use.*)
		TotalDuration : LREAL; (*Data for internal use.*)
		Direction : SINT; (*Data for internal use. Or use sigma therefor*)
		Sigma : LREAL; (*Data for internal use.*)
		TimeV : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		DeltaSigmaV : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		MovementV : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		TotalTimeV : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		SigmaI0V : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		SigmaI1V : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		SigmaI2V : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajConfigType : 	STRUCT  (*Contains the configuration of the crane*)
		ConfigValid : BOOL; (*Data for internal use.*)
		ConfigSpace : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		TrolleyHeight : REAL; (*Data for internal use.*)
		InitPositionValid : BOOL; (*Data for internal use.*)
		LoadHeight : REAL; (*Data for internal use.*)
		LoadWidth : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajPolygonType : 	STRUCT  (*Contains the control-polygon for the geometric path.*)
		NbPoints : UINT; (*Data for internal use.*)
		InitialPolygon : ARRAY[0..54]OF MTGntCranePolygonIntType; (*Data for internal use.*)
		PolygonFrame : ARRAY[0..3]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajDynLimType : 	STRUCT  (*Contains the Dynamic Limits of the Motions*)
		VelocityLimit : MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		AccelerationLimit : MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		MaxDeflectionAngle : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajPathConfType : 	STRUCT  (*Contains the base-parameters for the geometric path.*)
		StartPosition : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		StartPositionCnt : USINT; (*Data for internal use.*)
		StartSpeed : REAL; (*Data for internal use.*)
		EndPosition : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		EndPositionCnt : USINT; (*Data for internal use.*)
		EndSpeed : REAL; (*Data for internal use.*)
		OldEndPosition : MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		InitialLoadPosition : MTGntCrane2DCoordinatesType;
	END_STRUCT;
	MTGntCrane2DTrajRestAreaType : 	STRUCT  (*Contains the Restricted Areas in the Workspace of the Crane*)
		NbElems : UINT; (*Data for internal use.*)
		NbPoints : UINT; (*Data for internal use.*)
		Elements : ARRAY[0..99]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		Frame : ARRAY[0..1]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajStateVarType : 	STRUCT  (*Defines status of the FB, trigger variables.*)
		CommandState : UINT; (*Data for internal use.*)
		ExecutionState : UINT; (*Data for internal use.*)
		ReplanningIsPossible : BOOL; (*Data for internal use.*)
		ReplanningIsPerformed : BOOL; (*Data for internal use.*)
		TrajectoryFinished : BOOL; (*Data for internal use.*)
		CalculateInfoOld : BOOL; (*Data for internal use.*)
		MoveOld : BOOL; (*Data for internal use.*)
		StopOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajTimerType : 	STRUCT  (*Defines the geometric path.*)
		CycleTime : LREAL; (*Task cycle time. Unit: [s].*)
		TimerV : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
		ReplanTimer : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajHoistKey : 	STRUCT  (*Defines the Geometric Data one hoist movements.*)
		ReferencePosition : MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		NumberOfKeyPoints : UINT; (*Data for internal use.*)
		KeyPoints : ARRAY[0..11]OF MTGntCrane2DCoordinatesType; (*Data for internal use.*)
		KeyPointData : ARRAY[0..11]OF MTGntCrane2DTrajKeyDataType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajKeyDataType : 	STRUCT  (*Defines Aditional Data for the Hoist KeyPoints.*)
		TotalTime2KeyPoint : LREAL; (*Data for internal use.*)
		Time2KeyPoint : LREAL; (*Data for internal use.*)
		XDistance2KeyPoint : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajDynamicSeq : 	STRUCT  (*Dynamic Path Sequence defines the profile of a movement over time (jerk-unlimited).*)
		NumberOfKeyDataSegments : USINT; (*Data for internal use.*)
		PlanningSegmentIndex : USINT; (*Data for internal use.*)
		FilterTime : LREAL; (*Data for internal use.*)
		MovementKeyData : ARRAY[0..7]OF MTGntCraneMoveKeyDataIntType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajBrakingType : 	STRUCT  (*Used to store the braking times either for the trolley or hoist up movement.*)
		Activated : BOOL; (*Data for internal use.*)
		Sigma : LREAL; (*Data for internal use.*)
		Found : BOOL; (*Data for internal use.*)
		Time : LREAL; (*Data for internal use.*)
		Saving : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajBrkInfoType : 	STRUCT  (*Used to store the braking times for the trolley and hoist up movement.*)
		Signature : SINT; (*Data for internal use.*)
		HoistUp : MTGntCrane2DTrajBrakingType; (*Data for internal use.*)
		Trolley : MTGntCrane2DTrajBrakingType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajMovDataType : 	STRUCT  (*Dynamic Path Sequence defines the profile of the path-parameter over time (jerk-unlimited).*)
		TrolleyTiming : MTGntCrane2DTrajStartingType; (*Data for internal use.*)
		HoistDownTiming : MTGntCrane2DTrajStartingType; (*Data for internal use.*)
		BrakeTiming : MTGntCrane2DTrajBrkInfoType; (*Data for internal use.*)
		HighestNogoAreaHeight : REAL; (*Data for internal use.*)
		AdditionalHoistElevation : REAL; (*Data for internal use.*)
		MaxRopeLength : REAL; (*Data for internal use.*)
		IntegralsAndDerivativesLoadX : ARRAY[0..4]OF REAL; (*Data for internal use.*)
		IntegralsAndDerivativesLoadY : ARRAY[0..4]OF REAL; (*Data for internal use.*)
		TimeReplanningStartPosition : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane2DTrajStartingType : 	STRUCT  (*Used to store the starting times for the trolley and hoist down movement.*)
		Suspended : BOOL; (*Data for internal use.*)
		Found : BOOL; (*Data for internal use.*)
		VerticalLengthTimeDelta : LREAL; (*Data for internal use.*)
		Time : LREAL; (*Data for internal use.*)
		LowerTimeLimit : LREAL; (*Data for internal use.*)
	END_STRUCT;
END_TYPE

(****************** MTGntCraneController ******************)

TYPE
	MTGntCraneControllerInfoType : 	STRUCT  (*Controller information.*)
		LoadLagError : MTGntCraneCoordinatesType; (*Delay compensated lag error of load position (x-, y- & z-direction). Unit: [m].*) (* *) (*#CYC#*)
		PredictedEndPositionLoadX : REAL; (*Predicted end position of load in x-direction for ANTISWAY-Mode. Unit: [m].*) (* *) (*#CYC#*)
		PredictedEndPositionLoadZ : REAL; (*Predicted end position of load in z-direction for ANTISWAY-Mode. Unit: [m].*) (* *) (*#CYC#*)
		InLimitationTrolley : BOOL; (*Denotes if the trolley drive is in limitation.*) (* *) (*#CYC#*)
		InLimitationHoist : BOOL; (*Denotes if the hoist drive is in limitation.*) (* *) (*#CYC#*)
		InLimitationGantry : BOOL; (*Denotes if the gantry drive is in limitation.*) (* *) (*#CYC#*)
	END_STRUCT;
	MTGntCraneOscillationParType : 	STRUCT  (*Parameters of oscillation controller.*)
		DampingFactor : REAL; (*Damping factor (set value). Unit: [1].*)
	END_STRUCT;
	MTGntCraneOscillationXZParType : 	STRUCT  (*Parameters of oscillation controller.*)
		x : MTGntCraneOscillationParType; (*Sway controller parameters for x-direction (trolley).*)
		z : MTGntCraneOscillationParType; (*Sway controller parameters for z-direction (gantry).*)
	END_STRUCT;
	MTGntCranePIDParType : 	STRUCT  (*PID controller parameters.*)
		ProportionalGain : REAL; (*Proportional gain. Unit: [.].*)
		IntegrationTime : REAL; (*Integration time constant. Unit: [s].*)
		DerivativeTime : REAL; (*Derivative action time constant. Unit: [s].*)
	END_STRUCT;
	MTGntCraneXZPIDParType : 	STRUCT  (*PID controller parameters for horizontal direction.*)
		x : MTGntCranePIDParType; (*PID controller parameters for x-direction.*)
		z : MTGntCranePIDParType; (*PID controller parameters for z-direction.*)
	END_STRUCT;
	MTGntCraneControllerParType : 	STRUCT  (*Controller parameters.*)
		AntiSway : MTGntCraneOscillationXZParType := (x:=(DampingFactor:=0.6),z:=(DampingFactor:=0.6)); (*Parameters for anti-sway controller.*)
		LoadPosition : MTGntCraneXZPIDParType := (x:=(ProportionalGain:=0.5,DerivativeTime:=1.5),z:=(ProportionalGain:=0.5,DerivativeTime:=1.5)); (*Parameters for load position controller.*)
		AxisPosition : MTGntCraneXZPIDParType; (*Parameters for horizontal axis position controller. Optional: Only needed if trolley and gantry velocity outputs are used in open loop control.*)
		HoistPosition : MTGntCranePIDParType; (*Parameters for hoist position controller. Optional: Only needed if hoist velocity output is used.*)
		Dynamic : MTGntCraneDynamicParType; (*Dynamic parameters of the crane.*)
		FeedForwardMode : MTGntCraneFeedForwardModeEnum := 1; (*Feed-forward control mode.*)
		HoistLengthOffset : MTGntCraneLoadOffsetsType; (*Offset from hoist length to effective (identified) hoist length. Unit: [m].*)
	END_STRUCT;
	MTGntCraneCtrlIntType : 	STRUCT  (*Internal variables of function block MTGntCraneController.*)
		CycleTime : LREAL; (*Task cycle time. Unit: [s].*)
		Configuration : MTGntCraneConfigurationType; (*Data for internal use.*)
		DelayTime : MTGntCraneActuatorsType; (*Data for internal use.*)
		Parameters : MTGntCraneControllerParIntType; (*Data for internal use.*)
		Trolley : MTGntCraneCtrlHAxisDataType; (*Data for internal use.*)
		Hoist : MTGntCraneCtrlVAxisDataType; (*Data for internal use.*)
		Gantry : MTGntCraneCtrlHAxisDataType; (*Data for internal use.*)
		StatusVariables : MTGntCraneCtrlStatVarType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneControllerParIntType : 	STRUCT  (*Internal variables of function block MTGntCraneController.*)
		FeedForwardMode : MTGntCraneFeedForwardModeEnum; (*Data for internal use.*)
		x : MTGntCraneControllerHParType; (*Data for internal use.*)
		y : MTGntCraneControllerVParType; (*Data for internal use.*)
		z : MTGntCraneControllerHParType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneControllerHParType : 	STRUCT  (*Internal variables of function block MTGntCraneController.*)
		AntiSway : MTGntCraneOscillationParType; (*Data for internal use.*)
		LoadPosition : MTGntCranePIDParType; (*Data for internal use.*)
		AxisPosition : MTGntCranePIDParType; (*Data for internal use.*)
		Dynamic : MTGntCraneDynamicAxisParType; (*Data for internal use.*)
		HoistLengthOffset : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneControllerVParType : 	STRUCT  (*Internal variables of function block MTGntCraneController.*)
		HoistPosition : MTGntCranePIDParType; (*Data for internal use.*)
		Dynamic : MTGntCraneDynamicAxisParType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneDynamicAxisParType : 	STRUCT  (*Internal variables of function block MTGntCraneController.*)
		VelocityLimit : REAL; (*Data for internal use.*)
		AccelerationLimit : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlHoistLengthType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		Set : REAL; (*Data for internal use.*)
		Act : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlDelayHDataType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		FFPositionBufferData : MTGntCraneTimeDelayFcnType; (*Data for internal use.*)
		FFPosition : REAL; (*Data for internal use.*)
		SetLoadBufferData : ARRAY[0..2]OF MTGntCraneTimeDelayFcnType; (*Data for internal use.*)
		SetLoad : ARRAY[0..2]OF REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlDelayVDataType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		SetHoistLengthBufferData : MTGntCraneTimeDelayFcnType; (*Data for internal use.*)
		SetHoistLength : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneLimiterDataType : 	STRUCT  (*Internal data type of rate limiter.*)
		InLimitation : SINT; (*In limitation flag.*)
		OldValue : REAL; (*Old/last value.*)
	END_STRUCT;
	MTGntCraneCtrlHAxisDataType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		EffectiveHoistLength : MTGntCraneCtrlHoistLengthType; (*Data for internal use.*)
		FeedForward : MTGntCraneCtrlHAxisFFType; (*Data for internal use.*)
		Delay : MTGntCraneCtrlDelayHDataType; (*Data for internal use.*)
		OpenLoopSystem : MTGntCraneOscillationSystType; (*Data for internal use.*)
		OscillationController : MTGntCraneOscillationDataType; (*Data for internal use.*)
		KalmanEstimator : MTGntCraneKalmanEstDataType; (*Data for internal use.*)
		StationaryController : MTGntCraneStationaryDataType; (*Data for internal use.*)
		PIDController : MTGntCranePIDPlusDataType; (*Data for internal use.*)
		CorrectionVelocity : REAL; (*Data for internal use.*)
		TotalVelocity : REAL; (*Data for internal use.*)
		Limiter : MTGntCraneLimiterDataType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneOscillationSystType : 	STRUCT  (*System characterization for an oscillating system (open & closed loop).*)
		Gain : REAL; (*Gain.*)
		AngularFrequency : REAL; (*Angular frequency. Unit: [1/s].*)
		DampingFactor : REAL; (*Damping factor. Unit: [1].*)
	END_STRUCT;
	MTGntCraneOscillationDataType : 	STRUCT  (*Collection of all data of oscillation controller.*)
		Parameters : MTGntCraneOscillationParAugType; (*Augmented parameters of oscillation controller.*)
		ClosedLoopSystem : MTGntCraneOscillationSystType; (*System characterization of oscillating closed loop system.*)
		Output : REAL; (*Controller output.*)
	END_STRUCT;
	MTGntCraneOscillationParAugType : 	STRUCT  (*Augmented parameters of oscillation controller.*)
		SetDampingFactor : REAL; (*Set damping factor. Unit: [1].*)
		OutputLimit : REAL; (*Limit value of output. Unit: [.].*)
		OutputRateLimit : REAL; (*Rate limit value of output. Unit: [./s].*)
	END_STRUCT;
	MTGntCraneKalmanEstDataType : 	STRUCT  (*Collection of all data of Kalman estimator.*)
		Parameters : MTGntCraneKalmanEstParType; (*Parameters of Kalman estimator.*)
		States : MTGntCraneKalmanEstStatesType; (*States of Kalman estimator.*)
		Output : REAL; (*Kalman estimator output.*)
	END_STRUCT;
	MTGntCraneKalmanEstParType : 	STRUCT  (*Parameters of Kalman estimator.*)
		NbInitCycles : UDINT; (*Number of necessary init cycles.*)
		Q : ARRAY[0..2]OF LREAL; (*Q-matrix as diagonal matrix only.*)
		r : LREAL; (*R-matrix (here: 1x1).*)
	END_STRUCT;
	MTGntCraneKalmanEstStatesType : 	STRUCT  (*States of Kalman estimator.*)
		Initialized : BOOL; (*Init of Kalman estimator completed.*)
		CntInitCycles : UDINT; (*Init cycles counter.*)
		ObserverStates : ARRAY[0..2]OF LREAL; (*Vector of states.*)
		ErrorCovariance : ARRAY[0..8]OF LREAL; (*Error covariance matrix (3x3).*)
		StationaryValue : LREAL; (*Estimated stationary value.*)
	END_STRUCT;
	MTGntCraneStationaryDataType : 	STRUCT  (*Collection of all data of stationary controller.*)
		Initialize : BOOL; (*Trigger init of stationary controller.*)
		Suspend : BOOL; (*Suspend stationary controller.*)
		HoldIntegration : MTGntCranePIDIntegrationEnum; (*Hold integration of PID.*)
		States : MTGntCranePIDStatesType; (*States of PID controller.*)
		Output : REAL; (*Controller output.*)
	END_STRUCT;
	MTGntCraneCtrlHAxisFFType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		Position : REAL; (*Data for internal use.*)
		Velocity : REAL; (*Data for internal use.*)
		Acceleration : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlVAxisDataType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		HoistLength : MTGntCraneCtrlHoistLengthType; (*Data for internal use.*)
		FeedForward : MTGntCraneCtrlVAxisFFType; (*Data for internal use.*)
		Delay : MTGntCraneCtrlDelayVDataType; (*Data for internal use.*)
		PIDController : MTGntCranePIDPlusDataType; (*Data for internal use.*)
		CorrectionVelocity : REAL; (*Data for internal use.*)
		TotalVelocity : REAL; (*Data for internal use.*)
		Limiter : MTGntCraneLimiterDataType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlVAxisFFType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		Position : REAL; (*Data for internal use.*)
		Velocity : REAL; (*Data for internal use.*)
		Acceleration : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneCtrlStatVarType : 	STRUCT  (*Internal data type of function block MTGntCraneController.*)
		ConfigurationValid : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		Update : BOOL; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
END_TYPE

(*************** MTGntCraneLoadObserver ***************)

TYPE
	MTGntCraneObserverDistModeXZType : 	STRUCT  (*Defines the measurement method for capturing the load.*)
		x : MTGntCraneObserverDistModeEnum := 0; (*Defines Disturbance mode in x-direction (trolley).*)
		z : MTGntCraneObserverDistModeEnum := 0; (*Defines Disturbance mode in z-direction (gantry).*)
	END_STRUCT;
	MTGntCraneObserverMeasModeXZType : 	STRUCT  (*De*)
		x : MTGntCraneObserverMeasModeEnum := 0; (*Defines the measurement method for capturing the load in x-direction (trolley).*)
		z : MTGntCraneObserverMeasModeEnum := 0; (*Defines the measurement method for capturing the load in z-direction (gantry).*)
	END_STRUCT;
	MTGntCraneObserverDynamicXZType : 	STRUCT  (*Dynamic factor of the Observer. Valid value range: -3 <= DynamicFactor <= 3.*)
		x : REAL; (*Dynamic factor of the Observer in x-direction (trolley).*)
		z : REAL; (*Dynamic factor of the Observer in z-direction (gantry).*)
	END_STRUCT;
	MTGntCraneLoadObserverParType : 	STRUCT  (*Load Observer parameters.*)
		DynamicFactor : MTGntCraneObserverDynamicXZType; (*Dynamic factor of the Load Observer. Valid value range: -3 <= DynamicFactor <= 3.*)
		LoadMeasurementMode : MTGntCraneObserverMeasModeXZType; (*Defines the measurement method for capturing the load.*)
		DisturbanceMode : MTGntCraneObserverDistModeXZType; (*Defines where the assumed constant disturbance is applied.*)
		HoistLengthOffset : MTGntCraneLoadOffsetsType; (*Offset from hoist length to effective (identified) hoist length. Unit: [m].*)
	END_STRUCT;
	MTGntCraneLoadObserverIntType : 	STRUCT  (*Internal variables of function block MTGntCraneLoadObserver.*)
		CycleTime : LREAL; (*Task cycle time. Unit: [s].*)
		Configuration : MTGntCraneConfigurationType; (*Data for internal use.*)
		Parameters : MTGntCraneLoadObserverIntParType; (*Data for internal use.*)
		ObserverX : MTGntCraneLoadObserverDataType; (*Data for internal use.*)
		ObserverZ : MTGntCraneLoadObserverDataType; (*Data for internal use.*)
		StatusVariables : MTGntCraneLoadObsStatVarType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneLoadObserverDataType : 	STRUCT  (*Internal data type of function block MTGntCraneLoadObserver.*)
		MinInitTime : LREAL; (*Data for internal use.*)
		InitTimer : LREAL; (*Data for internal use.*)
		Initialized : BOOL; (*Data for internal use.*)
		StatesFigure : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
		DynamicFigure : LREAL; (*Data for internal use.*)
		ErrorCovariance : ARRAY[0..2,0..2]OF LREAL; (*Data for internal use.*)
		OutputVector : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
		InputVector : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
		ActHoistLength : LREAL; (*Data for internal use.*)
		ActLoadPos : LREAL; (*Data for internal use.*)
		SystemMatrix : ARRAY[0..2,0..2]OF LREAL; (*Data for internal use.*)
		SystemStates : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneLoadObserverIntParType : 	STRUCT  (*Internal data type of function block MTGntCraneLoadObserver.*)
		x : MTGntCraneLoadObserverHParType; (*Data for internal use.*)
		z : MTGntCraneLoadObserverHParType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneLoadObserverHParType : 	STRUCT  (*Internal data type of function block MTGntCraneLoadObserver.*)
		LoadMeasurementMode : MTGntCraneObserverMeasModeEnum := 0; (*Data for internal use.*)
		DisturbanceMode : MTGntCraneObserverDistModeEnum := 0; (*Data for internal use.*)
		HoistLengthOffset : REAL; (*Data for internal use.*)
		DynamicFactor : LREAL; (*Data for internal use.*)
		PositionFactor : LREAL; (*Data for internal use.*)
		VelocityFactor : LREAL; (*Data for internal use.*)
		DisturbanceFactor : LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneLoadObsStatVarType : 	STRUCT  (*Internal data type of function block MTGntCraneLoadObserver.*)
		ConfigurationValid : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		Update : BOOL; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
END_TYPE

(****************** MTGntCraneManualTrajectory *****************)

TYPE
	MTGntCraneActuatorsType : 	STRUCT  (*Actuators (3D).*)
		Trolley : REAL; (*Trolley axis.*)
		Hoist : REAL; (*Hoist axis.*)
		Gantry : REAL; (*Gantry axis.*)
	END_STRUCT;
	MTGntCraneManualTrajParType : 	STRUCT  (*Manual Trajectory parameters.*)
		Dynamic : MTGntCraneDynamicParType; (*Dynamic parameters.*)
		HoistLengthOffset : MTGntCraneLoadOffsetsType; (*Offset from hoist length to effective (identified) hoist length. Unit: [m].*)
	END_STRUCT;
	MTGntCraneManualTrajIntType : 	STRUCT  (*Manual Trajectory parameters.*)
		CycleTime : LREAL; (*Task cycle time. Unit: [s].*)
		Configuration : MTGntCraneConfigurationType; (*Data for internal use.*)
		Parameters : MTGntCraneManualTrajParIntType; (*Data for internal use.*)
		Trolley : MTGntCraneManualTrajAxisDataType; (*Data for internal use.*)
		Hoist : MTGntCraneManualTrajAxisDataType; (*Data for internal use.*)
		Gantry : MTGntCraneManualTrajAxisDataType; (*Data for internal use.*)
		StatusVariables : MTGntCraneManualTrajFBStateType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneManualTrajParIntType : 	STRUCT  (*Internal variables of function block MTGntCraneManualTrajectory.*)
		x : MTGntCraneManualTrajHParType; (*Data for internal use.*)
		y : MTGntCraneManualTrajVParType; (*Data for internal use.*)
		z : MTGntCraneManualTrajHParType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneManualTrajHParType : 	STRUCT  (*Internal variables of function block MTGntCraneManualTrajectory.*)
		Dynamic : MTGntCraneDynamicAxisParType; (*Data for internal use.*)
		Factor : MTGntCraneManualTrajFactorType; (*Data for internal use.*)
		HoistLengthOffset : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneManualTrajVParType : 	STRUCT  (*Internal variables of function block MTGntCraneManualTrajectory.*)
		Dynamic : MTGntCraneDynamicAxisParType; (*Data for internal use.*)
		Factor : MTGntCraneManualTrajFactorType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneManualTrajFactorType : 	STRUCT  (*Data for internal use.*)
		Jerk : REAL; (*normaly set to 2.0. Influences the dynamic behavior of the output. small value -> faster.*)
		Snap : REAL; (*normaly set to 2.0. Influences the dynamic behavior of the output. small value -> faster.*)
	END_STRUCT;
	MTGntCraneManualTrajFBStateType : 	STRUCT  (*Data for internal use.*)
		ConfigurationValid : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		SetStartValuesOld : BOOL; (*Data for internal use.*)
		Update : BOOL; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneManualTrajAxisDataType : 	STRUCT  (*Data for internal use.*)
		HoistLength : REAL; (*Data for internal use.*)
		ProfGenStates : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		Integrator : MTGntCraneSimpleIntegratorType; (*Data for internal use.*)
	END_STRUCT;
END_TYPE

(************** MTGntCraneSimulationModel **************)

TYPE
	MTGntCraneAxesCtrlParType : 	STRUCT  (*Controller parameters for trolley, hoist and gantry.*)
		Trolley : MTGntCranePIParType; (*PI parameters for trolley controller.*)
		Hoist : MTGntCranePIParType; (*PI parameters for hoist controller.*)
		Gantry : MTGntCranePIParType; (*PI parameters for gantry controller.*)
	END_STRUCT;
	MTGntCraneAxesParametersType : 	STRUCT  (*Parameters for trolley, hoist and gantry axes.*)
		Dynamic : MTGntCraneDynamicParType; (*Dynamic parameters.*)
		Control : MTGntCraneAxesCtrlParType; (*Control parameters.*)
	END_STRUCT;
	MTGntCraneInitValuesType : 	STRUCT  (*Initial crane coordinates.*)
		TrolleyPosition : REAL; (*Initial trolley position. Unit: [m].*)
		GantryPosition : REAL; (*Initial gantry position. Unit: [m].*)
		LoadPosition : MTGntCraneCoordinatesType; (*Initial load position. Unit: [m].*)
	END_STRUCT;
	MTGntCraneNoiseFactorsType : 	STRUCT  (*Noise factors.*)
		Trolley : REAL; (*Noise factor for trolley.*)
		Hoist : REAL; (*Noise factor for hoist.*)
		Gantry : REAL; (*Noise factor for gantry.*)
		Load : REAL; (*Noise factor for load.*)
	END_STRUCT;
	MTGntCraneSimConfigType : 	STRUCT  (*Configuration parameters of 3D simulation.*)
		TrolleyHeight : REAL; (*Trolley height. Unit: [m].*)
		InitValue : MTGntCraneInitValuesType; (*Initial crane coordinates.*)
		DelayTime : MTGntCraneActuatorsType; (*Delay time of actuators (trolley, hoist & gantry).*)
	END_STRUCT;
	MTGntCraneSimModelParType : 	STRUCT  (*Parameters for simulation model.*)
		System : MTGntCraneSystemParType; (*System parameters of the crane.*)
		Axes : MTGntCraneAxesParametersType; (*Axes parameters for controller of trolley, hoist and gantry.*)
		NoiseFactor : MTGntCraneNoiseFactorsType; (*Noise factors for trolley, hoist, gantry and load.*)
	END_STRUCT;
	MTGntCraneSwayHParType : 	STRUCT  (*Sway parameters (horizontal axis).*)
		Mass : REAL; (*Mass. Unit: [kg].*)
		FrictionConstant : REAL; (*Friction constant factor. Unit: [Ns/m].*)
	END_STRUCT;
	MTGntCraneSwayVParType : 	STRUCT  (*Sway parameters (vertical axis).*)
		WinderRadius : REAL; (*Radius of winder. Unit: [m].*)
		MomentOfInertia : REAL; (*Moment of inertia. Unit: [kgm²].*)
		FrictionConstant : REAL; (*Damping factor. Unit: [Ns/m].*)
	END_STRUCT;
	MTGntCraneSwayLParType : 	STRUCT  (*Sway parameters (load).*)
		Mass : REAL; (*Mass. Unit: [kg].*)
		DampingFactor : MTGntCraneCoordinatesXZType; (*Damping factor. Unit: [Ns/m].*)
	END_STRUCT;
	MTGntCraneSystemParType : 	STRUCT  (*System parameters.*)
		Trolley : MTGntCraneSwayHParType; (*Sway parameters of trolley.*)
		Hoist : MTGntCraneSwayVParType; (*Sway parameters of hoist.*)
		Gantry : MTGntCraneSwayHParType; (*Sway parameters of gantry.*)
		Load : MTGntCraneSwayLParType; (*Sway parameters of load.*)
	END_STRUCT;
	MTGntCraneSimModelIntType : 	STRUCT  (*Internal variables of function block MTGntCraneSimulationModel.*)
		CycleTime : LREAL; (*Task cycle time. Unit: [s].*)
		Configuration : MTGntCraneSimConfigType; (*Data for internal use.*)
		Parameters : MTGntCraneSimModelParType; (*Data for internal use.*)
		Trolley : MTGntCraneSimTrolleyDataType; (*Data for internal use.*)
		Hoist : MTGntCraneSimHoistDataType; (*Data for internal use.*)
		Gantry : MTGntCraneSimGantryDataType; (*Data for internal use.*)
		Load : MTGntCraneSimLoadDataType; (*Data for internal use.*)
		StatusVariables : MTGntCraneSimModelStatVarType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimModelModeEnum : 
		( (*Internal enumeration type of function block MTGntCraneSimulationModel.*)
		FULL := 0, (*Data for internal use.*)
		REDUCED := 1, (*Data for internal use.*)
		MINIMUM := 2 (*Data for internal use.*)
		);
	MTGntCrane3DPICtrlDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		HoldIntegrator : BOOL; (*Data for internal use.*)
		ResetIntegrator : BOOL; (*Data for internal use.*)
		InLimitation : SINT; (*Data for internal use.*)
		SetVelocity : REAL; (*Data for internal use.*)
		SetVelocityLimited : REAL; (*Data for internal use.*)
		SetVelocityOld : REAL; (*Data for internal use.*)
		ActVelocity : REAL; (*Data for internal use.*)
		ProportionalPart : REAL; (*Data for internal use.*)
		IntegrationPart : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimDelayDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		SetValueBufferData : ARRAY[0..1]OF MTGntCraneTimeDelayFcnType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimGantryDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		Delay : MTGntCraneSimDelayDataType; (*Data for internal use.*)
		PIControl : MTGntCrane3DPICtrlDataType; (*Data for internal use.*)
		SetTorque : REAL; (*Data for internal use.*)
		SetTorqueAdd : REAL; (*Data for internal use.*)
		SetTorqueTotal : REAL; (*Data for internal use.*)
		SimModelInt : MTGntCraneSimModelIntDataType; (*Data for internal use.*)
		ActPosition : REAL; (*Data for internal use.*)
		ActVelocity : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimHoistDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		Delay : MTGntCraneSimDelayDataType; (*Data for internal use.*)
		PIControl : MTGntCrane3DPICtrlDataType; (*Data for internal use.*)
		SetTorque : REAL; (*Data for internal use.*)
		SetTorqueAdd : REAL; (*Data for internal use.*)
		SetTorqueTotal : REAL; (*Data for internal use.*)
		MinLength : REAL; (*Data for internal use.*)
		ModelMode : MTGntCraneSimModelModeEnum; (*Data for internal use.*)
		SimModelInt : MTGntCraneSimModelIntDataType; (*Data for internal use.*)
		ActLength : REAL; (*Data for internal use.*)
		ActVelocity : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimLoadDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		SimModelIntX : MTGntCraneSimModelIntDataType; (*Data for internal use.*)
		SimModelIntZ : MTGntCraneSimModelIntDataType; (*Data for internal use.*)
		ActPosition : MTGntCraneCoordinatesType; (*Data for internal use.*)
		ActVelocity : MTGntCraneCoordinatesType; (*Data for internal use.*)
		ActAngle : MTGntCrane3DSphereAnglesType; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimModelIntDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		Pos : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
		Vel : ARRAY[0..2]OF LREAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimModelStatVarType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		ConfigurationValid : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		Update : BOOL; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimTrolleyDataType : 	STRUCT  (*Internal data type of function block MTGntCraneSimulationModel.*)
		Delay : MTGntCraneSimDelayDataType; (*Data for internal use.*)
		PIControl : MTGntCrane3DPICtrlDataType; (*Data for internal use.*)
		SetTorque : REAL; (*Data for internal use.*)
		SetTorqueAdd : REAL; (*Data for internal use.*)
		SetTorqueTotal : REAL; (*Data for internal use.*)
		SimModelInt : MTGntCraneSimModelIntDataType; (*Data for internal use.*)
		ActPosition : REAL; (*Data for internal use.*)
		ActVelocity : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCrane3DSphereAnglesType : 	STRUCT  (*Internal data type (spherical angles) of function block MTGntCraneSimulationModel.*)
		Theta : REAL; (*Vertical angle (basis: y-axis). Unit: [°].*)
		Phi : REAL; (*Plane angle (basis: z-axis). Unit: [°].*)
	END_STRUCT;
END_TYPE

(************** Common internal data types **************)

TYPE
	MTGntCraneTimeDelayFcnType : 	STRUCT  (*Data for internal use.*)
		DelayCounter : UDINT; (*Data for internal use.*)
		ActBufferIndex : UDINT; (*Data for internal use.*)
		ActBufferElements : UDINT; (*Data for internal use.*)
		OldBufferElements : UDINT; (*Data for internal use.*)
		DelayTimeAct : REAL; (*Data for internal use.*)
		BufferPointer : REFERENCE TO REAL; (*Data for internal use.*)
	END_STRUCT;
	MTGntCraneSimpleIntegratorType : 	STRUCT  (*Data for internal use.*)
		State : LREAL; (*Data for internal use.*)
	END_STRUCT;
END_TYPE
