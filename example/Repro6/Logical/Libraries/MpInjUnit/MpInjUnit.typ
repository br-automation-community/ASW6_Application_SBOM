(*Enumerations*)

TYPE
	MpInjUnitProfileGenerationEnum : 
		( (*Define how the profile is generated*)
		mpINJUNIT_POSITION_BASED := 0, (*The profile is based on position*)
		mpINJUNIT_TIME_BASED := 1 (*The profile is based on time*)
		);
	MpInjUnitMoveTypeEnum : 
		( (*Movement types for axes*)
		mpINJUNIT_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (injection unit will use the defined speed and force)*)
		mpINJUNIT_MOVE_TYPE_NORMAL := 1 (*Movement in manual mode (injection unit will follow the profile)*)
		);
	MpInjUnitStateEnum : 
		( (*Injection unit state information*)
		mpINJUNIT_UNDEFINED := 0, (*Injection unit status is not defined *)
		mpINJUNIT_FORWARD_END_POSITION := 1, (*Injection unit is in negative end position *)
		mpINJUNIT_FORWARD_STOP_POSITION := 2, (*Injection unit is in negative stop position *)
		mpINJUNIT_FORWARD_MOVEMENT := 3, (*Injection unit moves in negative direction *)
		mpINJUNIT_BACKWARD_END_POSITION := 4, (*Injection unit is in positive end position *)
		mpINJUNIT_BACKWARD_STOP_POSITION := 5, (*Injection unit is in positive stop position *)
		mpINJUNIT_BACKWARD_MOVEMENT := 6 (*Injection unit moves in positive direction *)
		);
	MpInjUnitValveTypeEnum : 
		( (*Valve types*)
		mpINJUNIT_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpINJUNIT_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpINJUNIT_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
END_TYPE

(*Configuration structure*)

TYPE
	MpInjUnitBasicHConfigType : 	STRUCT  (*Injection unit configuration parameters*)
		MaxPosition : REAL := 100; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.01; (*Velocity filter time [s]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpInjUnitInputSignalsType; (*Input signals*)
		OutputSignals : MpInjUnitOutputSignalsType; (*Output signals*)
		Forward : MpInjUnitForwardType; (*Configuration parameters for forward direction*)
		Backward : MpInjUnitBackwardType; (*Configuration parameters for backward direction*)
		ValveSettings : MpInjUnitValveSettingsType; (*Valve settings and linearization*)
	END_STRUCT;
	MpInjUnitInputSignalsType : 	STRUCT  (*Input signals*)
		CurrentPosition : STRING[255]; (*Datapoint containing current position*)
		CurrentForce : STRING[255]; (*Datapoint containing current force*)
		ForwardEnd : STRING[255]; (*Datapoint connected to forward end sensor*)
		ForwardSlow : STRING[255]; (*Datapoint connected to forward slow sensor*)
		BackwardEnd : STRING[255]; (*Datapoint connected to backward end sensor*)
		BackwardSlow : STRING[255]; (*Datapoint connected to backward slow sensor*)
	END_STRUCT;
	MpInjUnitOutputSignalsType : 	STRUCT  (*Input signals*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		ForwardValve : STRING[255]; (*Datapoint for forward valve signal*)
		BackwardValve : STRING[255]; (*Datapoint for backward valve signal*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpInjUnitBackwardType : 	STRUCT  (*Injection unit configuration parameters for each direction*)
		ProfileGeneration : MpInjUnitProfileGenerationEnum := mpINJUNIT_POSITION_BASED; (*How the profile is generated*)
		UseEndSwitch : BOOL := FALSE; (*Evaluate the limit switch*)
		UseSlowDownSwitch : BOOL := FALSE; (*Evaluate the slow down switch*)
		VelocityProfileLimits : MpInjUnitVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjUnitForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpInjUnitDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpInjUnitForwardType : 	STRUCT  (*Injection unit configuration parameters for each direction*)
		ProfileGeneration : MpInjUnitProfileGenerationEnum := mpINJUNIT_POSITION_BASED; (*How the profile is generated*)
		UseEndSwitch : BOOL := FALSE; (*Evaluate the limit switch*)
		UseSlowDownSwitch : BOOL := FALSE; (*Evaluate the slow down switch*)
		UseForceLimit : BOOL := FALSE; (*Use the nozzle protect force as force target*)
		VelocityProfileLimits : MpInjUnitForwardVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjUnitForwardForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpInjUnitDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpInjUnitDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*After movement delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpInjUnitVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s / rpm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s / rpm]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s² / rpm /s]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s² / rpm / s]*)
		EndDeceleration : REAL := 2000.0; (*Flow end deceleration [mm/s² / rpm /s]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpInjUnitForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpInjUnitForwardVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s / rpm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s / rpm]*)
		ProtectMaximum : REAL := 50; (*Max. velocity for nozzle protection [mm/s]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s² / rpm /s]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s² / rpm / s]*)
		EndDeceleration : REAL := 2000.0; (*Flow end deceleration [mm/s² / rpm /s]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpInjUnitForwardForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		ProtectMaximum : REAL := 50; (*Max. force for nozzle protection [bar]*)
		Tolerance : REAL := 0; (*Force tolerance for touch detection [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpInjUnitValveSettingsType : 	STRUCT  (*Valve settings*)
		ValveType : MpInjUnitValveTypeEnum := (0); (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpInjUnitValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpInjUnitValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 3; (*Number of used nodes*)
	END_STRUCT;
END_TYPE

(*Parameter structure*)

TYPE
	MpInjUnitBasicParType : 	STRUCT  (*Injection unit hydraulic parameters*)
		ForwardProfile : MpInjUnitProfileType := (Velocity:=[20.0,9(0.0)],Force:=[20.0,9(0.0)],Position:=[10(0.0)]); (*Forward direction movement profile parameters*)
		BackwardProfile : MpInjUnitProfileType := (Velocity:=[20.0,9(0.0)],Force:=[20.0,9(0.0)],Position:=[100.0,9(0.0)]); (*Backward direction movement profile parameters*)
		ProtectProfile : MpInjUnitProtectProfileType; (*Nozzle protection movement profile parameters*)
		SetupMode : MpInjUnitSetupModeType; (*Setup mode parameters*)
	END_STRUCT;
	MpInjUnitProfileType : 	STRUCT  (*Profile settings for each direction*)
		Velocity : ARRAY[0..9]OF REAL; (*Set velocity for each profile step [mm/s]*)
		Force : ARRAY[0..9]OF REAL; (*Set force for each profile step [bar]*)
		Position : ARRAY[0..9]OF REAL; (*Set position for each profile step [mm]*)
		Time : ARRAY[0..9]OF REAL; (*Movement time for each step [s]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100.0)]; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpInjUnitSetupModeType : 	STRUCT  (*Setup mode parameters*)
		ForwardProfile : MpInjUnitSetupModeProfileType; (*Settings for setup mode forward direction*)
		BackwardProfile : MpInjUnitSetupModeProfileType; (*Settings for setup mode backward direction*)
	END_STRUCT;
	MpInjUnitSetupModeProfileType : 	STRUCT  (*Profile settings for setup mode for hydraulic injection unit*)
		Velocity : REAL := 10; (*Setup mode velocity [mm/s]*)
		Force : REAL := 10; (*Setup mode force [bar]*)
	END_STRUCT;
	MpInjUnitProtectProfileType : 	STRUCT  (*Nozzle protection parameters*)
		Timeout : REAL := 0.0; (*Timeout for nozzle protection step [s]*)
		Velocity : REAL := 20; (*Set Velocity for nozzle protection [mm/s]*)
		Force : REAL := 20; (*Set Force for nozzle protection [bar]*)
		Position : REAL := 20; (*Set Position for nozzle protection end [mm]*)
		Delay : REAL := 0.02; (*Delay time after movement has ended [s]*)
	END_STRUCT;
END_TYPE

(*Additional Information structure*)

TYPE
	MpInjUnitInfoType : 	STRUCT  (*Injection unit info structure*)
		Diag : MpInjUnitDiagType;
	END_STRUCT;
	MpInjUnitBasicInfoType : 	STRUCT  (*Injection unit info structure*)
		Velocity : REAL; (*Current velocity [mm/s]*)
		MaxForce : REAL; (*Maximum force [bar]*)
		MinPosition : REAL; (*Minimum measured value[mm]*)
		MaxPosition : REAL; (*Maximum measured value[mm]*)
		MaxVelocity : REAL; (*Maximum velocity [mm/s]*)
		StepForward : USINT; (*Current profile step for forward movement*)
		StepBackward : USINT; (*Current profile step for backward movement*)
		State : MpInjUnitStateEnum; (*Injection unit state information*)
		Diag : MpInjUnitDiagType;
	END_STRUCT;
	MpInjUnitDiagType : 	STRUCT  (*MpInjUnit diagnosis information*)
		StatusID : MpInjUnitStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpInjUnitStatusIDType : 	STRUCT  (*MpInjUnit status ID information*)
		ID : MpInjUnitErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
