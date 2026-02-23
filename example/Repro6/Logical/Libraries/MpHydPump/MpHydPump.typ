(***************************************************** Generic *********************************************************)

TYPE
	MpHydPumpCtrlFeatureConfigType : 	STRUCT  (*MpHydPumpController feature configurations*)
		Type : MpHydPumpControllerFeatureEnum; (*Feature type*)
		HighPerformance : MpHydPumpHighPerfFeatureType; (*High performance feature parameters*)
		Autotuning : MpHydPumpAutotuningFeatureType; (*Autotuning feature parameters*)
		Protection : MpHydPumpProtectionFeatureType; (*Protection feature parameters*)
	END_STRUCT;
	MpHydPumpGrpFeatureConfigType : 	STRUCT  (*MpHydPumpGroup feature configurations*)
		Type : MpHydPumpGroupFeatureEnum; (*Feature type*)
		Autotuning : MpHydPumpGrpAutotuningFeatType; (*Autotuning feature parameters*)
	END_STRUCT;
	MpHydPumpStatusIDType : 	STRUCT  (*MpHydPump status ID information*)
		ID : MpHydPumpErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(*********************************************** Config of Controller ***************************************************)

TYPE
	MpHydPumpControllerConfigType : 	STRUCT  (*Controller configuration*)
		Simulation : MpHydPumpSimulationType; (*Simulation mode settings*)
		Pump : MpHydPumpPumpType; (*Pump type definition*)
		MovementLimits : MpHydPumpMoveLimitsConfigType; (*Limits of servo pump*)
		MotionSystem : MpHydPumpMotionSystemType; (*Type of the motion system*)
		Controller : MpHydPumpControllerType; (*Type of the axis controller*)
		Features : MpHydPumpControllerFeatureType; (*Linked features of MpHydPumpController*)
	END_STRUCT;
	MpHydPumpSimulationType : 	STRUCT  (*Simulation mode setting*)
		Type : MpHydPumpSimulationTypeEnum := mpHYDPUMP_SIMULATION_NOT_USED; (*Type of simulation mode*)
		MaximumSimulationPressure : REAL := 250; (*Maximum limit of simulated pressure. Unit:[bar]*)
		DeadVolume : REAL := 1.0; (*Dead volume in the hydraulic pump and pipes to the valve. Unit:[l]*)
		PumpLeakage : REAL := 0.01; (*Pump leakage coefficient. Unit:[l/min/bar]*)
	END_STRUCT;
	MpHydPumpPumpType : 	STRUCT  (*Pump type definition*)
		Type : MpHydPumpPumpTypeEnum := mpHYDPUMP_PUMP_USER_DEFINED; (*Pump type*)
		DisplacementVolume : REAL := 25.3; (*Displacement volume of the pump. Unit:[ccm]*)
		VolumetricEfficiency : REAL := 95.0; (*Volumetric efficiency of the pump. Unit: [%]*)
		InvertDirectionOfRotation : BOOL := FALSE; (*Pump speed direction is inversed*)
		ReverseTurnProtection : MpHydPumpReverseTurnProtectType; (*Protection against reverse rotation*)
		PumpModelDorninger : MpHydPumpDorningerPumpTypeEnum := mpHYDPUMP_DORNINGER_DHPH2_008;
		LowSpeedProtection : MpHydPumpLowSpeedProtectType; (*Protection against too long rotating with low speed and high pressure*)
	END_STRUCT;
	MpHydPumpReverseTurnProtectType : 	STRUCT  (*Protection against reverse rotation*)
		Type : MpHydPumpUsedEnum := mpHYDPUMP_NOT_USED; (*Reverse turn protection type*)
		MaxReverseTurnTime : REAL := 3.0; (*Maximum allowed time for reverse rotation*)
	END_STRUCT;
	MpHydPumpLowSpeedProtectType : 	STRUCT  (*Protection against low pump speed over a long period of time*)
		Type : MpHydPumpUsedEnum := mpHYDPUMP_NOT_USED; (*Enable low speed protection*)
		LowSpeedLimit : REAL := 150.0; (*Below this speed and above the "PressureLimit" the timer for low speed protection is triggered*)
		PressureLimit : REAL := 15.0; (*Above this pressure and below the "LowSpeedLimit" the timer for low speed protection is triggered*)
		MaximumLowSpeedTime : REAL := 30.0; (*Maximum allowed time for low speed of the pump*)
	END_STRUCT;
	MpHydPumpMoveLimitsConfigType : 	STRUCT  (*Limits of servo pump*)
		Speed : REAL := 1800.0; (*Maximum speed of the motor / pump combination. Unit: [rpm]*)
		Acceleration : REAL := 60000.0; (*Maximum acceleration of the motor / pump combination. Unit: [rpm/s]*)
		Deceleration : REAL := 1000000.0; (*Maximum deceleration of the motor / pump combination. Unit: [rpm/s]*)
		ReversePumpSpeed : REAL := 2000.0; (*Maximum pump speed in reverse direction*)
	END_STRUCT;
	MpHydPumpMotionSystemType : 	STRUCT  (*Pump type definition*)
		Type : MpHydPumpMotionSystemTypeEnum := mpHYDPUMP_MOTION_SYS_MAPP; (*Type of the motion system*)
		AxisReference : STRING[255]; (*String with axis  name*)
		InputSignals : MpHydPumpMotionSystemInputType; (*Input signals depending on motion system type*)
		OutputSignals : MpHydPumpMotionSystemOutputType; (*Output signals depending on motion system type*)
	END_STRUCT;
	MpHydPumpMotionSystemInputType : 	STRUCT  (*Input signals of an user defined motion system.*)
		PowerOn : STRING[255]; (*String with name of process variable of power on. This is the feedback information of the user defined motion system whether the drive is switched on.*)
		ActualAxisSpeed : STRING[255]; (*String with name of process variable of actual axis speed. This is the actual speed of the axis of the user defined motion system. Unit: [rpm].*)
	END_STRUCT;
	MpHydPumpMotionSystemOutputType : 	STRUCT  (*Output signals of an user defined motion system.*)
		Power : STRING[255]; (*String with name of process variable of power.This is a command to turn on the drive of the user defined motion system.*)
		SetAxisSpeed : STRING[255]; (*String with name of process variable of set axis speed. This is the set speed for the axis of the user defined motion system. Unit: [rpm].*)
	END_STRUCT;
	MpHydPumpControllerType : 	STRUCT  (*Pressure control parameters*)
		Type : MpHydPumpControllerTypeEnum := mpHYDPUMP_PRESSURE_SPEED_CONTROL; (*Type of the axis controller*)
		InputSignals : MpHydPumpContInputSignalsType; (*Input signals depending on controller type*)
		PressureSensorSignal : MpHydPumpPressureSensorType; (*Pressure sensor settings*)
		PressureFilterTime : REAL := 0.004; (*Filter time for the pressure signal. Unit:[s]*)
		SetValueLimits : MpHydPumpSetValueLimitsType; (*Set value limits*)
		ControllerParameterSets : ARRAY[0..9]OF MpHydPumpParameterSetType; (*Pressure controller paramter set*)
		MinimumPressureController : MpHydPumpMinPressureCtrlType; (*Minium pressure controller settings*)
	END_STRUCT;
	MpHydPumpContInputSignalsType : 	STRUCT  (*Input signals depending on controller type*)
		SetSpeed : STRING[255]; (*String with name of process varialbe of set speed. Unit: [rpm]*)
		SetPressure : STRING[255]; (*String with name of process varialbe of set pressure. Unit: [bar]*)
		PressureControllerParameterSet : STRING[255]; (*String with name of process varialbe of pressure controller parameter set*)
		OnlySpeedControl : STRING[255]; (*String with name of process varialbe of to deactivate the pressure controller and use only speed control*)
		SetFlow : STRING[255]; (*String with name of process variable of set flow. Unit: [lpm]*)
		OnlyFlowControl : STRING[255]; (*String with name of process variable to deactivate the pressure controller and use only flow control*)
		ActivateAccelerationMode : STRING[255]; (*String with name of process variable to activate the defined acceleration mode of the current pressure controller*)
	END_STRUCT;
	MpHydPumpPressureSensorType : 	STRUCT  (*Pressure sensor settings*)
		Type : MpHydPumpPressureSensorTypeEnum := mpHYDPUMP_READ_FROM_DRIVE; (*Type of pressure sensor source*)
		ActualPressure : STRING[255]; (*String with name of process varialbe with the actual pressure as integer value comming from the pressure sensor.*)
		Scaling : MpHydPumpSensorScalingType; (*Input signals depending on controller type*)
		DeviceName : STRING[32]; (*Device name of the I/O module holding the pressure sensor data. e.g. "IF3.ST2.IF1.ST2"*)
		ChannelName : STRING[32]; (*Channel name of the I/O module used for the pressure sensor data. e.g. "AnalogInput01"*)
	END_STRUCT;
	MpHydPumpSensorScalingType : 	STRUCT  (*Pressure sensor scaling*)
		MinimumSignalValue : INT := 0; (*Minimum pressure sensor signal (digits)*)
		MaximumSignalValue : INT := 32767; (*Maximum pressure sensor signal (digits)*)
		MinimumPressure : REAL := 0.0; (*Minimum pressure measured by sensor. Unit:[bar]*)
		MaximumPressure : REAL := 250.0; (*Maximum pressure measured by sensor. Unit:[bar]*)
	END_STRUCT;
	MpHydPumpSetValueLimitsType : 	STRUCT  (*Set value limits*)
		MaximumSetPressure : REAL := 250.0; (*Maximum set pressure allowed in the system. Unit:[bar]*)
		NegativeSetSpeedAllowed : BOOL := FALSE; (*Negative set value for pump speed is allowed*)
		NegativeSetFlowAllowed : BOOL := FALSE; (*Negative set value for pump flow is allowed*)
		SetPressurePrefilterTimeUp : REAL := 0.0; (*Filter time for set presssure jump in positive direction. Unit:[s]*)
		SetPressurePrefilterTimeDown : REAL := 0.0; (*Filter time for set presssure jump in negative direction. Unit:[s]*)
	END_STRUCT;
	MpHydPumpParameterSetType : 	STRUCT  (*Pressure controller settings*)
		ProportionalGain : REAL := 10.0; (*Proportional gain.*)
		IntegrationTime : REAL := 0.1; (*Integral time constant for the integral component. Unit: [s].*)
		DerivativeTime : REAL := 0.0; (*Differential time constant for the derivative component. Unit: [s].*)
		FilterTime : REAL := 0.0; (*Filter time constant for the derivative component. Unit: [s].*)
		CompensationFilter : MpHydPumpCompensationFilterType; (*Settings for compensation filter*)
		NegativeIntegratorLimit : REAL := 0.0; (*Integration part limitation in reverse direction. Unit [rpm].*)
		AccelerationMode : MpHydPumpAccelerationModeType; (*Acceleration mode settings*)
	END_STRUCT;
	MpHydPumpCompensationFilterType : 	STRUCT  (*Compensation filter settings*)
		Type : MpHydPumpCompensationFilterEnum := mpHYDPUMP_COMP_FILTER_NOT_USED; (*Type of compensation filter*)
		CenterFrequencyNumerator : REAL := 0.0; (*Center frequency of the numerator. Unit:[Hz]*)
		DampingRatioNumerator : REAL := 0.0; (*Damping ratio of the numerator*)
		CenterFrequencyDenominator : REAL := 0.0; (*Center frequency of the denominator. Unit:[Hz]*)
		DampingRatioDenominator : REAL := 0.0; (*Damping ratio of the denominator*)
	END_STRUCT;
	MpHydPumpAccelerationModeType : 	STRUCT  (*Acceleration mode settings*)
		Type : MpHydPumpUsedEnum := mpHYDPUMP_NOT_USED; (*Type of acceleration mode*)
		DeactivationWindow : REAL := 0.0; (*Pressure distance to the set pressure for deactivating the acceleration mode. Unit:[bar]*)
	END_STRUCT;
	MpHydPumpMinPressureCtrlType : 	STRUCT  (*Minium pressure controller settings*)
		Type : MpHydPumpMinPressureCtrlTypeEnum := mpHYDPUMP_MIN_PRESSURE_NOT_USED; (*Enable/Disable minimum pressure controller*)
		SetMinimumPressure : REAL := 10.0; (*Set pressure for minimum pressure controller. Unit:[bar]*)
		ProportionalGain : REAL := 10.0; (*Proportional gain for minimum pressure controller*)
		IntegrationTime : REAL := 0.1; (*Integral action time for minimum pressure controller. Unit:[s]*)
	END_STRUCT;
	MpHydPumpControllerFeatureType : 	STRUCT  (*Linked features of MpHydPumpController*)
		FeatureReference1 : STRING[32]; (*Feature reference 1*)
		FeatureReference2 : STRING[32]; (*Feature reference 2*)
		FeatureReference3 : STRING[32]; (*Feature reference 3*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(*********************************************** Config of Pump group ***************************************************)

TYPE
	MpHydPumpGroupConfigType : 	STRUCT  (*Pump group configuration*)
		Simulation : MpHydPumpGroupSimulationType; (*Simulation mode settings*)
		MasterPump : STRING[32]; (*String with name (mapp Link) of master pump.*)
		NumberOfModes : UINT; (*Number of configured group modes.*)
		Modes : {REDUND_UNREPLICABLE} UDINT; (*List of configured group modes. The size of the array is not permitted to be less than the size defined via "NumberOfModes".*)
		InputSignals : MpHydPumpGroupInputSignalsType; (*Input signals of pump group.*)
		Features : MpHydPumpGroupFeatureType; (*Linked features of MpHydPumpGroup*)
	END_STRUCT;
	MpHydPumpGroupSimulationType : 	STRUCT  (*Simulation mode settings for pump group*)
		Type : MpHydPumpSimulationTypeEnum := mpHYDPUMP_SIMULATION_NOT_USED; (*Type of simulation mode*)
		MaximumSimulationPressure : REAL := 250.0; (*Maximum limit of simulated pressure. Unit:[bar]*)
	END_STRUCT;
	MpHydPumpGroupModeType : 	STRUCT  (*Parameters for pump group mode.*)
		Name : STRING[32]; (*String with name of mode.*)
		DelayTime : REAL := 0.0; (*Defines the moment of changing the controller type, the parameter set and the used pumps in relation to the moment of switching to this mode*)
		Controller : MpHydPumpGroupModeControllerType; (*Controller settings for certain pump group mode.*)
		NumberOfUsedPumps : UINT; (*Number of configured used pumps.*)
		UsedPumps : {REDUND_UNREPLICABLE} UDINT; (*List of configured used pumps. The size of the array is not permitted to be less than the size defined via "NumberOfUsedPumps".*)
		NumberOfUsedValves : UINT; (*Number of configured used valves.*)
		UsedValves : {REDUND_UNREPLICABLE} UDINT; (*List of configured used pumps. The size of the array is not permitted to be less than the size defined via "NumberOfUsedValves".*)
		SimulationParameters : MpHydPumpGroupModeSimParType; (*Simulation parameters for a certain mode.*)
	END_STRUCT;
	MpHydPumpGroupUsedPumpType : 	STRUCT  (*Parameters for a certain used pump of a certain pump group mode.*)
		PumpReference : STRING[32]; (*String with name (mapp Link) of used pump.*)
		Usage : REAL := 100.0; (*Limits the pump's volume flow by this percentage. This can be adjusted to reduce the usage of this pump in the group.*)
	END_STRUCT;
	MpHydPumpGroupModeControllerType : 	STRUCT  (*Controller settings for certain pump group mode.*)
		Type : MpHydPumpGroupControllerTypeEnum := mpHYDPUMP_GROUP_PRESSURE_FLOW; (*Type of simulation mode*)
		ControllerParameterSet : USINT := 0; (*Controller parameter set of pressure controller used in this mode. The available parameter sets can be found in the configuration of the master pump.*)
	END_STRUCT;
	MpHydPumpGroupUsedValveType : 	STRUCT  (*Parameters for a certain used valve of a certain pump group mode.*)
		ValveReference : STRING[32]; (*String with name (mapp Link) of used valve.*)
		Actuation : MpHydPumpGroupValveActuationEnum; (*Defines the position of the valve, i.e. in the case of a switching valve which coils are energized.*)
		DelayTime : REAL := 0.0; (*Defines the switching moment of this valve in relation to the moment of switching to this mode.*)
	END_STRUCT;
	MpHydPumpGroupModeSimParType : 	STRUCT  (*Simulation parameters for this mode.*)
		OilVolume : REAL := 1.0; (*Oil volume in the pipes and hoses of the a certain pump group mode.*)
		Leakage : REAL := 0.01; (*Leakage coefficient of the a certain pump group mode.*)
	END_STRUCT;
	MpHydPumpGroupInputSignalsType : 	STRUCT  (*Input signals of pump group.*)
		SetFlow : STRING[255]; (*String with name of process variable of group set flow. Unit: [lpm]*)
		SetPressure : STRING[255]; (*String with name of process varialbe of group set pressure. Unit: [bar]*)
		Mode : STRING[255]; (*String with name of process varialbe for selecting the active group mode.*)
		ActivateAccelerationMode : STRING[255]; (*String with name of process variable to activate the defined acceleration mode of the master pump.*)
	END_STRUCT;
	MpHydPumpGroupFeatureType : 	STRUCT 
		FeatureReference1 : STRING[32]; (*Feature reference 1*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(******************************************* Config of High Performance**********************************************)

TYPE
	MpHydPumpHighPerfFeatureType : 	STRUCT  (*High performance feature parameters*)
		DriveType : MpHydPumpHighPerfDriveTypeType; (*Type of the drive*)
	END_STRUCT;
	MpHydPumpHighPerfDriveTypeType : 	STRUCT  (*Type of the drive*)
		Type : MpHydPumpDriveTypeEnum; (*Drive type*)
		PressureSensorSource : MpHydPumpPressureSourceType; (*Source of the pressure sensor*)
	END_STRUCT;
	MpHydPumpPressureSourceType : 	STRUCT  (*Source of the pressure sensor*)
		Type : MpHydPumpPressureSourceEnum; (*Type of pressure sensor source*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(********************************************** Config of Autotuning ***************************************************)

TYPE
	MpHydPumpAutotuningFeatureType : 	STRUCT  (*Autotuning feature parameters*)
		PressureTuning : MpHydPumpPressureTuneFeatureType; (*Pressure tuning settings*)
	END_STRUCT;
	MpHydPumpPressureTuneFeatureType : 	STRUCT  (*Pressure tuning settings*)
		OperationPointSpeed : REAL := 50.0; (*Operation point speed. Unit:[rpm]. Permissible range of values: 0.0 < OperationPointSpeed <= MovementLimits.Speed.*)
		ExcitationSpeedSignal : MpHydPumpExcitationSignalType; (*Excitation signal settings*)
		TestSignal : ARRAY[0..4]OF MpHydPumpTestSignalType; (*Test signal settings*)
	END_STRUCT;
	MpHydPumpExcitationSignalType : 	STRUCT  (*Excitation signal settings*)
		StepHeight : REAL := 50.0; (*Height of speed step for identification phase with step. Unit: [rpm]. Permissible range of values: 0.0 < StepHeight <= MaxPumpSpeed - OperationPointSpeed.*)
		StepDuration : REAL := 3.0; (*Duration of step identificationUnit: [s]. Permitted range of values: 0.02 < StepDuration =< 50.0.*)
		WaitingTime : REAL := 0.0; (*Waiting time after step identification. Unit: [s]. Permitted range of values: 0.0 < WaitingTime =< 50.0.*)
		OscillationAmplitude : REAL := 200.0; (*Amplitude of speed oscillation for identification with oscillation signal. Unit: [rpm]. Permissible range of values: 0.0 < OscillationAmplitude <= MaxPumpSpeed - OperationPointSpeed.*)
		OscillationDuration : REAL := 2.0; (*Duration of oscillation identification. Unit: [s]. Permitted range of values: 0.0032 < OscillationDuration <= 4.0.*)
	END_STRUCT;
	MpHydPumpTestSignalType : 	STRUCT  (*Test signal settings*)
		SetSpeed : REAL; (*Set speed of test signal sequence. Unit:[rpm]*)
		SetPressure : REAL; (*Set pressure of test signal sequence. Unit:[bar]*)
		Duration : REAL; (*Duration time of test signal sequence. Unit:[s]*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(******************************************* Parameters of Autotuning ************************************************)

TYPE
	MpHydPumpAutotuningParType : 	STRUCT  (*Auto tuning parameters*)
		PressureController : MpHydPumpPressureTuningType; (*Parameters for pressure controller tuning*)
	END_STRUCT;
	MpHydPumpPressureTuningType : 	STRUCT  (*Parameters for pressure controller tuning*)
		ControllerDesign : MpHydPumpControllerDesignType; (*Design of the resulting controller*)
	END_STRUCT;
	MpHydPumpControllerDesignType : 	STRUCT  (*Design of the resulting controller*)
		ControllerType : MpHydPumpAutotuningCtrlTypeEnum := mpHYDPUMP_PI_CONTROLLER; (*Controller type used for loop shaping*)
		RiseTime : REAL := 0.05; (*Desired rise time of the pressure controller. Valid value range:0.0016s=<RiseTime<= 1.0s*)
		OvershootReduction : REAL := 25.0; (*Factor to reduce the overshoot. Unit: [%] Valid value range: 0% - 100%. Only valid for ControllerType = mpHYDPUMP_PID_CONTROLLER.*)
		OscillationReduction : REAL := 50.0; (*Factor to compensate oscillation. Unit: [%] Valid value range: 0% - 100%. Only valid for ControllerType = mpHYDPUMP_PID_CONTROLLER.*)
		UseCompensationFilter : BOOL := FALSE; (*ONLY FOR ACOPOS DRIVE! Auto tuning of compensation filter*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(********************************************** Config of Protection ***************************************************)

TYPE
	MpHydPumpProtectionFeatureType : 	STRUCT  (*Protection feature parameters*)
		DriveType : MpHydPumpProtectionDriveTypeType; (*Type of the drive*)
		DriveShutdownProtection : MpHydPumpDriveShutdownProtType; (*Protection against drive shutdown*)
		ThermalPumpProtection : MpHydPumpThermalPumpProtType; (*Thermal pump protection against pump overheating*)
	END_STRUCT;
	MpHydPumpProtectionDriveTypeType : 	STRUCT  (*Drive type parameters*)
		Type : MpHydPumpDriveTypeEnum; (*Drive type*)
	END_STRUCT;
	MpHydPumpDriveShutdownProtType : 	STRUCT  (*Parameters for protection against drive shutdown*)
		Type : MpHydPumpUsedEnum := mpHYDPUMP_NOT_USED; (*Enable drive shutdown protection*)
		LimitationCurve : MpHydPumpLimitationCurveType; (*Limitation curve*)
	END_STRUCT;
	MpHydPumpLimitationCurveType : 	STRUCT  (*Limitation curve parameters*)
		StartingPoints : MpHydPumpDriveStartingPointsType; (*Starting points for the limitation*)
		DriveLimitationSettings : MpHydPumpDriveLimitSettingsType; (*Drive limitation settings*)
		JunctionLimitationSettings : MpHydPumpJunctionLimitType; (*Extended settings for drive shutdown if the junction temperature is a problem*)
	END_STRUCT;
	MpHydPumpDriveStartingPointsType : 	STRUCT  (*Drive limitation settings*)
		LoadTorqueLimitation : REAL := 90.0; (*Torque limitation starts, if the load in percent is higher than this limit*)
		LoadSpeedLimitation : REAL := 90.0; (*Speed limitation starts, if the load in percent is higher than this limit*)
	END_STRUCT;
	MpHydPumpDriveLimitSettingsType : 	STRUCT  (*Drive limitation settings*)
		Type : MpHydPumpDriveLimitEnum := mpHYDPUMP_LIMITS_READ_FROM_DRIVE; (*Source of the drive limitation settings (user or  read from drive)*)
		NominalTorque : REAL := 0.0; (*Torque, which permit operation at 100% load (Only for Type = mpHYDPUMP_LIMITS_USER_DEFINED)*)
		MaximumTorque : REAL := 0.0; (*Maximum torque limit (Only for Type = mpHYDPUMP_LIMITS_USER_DEFINED)*)
		NominalSpeed : REAL := 0.0; (*Speed, which permit operation at 100% load (Only for Type = mpHYDPUMP_LIMITS_USER_DEFINED)*)
		MaximumSpeed : REAL := 0.0; (*Maximum speed limit (Only for Type = mpHYDPUMP_LIMITS_USER_DEFINED)*)
		AmbientTemperature : REAL := 40.0; (*Ambient temperature*)
	END_STRUCT;
	MpHydPumpJunctionLimitType : 	STRUCT  (*Junction limitation settings*)
		LoadTorqueLimitation : REAL := 100.0; (*Junction load starting point of the torque limitation*)
		NominalTorque : REAL := 0.0; (*Nominal torque for junction temperature*)
	END_STRUCT;
	MpHydPumpThermalPumpProtType : 	STRUCT  (*Parameters for the thermal pump protection*)
		Type : MpHydPumpUsedEnum := mpHYDPUMP_NOT_USED; (*Enable thermal pump protection*)
		StartingPoints : MpHydPumpPumpStartingPointsType; (*Starting points for the limitation*)
	END_STRUCT;
	MpHydPumpPumpStartingPointsType : 	STRUCT  (*Starting points for the limitation*)
		PumpLoadTorqueLimitation : REAL := 90.0; (*Torque limitation starts, if the PUMP load in percent is higher than this limit*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(********************************************** Config of Group Autotuning ************************************************)

TYPE
	MpHydPumpGrpAutotuningFeatType : 	STRUCT  (*Pump group autotuning feature parameters*)
		PressureTuning : MpHydPumpGrpPressureTuneFeatType; (*Pressure tuning settings*)
	END_STRUCT;
	MpHydPumpGrpPressureTuneFeatType : 	STRUCT  (*Pump group pressure tuning settings*)
		OperationPointFlow : REAL := 0.3; (*Operation point flow. Unit:[lpm]. Permissible range of values: 0.0 < OperationPointFlow <= 100000.*)
		ExcitationFlowSignal : MpHydPumpGrpExcitationSignalType; (*Excitation signal settings*)
		TestSignal : ARRAY[0..4]OF MpHydPumpGrpTestSignalType; (*Test signal settings*)
	END_STRUCT;
	MpHydPumpGrpExcitationSignalType : 	STRUCT  (*Pump group excitation signal settings*)
		StepHeight : REAL := 0.3; (*Height of flow step for identification phase with step. Unit: [lpm]. Permissible range of values: 0.0 < StepHeight <= 100000.*)
		StepDuration : REAL := 3.0; (*Duration of step identificationUnit: [s]. Permitted range of values: 0.02 < StepDuration <= 50.0.*)
		WaitingTime : REAL := 0.0; (*Waiting time after step identification. Unit: [s]. Permitted range of values: 0.0 < WaitingTime <= 50.0.*)
		OscillationAmplitude : REAL := 1.0; (*Amplitude of flow oscillation for identification with oscillation signal. Unit: [lpm]. Permissible range of values: 0.0 < OscillationAmplitude <= 100000.*)
		OscillationDuration : REAL := 2.0; (*Duration of oscillation identification. Unit: [s]. Permitted range of values: 0.0032 < OscillationDuration <= 4.0.*)
	END_STRUCT;
	MpHydPumpGrpTestSignalType : 	STRUCT  (*Pump group test signal settings*)
		SetFlow : REAL; (*Set flow of test signal sequence. Unit:[lpm]*)
		SetPressure : REAL; (*Set pressure of test signal sequence. Unit:[bar]*)
		Duration : REAL; (*Duration time of test signal sequence. Unit:[s]*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of Controller *****************************************************)

TYPE
	MpHydPumpControllerInfoType : 	STRUCT  (*Controller information*)
		Control : MpHydPumpControlInfoType; (*Control information of pressure controller*)
		System : MpHydPumpSystemInfoType; (*System information*)
		Simulation : BOOL; (*Integrated simulation is active.*)
		Diag : MpHydPumpDiagType; (*Diagnostic structure for the function block*)
		Protection : MpHydPumpProtectionInfoType;
	END_STRUCT;
	MpHydPumpControlInfoType : 	STRUCT  (*Controller information*)
		InPressureControl : BOOL; (*Function block is currently in pressure control*)
		InMinimumPressureControl : BOOL; (*Function block is currently in minimum pressure control*)
		InSpeedControl : BOOL; (*Function block is currently in speed control*)
		CompensationFilterActive : BOOL; (*Compensation-filter active/inactive*)
		SpeedController : MpHydPumpSpeedControllerInfoType; (*Information of speed controller*)
		ReverseTurnProtectionActive : BOOL; (*Reverse turn protection active/inactive*)
		InExternalControl : BOOL; (*Controller is currently used in an external component*)
		AccelerationMode : MpHydPumpAccModeInfoType; (*Information of acceleration mode*)
		LowSpeedProtectionActive : BOOL; (*Low speed protection active/inactive*)
		SetValues : MpHydPumpSetValuesInfoType; (*Setpoints of the control*)
		ExternalSource : STRING[32]; (*Name of the MpLink of the parent which is using this controller at the moment (for "InExternalControl" = TRUE).*)
	END_STRUCT;
	MpHydPumpSetValuesInfoType : 	STRUCT  (*Setpoints of the control*)
		Speed : REAL; (*speed setpoint. Unit: [rpm]*)
		Pressure : REAL; (*Pressure setpoint. Unit: [bar]*)
		VolumeFlow : REAL; (*Volumetric flow rate setpoint. Unit: [l/min]*)
		DriveSpeed : REAL; (*Total set speed for speed controller = set speed + additive actuation. Unit: [rpm]*)
		AdditiveActuationValue : REAL; (*Additive actuation value relative to the configured maximum pump speed. Unit: [%]*)
	END_STRUCT;
	MpHydPumpSpeedControllerInfoType : 	STRUCT  (*Information of speed controller*)
		ProportionalGain : REAL; (*Gain for speed controller*)
		IntegrationTime : REAL; (*Integration time for speed controller. Unit: [s].*)
		FilterTime : REAL; (*Filter time for speed controller. Unit:[s]*)
	END_STRUCT;
	MpHydPumpAccModeInfoType : 	STRUCT  (*Information of acceleration mode*)
		Active : BOOL; (*Acceleration of the acceleration mode is currently active*)
		Done : BOOL; (*Acceleration of the acceleration mode is done*)
	END_STRUCT;
	MpHydPumpSystemInfoType : 	STRUCT  (*Power information*)
		Speed : REAL; (*Actual pump speed in rpm*)
		Pressure : REAL; (*Actual pump pressure in bar*)
		VolumeFlow : REAL; (*Actual calculated volume flow in l/min*)
		ElectricPower : REAL; (*Actual measured electrical power in kW*)
		MechanicPower : REAL; (*Actual measured mechanical power in kW*)
		HydraulicPower : REAL; (*Actual hydraulic power in kW*)
	END_STRUCT;
	MpHydPumpDiagType : 	STRUCT  (*MpHydPump diagnosis information*)
		StatusID : MpHydPumpStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpHydPumpProtectionInfoType : 	STRUCT  (*Protection information*)
		TorqueLimit : REAL; (*Actual torque limit*)
		SpeedLimit : REAL; (*Actual speed limit*)
		Drive : MpHydPumpProtectionDriveInfoType; (*Information of the drive limitation.*)
		Pump : MpHydPumpProtectionPumpInfoType; (*Information of the pump protection.*)
	END_STRUCT;
	MpHydPumpProtectionDriveInfoType : 	STRUCT  (*Information of the drive limitation.*)
		Active : BOOL; (*Drive shutdown protection is active*)
		InProtection : BOOL; (*The drive is in protection.*)
		Load : REAL; (*Actual drive load in percent*)
		Cause : MpHydPumpMaxLoadEnum; (*Cause of the maximum drive load.*)
	END_STRUCT;
	MpHydPumpProtectionPumpInfoType : 	STRUCT  (*Information of the pump protection.*)
		Active : BOOL; (*Thermal pump protection is active*)
		InProtection : BOOL; (*The drive is in protection due to the thermal pump load.*)
		Load : REAL; (*Actual pump load in percent.*)
		FlushingRequired : BOOL; (*Signals if flushing is required.*)
		FlushingSpeed : REAL; (*Pump speed which is necessary in order to decrease the pump load as fast as possible.*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of Autotuning ****************************************************)

TYPE
	MpHydPumpAutotuningInfoType : 	STRUCT  (*Tuning information*)
		PressureController : MpHydPumpPressureTuningInfoType; (*Information of pressure controller autotuning*)
		System : MpHydPumpTuningSystemInfoType; (*Parameters of identified system*)
		Diag : MpHydPumpDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
	MpHydPumpPressureTuningInfoType : 	STRUCT  (*Information of autotuning of pressure controller*)
		Parameters : MpHydPumpTuningControlInfoType; (*Tuned parameters*)
		ParameterSet : USINT; (*Tuned parameter set of pressure controller*)
		TuningState : MpHydPumpTuningStateEnum; (*Tuning state*)
	END_STRUCT;
	MpHydPumpTuningControlInfoType : 	STRUCT  (*Tuned parameters*)
		PIDParameters : MpHydPumpPIDParametersType; (*Tuned controller parameters*)
		CompensationFilter : MpHydPumpCompensationFilterType; (*Tuned compensation-filter parameters*)
		FilterRecommended : BOOL; (*Shows, if compensation filter should be used.*)
	END_STRUCT;
	MpHydPumpPIDParametersType : 	STRUCT  (*Pressure controller settings*)
		ProportionalGain : REAL; (*Proportional gain.*)
		IntegrationTime : REAL; (*Integral time constant for the integral component. Unit: [s].*)
		DerivativeTime : REAL; (*Differential time constant for the derivative component. Unit: [s].*)
		FilterTime : REAL; (*Filter time constant for the derivative component. Unit: [s].*)
	END_STRUCT;
	MpHydPumpTuningSystemInfoType : 	STRUCT  (*Parameters of identified system*)
		DeadVolume : REAL; (*Dead volume. Unit: [l]*)
		PumpLeakage : REAL; (*Pump leakage. Unit: [l/min/bar]*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of Config-FUB ***************************************************)

TYPE
	MpHydPumpInfoType : 	STRUCT  (*MpHydPump info structure*)
		Diag : MpHydPumpDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of Group *****************************************************)

TYPE
	MpHydPumpGroupInfoType : 	STRUCT  (*Group information*)
		Control : MpHydPumpGroupControlInfoType; (*Control information of pressure controller of the group*)
		System : MpHydPumpGroupSystemInfoType; (*System information*)
		Simulation : BOOL; (*Integrated simulation is active.*)
		Diag : MpHydPumpDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
	MpHydPumpGroupControlInfoType : 	STRUCT  (*Controller information*)
		InPressureControl : BOOL; (*Function block is currently in pressure control*)
		InFlowControl : BOOL; (*Function block is currently in flow control*)
		CompensationFilterActive : BOOL; (*Compensation-filter active/inactive*)
		AccelerationMode : MpHydPumpAccModeInfoType; (*Information of acceleration mode*)
	END_STRUCT;
	MpHydPumpGroupSystemInfoType : 	STRUCT  (*Power information*)
		Pressure : REAL; (*Actual pressure of the group in bar*)
		VolumeFlow : REAL; (*Actual calculated volume flow of the group in l/min*)
		ElectricPower : REAL; (*Actual measured electrical power of the group in kW*)
		MechanicPower : REAL; (*Actual measured mechanical power of the group in kW*)
		HydraulicPower : REAL; (*Actual hydraulic power of the group in kW*)
		NumberOfUsedPumps : UINT; (*Number of pumps which are currently used in the group*)
		MaximumVolumeFlow : REAL; (*Maximum possible volume flow with the pumps used in this mode*)
		GroupMode : STRING[32]; (*Current active group mode*)
		GroupModeIndex : UINT; (*Index of the selected group mode.*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(*************************************************** Enumerations ******************************************************)

TYPE
	MpHydPumpPressureSourceEnum : 
		( (*Source of the pressure sensor*)
		mpHYDPUMP_ANALOG_INPUT_NOT_USED := 0, (*Pressure sonsor is not read on the analog inputs of the drive. The external source has to be used.*)
		mpHYDPUMP_ANALOG_INPUT_1 := 1, (*Pressure sonsor source is configured on analog input 1 of drive*)
		mpHYDPUMP_ANALOG_INPUT_2 := 2, (*Pressure sonsor source is configured on analog input 2 of drive*)
		mpHYDPUMP_ANALOG_INPUT_3 := 3, (*Pressure sonsor source is configured on analog input 3 of drive*)
		mpHYDPUMP_ANALOG_INPUT_4 := 4 (*Pressure sonsor source is configured on analog input 4 of drive*)
		);
	MpHydPumpControllerFeatureEnum : 
		( (*Type of the feature*)
		mpHYDPUMP_FEAT_HIGH_PERFORMANCE := 0, (*High performance feature*)
		mpHYDPUMP_FEAT_AUTOTUNING := 1, (*Autotuning feature*)
		mpHYDPUMP_FEAT_PROTECTION := 2 (*Protection feature*)
		);
	MpHydPumpGroupFeatureEnum : 
		( (*Type of the group feature*)
		mpHYDPUMP_GRP_FEAT_AUTOTUNING := 0 (*Autotuning feature*)
		);
	MpHydPumpPressureSensorTypeEnum : 
		( (*Type of pressure sensor source*)
		mpHYDPUMP_READ_FROM_DRIVE := 0, (*Reading actual pressure with analog input module on drive.*)
		mpHYDPUMP_READ_FROM_PV := 1, (*Reading actual pressure from process variable.*)
		mpHYDPUMP_READ_FROM_PLK := 2 (*Reading actual pressure from powerlink frame.*)
		);
	MpHydPumpDriveLimitEnum : 
		( (*Source of the drive limitation settings (user or  read from drive)*)
		mpHYDPUMP_LIMITS_READ_FROM_DRIVE := 0, (*Drive limitation settings are read from the drive*)
		mpHYDPUMP_LIMITS_USER_DEFINED := 1 (*Drive limitation settings are set by the user*)
		);
	MpHydPumpMaxLoadEnum : 
		( (*Maximum load*)
		mpHYDPUMP_CONTINUOUS_CURRENT := 0, (*Continuous current.*)
		mpHYDPUMP_PEAK_CURRENT := 1, (*Peak current.*)
		mpHYDPUMP_POWER := 2, (*Power.*)
		mpHYDPUMP_HEAT_SINK_TEMPERATURE := 3, (*Heat sink temperature.*)
		mpHYDPUMP_MOTOR_TEMPERATURE := 4, (*Motor temperature.*)
		mpHYDPUMP_MOTOR_MODEL_TEMP := 5, (*Motor model temperature.*)
		mpHYDPUMP_JUNCTION_TEMPERATURE := 6 (*Junction temperature.*)
		);
	MpHydPumpPumpTypeEnum : 
		( (*Pump type*)
		mpHYDPUMP_PUMP_USER_DEFINED := 0, (*User defined pump settings*)
		mpHYDPUMP_PUMP_DORNINGER := 1 (*Pump of dorninger hytronics*)
		);
	MpHydPumpDriveTypeEnum : 
		( (*Drive type*)
		mpHYDPUMP_DRIVE_TYPE_ACOPOS := 0 (*Drive type ACOPOS servo drive family*)
		);
	MpHydPumpAutotuningModeEnum : 
		( (*Tuning mode*)
		mpHYDPUMP_TUNE_ALL := 0, (*ONLY FOR ACOPOS DRIVES! Tuning of speed controller and pressure controller.*)
		mpHYDPUMP_TUNE_SPEED := 1, (*ONLY FOR ACOPOS DRIVES! Speed controller tuning*)
		mpHYDPUMP_TUNE_PRESSURE := 2, (*Pressure controller tuning*)
		mpHYDPUMP_TUNE_TEST_PRESSURE := 3, (*Test pressure controller*)
		mpHYDPUMP_FINE_TUNING_PRESSURE := 4 (*Fine tuning of pressure controller parameters depending on tuning parameters*)
		);
	MpHydPumpMotionSystemTypeEnum : 
		( (*Type of the motion system*)
		mpHYDPUMP_MOTION_SYS_MAPP := 0, (*Mapp motion as used motion system*)
		mpHYDPUMP_MOTION_SYS_USER := 1 (*User defined motion system*)
		);
	MpHydPumpTuningStateEnum : 
		( (*Tuning state*)
		mpHYDPUMP_TUNING_IDLE := 0, (*State: Wait for command "StartIdentification".*)
		mpHYDPUMP_TUNING_WAIT := 1, (*State: Wait for being in operation point (pressure signal stable).*)
		mpHYDPUMP_TUNING_IDENT_STEP_POS := 2, (*State: Identification of PT1 step in positive direction.*)
		mpHYDPUMP_TUNING_IDENT_STEP_NEG := 3, (*State: Identification of PT1 step in negative direction.*)
		mpHYDPUMP_TUNING_IDENT_OSC := 4, (*State: Identification of resonance frequency.*)
		mpHYDPUMP_TUNING_DONE := 5, (*State: Pressure controller was tuned. Ready for tuning mode "mpHYDPUMP_FINE_TUNING_PRESSURE" or "mpHYDPUMP_TUNE_TEST_PRESSURE".*)
		mpHYDPUMP_TUNING_TEST := 6 (*State: Tuning test for verification.*)
		);
	MpHydPumpSimulationTypeEnum : 
		( (*Type of simulation mode*)
		mpHYDPUMP_SIMULATION_NOT_USED := 0, (*Simulation mode: None*)
		mpHYDPUMP_SIMULATION_PUMP_DRIVE := 1, (*Simulation mode: Pump and drive - hydraulic is simulated and drive has to be in simulation mode*)
		mpHYDPUMP_SIMULATION_PUMP := 2 (*Simulation mode: Pump - only hydraulic is simulated, drive must not be in simulation, motor is moving.*)
		);
	MpHydPumpControllerTypeEnum : 
		( (*Controller type*)
		mpHYDPUMP_PRESSURE_SPEED_CONTROL := 0, (*Alternating pressure/speed controller*)
		mpHYDPUMP_SPEED_CONTROL := 1, (*Speed controller*)
		mpHYDPUMP_PRESSURE_FLOW_CONTROL := 2, (*Alternating pressure/flow controller*)
		mpHYDPUMP_FLOW_CONTROL := 3 (*Flow controller*)
		);
	MpHydPumpUsedEnum : 
		( (*Generic enum if a functionallity is used*)
		mpHYDPUMP_NOT_USED := 0, (*Function is not used*)
		mpHYDPUMP_USED := 1 (*Function is used*)
		);
	MpHydPumpMinPressureCtrlTypeEnum : 
		( (*Minimum pressure controller type*)
		mpHYDPUMP_MIN_PRESSURE_NOT_USED := 0, (*Minimum pressure controller is not used*)
		mpHYDPUMP_MIN_PRESSURE_USED := 1 (*Minimum pressure controller is used*)
		);
	MpHydPumpAutotuningCtrlTypeEnum : 
		( (*Controller type for pressure tuning*)
		mpHYDPUMP_PI_CONTROLLER := 0, (*PI controller*)
		mpHYDPUMP_PID_CONTROLLER := 1 (*PID controller*)
		);
	MpHydPumpCompensationFilterEnum : 
		( (*Compensation fitler type*)
		mpHYDPUMP_COMP_FILTER_NOT_USED := 0, (*Compensation filter is not used*)
		mpHYDPUMP_COMP_FILTER_USED := 1 (*Compensation fitler is used*)
		);
	MpHydPumpDorningerPumpTypeEnum : 
		(
		mpHYDPUMP_DORNINGER_DHPH2_004 := 2004,
		mpHYDPUMP_DORNINGER_DHPH2_005 := 2005,
		mpHYDPUMP_DORNINGER_DHPH2_006 := 2006,
		mpHYDPUMP_DORNINGER_DHPH2_008 := 2008,
		mpHYDPUMP_DORNINGER_DHPH2_011 := 2011,
		mpHYDPUMP_DORNINGER_DHPH2_013 := 2013,
		mpHYDPUMP_DORNINGER_DHPH2_016 := 2016,
		mpHYDPUMP_DORNINGER_DHPH2_019 := 2019,
		mpHYDPUMP_DORNINGER_DHPH2_019_6 := 52019,
		mpHYDPUMP_DORNINGER_DHPH2_022 := 2022,
		mpHYDPUMP_DORNINGER_DHPH2_022_6 := 52022,
		mpHYDPUMP_DORNINGER_DHPH2_025 := 2025,
		mpHYDPUMP_DORNINGER_DHPH2_025_6 := 52025,
		mpHYDPUMP_DORNINGER_DHPH3_014 := 3014,
		mpHYDPUMP_DORNINGER_DHPH3_016 := 3016,
		mpHYDPUMP_DORNINGER_DHPH3_020 := 3020,
		mpHYDPUMP_DORNINGER_DHPH3_025 := 3025,
		mpHYDPUMP_DORNINGER_DHPH3_032 := 3032,
		mpHYDPUMP_DORNINGER_DHPH3_040 := 3040,
		mpHYDPUMP_DORNINGER_DHPH3_040_6 := 53040,
		mpHYDPUMP_DORNINGER_DHPH3_050 := 3050,
		mpHYDPUMP_DORNINGER_DHPH3_050_6 := 53050,
		mpHYDPUMP_DORNINGER_DHPH3_064 := 3064,
		mpHYDPUMP_DORNINGER_DHPH3_064_6 := 53064,
		mpHYDPUMP_DORNINGER_DHPH5_064 := 5064,
		mpHYDPUMP_DORNINGER_DHPH5_080 := 5080,
		mpHYDPUMP_DORNINGER_DHPH5_100 := 5100,
		mpHYDPUMP_DORNINGER_DHPH6_040 := 6040,
		mpHYDPUMP_DORNINGER_DHPH6_050 := 6050,
		mpHYDPUMP_DORNINGER_DHPH6_064 := 6064,
		mpHYDPUMP_DORNINGER_DHPH6_080 := 6080,
		mpHYDPUMP_DORNINGER_DHPH6_100 := 6100,
		mpHYDPUMP_DORNINGER_DHPH6_125 := 6125,
		mpHYDPUMP_DORNINGER_DHPH6_160 := 6160,
		mpHYDPUMP_DORNINGER_DHPH6_200 := 6200,
		mpHYDPUMP_DORNINGER_DHPH6_250 := 6250,
		mpHYDPUMP_DORNINGER_DHPC3_020 := 13020,
		mpHYDPUMP_DORNINGER_DHPC3_025 := 13025,
		mpHYDPUMP_DORNINGER_DHPC3_032 := 13032,
		mpHYDPUMP_DORNINGER_DHPC3_040 := 13040,
		mpHYDPUMP_DORNINGER_DHPC3_040_6 := 63040,
		mpHYDPUMP_DORNINGER_DHPC3_050 := 13050,
		mpHYDPUMP_DORNINGER_DHPC3_050_6 := 63050,
		mpHYDPUMP_DORNINGER_DHPC3_063_6 := 63063,
		mpHYDPUMP_DORNINGER_DHPC3_064 := 13064,
		mpHYDPUMP_DORNINGER_DHPC3_064_6 := 63064,
		mpHYDPUMP_DORNINGER_DHPC5_064 := 15064,
		mpHYDPUMP_DORNINGER_DHPC5_080 := 15080,
		mpHYDPUMP_DORNINGER_DHPC5_100 := 15100,
		mpHYDPUMP_DORNINGER_DHPC6_125 := 16125,
		mpHYDPUMP_DORNINGER_DHPC6_160 := 16160,
		mpHYDPUMP_DORNINGER_DHPC6_200 := 16200,
		mpHYDPUMP_DORNINGER_DHPC6_250 := 16250,
		mpHYDPUMP_DORNINGER_DHPS2_005 := 22005,
		mpHYDPUMP_DORNINGER_DHPS2_006 := 22006,
		mpHYDPUMP_DORNINGER_DHPS2_008 := 22008,
		mpHYDPUMP_DORNINGER_DHPS2_011 := 22011,
		mpHYDPUMP_DORNINGER_DHPS2_013 := 22013,
		mpHYDPUMP_DORNINGER_DHPS2_016 := 22016,
		mpHYDPUMP_DORNINGER_DHPS2_019 := 22019,
		mpHYDPUMP_DORNINGER_DHPS2_022 := 22022,
		mpHYDPUMP_DORNINGER_DHPS2_025 := 22025
		);
	MpHydPumpGroupControllerTypeEnum : 
		( (*Controller type of pump group mode*)
		mpHYDPUMP_GROUP_PRESSURE_FLOW := 0, (*Alternating pressure/flow controller*)
		mpHYDPUMP_GROUP_FLOW := 1 (*Flow controller*)
		);
	MpHydPumpGroupValveActuationEnum : 
		( (*Actuation of used valve in the pumg group mode.*)
		mpHYDPUMP_NO_COILS_ENERGIZED := 0, (*Selection for a switching valve. No coils are energized.*)
		mpHYDPUMP_COIL_1_ENERGIZED := 1, (*Selection for a switching valve. Coil 1 is energized.*)
		mpHYDPUMP_COIL_2_ENERGIZED := 2, (*Selection for a switching valve. Coil 2 is energized.*)
		mpHYDPUMP_COIL_1_AND_2_ENERGIZED := 3 (*Selection for a switching valve. Coil 1 and coil 2 are energized.*)
		);
END_TYPE

(**************************************************************************************************************************)
