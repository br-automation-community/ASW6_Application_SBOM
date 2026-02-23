(**********************************************************)
(********************** Enumerators ********************)
(**********************************************************)
(*Common*)

TYPE
	MpInjectMechanicalTypeEnum : 
		( (*Mechanical types for axes*)
		mpINJECT_MECH_TYPE_HYDRAULIC := 0, (*Axis is an hydraulic piston*)
		mpINJECT_MECH_TYPE_ELECTRIC := 1 (*Axis is an electric servomotor*)
		);
	MpInjectMoveTypeEnum : 
		( (*Movement types for axes*)
		mpINJECT_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (axis will use the defined speed and pressure)*)
		mpINJECT_MOVE_TYPE_NORMAL := 1 (*Movement in manual or semi-(automatic) mode (axis will follow the profile)*)
		);
	MpInjectStateEnum : 
		( (*State information*)
		mpINJECT_STATE_UNDEFINED := 0, (*Axis status is not defined *)
		mpINJECT_STATE_INJ_END_POSITION := 1, (*Axis is in negative end position *)
		mpINJECT_STATE_INJ_STOP_POSITION := 2, (*Axis is in negative stop position *)
		mpINJECT_STATE_INJ_MOVEMENT := 3, (*Axis does a movement in negative direction*)
		mpINJECT_STATE_DEC_END_POSITION := 4, (*Axis is in positive end position *)
		mpINJECT_STATE_DEC_STOP_POSITION := 5, (*Axis is in positive stop position *)
		mpINJECT_STATE_DEC_MOVEMENT := 6 (*Axis does a movement in positive direction*)
		);
	MpInjectExecutingCmdEnum : 
		( (*Currently executed command*)
		mpINJECT_CMD_IDLE := 0, (*No command is active*)
		mpINJECT_CMD_INJECTION := 1, (*Injection movement is active*)
		mpINJECT_CMD_HOLD_ON_PRESSURE := 2, (*Hold on pressure phase is active*)
		mpINJECT_CMD_DECOMPRESSION := 3, (*Decompression movement is active*)
		mpINJECT_CMD_PLASTIFICATION := 4 (*Plastification movement is active*)
		);
	MpInjectSwitchoverReasonEnum : 
		( (*Switchover reason*)
		mpINJECT_SWITCHOVER_POSITION := 0, (*Switchover happened due to position*)
		mpINJECT_SWITCHOVER_TIME := 1, (*Switchover happened due to time*)
		mpINJECT_SWITCHOVER_PRESSURE := 2, (*Switchover happened due to pressure*)
		mpINJECT_SWITCHOVER_CAVITY := 3, (*Switchover happened due to cavity pressure*)
		mpINJECT_SWITCHOVER_EXTERNAL := 4 (*Switchover happened due to external signal*)
		);
	MpInjectProfileGenerationEnum : 
		( (*Define how the profile is generated*)
		mpINJECT_POSITION_BASED := 0, (*The profile is based on position*)
		mpINJECT_TIME_BASED := 1 (*The profile is based on time*)
		);
END_TYPE

(**********************************************************)
(*Electric*)

TYPE
	MpInjectMotionSystemTypeEnum : 
		( (*Type of the motion system*)
		mpINJECT_MOTION_SYS_MAPP := 0 (*Motion system used is mappMotion*)
		);
	MpInjectDigitalSourceEnum : 
		( (*Source of the digital sensor*)
		mpINJECT_DIGITAL_INPUT_NOT_USED := 0, (*Digital sensor is not read on the digital inputs of the drive. The external source has to be used.*)
		mpINJECT_DIGITAL_INPUT_TRIGGER_1 := 1, (*Digital sensor source is configured on digital input trigger 1 of drive*)
		mpINJECT_DIGITAL_INPUT_TRIGGER_2 := 2 (*Digital sensor source is configured on digital input trigger 2 of drive*)
		);
	MpInjectPressureSourceEnum : 
		( (*Source of the pressure sensor*)
		mpINJECT_ANALOG_INPUT_NOT_USED := 0, (*Pressure sonsor is not read on the analog inputs of the drive. The external source has to be used.*)
		mpINJECT_ANALOG_INPUT_1 := 1, (*Pressure sonsor source is configured on analog input 1 of drive*)
		mpINJECT_ANALOG_INPUT_2 := 2, (*Pressure sonsor source is configured on analog input 2 of drive*)
		mpINJECT_ANALOG_INPUT_3 := 3, (*Pressure sonsor source is configured on analog input 3 of drive*)
		mpINJECT_ANALOG_INPUT_4 := 4 (*Pressure sonsor source is configured on analog input 4 of drive*)
		);
	MpInjectSensorTypeEnum : 
		( (*Type of sensor signal source*)
		mpINJECT_READ_FROM_DRIVE := 0, (*Reading actual sensor signal with analog input module on drive.*)
		mpINJECT_READ_FROM_PV := 1, (*Reading actual sensor signal from process variable.*)
		mpINJECT_SENSOR_NOT_USED := 2 (*Actual sensor signal not used.*)
		);
	MpInjectAxisHomingTypeEnum : 
		( (*Homing type*)
		mpINJECT_HOME_NOT_USED := 0, (*Homing not used*)
		mpINJECT_HOME_ABS_CORRECTION := 1, (*Homing by setting the homing position as offset for an absolute encoder with counter range correction*)
		mpINJECT_HOME_DIRECT := 2 (*Direct homing. Homing position is used directly as the new axis position.*)
		);
END_TYPE

(**********************************************************)
(*Hydraulic*)

TYPE
	MpInjectValveTypeEnum : 
		( (*Valve types*)
		mpINJECT_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpINJECT_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpINJECT_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
	MpInjectControllerModeEnum : 
		( (*Controller type*)
		mpINJECT_CTRL_MODE_OPEN_LOOP := 0, (*Open loop control*)
		mpINJECT_CTRL_MODE_CLOSED_LOOP := 1 (*Closed loop control*)
		);
END_TYPE

(**********************************************************)
(*************** Configuration structure ****************)
(**********************************************************)
(*Common*)

TYPE
	MpInjectInjectForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		HoldMaximum : REAL := 100; (*Maximum pressure for hold pressure step [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar] (not used in electric mode)*)
		Acceleration : REAL := 5000.0; (*Pressure acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Pressure deceleration [bar/s]*)
	END_STRUCT;
	MpInjectVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s]*)
		ReverseMovementMaximum : REAL := 5; (*Maximum velocity of axis during backward movement [mm/s] (not used in hydraulic mode)*)
		Acceleration : REAL := 2000.0; (*Acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Deceleration [mm/s² ]*)
		EndDeceleration : REAL := 2000.0; (*End deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpInjectForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar] (not used in electric mode)*)
		Acceleration : REAL := 5000.0; (*Pressure acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Pressure deceleration [bar/s]*)
	END_STRUCT;
	MpInjectBackPressureType : 	STRUCT  (*Back pressure configuration parameters*)
		Maximum : REAL := 100; (*Maximum back pressure [bar]*)
		Acceleration : REAL := 5000; (*Back pressure acceleration rate [bar/s]*)
		Deceleration : REAL := 5000; (*Back pressure deceleration rate [bar/s]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Electric*)
(*Injection*)

TYPE
	MpInjectBasicEConfigType : 	STRUCT  (*Electric injection settings*)
		MechanicalType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_ELECTRIC;
		MotionSystem : MpInjectMotionSystemType; (*Type of the motion system*)
		InputSignals : MpInjectEInputSignalsType; (*Input signals*)
		OutputSignals : MpInjectEOutputSignalsType; (*Input signals*)
		MaxPosition : REAL := 100.0; (*Maximum stroke of axis [mm]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		Injection : MpInjectEInjectionType; (*Electric injection settings*)
		Decompression : MpInjectEDecompressionType; (*Electric decompression settings*)
	END_STRUCT;
	MpInjectSensorScalingType : 	STRUCT  (*Scaling parameters for raw values of pressure sensor*)
		MinimumSignalValue : INT := 0; (*Minimum pressure sensor signal (digits)*)
		MaximumSignalValue : INT := 32767; (*Maximum pressure sensor signal (digits)*)
		MinimumPressure : REAL := 0.0; (*Minimum pressure measured by sensor. Unit:[bar]*)
		MaximumPressure : REAL := 250.0; (*Maximum pressure measured by sensor. Unit:[bar]*)
	END_STRUCT;
	MpInjectEInputSignalsType : 	STRUCT  (*Inject input signals*)
		PrepareAxis : STRING[255]; (*String with name of process variable to power on the axis*)
		HomingPosition : STRING[255]; (*String with name of process variable to define the absolute correction homing offset or direct homing position*)
		PressureSensorSignal : MpInjectPressureSensorType := (Type:=mpINJECT_READ_FROM_DRIVE); (*Pressure sensor settings*)
		PressureFilterTime : REAL; (*Pressure signal filter time value*)
		CavityPressureSensorSignal : MpInjectPressureSensorType := (Type:=mpINJECT_READ_FROM_PV); (*Cavity pressure sensor settings*)
		CavityPressureFilterTime : REAL; (*Cavity pressure signal filter time value*)
		SwitchoverSensorSignal : MpInjectDigitalSensorType := (Type:=mpINJECT_READ_FROM_PV); (*Switchover sensor settings*)
	END_STRUCT;
	MpInjectEOutputSignalsType : 	STRUCT  (*Inject input signals*)
		AxisReady : STRING[255]; (*String with name of process varialbe to get the axis ready status*)
	END_STRUCT;
	MpInjectDigitalSensorType : 	STRUCT  (*Digital sensor settings*)
		Type : MpInjectSensorTypeEnum := mpINJECT_READ_FROM_PV; (*Type of digital sensor source  (internal / external)*)
		DigitalSensorSource : MpInjectDigitalSourceType; (*Source of digital sensor signal*)
		DigitalValue : STRING[255]; (*String with name of process varialbe with the value coming from the digital sensor*)
	END_STRUCT;
	MpInjectPressureSensorType : 	STRUCT  (*Pressure sensor settings*)
		Type : MpInjectSensorTypeEnum; (*Type of pressure sensor source (internal / external)*)
		PressureSensorSource : MpInjectPressureSourceType; (*Source of pressure sensor signal*)
		CurrentPressure : STRING[255]; (*String with name of process varialbe with the current pressure as integer value coming from the pressure sensor.*)
		Scaling : MpInjectSensorScalingType; (*External sensor scaling settings*)
	END_STRUCT;
	MpInjectDigitalSourceType : 	STRUCT  (*Source of the digital sensor*)
		Type : MpInjectDigitalSourceEnum; (*Type of digital sensor source*)
	END_STRUCT;
	MpInjectPressureSourceType : 	STRUCT  (*Source of the pressure sensor*)
		Type : MpInjectPressureSourceEnum; (*Type of pressure sensor source*)
	END_STRUCT;
	MpInjectMotionSystemType : 	STRUCT  (*Motion type definition*)
		Type : MpInjectMotionSystemTypeEnum := mpINJECT_MOTION_SYS_MAPP; (*Type of the motion system used*)
		AxisReference : STRING[255]; (*String with axis  name*)
		AxisPreparation : MpInjectAxisPreparationType; (*Settings for the axis preparation*)
	END_STRUCT;
	MpInjectAxisPreparationType : 	STRUCT  (*Settings for the axis preparation*)
		Power : MpInjectAxisPrepPowerType; (*Settings for powering the axis during preparation*)
		Home : MpInjectAxisPrepHomeType; (*Settings for homing the axis during preparation*)
	END_STRUCT;
	MpInjectAxisPrepPowerType : 	STRUCT  (*Power the axis during preparation*)
		Enable : BOOL := TRUE; (*Enable powering the axis during preparation*)
	END_STRUCT;
	MpInjectAxisPrepHomeType : 	STRUCT  (*Home the axis during preparation*)
		Type : MpInjectAxisHomingTypeEnum := mpINJECT_HOME_ABS_CORRECTION; (*Select type of homing during preparation*)
	END_STRUCT;
	MpInjectEInjectionType : 	STRUCT  (*Electric injection settings*)
		VelocityProfileLimits : MpInjectVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectInjectForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		SwitchoverTime : REAL := 0.0032; (*Time within which the pressure setpoint is ramped to hold-on pressure [s]*)
		TimeTolerance : REAL := 0.01; (*Time tolerance for end detection [s]*)
		PressureController : MpInjectEControllerType; (*PID parameters for injection/hold pressure controller*)
		ProfileGeneration : MpInjectProfileGenerationEnum := mpINJECT_POSITION_BASED; (*How the profile is generated*)
	END_STRUCT;
	MpInjectEDecompressionType : 	STRUCT  (*Electric decompression settings*)
		VelocityProfileLimits : MpInjectVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
	END_STRUCT;
END_TYPE

(*Plastification*)

TYPE
	MpInjectPlastMotionSystemType : 	STRUCT  (*Motion type definition*)
		Type : MpInjectMotionSystemTypeEnum := mpINJECT_MOTION_SYS_MAPP; (*Type of the motion system used*)
		AxisReference : STRING[255]; (*String with axis  name*)
		AxisPreparation : MpInjectPlastAxisPreparationType; (*Settings for the axis preparation*)
	END_STRUCT;
	MpInjectPlastAxisPreparationType : 	STRUCT  (*Settings for the axis preparation*)
		Power : MpInjectPlastAxisPrepPowerType; (*Settings for powering the axis during preparation*)
		Home : MpInjectPlastAxisPrepHomeType; (*Settings for homing the axis during preparation*)
	END_STRUCT;
	MpInjectPlastAxisPrepPowerType : 	STRUCT  (*Power the axis during preparation*)
		Enable : BOOL := TRUE; (*Enable powering the axis during preparation*)
	END_STRUCT;
	MpInjectPlastAxisPrepHomeType : 	STRUCT  (*Home the axis during preparation*)
		Type : MpInjectAxisHomingTypeEnum := mpINJECT_HOME_DIRECT; (*Select type of homing during preparation*)
	END_STRUCT;
	MpInjectPlastEInputSignalsType : 	STRUCT  (*Inject input signals*)
		PrepareAxis : STRING[255]; (*String with name of process varialbe to power on the axis*)
	END_STRUCT;
	MpInjectPlastEVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s]*)
		Acceleration : REAL := 2000.0; (*Acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Deceleration [mm/s² ]*)
		EndDeceleration : REAL := 2000.0; (*End deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpInjectPlastEForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [Nm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [Nm]*)
		Acceleration : REAL := 5000.0; (*Force ramping up [Nm/s]*)
		Deceleration : REAL := 5000.0; (*Force ramping down [Nm/s]*)
	END_STRUCT;
	MpInjectPlastEOutputSignalsType : 	STRUCT  (*Inject input signals*)
		AxisReady : STRING[255]; (*String with name of process varialbe to get the axis ready status*)
	END_STRUCT;
	MpInjectPlastBasicEConfigType : 	STRUCT  (*Electric plastification configuration parameters*)
		MechanicalType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_ELECTRIC;
		MotionSystem : MpInjectPlastMotionSystemType; (*Electric injection settings*)
		InputSignals : MpInjectPlastEInputSignalsType; (*Input signals*)
		OutputSignals : MpInjectPlastEOutputSignalsType; (*Input signals*)
		MaxPosition : REAL := 100; (*Maximum position for plastification [mm]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InjectMechType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_ELECTRIC; (*Type of linked injection component *)
		Plastification : MpInjectEPlastificationType; (*Plastification configuration*)
		BackPressure : MpInjectBackPressureType; (*Back pressure configuration*)
	END_STRUCT;
	MpInjectEPlastificationType : 	STRUCT  (*Electric plastification settings*)
		VelocityProfileLimits : MpInjectPlastEVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectPlastEForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		ValveSettings : MpInjectBackPrsValveSetType; (*Valve settings and linearization*)
		BackPressureController : MpInjectControllerType; (*PID parameters for back pressure controller*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Hydraulic*)
(*Injection*)

TYPE
	MpInjectBasicHConfigType : 	STRUCT  (*Hydraulic injection settings*)
		MaxPosition : REAL := 100.0; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.01; (*Velocity filter time [s]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpInjectInputSignalsType; (*Input signals*)
		OutputSignals : MpInjectOutputSignalsType; (*Output signals*)
		Injection : MpInjectInjectionType; (*Hydraulic injection settings*)
		Decompression : MpInjectDecompressionType; (*Hydraulic decompression settings*)
		MechanicalType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_HYDRAULIC;
	END_STRUCT;
	MpInjectInputSignalsType : 	STRUCT  (*Inject input signals*)
		CurrentPosition : STRING[255]; (*Datapoint containing current position*)
		CurrentPressure : STRING[255]; (*Datapoint containing current pressure*)
		CavityPressure : STRING[255]; (*Datapoint containing cavity pressure*)
		SwitchoverSensor : STRING[255]; (*Datapoint containing switchover sensor state*)
		EnablePIDTracking : STRING[255]; (*Datapoint for PID tracking enable*)
		PIDTrackingValue : STRING[255]; (*Datapoint containing PID tracking value*)
	END_STRUCT;
	MpInjectOutputSignalsType : 	STRUCT  (*Inject output signals*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		InjectionValve : STRING[255]; (*Datapoint for the injection valve signal*)
		InjectionFastValve : STRING[255]; (*Datapoint for the injection fast valve signal*)
		DecompressionValve : STRING[255]; (*Datapoint for the decompression valve signal*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpInjectInjectionType : 	STRUCT  (*Hydraulic injection settings*)
		VelocityProfileLimits : MpInjectVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectInjectForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		ValveSettings : MpInjectValveSettingsType; (*Valve settings and linearization*)
		VelocityController : MpInjectControllerType; (*Velocity controller settings*)
		PressureController : MpInjectControllerType; (*Hold on pressure controller settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.01; (*Time tolerance for end detection [s]*)
		Delay : MpInjectDelayType; (*Hydraulic delay settings*)
		FastValve : MpInjectFastValveType; (*Regenerative valve settings*)
		HoldPrsIntegralPartLimitation : MpInjectIntegralPartLimitType; (*Integral part limitation for hold pressure settings*)
		InjVelIntegralPartLimitation : MpInjectIntegralPartLimitType; (*Integral part limitation for injection velocity settings*)
		ProfileGeneration : MpInjectProfileGenerationEnum := mpINJECT_POSITION_BASED; (*How the profile is generated*)
	END_STRUCT;
	MpInjectDecompressionType : 	STRUCT  (*Hydraulic decompression settings*)
		VelocityProfileLimits : MpInjectVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		ValveSettings : MpInjectValveSettingsType; (*Valve settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpInjectDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
END_TYPE

(*Plastification*)

TYPE
	MpInjectPlastificationType : 	STRUCT  (*Hydraulic plastification settings*)
		VelocityProfileLimits : MpInjectVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpInjectForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		ValveSettings : MpInjectBackPrsValveSetType; (*Valve settings and linearization*)
		BackPressureController : MpInjectControllerType; (*PID parameters for back pressure controller*)
		VelocityController : MpInjectControllerType; (*Rotation velocity controller settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		PulsesPerRevolution : UINT := 12; (*Number of pulses per revolution*)
		RotationMeasurementFilterTime : REAL := 0.5; (*Rotation measurement filter time [s]*)
		Delay : MpInjectDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpInjectBackPrsValveSetType : 	STRUCT  (*Valve settings*)
		ValveType : MpInjectValveTypeEnum := mpINJECT_VALVE_TYPE_PROP; (*Valve type for backpressure control*)
		ValveLinearization : MpInjectBackPressureLinType; (*Valve linearization data*)
	END_STRUCT;
	MpInjectFastValveType : 	STRUCT  (*Regenerative valve settings*)
		Enable : BOOL; (*Enable the usage of the regenerative valve*)
		MaxVelocity : REAL; (*Maximum injection velocity if regenerative valve is used [mm/s]*)
		MaxForce : REAL; (*Maximum injection force if regenerative valve is used [bar]*)
	END_STRUCT;
	MpInjectPlastBasicHConfigType : 	STRUCT  (*Hydraulic plastification configuration parameters*)
		MaxPosition : REAL := 100; (*Maximum position for plastification [mm]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		UseExternalVelocity : BOOL := FALSE; (*Use an external velocity signal*)
		InputSignals : MpInjectPlastInputSignalsType; (*Input signals*)
		OutputSignals : MpInjectPlastOutputSignalsType; (*Output signals*)
		Plastification : MpInjectPlastificationType; (*Plastification configuration*)
		BackPressure : MpInjectBackPressureType; (*Back pressure configuration*)
		MechanicalType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_HYDRAULIC;
		InjectMechType : MpInjectMechanicalTypeEnum := mpINJECT_MECH_TYPE_HYDRAULIC; (*Type of linked injection component *)
	END_STRUCT;
	MpInjectPlastInputSignalsType : 	STRUCT  (*Plastification input signals*)
		RotationPulse : STRING[255]; (*Datapoint containing rotation pulse sensor state*)
		RotationVelocity : STRING[255]; (*Datapoint containing external rotation velocity value*)
	END_STRUCT;
	MpInjectPlastOutputSignalsType : 	STRUCT  (*Plastification output signals*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		PlastificationValve : STRING[255]; (*Datapoint for the plastification valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpInjectValveSettingsType : 	STRUCT  (*Valve settings and linearization*)
		ValveType : MpInjectValveTypeEnum := mpINJECT_VALVE_TYPE_PROP; (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpInjectValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpInjectValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [50(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [50(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 1; (*Number of used nodes*)
	END_STRUCT;
	MpInjectBackPressureLinType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [0,32767,48(0)]; (*Valve signal (output) [%]*)
		BackPressureValues : ARRAY[0..49]OF REAL := [0,100,48(0.0)]; (*Back pressure values (input) [bar]*)
		NumberOfNodes : USINT := 2; (*Number of used nodes*)
	END_STRUCT;
	MpInjectControllerType : 	STRUCT  (*Controller type*)
		Mode : MpInjectControllerModeEnum := mpINJECT_CTRL_MODE_OPEN_LOOP; (*Control type*)
		Settings : MpInjectPIDType; (*PID parameters*)
	END_STRUCT;
	MpInjectEControllerType : 	STRUCT  (*Controller type*)
		Mode : MpInjectControllerModeEnum := mpINJECT_CTRL_MODE_CLOSED_LOOP; (*Control type*)
		Settings : MpInjectEPIDType; (*PID parameters*)
	END_STRUCT;
	MpInjectEPIDType : 	STRUCT  (*PID Parameters*)
		ProportionalGain : REAL := 2.0; (*Proportional gain [rpm/bar]*)
		IntegralTime : REAL := 0.0; (*Integral time [s]*)
		DerivativeTime : REAL := 0.0; (*Derivative time [s]*)
		DerivativeFilterTime : REAL := 0.0; (*Filter time for derivation part [s]*)
	END_STRUCT;
	MpInjectPIDType : 	STRUCT  (*PID Parameters*)
		OutputLimit : REAL := 100.0; (*Controller output limit [%]*)
		ProportionalGain : REAL := 1; (*Proportional gain [rpm/bar]*)
		IntegralTime : REAL := 0.0; (*Integral time [s]*)
		DerivativeTime : REAL := 0.0; (*Derivative time [s]*)
		DerivativeFilterTime : REAL := 0.0; (*Filter time for derivation part [s]*)
	END_STRUCT;
	MpInjectDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*Delay time to end the movement [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpInjectIntegralPartLimitType : 	STRUCT  (*Integral part limitation*)
		Enable : BOOL := FALSE; (*Enable the usage of integral part limitation*)
		MinIntegralOutput : REAL := -100; (*Minimum integral part output for limitation [%]*)
		MaxIntegralOutput : REAL := 100; (*Maximum integral part output for limitation [%]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(******************* Parameter structure ***************)
(**********************************************************)

TYPE
	MpInjectBasicParType : 	STRUCT  (*Injection and decompression parameters*)
		FastInjection : BOOL := FALSE; (*Enables the usage of the regenerative valve (not used in electric mode)*)
		InjectionProfile : MpInjectInjectionProfileType; (*Injection movement profile*)
		HoldOnPressureProfile : MpInjectHoldPrsProfileType; (*Hold on pressure profile*)
		DecompressionBefore : MpInjectDecompProfileType; (*Decompression before plastification movement profile*)
		DecompressionAfter : MpInjectDecompProfileType; (*Decompression after plastification movement profile*)
		SetupMode : MpInjectSetupModeType; (*Setup mode parameters*)
		Switchover : MpInjectSwitchOverType; (*Switchover settings*)
	END_STRUCT;
	MpInjectPlastBasicParType : 	STRUCT  (*Plastification parameters*)
		PlastificationProfile : MpInjectPlastProfileType; (*Plastification profile parameters*)
		SetupMode : MpInjectPlastSetupModeType; (*Setup mode parameters*)
	END_STRUCT;
	MpInjectInjectionProfileType : 	STRUCT  (*Injection movement profile*)
		Velocity : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set velocity for injection, profile steps [mm/s]*)
		Force : ARRAY[0..9]OF REAL := [20,9(0.0)]; (*Set force for injection, profile steps [bar]*)
		Position : ARRAY[0..9]OF REAL := [10,9(0.0)]; (*Set position for injection, target position for each step [mm]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100)]; (*Optional: Acceleration override for each profile step [1..100%]*)
		Time : ARRAY[0..9]OF REAL := [1.0,9(0.0)]; (*Movement time for each step [s]*)
	END_STRUCT;
	MpInjectHoldPrsProfileType : 	STRUCT  (*Hold on pressure profile*)
		Velocity : ARRAY[0..9]OF REAL := [10,9(0.0)]; (*Set velocity for hold on pressure, profile steps [mm/s]*)
		Pressure : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set pressure for hold on pressure, profile steps [bar]*)
		Time : ARRAY[0..9]OF REAL := [1.0,9(0.0)]; (*Time for hold on pressure step [s]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100)]; (*Optional: Pressure acceleration override for each profile step [1..100%]*)
	END_STRUCT;
	MpInjectDecompProfileType : 	STRUCT  (*Decompression movement profiles*)
		Velocity : REAL := 50; (*Set velocity for decompression [mm/s]*)
		Force : REAL := 20; (*Set force for decompression [bar]*)
		Position : REAL := 5; (*Set position for decompression [mm]*)
		AccelerationOverride : REAL := 100; (*Optional: Acceleration override for each profile step [1..100%]*)
	END_STRUCT;
	MpInjectPlastProfileType : 	STRUCT  (*Plastification movement profile*)
		Velocity : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set velocity for plastification, profile steps [rpm]*)
		Force : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set force for plastification, profile steps [bar / Nm]*)
		Position : ARRAY[0..9]OF REAL := [100,9(0.0)]; (*Target position for each plastification step [mm]*)
		BackPressure : ARRAY[0..9]OF REAL := [5,9(0.0)]; (*Back pressure for each plastification step [bar]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100)]; (*Optional: Pressure acceleration override for each profile step [1..100%]*)
	END_STRUCT;
	MpInjectSwitchOverType : 	STRUCT  (*Switchover settings*)
		EnableByPosition : BOOL := FALSE; (*Enable switchover by position*)
		Position : REAL := 20; (*Injection axis position where switchover should happen [mm]*)
		EnableByPressure : BOOL := FALSE; (*Enable switchover by pressure*)
		Pressure : REAL := 50; (*Injection pressure where switchover should happen [bar]*)
		EnableByTime : BOOL := FALSE; (*Enable switchover by time*)
		Time : REAL := 0.0; (*Time after start of injection when switchover should happen [s]*)
		EnableByCavityPressure : BOOL := FALSE; (*Enable switchover by cavity pressure*)
		CavityPressure : REAL := 50; (*Cavity pressure at which switchover should happen [bar]*)
		ReleasePosition : REAL := 50; (*Release position for pressure and cavity pressure switchover [mm]*)
		EnableByExternal : BOOL := FALSE; (*Enable switchover by external signal*)
	END_STRUCT;
	MpInjectSetupModeType : 	STRUCT  (*Setup mode parameters*)
		Injection : MpInjectSetupModeProfileType; (*Setup mode injection parameters*)
		Decompression : MpInjectSetupModeProfileType; (*Setup mode decompression parameters*)
	END_STRUCT;
	MpInjectSetupModeProfileType : 	STRUCT  (*Setup mode hydraulic profile parameters*)
		Velocity : REAL := 20; (*Setup mode velocity [mm/s]*)
		Force : REAL := 20; (*Setup mode force [bar]*)
	END_STRUCT;
	MpInjectPlastSetupModeType : 	STRUCT  (*Setup mode parameters*)
		Velocity : REAL := 50; (*Setup mode plastification velocity [rpm]*)
		Force : REAL := 50; (*Setup mode plastification force [bar / Nm]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*********************** Info structure ******************)
(**********************************************************)

TYPE
	MpInjectBasicInfoType : 	STRUCT  (*Core information structure*)
		Velocity : REAL; (*Current injection axis velocity [mm/s]*)
		MinPosition : REAL; (*Minimum position [mm]*)
		MaxPosition : REAL; (*Maximum position [mm]*)
		MaxVelocity : REAL; (*Maximum velocity [mm/s]*)
		MaxPressure : REAL; (*Maximum pressure [bar]*)
		StepInjection : USINT; (*Current profile step for injection*)
		StepHoldOn : USINT; (*Current profile step for hold on pressure*)
		StepDecompression : USINT; (*Current profile step for decompression (0 = before, 1 = after)*)
		SwitchOver : MpInjectSwitchOverInfoType; (*Switchover information*)
		State : MpInjectStateEnum; (*Injection state information*)
		PIDHoldPressure : MpInjectPIDInfoType; (*PID output information for hold pressure controller (not used in electric mode)*)
		PIDInjectVelocity : MpInjectPIDInfoType; (*PID output information for injection velocity controller (not used in electric mode)*)
		Diag : MpInjectDiagExtType; (*Diagnosis information*)
		Position : REAL; (*Current injection axis position [mm]*)
		Pressure : REAL; (*Current injection axis pressure [bar]*)
		InVelocityControl : BOOL; (*Pressure controller is controlling the axis in speed (not used in hydraulic mode)*)
		InPressureControl : BOOL; (*Pressure controller is controlling the axis in pressure (not used in hydraulic mode)*)
	END_STRUCT;
	MpInjectPlastBasicInfoType : 	STRUCT  (*Core information structure*)
		Velocity : REAL; (*Current plastification screw rotation velocity [rpm]*)
		MaxVelocity : REAL; (*Maximum velocity [rpm]*)
		StepPlastification : USINT; (*Current profile step for plastification*)
		State : MpInjectStateEnum; (*Plastification state information*)
		Diag : MpInjectDiagExtType; (*Diagnosis information*)
		Torque : REAL; (*Current plastification screw torque [Nm] (not used in hydraulic mode)*)
		InTorqueLimitation : BOOL; (*The torque limitation is active (not used in hydraulic mode)*)
	END_STRUCT;
	MpInjectSwitchOverInfoType : 	STRUCT  (*Switchover information*)
		Reason : MpInjectSwitchoverReasonEnum; (*Switchover reason*)
		Position : REAL; (*Position of last switchover [mm]*)
		Pressure : REAL; (*Pressure of last switchover [bar]*)
		CavityPressure : REAL; (*Cavity pressure of last switchover [bar]*)
		Time : REAL; (*Time of last switchover [s]*)
	END_STRUCT;
	MpInjectPIDInfoType : 	STRUCT  (*PID output information*)
		Out : REAL; (*Output value (manipulated variable)*)
		ProportionalPart : REAL; (*Proportional component*)
		IntegratorPart : REAL; (*Integral component*)
		DerivativePart : REAL; (*Derivative component*)
	END_STRUCT;
	MpInjectInfoType : 	STRUCT  (*Library information structure*)
		Diag : MpInjectDiagType;
	END_STRUCT;
	MpInjectDiagType : 	STRUCT 
		StatusID : MpInjectStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpInjectDiagExtType : 	STRUCT 
		StatusID : MpInjectStatusIDType; (*Segmented StatusID output*)
		ExecutingCommand : MpInjectExecutingCmdEnum; (*Currently executing command*)
	END_STRUCT;
	MpInjectStatusIDType : 	STRUCT 
		ID : MpInjectErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
