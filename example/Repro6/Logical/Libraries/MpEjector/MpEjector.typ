(**********************************************************)
(********************** Enumerators ********************)
(**********************************************************)
(*Common*)

TYPE
	MpEjectorMechanicalTypeEnum : 
		( (*Mechanical types for axes*)
		mpEJECTOR_MECH_TYPE_HYDRAULIC := 0, (*Axis is an hydraulic piston*)
		mpEJECTOR_MECH_TYPE_ELECTRIC := 1 (*Axis is an electric servomotor*)
		);
	MpEjectorProfileGenerationEnum : 
		( (*Define how the profile is generated*)
		mpEJECTOR_POSITION_BASED := 0, (*The profile is based on position*)
		mpEJECTOR_TIME_BASED := 1 (*The profile is based on time*)
		);
	MpEjectorMoveTypeEnum : 
		( (*Movement types for axes*)
		mpEJECTOR_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (Ejector \will use the defined speed and force)*)
		mpEJECTOR_MOVE_TYPE_NORMAL := 1, (*Movement in manual mode (Ejector will follow the profile)*)
		mpEJECTOR_MOVE_TYPE_REPETITION := 3 (*Movement in repetition mode (Ejector will move to the repetition position)*)
		);
	MpEjectorStateEnum : 
		( (*Ejector state information*)
		mpEJECTOR_UNDEFINED := 0, (*Ejector status is not defined *)
		mpEJECTOR_BACKWARD_END_POSITION := 1, (*Ejector is in negative end position *)
		mpEJECTOR_BACKWARD_STOP_POSITION := 2, (*Ejector is in negative stop position *)
		mpEJECTOR_BACKWARD_MOVEMENT := 3, (*Ejector moves in negative direction *)
		mpEJECTOR_FORWARD_END_POSITION := 4, (*Ejector is in positive end position *)
		mpEJECTOR_FORWARD_STOP_POSITION := 5, (*Ejector is in positive stop position *)
		mpEJECTOR_FORWARD_MOVEMENT := 6 (*Ejector moves in positive direction *)
		);
END_TYPE

(**********************************************************)
(*Electric*)

TYPE
	MpEjectorMotionSystemTypeEnum : 
		( (*Type of the motion system*)
		mpEJECTOR_MOTION_SYS_MAPP := 0 (*Motion system used is mappMotion*)
		);
	MpEjectorAxisHomingTypeEnum : 
		( (*Homing type*)
		mpEJECTOR_HOME_NOT_USED := 0, (*Homing not used*)
		mpEJECTOR_HOME_ABS_CORRECTION := 1, (*Homing by setting the homing position as offset for an absolute encoder with counter range correction*)
		mpEJECTOR_HOME_DIRECT := 2 (*Direct homing. Homing position is used directly as the new axis position.*)
		);
END_TYPE

(**********************************************************)
(*Hydraulic*)

TYPE
	MpEjectorValveTypeEnum : 
		( (*Valve types*)
		mpEJECTOR_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpEJECTOR_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpEJECTOR_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
END_TYPE

(**********************************************************)
(*************** Configuration structure ***************)
(**********************************************************)
(*Common*)

TYPE
	MpEjectorVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s]*)
		Acceleration : REAL := 2000.0; (*Acceleration [mm/s² ]*)
		Deceleration : REAL := 2000.0; (*Deceleration [mm/s² ]*)
		EndDeceleration : REAL := 2000.0; (*End deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Electric*)

TYPE
	MpEjectorMotionSystemType : 	STRUCT  (*Motion type definition*)
		Type : MpEjectorMotionSystemTypeEnum := mpEJECTOR_MOTION_SYS_MAPP; (*Type of the motion system used*)
		AxisReference : STRING[255]; (*String with axis  name*)
		AxisPreparation : MpEjectorAxisPreparationType; (*Settings for the axis preparation*)
	END_STRUCT;
	MpEjectorAxisPreparationType : 	STRUCT  (*Settings for the axis preparation*)
		Power : MpEjectorAxisPrepPowerType; (*Settings for powering the axis during preparation*)
		Home : MpEjectorAxisPrepHomeType; (*Settings for homing the axis during preparation*)
	END_STRUCT;
	MpEjectorAxisPrepPowerType : 	STRUCT  (*Power the axis during preparation*)
		Enable : BOOL := TRUE; (*Enable powering the axis during preparation*)
	END_STRUCT;
	MpEjectorAxisPrepHomeType : 	STRUCT  (*Home the axis during preparation*)
		Type : MpEjectorAxisHomingTypeEnum := mpEJECTOR_HOME_ABS_CORRECTION; (*Select type of homing during preparation*)
	END_STRUCT;
	MpEjectorEForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [Nm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [Nm]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [Nm/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [Nm/s]*)
	END_STRUCT;
	MpEjectorEMoveConfigType : 	STRUCT  (*Ejector configuration parameters for each direction*)
		ProfileGeneration : MpEjectorProfileGenerationEnum := mpEJECTOR_POSITION_BASED; (*How the profile is generated*)
		VelocityProfileLimits : MpEjectorVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpEjectorEForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
	END_STRUCT;
	MpEjectorBasicEConfigType : 	STRUCT  (*Ejector configuration parameters*)
		MechanicalType : MpEjectorMechanicalTypeEnum := mpEJECTOR_MECH_TYPE_ELECTRIC;
		MotionSystem : MpEjectorMotionSystemType; (*Electric injection settings*)
		InputSignals : MpEjectorEInputSignalsType; (*Input signals*)
		OutputSignals : MpEjectorEOutputSignalsType; (*Output signals*)
		MaxPosition : REAL := 100; (*Maximum stroke of axis [mm]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		EnableRepetition : BOOL := FALSE; (*Enable the repetition movement*)
		Forward : MpEjectorEMoveConfigType; (*Configuration parameters for forward direction*)
		Backward : MpEjectorEMoveConfigType; (*Configuration parameters for backward direction*)
	END_STRUCT;
	MpEjectorEInputSignalsType : 	STRUCT  (*Input signals*)
		PrepareAxis : STRING[255]; (*String with name of process variable to power on the axis*)
		HomingPosition : STRING[255]; (*String with name of process variable to define the absolute correction homing offset or direct homing position*)
	END_STRUCT;
	MpEjectorEOutputSignalsType : 	STRUCT  (*Output signals*)
		AxisReady : STRING[255]; (*String with name of process varialbe to get the axis ready status*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Hydraulic*)

TYPE
	MpEjectorBasicHConfigType : 	STRUCT  (*Ejector configuration parameters*)
		MaxPosition : REAL := 100; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.01; (*Velocity filter time [s]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		EnableRepetition : BOOL := FALSE; (*Enable the repetition movement*)
		InputSignals : MpEjectorInputSignalsType; (*Input signals*)
		OutputSignals : MpEjectorOutputSignalsType; (*Output signals*)
		ValveSettings : MpEjectorValveSettingsType; (*Valve settings and linearization*)
		Forward : MpEjectorMoveConfigType; (*Configuration parameters for forward direction*)
		Backward : MpEjectorMoveConfigType; (*Configuration parameters for backward direction*)
		MechanicalType : MpEjectorMechanicalTypeEnum := mpEJECTOR_MECH_TYPE_HYDRAULIC;
	END_STRUCT;
	MpEjectorInputSignalsType : 	STRUCT  (*Input signals*)
		CurrentPosition : STRING[255]; (*Datapoint containing current position*)
		ForwardEnd : STRING[255]; (*Datapoint connected to forward end sensor*)
		ForwardSlow : STRING[255]; (*Datapoint connected to forward slow sensor*)
		BackwardEnd : STRING[255]; (*Datapoint connected to backward end sensor*)
		BackwardSlow : STRING[255]; (*Datapoint connected to backward slow sensor*)
	END_STRUCT;
	MpEjectorOutputSignalsType : 	STRUCT  (*Input signals*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		ForwardValve : STRING[255]; (*Datapoint for forward valve signal*)
		BackwardValve : STRING[255]; (*Datapoint for backward valve signal*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpEjectorValveSettingsType : 	STRUCT  (*Valve settings*)
		ValveType : MpEjectorValveTypeEnum := mpEJECTOR_VALVE_TYPE_DIRECT; (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpEjectorValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpEjectorValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 3; (*Number of used nodes*)
	END_STRUCT;
	MpEjectorDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*After movement delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpEjectorForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpEjectorMoveConfigType : 	STRUCT  (*Ejector configuration parameters for each direction*)
		ProfileGeneration : MpEjectorProfileGenerationEnum := mpEJECTOR_POSITION_BASED; (*How the profile is generated*)
		UseEndSwitch : BOOL := FALSE; (*Evaluate the limit switch*)
		UseSlowDownSwitch : BOOL := FALSE; (*Evaluate the slow down switch*)
		VelocityProfileLimits : MpEjectorVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpEjectorForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpEjectorDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(******************* Parameter structure **************)
(**********************************************************)

TYPE
	MpEjectorBasicParType : 	STRUCT  (*Ejector parameters*)
		ForwardProfile : MpEjectorProfileType := (Velocity:=[50.0,9(0.0)],Force:=[50.0,9(0.0)],Position:=[100.0,9(0.0)],AccelerationOverride:=[10(100.0)]); (*Forward movement profile parameters*)
		BackwardProfile : MpEjectorProfileType := (Velocity:=[50.0,9(0.0)],Force:=[50.0,9(0.0)],AccelerationOverride:=[10(100.0)]); (*Backward movement profile parameters*)
		Repetition : MpEjectorRepetitionProfileType; (*Repetition profile parameters*)
		SetupMode : MpEjectorSetupModeType; (*Setup parameters (fixed during machine operation, changed during commissioning)*)
	END_STRUCT;
	MpEjectorProfileType : 	STRUCT  (*Profile settings for each direction*)
		Velocity : ARRAY[0..9]OF REAL; (*Set velocity for each profile step [mm/s]*)
		Force : ARRAY[0..9]OF REAL; (*Set force for each profile step [bar / Nm]*)
		Position : ARRAY[0..9]OF REAL; (*Set position for each profile step [mm]*)
		Time : ARRAY[0..9]OF REAL; (*Movement time for each step [s]*)
		AccelerationOverride : ARRAY[0..9]OF REAL; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpEjectorSetupModeType : 	STRUCT  (*Setting mode parameters*)
		ForwardProfile : MpEjectorSetupModeProfileType; (*Settings for setting mode positive direction*)
		BackwardProfile : MpEjectorSetupModeProfileType; (*Settings for setting mode negative direction*)
	END_STRUCT;
	MpEjectorSetupModeProfileType : 	STRUCT  (*Profile settings for each direction in setting mode*)
		Velocity : REAL := 10; (*Setting mode velocity for each direction [mm/s]*)
		Force : REAL := 10; (*Setting mode force for each direction [bar / Nm]*)
	END_STRUCT;
	MpEjectorRepetitionProfileType : 	STRUCT  (*Repetition profile*)
		Forward : MpEjectorRepetitionMoveType; (*Forward repetition profile parameters*)
		Backward : MpEjectorRepetitionMoveType; (*Backward repetition profile parameters*)
	END_STRUCT;
	MpEjectorRepetitionMoveType : 	STRUCT  (*Parameters for repetition movement for one direction*)
		Velocity : REAL := 20; (*Set velocity for repetition step [mm/s]*)
		Force : REAL := 20; (*Set force for repetition step [bar / Nm]*)
		Position : REAL := 0; (*Set position for repetition step [mm]*)
		Time : REAL := 0; (*Time for repetition step [s]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(********************** Info structure *******************)
(**********************************************************)

TYPE
	MpEjectorBasicInfoType : 	STRUCT  (*Ejector info structure*)
		Velocity : REAL; (*Current velocity [mm/s]*)
		MinPosition : REAL; (*Minimum measured value[mm]*)
		MaxPosition : REAL; (*Maximum measured value[mm]*)
		MaxVelocity : REAL; (*Maximum velocity [mm/s]*)
		StepForward : USINT; (*Current profile step for forward movement*)
		StepBackward : USINT; (*Current profile step for backward movement*)
		State : MpEjectorStateEnum; (*Ejector state information*)
		Diag : MpEjectorDiagType;
		Position : REAL; (*Current position [mm] (not used in hydraulic mode)*)
		Torque : REAL; (*Current torque [Nm] (not used in hydraulic mode)*)
		InTorqueLimitation : BOOL; (*The torque limitation is active (not used in hydraulic mode)*)
	END_STRUCT;
	MpEjectorInfoType : 	STRUCT  (*Ejector config info structure*)
		Diag : MpEjectorDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpEjectorDiagType : 	STRUCT  (*MpEjector diagnosis information*)
		StatusID : MpEjectorStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpEjectorStatusIDType : 	STRUCT  (*MpEjector status ID information*)
		ID : MpEjectorErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
