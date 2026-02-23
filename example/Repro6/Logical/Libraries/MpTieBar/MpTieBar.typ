(*Configuration structure for hydraulic*)

TYPE
	MpTieBarBasicHConfigType : 	STRUCT  (*TieBar configuration parameters*)
		MaxPosition : REAL := 100; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.01; (*Velocity filter time [s]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpTieBarInputSignalsType; (*Input signals*)
		OutputSignals : MpTieBarOutputSignalsType; (*Output signals*)
		ValveSettings : MpTieBarValveSettingsType; (*Valve settings and linearization*)
		Forward : MpTieBarMoveConfigType; (*Configuration parameters for forward direction*)
		Backward : MpTieBarMoveConfigType; (*Configuration parameters for backward direction*)
		Lock : MpTieBarLockConfigType; (*Configuration parameters for lock movement*)
		Unlock : MpTieBarUnlockConfigType; (*Configuration parameters for unlock movement*)
	END_STRUCT;
	MpTieBarUnlockConfigType : 	STRUCT  (*TieBar configuration parameters for each direction*)
		VelocityProfileLimits : MpTieBarLockUnlockVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpTieBarLockUnlockForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		ForceTolerance : REAL := 0; (*Force tolerance for end detection [bar]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpTieBarDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpTieBarLockConfigType : 	STRUCT  (*TieBar configuration parameters for each direction*)
		VelocityProfileLimits : MpTieBarLockUnlockVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpTieBarLockUnlockForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		ForceTolerance : REAL := 0; (*Force tolerance for end detection [bar]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpTieBarDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpTieBarMoveConfigType : 	STRUCT  (*TieBar configuration parameters for each direction*)
		VelocityProfileLimits : MpTieBarVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpTieBarForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpTieBarDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpTieBarDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*After movement delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpTieBarInputSignalsType : 	STRUCT  (*Input signals*)
		CurrentPosition : STRING[255] := ''; (*Current position*)
		CurrentForce : STRING[255] := ''; (*Current force*)
		CurrentMoldPosition : STRING[255] := ''; (*Mold position*)
	END_STRUCT;
	MpTieBarOutputSignalsType : 	STRUCT  (*Output signals*)
		SetVelocity : STRING[255] := ''; (*Set velocity*)
		SetForce : STRING[255] := ''; (*Set force*)
		ForwardValve : STRING[255]; (*Forward valve*)
		BackwardValve : STRING[255]; (*Backward valve*)
		LockValve : STRING[255]; (*Lock valve*)
		UnlockValve : STRING[255]; (*Unlock valve*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpTieBarValveSettingsType : 	STRUCT  (*Valve settings*)
		ValveType : MpTieBarValveTypeEnum := mpTIEBAR_VALVE_TYPE_DIRECT; (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpTieBarValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpTieBarValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 3; (*Number of used nodes*)
	END_STRUCT;
	MpTieBarUnlockModeEnum : 
		( (*Movement types for axes*)
		mpTIEBAR_UNLOCK_BY_PRESSURE := 0, (*Unlocking by force*)
		mpTIEBAR_UNLOCK_BY_POSITION := 1 (*Unlocking by position*)
		);
	MpTieBarMoveTypeEnum : 
		( (*Movement types for axes*)
		mpTIEBAR_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (TieBar will use the defined speed and force)*)
		mpTIEBAR_MOVE_TYPE_NORMAL := 1 (*Movement in manual mode (TieBar will follow the profile)*)
		);
	MpTieBarStateEnum : 
		( (*TieBar state information*)
		mpTIEBAR_UNDEFINED := 0, (*TieBar status is not defined *)
		mpTIEBAR_FORWARD_END_POSITION := 1, (*TieBar is in negative end position *)
		mpTIEBAR_FORWARD_STOP_POSITION := 2, (*TieBar is in negative stop position *)
		mpTIEBAR_FORWARD_MOVEMENT := 3, (*TieBar moves in negative direction *)
		mpTIEBAR_BACKWARD_END_POSITION := 4, (*TieBar is in positive end position *)
		mpTIEBAR_BACKWARD_STOP_POSITION := 5, (*TieBar is in positive stop position *)
		mpTIEBAR_BACKWARD_MOVEMENT := 6 (*TieBar moves in positive direction *)
		);
	MpTieBarValveTypeEnum : 
		( (*Valve types*)
		mpTIEBAR_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpTIEBAR_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpTIEBAR_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
	MpTieBarLockUnlockVelocityType : 	STRUCT  (*Velocity settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [%]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpTieBarLockUnlockForceType : 	STRUCT  (*Force settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpTieBarVelocityType : 	STRUCT  (*Velocity settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [%]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode velocity [%]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpTieBarForceType : 	STRUCT  (*Force settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
END_TYPE

(*Parameter structure*)

TYPE
	MpTieBarBasicParType : 	STRUCT  (*TieBar parameters*)
		ForwardProfile : MpTieBarProfileType; (*Forward movement profile parameters*)
		BackwardProfile : MpTieBarProfileType; (*Backward movement profile parameters*)
		LockProfile : MpTieBarLockProfileType; (*Lock movement profile parameters*)
		UnlockProfile : MpTieBarUnlockProfileType; (*Unlock movement profile parameters*)
		SetupMode : MpTieBarSetupModeType; (*Setup parameters (fixed during machine operation, changed during commissioning)*)
	END_STRUCT;
	MpTieBarProfileType : 	STRUCT  (*Profile settings for each direction*)
		Velocity : REAL := 50.0; (*Set velocity for each profile step [mm/s]*)
		Force : REAL := 50.0; (*Set force for each profile step [bar]*)
		AccelerationOverride : REAL := 100.0; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpTieBarUnlockProfileType : 	STRUCT  (*Unlock parameters*)
		UnlockMode : MpTieBarUnlockModeEnum := mpTIEBAR_UNLOCK_BY_PRESSURE; (*Unlock mode*)
		Velocity : ARRAY[0..4]OF REAL := [5(100)]; (*Set Velocity for unlock [mm/s]*)
		Force : ARRAY[0..4]OF REAL := [5(100)]; (*Set Force for unlock [bar]*)
		UnlockPosition : ARRAY[0..4]OF REAL := [5(10)]; (*Position limit point, after reaching this point unlocking movement ends[mm]*)
		UnlockForce : ARRAY[0..4]OF REAL := [5(10)]; (*Force limit point, after reaching this point unlocking movement ends[bar]*)
		AccelerationOverride : ARRAY[0..4]OF REAL := [5(100)]; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpTieBarLockProfileType : 	STRUCT  (*Lock parameters*)
		Velocity : ARRAY[0..4]OF REAL := [5(100)]; (*Set Velocity for lock [mm/s]*)
		Force : ARRAY[0..4]OF REAL := [5(100)]; (*Set Force for lock [bar]*)
		ForceLimit : ARRAY[0..4]OF REAL := [5(99)]; (*Presure limit for lock [bar]*)
		AccelerationOverride : ARRAY[0..4]OF REAL := [5(100)]; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpTieBarSetupModeType : 	STRUCT  (*Setting mode parameters*)
		ForwardProfile : MpTieBarSetupModeProfileType; (*Settings for setting mode positive direction*)
		BackwardProfile : MpTieBarSetupModeProfileType; (*Settings for setting mode negative direction*)
	END_STRUCT;
	MpTieBarSetupModeProfileType : 	STRUCT  (*Profile settings for each direction in setting mode*)
		Velocity : REAL := 20.0; (*Setting mode velocity for each direction [mm/s]*)
		Force : REAL := 20.0; (*Setting mode force for each direction [bar]*)
	END_STRUCT;
END_TYPE

(*Additional info structure*)

TYPE
	MpTieBarBasicInfoType : 	STRUCT  (*Tie Bar info structure*)
		Velocity : REAL; (*Current velocity [mm/s]*)
		MaxPosition : REAL; (*Maximum measured value[mm]*)
		MaxVelocity : REAL; (*Maximum velocity [mm/s]*)
		StepLock : USINT; (*Current profile step for lock movement*)
		StepUnlock : USINT; (*Current profile step for unlock movement*)
		State : MpTieBarStateEnum; (*TieBar state information*)
		Diag : MpTieBarDiagType;
	END_STRUCT;
	MpTieBarInfoType : 	STRUCT  (*Tie Bar info structure*)
		Diag : MpTieBarDiagType;
	END_STRUCT;
	MpTieBarDiagType : 	STRUCT  (*MpTieBar diagnosis information*)
		StatusID : MpTieBarStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpTieBarStatusIDType : 	STRUCT  (*MpTieBar status ID information*)
		ID : MpTieBarErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
		Code : UINT; (*Error code*)
	END_STRUCT;
END_TYPE
