(*********** Enumerations ***********)

TYPE
	MpTempControllerSignalCoolEnum : 
		( (*Possible signal modulations for cooling.*)
		mpTEMP_SIGNAL_MOD_COOL_PWM := 0, (*Pulse width modulation is used for signal modulation.*)
		mpTEMP_SIGNAL_MOD_COOL_PFM := 1, (*Pulse frequency modulation is used for signal modulation.*)
		mpTEMP_SIGNAL_MOD_COOL_NOT_USED := 2 (*Signal modulation is not performed. *)
		);
	MpTempControllerSignalHeatEnum : 
		( (*Possible signal modulations for heating.*)
		mpTEMP_SIGNAL_MOD_HEAT_PWM := 0, (*Pulse width modulation is used for signal modulation.*)
		mpTEMP_SIGNAL_MOD_HEAT_NOT_USED := 1 (*Signal modulation is not performed. *)
		);
	MpTempHCMConceptEnum : 
		( (*Concept of heat current monitoring.*)
		mpTEMP_HCM_CONCEPT_CCS := 0 (*Concept "Common current sensing" of heating current monitoring is used, which requires one current transformer per phase.*)
		);
	MpTempHCMOperationEnum : 
		( (*Possible operating modes for heating current monitoring.*)
		mpTEMP_OPERATION_DISCONTINUOUS := 0, (*Heating current monitoring is only performed once for all zones.*)
		mpTEMP_OPERATION_CONTINUOUS := 1 (*Heating current monitoring is continuously performed for all zones.*)
		);
	MpTempSystemTypeEnum : 
		( (*Possible system classifications.*)
		mpTEMP_SYSTEM_TYPE_PT2 := 0, (*The system is classified as PT2.*)
		mpTEMP_SYSTEM_TYPE_IT1 := 1, (*The system is cassified as IT1.*)
		mpTEMP_SYSTEM_TYPE_NONE := 3 (*No classification intended, all system parameters equal zero.*)
		);
	MpTempHCMStateEnum : 
		( (*Possible step chain states for heating current monitoring.*)
		mpTEMP_HCM_WAIT := 0, (*HCM is in sleep mode.*)
		mpTEMP_HCM_MEASUREMENT := 1, (*Feed-through of measurement at a zone.*)
		mpTEMP_HCM_INTERVAL := 2, (*Settling time after measurement at a zone.*)
		mpTEMP_HCM_IDLE := 3 (*Time until the next cycle of the HCM begins.*)
		);
	MpTempHysteresisModeEnum : 
		( (*Possible modes for the hysteresis.*)
		mpTEMP_HYSTERESIS_ON := 0, (*The temperature controller is permitted to heat and cool.*)
		mpTEMP_HYSTERESIS_OFF_HEAT_ONLY := 1, (*The temperature controller is only permitted to heat.*)
		mpTEMP_HYSTERESIS_OFF_COOL_ONLY := 2 (*The temperature controller is only permitted to cool.*)
		);
	MpTempProfileModeEnum : 
		( (*Possible profile generation methods.*)
		mpTEMP_PROFILE_MODE_OFF := 0, (*Does not calculate a profile or feed-forward control.*)
		mpTEMP_PROFILE_MODE_TIME_OPT := 1, (*Calculates a time-optimized temperature profile and associated parameters for feed-forward control.*)
		mpTEMP_PROFILE_MODE_RATE_LIMITED := 2 (*Calculates a temperature profile that is limited by the slew rate and the associated parameters for feed-forward control.*)
		);
	MpTempProfileStateEnum : 
		( (*State of the profile generation.*)
		mpTEMP_PROFILE_STATE_DISABLED := 0, (*Function block not active.*)
		mpTEMP_PROFILE_STATE_READY := 1, (*The system is waiting for a command.*)
		mpTEMP_PROFILE_STATE_ACTIVE := 2 (*The system is outputting the calculated temperature profile.*)
		);
	MpTempProfileSyncModeEnum : 
		( (*Different options for synchronized profile generation*)
		mpTEMP_PROFILE_SYNC_OFF := 0, (*Profile synchronization is not used.*)
		mpTEMP_PROFILE_SYNC_AUTO := 1, (*The profile parameters for synchronizing the profiles are automatically identified by the referenced controllers.*)
		mpTEMP_PROFILE_SYNC_USER := 2 (*The profile parameters for synchronizing the profiles are specified by the user.*)
		);
	MpTempPWMScheduleModeEnum : 
		( (*Different operating modes of the PWM schedule.*)
		mpTEMP_PWM_MODE_SHIFT := 0, (*Shifts the entire pulse within the period.*)
		mpTEMP_PWM_MODE_SPLIT := 1 (*Splits up the pulse within the period.*)
		);
	MpTempTuningModeEnum : 
		( (*Possible modes for the tuning.*)
		mpTEMP_TUNING_MODE_OFF := 0, (*Tuning is not performed. *)
		mpTEMP_TUNING_MODE_HEAT := 1, (*Step tuning for only the heating unit is performed to obtain the heating system, profile and PID parameters.*)
		mpTEMP_TUNING_MODE_HEAT_COOL := 2, (*Step tuning for heating and cooling unit is performed to obtain both heating as well as cooling system, profile and PID parameters.*)
		mpTEMP_TUNING_MODE_OSC_HEAT := 3, (*Oscillation tuning around the setpoint for only the heating unit is performed to obtain the heating PID parameters and the integrator preloading value.*)
		mpTEMP_TUNING_MODE_OSC_HEAT_COOL := 4, (*Oscillation tuning around the setpoint for the heating and cooling unit is performed to obtain the heating as well as cooling PID parameters and the integrator preloading value.*)
		mpTEMP_TUNING_MODE_OSC_COOL := 5 (*Oscillation tuning around the setpoint for only the cooling unit is performed to obtain the cooling PID parameters.*)
		);
	MpTempTuningStateEnum : 
		( (*Possible states of the tuning.*)
		mpTEMP_TUNING_STATE_IDLE := 0, (*The system is waiting for a command.*)
		mpTEMP_TUNING_STATE_INIT := 1, (*Initial state for tuning multiple zones.*)
		mpTEMP_TUNING_STATE_SYSTEM_CHECK := 2, (*The system is checked for a stable operating point.*)
		mpTEMP_TUNING_STATE_DELAY_TIME := 3, (*The delay time of the system is identified.*)
		mpTEMP_TUNING_STATE_IDENT := 4, (*The PID and system parameters of the system are identified.*)
		mpTEMP_TUNING_STATE_PREDICTION := 5, (*Calculates the time needed to switch over the controlling signal and calculates the temperature setpoint.*)
		mpTEMP_TUNING_STATE_IN_SETPOINT := 6, (*The system has reached the temperature setpoint and is waiting for further commands.*)
		mpTEMP_TUNING_STATE_ERROR := 99, (*An error occurred and the tuning was aborted.*)
		mpTEMP_TUNING_STATE_ABORTED := 100 (*Tuning was aborted by the user.*)
		);
	MpTempTuningSystemCheckEnum : 
		( (*Different time spans for checking the system.*)
		mpTEMP_TUNING_SYS_CHECK_SHORT := 0, (*The time span for checking the system is 5 s.*)
		mpTEMP_TUNING_SYS_CHECK_MEDIUM := 1, (*The time span for checking the system is 30 s.*)
		mpTEMP_TUNING_SYS_CHECK_LONG := 2 (*The time span for checking the system is 100 s.*)
		);
	MpTempZoneTypeEnum : 
		( (*Possible temperature systems.*)
		mpTEMP_ZONE_TYPE_HEAT := 0, (*The temperature zone consists only of a heating unit.*)
		mpTEMP_ZONE_TYPE_COOL := 1, (*The temperature zone consists only of a cooling unit.*)
		mpTEMP_ZONE_TYPE_HEAT_COOL := 2 (*The temperature zone consists of a heating unit as well as cooling unit.*)
		);
	MpTempSoftStartModeEnum : 
		( (*Different working principles of the soft start.*)
		mpTEMP_SOFTSTART_MOD_POWER_LIM := 0, (*The soft start is based on a heat power limitation.*)
		mpTEMP_SOFTSTART_MOD_SLEW_RATE := 1 (*The soft start is based on a defined gradient.*)
		);
	MpTempSoftStartEnableEnum : 
		( (*Different using options of the soft start.*)
		mpTEMP_SOFTSTART_USE_GROUP := 0, (*For this zone the soft start parameters of the group are used.*)
		mpTEMP_SOFTSTART_USE_ZONE := 1, (*The soft start parameters for this zone are configured individually.*)
		mpTEMP_SOFTSTART_NOT_USED := 2 (*The soft start for this zone is deactivated.*)
		);
	MpTempSoftStartStateEnum : 
		( (*Possible step chain states for the soft start.*)
		mpTEMP_SOFTSTART_HEATING := 0, (*Heating up to soft-start temperature.*)
		mpTEMP_SOFTSTART_HOLD_TEMP := 1, (*All zones are hold at the soft-start temperature.*)
		mpTEMP_SOFTSTART_REACHED_TEMP := 2, (*This zone has already reached the soft-start temperature.*)
		mpTEMP_SOFTSTART_FINISHED := 3, (*The soft start is finished. *)
		mpTEMP_SOFTSTART_EXCLUDED := 4, (*This zone is skipped due to configuration settings.*)
		mpTEMP_SOFTSTART_SKIPPED := 5, (*This zone is skipped due to preconditions.*)
		mpTEMP_SOFTSTART_OFF := 6 (*The soft start is not used*)
		);
END_TYPE

(*********** Config ********** *)

TYPE
	MpTempControllerConfigType : 	STRUCT  (*Configuration parameters for the controller.*)
		Type : MpTempZoneTypeEnum := mpTEMP_ZONE_TYPE_HEAT; (*Defines the zone type.*)
		AmbientTemperature : REAL := 25.0; (*Ambient temperature of the system [°C].*)
		MaxHeatPower : REAL := 10.0; (*Maximum output power for heating [kW].*)
		MaxHeatOutput : REAL := 100.0; (*Maximum manipulated variable for heating [%].*)
		MaxCoolOutput : REAL := 100.0; (*Maximum manipulated variable for cooling [%].*)
		ProfileMode : MpTempProfileModeEnum := mpTEMP_PROFILE_MODE_RATE_LIMITED; (*Defines the profile generation method.*)
		SystemCheck : MpTempTuningSystemCheckEnum := mpTEMP_TUNING_SYS_CHECK_LONG; (*Defines the time span used to check the system.*)
		SystemParameters : MpTempSystemType; (*System parameters defined by the user or identified by tuning.*)
		PWMParameters : MpTempPWMType; (*Parameters for PWM.*)
		HCMParameters : MpTempHCMType; (*Parameters for heating current monitoring.*)
		TemperatureFilter : MpTempControllerFilterType; (*Parameters for the temperature filter.*)
		SignalModulation : MpTempSignalModulationType; (*Parameters for the signal modulation.*)
		PFMParameters : MpTempPFMType; (*Parameters for PFM.*)
		SoftStart : MpTempSoftStartControllerType; (*Soft start parameters of the zone.*)
	END_STRUCT;
	MpTempGroupConfigType : 	STRUCT  (*Configuration parameters for the group.*)
		EnableLoadBalancing : BOOL := TRUE; (*Enables/Disables load balancing for the grouped zones.*)
		MaxHeatPower : REAL := 30.0; (*Average maximum permissible output power of the grouped zones per PWM period. [kW].*)
		PWMScheduleParameters : MpTempPWMScheduleType; (*Parameters that determine the behavior of the PWM schedule.*)
		SoftStart : MpTempSoftStartGroupType; (*Soft start parameters of the group.*)
	END_STRUCT;
	MpTempHCMConfigType : 	STRUCT  (*Configuration parameters for heating current monitoring.*)
		CurrentSensingConcept : MpTempHCMConceptEnum := mpTEMP_HCM_CONCEPT_CCS; (*Defines which type of heating current monitoring is used.*)
		OperationMode : MpTempHCMOperationEnum := mpTEMP_OPERATION_CONTINUOUS; (*Operating mode that defines whether the measurement should be performed once only or continuously.*)
		MeasurementTime : REAL := 0.12; (*Time period of measurement in which the manipulated variable for heating is set to 100% [s].*)
		IntervalTime : REAL := 60.0; (*Time period in which the controller can compensate for measurement influence [s].*)
		IdleTime : REAL := 180.0; (*Time period after a complete HCM cycle [s]. This parameter is only relevant for operating mode mpTEMP_HCM_MODE_CONTINUOUS.*)
	END_STRUCT;
END_TYPE

(*********** Parameters ********** *)

TYPE
	MpTempToleranceBandType : 	STRUCT  (*Parameters for the tolerance band that define setpoint deviation.*)
		Lower : REAL := 2.0; (*Setpoint deviation that defines the lower limit of the tolerance band [°C] or [A].*)
		Upper : REAL := 2.0; (*Setpoint deviation that defines the upper limit of the tolerance band [°C] or [A].*)
	END_STRUCT;
	MpTempControllerSignalHeatType : 	STRUCT  (*Parameters for signal modulation for heating.*)
		Type : MpTempControllerSignalHeatEnum := mpTEMP_SIGNAL_MOD_HEAT_PWM; (*Defines the signal modulation method.*)
	END_STRUCT;
	MpTempControllerSignalCoolType : 	STRUCT  (*Parameters for signal modulation for cooling.*)
		Type : MpTempControllerSignalCoolEnum := mpTEMP_SIGNAL_MOD_COOL_PWM; (*Defines the signal modulation method.*)
	END_STRUCT;
	MpTempSignalModulationType : 	STRUCT  (*Parameters for signal modulation.*)
		Heat : MpTempControllerSignalHeatType; (*Parameter for configuring the signal modulation for heating.*)
		Cool : MpTempControllerSignalCoolType; (*Parameter for configuring the signal modulation for cooling.*)
	END_STRUCT;
	MpTempGroupParType : 	STRUCT  (*Parameters for the group.*)
		SynchronizeTuning : BOOL; (*Defines whether the temperature of the slowest zone applies as a reference for the other zones. Reserved for future use.*)
		Profile : MpTempGroupProfileType; (*Parameter for configuring a user-defined profile for setpoint generation.*)
	END_STRUCT;
	MpTempControllerParType : 	STRUCT  (*Parameters for the controller.*)
		PID : MpTempPIDType; (*PID parameters that influence the control quality.*)
		Tuning : MpTempTuningType; (*Parameters that define the tuning procedure.*)
		Profile : MpTempControllerProfileType; (*Parameter for configuring the profile for setpoint generation.*)
		ToleranceBand : MpTempToleranceBandType; (*Parameters for the tolerance band that define temperature setpoint deviation.*)
		Hysteresis : MpTempHysteresisType; (*Parameter for configuring the heating and cooling switchover of the controller.*)
	END_STRUCT;
	MpTempTuningType : 	STRUCT  (*Parameters for tuning.*)
		Mode : MpTempTuningModeEnum := mpTEMP_TUNING_MODE_HEAT; (*Defines which mode is used for tuning.*)
		SetPointHeat : REAL := 160.0; (*Temperature setpoint for heating [°C]. Heating takes place up to this temperature during heating tuning. *)
		SetPointCool : REAL := 100.0; (*Temperature setpoint for cooling [°C]. Cooling down takes place up to this temperature during cooling tuning.*)
	END_STRUCT;
	MpTempControllerProfileType : 	STRUCT  (*Parameters for the profile of the controller.*)
		Heat : MpTempProfileParType; (*Parameters for configuring the profile during a heating process.*)
		Cool : MpTempProfileParType; (*Parameters for configuring the profile during a cooling process.*)
		AttenuationFactor : REAL := 1.0; (*Defines the percentage of the maximum values of the profile generator are permitted to be used for feed-forward control for the controller. This parameter can be used to give the controller more room for corrections.*)
		OvershootReduction : REAL := 0.0; (*Overshoot reduction for the time optimized heating process. Unit: [%]*)
	END_STRUCT;
	MpTempGroupProfileType : 	STRUCT  (*Parameters for the profile for the controller of the group.*)
		SynchronizationMode : MpTempProfileSyncModeEnum := mpTEMP_PROFILE_SYNC_AUTO; (*Defines the mode for profile synchronization.*)
		Heat : MpTempProfileParType; (*Parameters for configuring the profile during a heating process.*)
		Cool : MpTempProfileParType; (*Parameters for configuring the profile during a cooling process.*)
	END_STRUCT;
	MpTempProfileType : 	STRUCT  (*Parameters for the current profile.*)
		Heat : MpTempProfileParType; (*Parameters for configuring the profile during a heating process.*)
		Cool : MpTempProfileParType; (*Parameters for configuring the profile during a cooling process.*)
	END_STRUCT;
	MpTempProfileParType : 	STRUCT  (*Parameters for the current profile.*)
		SlewRate : REAL := 5.0; (*Limitation of the slope of the temperature signal [°C/s]. This value should be selected so that the system can follow the slope.*)
		FilterTime : REAL := 35.0; (*Filter time for the generated signal temperature signal [s]. This parameter rounds the generated profile at the beginning and end.*)
		DelayTime : REAL := 1.0; (*Delay time for the generated signal temperature signal [s].*)
		QuickStart : BOOL := FALSE; (*Sets the filter time to 0 s at the beginning. The profile therefore starts immediately with the defined slope.*)
	END_STRUCT;
	MpTempPIDType : 	STRUCT  (*PID parameters for the controller.*)
		Heat : MpTempPIDParType; (*PID parameters that influence the control quality for heating.*)
		Cool : MpTempPIDParType; (*PID parameters that influence the control quality for cooling.*)
		IntegratorPreloading : REAL := 0.0; (*Non-positive value to preload the integral part for setpoint changes in order to adjust the overshoot.*)
	END_STRUCT;
	MpTempPIDParType : 	STRUCT  (*PID parameters for the controller.*)
		ProportionalGain : REAL := 6.0; (*Proportional gain.*)
		IntegrationTime : REAL := 5.0; (*Integration time (integral action time) of the integral component [s].*)
		DerivativeTime : REAL := 1.0; (*Derivative time (derivative time) of the derivative component [s].*)
		FilterTime : REAL := 0.1; (*Filter time constant of the derivative component [s].*)
	END_STRUCT;
	MpTempSystemType : 	STRUCT  (*Parameters for the temperature system.*)
		Heat : MpTempSystemParType; (*Parameters for configuring the temperature system for heating.*)
		Cool : MpTempSystemParType; (*Parameters for configuring the temperature system for cooling.*)
	END_STRUCT;
	MpTempSystemCharacteristicsType : 	STRUCT  (*Characteristics for heating and cooling systems.*)
		Heat : MpTempSystemTypeEnum := mpTEMP_SYSTEM_TYPE_PT2; (*Heating system characteristics.*)
		Cool : MpTempSystemTypeEnum := mpTEMP_SYSTEM_TYPE_PT2; (*Cooling system characteristics.*)
	END_STRUCT;
	MpTempSystemParType : 	STRUCT  (*System-specific parameters.*)
		Gain : REAL := 2.8; (*Gain factor of the temperature system [°C/%].*)
		TimeConstant1 : REAL := 30.0; (*First time constant of the temperature system [s].*)
		TimeConstant2 : REAL := 2.0; (*Second time constant of the temperature system [s].*)
		DelayTime : REAL := 1.0; (*Delay time of the temperature system [s].*)
	END_STRUCT;
	MpTempPWMScheduleType : 	STRUCT  (*Parameters for the PWM schedule.*)
		Heat : MpTempPWMScheduleParType; (*Parameters for configuring the PWM schedule for heating.*)
		Cool : MpTempPWMScheduleParType; (*Parameters for configuring the PWM schedule for cooling.*)
	END_STRUCT;
	MpTempPWMScheduleParType : 	STRUCT  (*Parameters for the PWM schedule.*)
		Mode : MpTempPWMScheduleModeEnum := mpTEMP_PWM_MODE_SHIFT; (*Defines the mode of the PWM schedule.*)
		Period : REAL := 1.0; (*Defines the PWM period [s]. A period that is too long can have a negative effect on the system.*)
		MinPulseWidth : REAL := 0.0; (*Defines the minimum pulse duration [s].*)
		MinPause : REAL := 0.0; (*Defines the minimum pause duration between pulses [s].*)
	END_STRUCT;
	MpTempPFMType : 	STRUCT  (*Parameters for PFM.*)
		Cool : MpTempPFMParType; (*Parameters for configuring PFM for cooling.*)
	END_STRUCT;
	MpTempPFMParType : 	STRUCT  (*Parameters for PFM.*)
		PulseWidth : REAL := 1.0; (*Defines the pulse duration [s].*)
		MinPause : REAL := 0.0; (*Defines the minimum pause duration between pulses [s].*)
		MinOutput : REAL := 10.0; (*Defines the lower limit from which the controller output is output in [%]. Values below are ignored.*)
		ForceMinPause : BOOL := FALSE; (*Defines the switching behavior exclusively for 100% controller output. *)
		MaxOutput : REAL := 100.0; (*Defines the lower limit from which the controller output is set to 100 [%].*)
	END_STRUCT;
	MpTempPWMType : 	STRUCT  (*Parameters for PWM.*)
		Heat : MpTempPWMParType; (*Parameters for configuring PWM for heating.*)
		Cool : MpTempPWMParType; (*Parameters for configuring PWM for cooling.*)
	END_STRUCT;
	MpTempPWMParType : 	STRUCT  (*Parameters for PWM.*)
		Period : REAL := 1.0; (*Defines the PWM period [s]. A period that is too long can have a negative effect on the system.*)
		MinPulseWidth : REAL := 0.0; (*Defines the minimum pulse duration [s].*)
		MinPause : REAL := 0.0; (*Defines the minimum pause duration between pulses [s].*)
	END_STRUCT;
	MpTempHCMCurrentType : 	STRUCT  (*Parameters for the values of the current per phase.*)
		PhaseL1 : REAL := 0.0; (*Current for phase L1 [A].*)
		PhaseL2 : REAL := 0.0; (*Current for phase L2 [A].*)
		PhaseL3 : REAL := 0.0; (*Current for phase L3 [A].*)
	END_STRUCT;
	MpTempHCMType : 	STRUCT  (*Parameters for heating current monitoring.*)
		Enable : BOOL; (*Enables heating current monitoring.*)
		ReferenceCurrent : MpTempHCMCurrentType; (*Parameters for phase reference currents.*)
		MaximumCurrent : MpTempHCMCurrentType; (*Parameters for phase maximum currents.*)
		ToleranceBand : MpTempToleranceBandType; (*Parameters for the tolerance band that define reference value deviation.*)
	END_STRUCT;
	MpTempHysteresisType : 	STRUCT  (*Parameters for the hysteresis.*)
		Mode : MpTempHysteresisModeEnum; (*Defines which mode is used for the hysteresis.*)
		Band : MpTempHysteresisBand; (*Defines the band for switching between heating and cooling.*)
	END_STRUCT;
	MpTempHysteresisBand : 	STRUCT  (*Parameters of the hysteresis band that defines the switchover between heating and cooling.*)
		HeatToCool : REAL := 2.0; (*Lower limit of the controller from which it begins to cool [%].*)
		CoolToHeat : REAL := 2.0; (*Lower limit of the controller from which it begins to heat [%].*)
	END_STRUCT;
	MpTempControllerFilterType : 	STRUCT  (*Parameters for the temperatuer filter.*)
		Enable : BOOL := TRUE; (*Enables temperature filtering.*)
		NoiseReduction : REAL := 1; (*Suppression of measurement noise. The noise is suppressed more by increasing the value. Info: Too much noise suppression can have a negative effect on the control quality.*)
	END_STRUCT;
	MpTempSoftStartControllerType : 	STRUCT  (*Soft start parameters of the controller.*)
		Type : MpTempSoftStartEnableEnum; (*Different soft start enable-modes for the controller.*)
		Settings : MpTempSoftStartSettingsType; (*Setting the working principle of the soft start as well as the required parameters.*)
	END_STRUCT;
	MpTempSoftStartSettingsType : 	STRUCT  (*Setting the working principle of the soft start as well as the required parameters.*)
		Mode : MpTempSoftStartModeEnum; (*Setting the working principle of the soft start.*)
		ReducedMaximumHeatOutput : REAL; (*Specified reduced maximum heat output for the soft start. This heating power will be applied.*)
		SlewRate : REAL; (*Specified slew rate for the soft start.*)
		FilterTime : REAL; (*Specified filter time for the soft start.*)
		DelayTime : REAL; (*Specified delay time for the soft start.*)
		QuickStart : BOOL; (*Specified quick start for the soft start.*)
	END_STRUCT;
	MpTempSoftStartGroupType : 	STRUCT  (*Soft start parameters of the group.*)
		Enable : BOOL; (*Enables the soft start at the group.*)
		Temperature : REAL; (*The soft start temperature needs to be the same for every zone within the group.*)
		HoldTime : REAL; (*For this time span the plant will be hold on the soft start temperature.*)
		Settings : MpTempSoftStartSettingsType; (*Setting the working principle of the soft start as well as the required parameters.*)
	END_STRUCT;
END_TYPE

(*********** Info ***********)

TYPE
	MpTempControllerInfoType : 	STRUCT  (*Information about the controller component.*)
		SetTemperature : REAL; (*Profile of the temperature setpoint [°C].*)
		FeedForwardHeat : REAL; (*Feed-forward value for heating [%].*)
		FeedForwardCool : REAL; (*Feed-forward value for cooling [%].*)
		InTolerance : BOOL; (*The operating point was reached, and the current temperature is within the tolerance.*)
		Tuning : MpTempTuningInfoType; (*Contains information about tuning.*)
		Profile : MpTempControllerProfileInfoType; (*Contains information about the current profile.*)
		Control : MpTempControlInfoType; (*Contains information about the controller.*)
		Simulation : MpTempSimulationInfoType; (*Contains information about simulation.*)
		Diag : MpTempDiagType; (*Diagnostic structure for the status ID.*)
		HCM : MpTempControllerHCMInfoType; (*Contains the currents identified during the HCM measurement. *)
		SoftStart : MpTempSoftStartCtrlInfoType; (*Information about the soft start.*)
		Parameterization : MpTempParameterizationInfoType; (*Contains information about the current parameterization.*)
	END_STRUCT;
	MpTempGroupInfoType : 	STRUCT  (*Information about the group component.*)
		Profile : MpTempGroupProfileInfoType; (*Contains information about the profile.*)
		HeatPower : MpTempGroupPowerType; (*Contains information about the power limitation.*)
		Diag : MpTempDiagType; (*Diagnostic structure of the function block.*)
		SoftStart : MpTempSoftStartGroupInfoType; (*Information about the soft start*)
	END_STRUCT;
	MpTempHCMInfoType : 	STRUCT  (*Information about the HCM component.*)
		State : MpTempHCMStateEnum; (*Current state of HCM.*)
		Diag : MpTempDiagType; (*Diagnostic structure for the status ID.*)
	END_STRUCT;
	MpTempInfoType : 	STRUCT  (*Additional diagnostic information.*)
		Diag : MpTempDiagType; (*Diagnostic structure for the status ID.*)
	END_STRUCT;
	MpTempDiagType : 	STRUCT  (*Additional diagnostic information.*)
		StatusID : MpTempStatusIDType; (*StatusID diagnostic structure.*)
	END_STRUCT;
	MpTempStatusIDType : 	STRUCT  (*Segmented StatusID output.*)
		ID : MpTempErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpTempTuningInfoType : 	STRUCT  (*Information about the tuning.*)
		State : MpTempTuningStateEnum; (*Current state of the tuning procedure.*)
		PIDParameters : MpTempPIDType; (*PID parameters identified by tuning.*)
		SystemParameters : MpTempSystemType; (*System parameters identified by tuning.*)
		ProfileParameters : MpTempProfileType; (*Profile parameters identified by tuning.*)
		Quality : MpTempTuningQualityType; (*Quality information related to the tuning process for heating and cooling. *)
		TemperatureFilter : MpTempTuningFilterType; (*Filter parameters identified by tuning.*)
		SystemType : MpTempSystemCharacteristicsType; (*System classification*)
	END_STRUCT;
	MpTempTuningQualityType : 	STRUCT  (*Information about the quality of the identified parameters.*)
		Heat : USINT; (*Quality of the identified parameters for the heating process.*)
		Cool : USINT; (*Quality of the identified parameters for the cooling process.*)
	END_STRUCT;
	MpTempControllerProfileInfoType : 	STRUCT  (*Information about the profile.*)
		Active : BOOL; (*Indicates whether profile generation is active.*)
		InSetPoint : BOOL; (*Indicates whether the temperature setpoint is reached.*)
	END_STRUCT;
	MpTempControlInfoType : 	STRUCT  (*Information about current controller values.*)
		ControlError : REAL; (*Control deviation between setpoint and actual value [°C].*)
		ProportionalPart : REAL; (*Proportional component of the controller [%].*)
		IntegrationPart : REAL; (*Integral component of the controller [%].*)
		DerivativePart : REAL; (*Derivative component of the controller [%].*)
		ActualTemperatureFiltered : REAL; (*Filtered current temperature [°C].*)
		ActualTemperatureDerivative : REAL; (*Derivative of the current temperature [°C/s].*)
		TemperatureFilterUsed : BOOL; (*The filtered temperature is used for closed-loop control.*)
	END_STRUCT;
	MpTempSimulationInfoType : 	STRUCT  (*Information about the simulated temperature process.*)
		HeatValue : REAL; (*Manipulated variable for heating [%].*)
		CoolValue : REAL; (*Manipulated variable for cooling [%].*)
		ActualTemperature : REAL; (*Current temperature of the zone [°C].*)
		Heat : BOOL; (*Digital manipulated variable for heating.*)
		Cool : BOOL; (*Digital manipulated variable for cooling.*)
		SystemType : MpTempSystemCharacteristicsType; (*System classification*)
	END_STRUCT;
	MpTempGroupProfileInfoType : 	STRUCT  (*Information about the profile.*)
		Active : BOOL; (*Indicates whether profile generation is active.*)
		InSetPoint : BOOL; (*Indicates whether the temperature setpoint is reached.*)
		Heat : MpTempProfileParType; (*Profile parameters for heating. Defined by the zones with synchronized profile generation.*)
		Cool : MpTempProfileParType; (*Profile parameters for cooling. Defined by the zones with synchronized profile generation.*)
	END_STRUCT;
	MpTempGroupPowerType : 	STRUCT  (*Information about power limitation*)
		Actual : REAL; (*Current average power of all zones per period [kW].*)
		Required : REAL; (*Required average power of all zones per period [kW].*)
		InLimitation : BOOL; (*Indicates whether the power output of the zones is limited.*)
	END_STRUCT;
	MpTempControllerHCMInfoType : 	STRUCT  (*Information about the previously measured currents of the associated heating element.*)
		AverageCurrentL1 : REAL; (*Average value of the current measurement of phase L1 [A].*)
		AverageCurrentL2 : REAL; (*Average value of the current measurement of phase L2 [A].*)
		AverageCurrentL3 : REAL; (*Average value of the current measurement of phase L3 [A].*)
	END_STRUCT;
	MpTempTuningFilterType : 	STRUCT  (*Information about the recommended filter settings that were identified during tuning.*)
		NoiseReduction : REAL := 1.0; (*Recommended suppression of measurement noise that is determined during tuning. *)
	END_STRUCT;
	MpTempSoftStartGroupInfoType : 	STRUCT  (*Information about the soft start for the group.*)
		State : MpTempSoftStartStateEnum; (*Current state of the soft start at the group.*)
	END_STRUCT;
	MpTempSoftStartCtrlInfoType : 	STRUCT  (*Information about the soft start for the controller.*)
		State : MpTempSoftStartStateEnum; (*Current state of the soft start at the controller. *)
	END_STRUCT;
	MpTempSystemInfoType : 	STRUCT  (*Information about the currently used system data.*)
		Parameters : MpTempSystemType; (*Currently used system parameters.*)
		Type : MpTempSystemCharacteristicsType; (*System characteristics of the currently used system.*)
	END_STRUCT;
	MpTempParameterizationInfoType : 	STRUCT  (*Information about the current parameterization of the function block.*)
		Controller : MpTempPIDType; (*Current parameterization of the PID controller.*)
		System : MpTempSystemInfoType; (*Current parameterization of the system data.*)
		Profile : MpTempProfileType; (*Current parameterization of the profile data.*)
		KalmanFilter : MpTempControllerFilterType; (*Current parameterization of the Kalman filter.*)
	END_STRUCT;
END_TYPE
