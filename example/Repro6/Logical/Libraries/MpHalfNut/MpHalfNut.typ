
TYPE
	MpHalfNutMoveTypeEnum : 
		( (*Movement types for axes*)
		mpHALFNUT_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (HalfNut \will use the defined speed and pressure)*)
		mpHALFNUT_MOVE_TYPE_NORMAL := 1 (*Movement in manual mode (HalfNut will follow the profile)*)
		);
	MpHalfNutStateEnum : 
		( (*HalfNut state information*)
		mpHALFNUT_UNDEFINED := 0, (*HalfNut status is not defined *)
		mpHALFNUT_CLOSE_END_POSITION := 1, (*HalfNut is in negative end position *)
		mpHALFNUT_CLOSE_STOP_POSITION := 2, (*HalfNut is in negative stop position *)
		mpHALFNUT_CLOSE_MOVEMENT := 3, (*HalfNut moves in negative direction *)
		mpHALFNUT_OPEN_END_POSITION := 4, (*HalfNut is in positive end position *)
		mpHALFNUT_OPEN_STOP_POSITION := 5, (*HalfNut is in positive stop position *)
		mpHALFNUT_OPEN_MOVEMENT := 6 (*HalfNut moves in positive direction *)
		);
END_TYPE

(*Configuration structure*)

TYPE
	MpHalfNutBasicHConfigType : 	STRUCT  (*HalfNut configuration parameters*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpHalfNutInputSignalsType; (*Input signals*)
		OutputSignals : MpHalfNutOutputSignalsType; (*Output signals*)
		Open : MpHalfNutMoveConfigType; (*Configuration parameters for open direction*)
		Close : MpHalfNutMoveConfigType; (*Configuration parameters for close direction*)
	END_STRUCT;
	MpHalfNutInputSignalsType : 	STRUCT  (*Input signals*)
		OpenEnd : STRING[255]; (*Datapoint containing open end input signal*)
		CloseEnd : STRING[255]; (*Datapoint containing close end input signal*)
	END_STRUCT;
	MpHalfNutOutputSignalsType : 	STRUCT  (*Output signals*)
		SetVelocity : STRING[255]; (*Datapoint that gets set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets set force*)
		OpenValve : STRING[255]; (*Datapoint for open valve signal*)
		CloseValve : STRING[255]; (*Datapoint for close valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpHalfNutMoveConfigType : 	STRUCT  (*HalfNut configuration parameters for each direction*)
		UseEndSwitch : BOOL := FALSE; (*Evaluate the limit switch*)
		VelocityProfileLimits : MpHalfNutVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpHalfNutForceType; (*Pressure settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpHalfNutDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpHalfNutDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*After movement delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Pressure delay time [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Pressure during pressure delay [bar]*)
	END_STRUCT;
	MpHalfNutVelocityType : 	STRUCT  (*Velocity settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [%]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode velocity [%]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpHalfNutForceType : 	STRUCT  (*Pressure settings*)
		Maximum : REAL := 100; (*Maximum pressure [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setup mode pressure [bar]*)
		PumpForceOffset : REAL := 0; (*Pump pressure offset [bar]*)
		Acceleration : REAL := 5000.0; (*Pressure acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Pressure deceleration [bar/s]*)
	END_STRUCT;
END_TYPE

(*Parameter structure*)

TYPE
	MpHalfNutBasicParType : 	STRUCT  (*HalfNut parameters*)
		OpenProfile : MpHalfNutProfileType; (*Open movement profile parameters*)
		CloseProfile : MpHalfNutProfileType; (*Close movement profile parameters*)
		SetupMode : MpHalfNutSetupModeType; (*Setup parameters (fixed during machine operation, changed during commissioning)*)
	END_STRUCT;
	MpHalfNutProfileType : 	STRUCT  (*Profile settings for each direction*)
		Velocity : ARRAY[0..9]OF REAL := [50.0,9(0.0)]; (*Set velocity for each profile step [mm/s]*)
		Force : ARRAY[0..9]OF REAL := [50.0,9(0.0)]; (*Set pressure for each profile step [bar]*)
		Time : ARRAY[0..9]OF REAL := [2.0,9(0.0)]; (*Movement time for each step [s]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100.0)]; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpHalfNutSetupModeType : 	STRUCT  (*Setting mode parameters*)
		OpenProfile : MpHalfNutSetupModeProfileType; (*Settings for setting mode positive direction*)
		CloseProfile : MpHalfNutSetupModeProfileType; (*Settings for setting mode negative direction*)
	END_STRUCT;
	MpHalfNutSetupModeProfileType : 	STRUCT  (*Profile settings for each direction in setting mode*)
		Velocity : REAL := 20.0; (*Setting mode velocity for each direction [mm/s]*)
		Force : REAL := 20.0; (*Setting mode pressure for each direction [bar]*)
	END_STRUCT;
END_TYPE

(*Information structure*)

TYPE
	MpHalfNutBasicInfoType : 	STRUCT  (*HalfNut info structure*)
		StepOpen : USINT; (*Current profile step for open movement*)
		StepClose : USINT; (*Current profile step for close movement*)
		State : MpHalfNutStateEnum; (*HalfNut state information*)
		Diag : MpHalfNutDiagType;
	END_STRUCT;
	MpHalfNutInfoType : 	STRUCT  (*HalfNut config info structure*)
		Diag : MpHalfNutDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpHalfNutDiagType : 	STRUCT  (*MpHalfNut diagnosis information*)
		StatusID : MpHalfNutStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpHalfNutStatusIDType : 	STRUCT  (*MpHalfNut status ID information*)
		ID : MpHalfNutErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
