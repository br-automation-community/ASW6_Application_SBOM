(*Enumerators*)

TYPE
	MpCorePullMoveModeEnum : 
		( (*Movement modes defining end conditon*)
		mpCOREPULL_MOVE_MODE_LIMITSWITCH := 1, (*Movement ends after reaching limit switch*)
		mpCOREPULL_MOVE_MODE_TIME := 2, (*Movement ends after specified time*)
		mpCOREPULL_MOVE_MODE_PULSES := 4 (*Movement ends after specified number of pulses*)
		);
	MpCorePullMoveTypeEnum : 
		( (*Movement types for axes*)
		mpCOREPULL_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (axis will use the defined speed and force)*)
		mpCOREPULL_MOVE_TYPE_NORMAL := 1 (*Movement in normal mode (axis will follow the profile)*)
		);
	MpCorePullStateEnum : 
		( (*State information*)
		mpCOREPULL_STATE_UNDEFINED := 0, (*Axis status is not defined *)
		mpCOREPULL_STATE_OUT_END_POS := 1, (*Axis is in negative end position *)
		mpCOREPULL_STATE_OUT_STOP_POS := 2, (*Axis is in negative stop position *)
		mpCOREPULL_STATE_OUT_MOVEMENT := 3, (*Axis moves in negative direction *)
		mpCOREPULL_STATE_IN_END_POS := 4, (*Axis is in positive end position *)
		mpCOREPULL_STATE_IN_STOP_POS := 5, (*Axis is in positive stop position *)
		mpCOREPULL_STATE_IN_MOVEMENT := 6 (*Axis moves in positive direction *)
		);
	MpCorePullValveTypeEnum : 
		( (*Valve types*)
		mpCOREPULL_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpCOREPULL_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpCOREPULL_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
END_TYPE

(*Configuration structure*)

TYPE
	MpCorePullBasicHConfigType : 	STRUCT  (*Core pull configuration parameters*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpCorePullInputSignalsType; (*Input signals*)
		OutputSignals : MpCorePullOutputSignalsType; (*Output signals*)
		In : MpCorePullConfigDirectionType; (*Configuration parameters for positive direction*)
		Out : MpCorePullConfigDirectionType; (*Configuration parameters for negative direction*)
		ValveSettings : MpCorePullValveSettingsType; (*Valve settings and linearization*)
	END_STRUCT;
	MpCorePullInputSignalsType : 	STRUCT  (*Input signals*)
		InEnd : STRING[255]; (*Datapoint connected to in end sensor*)
		OutEnd : STRING[255]; (*Datapoint connected to out end sensor*)
		PulseCount : STRING[255]; (*Datapoint connected to pulse count*)
	END_STRUCT;
	MpCorePullOutputSignalsType : 	STRUCT  (*Input signals*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		InValve : STRING[255]; (*Datapoint for forward valve signal*)
		OutValve : STRING[255]; (*Datapoint for backward valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve valve signal*)
	END_STRUCT;
	MpCorePullConfigDirectionType : 	STRUCT  (*Core pull configuration parameters for each direction*)
		VelocityProfileLimits : MpCorePullVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpCorePullForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpCorePullDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpCorePullDelayType : 	STRUCT  (*Hydraulic delay Setups*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*Delay time to end the movement [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpCorePullVelocityType : 	STRUCT  (*Velocity settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [%]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode velocity [%]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
	END_STRUCT;
	MpCorePullForceType : 	STRUCT  (*Force settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpCorePullValveSettingsType : 	STRUCT  (*Valve settings*)
		ValveType : MpCorePullValveTypeEnum := mpCOREPULL_VALVE_TYPE_DIRECT; (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpCorePullValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpCorePullValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 3; (*Number of used nodes*)
	END_STRUCT;
END_TYPE

(*Parameter structure*)

TYPE
	MpCorePullBasicParType : 	STRUCT  (*Core pull parameters*)
		In : ARRAY[0..4]OF MpCorePullDirectionType; (*Positive direction movement parameter set*)
		Out : ARRAY[0..4]OF MpCorePullDirectionType; (*Negative direction movement parameter set*)
		SetupMode : MpCorePullSetupModeType; (*Setup mode parameters*)
	END_STRUCT;
	MpCorePullSetupModeType : 	STRUCT  (*Setup mode parameters*)
		In : MpCorePullDirectionSetupType; (*Positive direction movement parameters*)
		Out : MpCorePullDirectionSetupType; (*Negative direction movement parameters*)
	END_STRUCT;
	MpCorePullDirectionSetupType : 	STRUCT  (*Profile Setups for each direction*)
		Velocity : REAL := 10.0; (*Setup mode velocity for each direction [%]*)
		Force : REAL := 10.0; (*Setup mode force for each direction [bar]*)
	END_STRUCT;
	MpCorePullDirectionType : 	STRUCT  (*Profile Setups for each direction*)
		Velocity : REAL := 100; (*Normal mode velocity for each direction [%]*)
		Force : REAL := 100; (*Normal mode force for each direction [bar]*)
		AccelerationOverride : REAL := 100; (*Override for acceleration / deceleration [%]*)
		Pulses : UDINT := 50; (*Specifying number of pulses for core movement (rotational cores) [-]*)
		Time : REAL := 2; (*Specifying core movement duration in Time mode or addtitional movement duration after end condition for other modes [s]*)
		Timeout : REAL := 5; (*Core movement should be finished within this time [s]*)
		ValveStayOn : BOOL := FALSE; (*If true, valves will stay on after movement finish*)
		MoveMode : MpCorePullMoveModeEnum := mpCOREPULL_MOVE_MODE_LIMITSWITCH; (*Selecting end condition for movement*)
	END_STRUCT;
END_TYPE

(*Additional info structure*)

TYPE
	MpCorePullBasicInfoType : 	STRUCT  (*Core pull info structure*)
		State : MpCorePullStateEnum; (*Axis status information*)
		Diag : MpCorePullDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpCorePullInfoType : 	STRUCT  (*Core pull info structure*)
		Diag : MpCorePullDiagType;
	END_STRUCT;
	MpCorePullDiagType : 	STRUCT  (*MpCorePullH diagnosis information*)
		StatusID : MpCorePullStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpCorePullStatusIDType : 	STRUCT  (*MpCorePullH status ID information*)
		ID : MpCorePullErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
