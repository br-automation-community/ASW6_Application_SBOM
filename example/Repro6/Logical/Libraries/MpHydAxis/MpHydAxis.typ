(**************************************************************************************************************************)
(***************************************************** Generic *********************************************************)

TYPE
	MpHydAxisDiagType : 	STRUCT 
		StatusID : MpHydAxisStatusIDType; (*StatusID diagnostic structure*)
	END_STRUCT;
	MpHydAxisStatusIDType : 	STRUCT 
		ID : MpHydAxisErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
		Code : UINT; (*Code for the status ID. This error number can be used to search for additional information in the help system*)
	END_STRUCT;
	MpHydAxisCtrlSourceEnum : 
		( (*Types of signal sources*)
		mpHYDAXIS_NOT_USED := 0, (*Not used*)
		mpHYDAXIS_VARIABLE_REAL := 1, (*Variable REAL*)
		mpHYDAXIS_VARIABLE_LREAL := 2 (*Variable LREAL*)
		);
	MpHydAxisDestinationTypeEnum : 
		( (*Destination types for output signals*)
		mpHYDAXIS_DEST_VAR_NOT_USED := 0,
		mpHYDAXIS_DEST_VAR_REAL := 1,
		mpHYDAXIS_DEST_VAR_INT := 2,
		mpHYDAXIS_DEST_VAR_UINT := 3
		);
	MpHydAxisPrValveCtrlEnum : 
		( (*Controller types of proportional valve*)
		mpHYDAXIS_VALVECTRL_FLOW := 0, (*Proportional valve controller which is controlling the volume flow.*)
		mpHYDAXIS_VALVECTRL_VALVESIGNAL := 1 (*Proportional valve controller which is controlling the valve signal.*)
		);
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of switching valve *****************************************************)

TYPE
	MpHydAxisSwitchingValveInfoType : 	STRUCT  (*Switching valve information.*)
		Coil1Energized : BOOL; (*Output which shows the coil 1 signal delayed by the switching duration to indicate if the valve has switched.*)
		Coil2Energized : BOOL; (*Output which shows the coil 2 signal delayed by the switching duration to indicate if the valve has switched.*)
		InExternalControl : BOOL; (*Function block is currently controlled externally e.g. by a group.*)
		Diag : MpHydAxisDiagType; (*Diagnostic structure for the function block.*)
		ExternalSource : STRING[32]; (*Name of the MpLink of the parent which is using this switching valve at the moment (for "InExternalControl" = TRUE).*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of proportional valve *****************************************************)

TYPE
	MpHydAxisPropValveInfoType : 	STRUCT  (*Proportional valve information.*)
		InExternalControl : BOOL; (*Component is currently controlled externally.*)
		ExternalSource : STRING[32]; (*Name of the MpLink of the parent when the component is controlled externally.*)
		Controller : MpHydAxisPrValveCtrlInfoType; (*Controller information.*)
		ValveSignals : MpHydAxisPrValveSignalsInfoType; (*Valve signals information.*)
		Diag : MpHydAxisDiagType; (*Diagnostic structure for the function block.*)
		Sensors : MpHydAxisPrValveSensorsInfoType; (*Proportional valve sensors information.*)
	END_STRUCT;
	MpHydAxisPrValveCtrlInfoType : 	STRUCT  (*Proportional valve controller information.*)
		Type : MpHydAxisPrValveCtrlEnum := mpHYDAXIS_VALVECTRL_FLOW; (*Proportional valve controller type.*)
		SetValues : MpHydAxisPrValveSetValueInfoType; (*Proportional valve set values information.*)
		ValveCurve : MpHydAxisPrValveCurveInfoType; (*Proportional valve curve information.*)
		Output : REAL := 0.0; (*Controller output valve signal. Unit: [%].*)
		Output1 : REAL := 0.0; (*Controller output valve signal 1 of the flow contoller. Unit: [%].*)
		Output2 : REAL := 0.0; (*Controller output valve signal 2 of the flow controller. This signal is only used for load control by an external component (if "InExternalControl = TRUE", e.g. via the hydraulic axis controller). Unit: [%].*)
		PressureFlowLinearization : MpHydAxisPrValveFlowLinInfoType; (*Pressure-dependent volume flow linearization information.*)
	END_STRUCT;
	MpHydAxisPrValveFlowLinInfoType : 	STRUCT  (*Pressure-dependent flow linearization information.*)
		FlowDirection : MpHydAxisPrValveFlowDirEnum := mpHYDAXIS_FLOW_DIR_POS; (*Volume flow direction.*)
		Active : BOOL := FALSE; (*Information if pressure-dependent flow linearization is active.*)
		PressureDrop : REAL := 0.0; (*Calculated pressure difference. Calculated from the configured pressure sensors of the current volume flow direction. Unit: [bar].*)
		LinearizationGain : REAL := 0.0; (*Calculated gain for the linearization. Unit: [1].*)
	END_STRUCT;
	MpHydAxisPrValveSetValueInfoType : 	STRUCT  (*Proportional valve set value information.*)
		SetFlow : REAL := 0.0; (*Set flow. Unit: [lpm].*)
		AdditionalValveSignal : REAL := 0.0; (*Additional valve signal. Unit: [%].*)
		SetValveSignal : REAL := 0.0; (*Set valve signal. Unit: [%].*)
		SetFlow2 : REAL := 0.0; (*Set flow 2. This input signal is only used for load control by an external component (if "InExternalControl = TRUE", e.g. via the hydraulic axis controller). Unit: [lpm].*)
		AdditionalValveSignal2 : REAL := 0.0; (*Additional valve signal 2. This input signal  is only used for load control by an external component (if "InExternalControl = TRUE", e.g. via the hydraulic axis controller). Unit: [%].*)
	END_STRUCT;
	MpHydAxisPrValveSignalsInfoType : 	STRUCT  (*Proportional valve signals information.*)
		ValveSignal1 : MpHydAxisPrValveSignalInfoType; (*Valve signal 1 information.*)
		ValveSignal2 : MpHydAxisPrValveSignalInfoType; (*Valve signal 2 information.*)
	END_STRUCT;
	MpHydAxisPrValveCurveInfoType : 	STRUCT  (*Proportional valve curve information.*)
		InputFlow : REAL := 0.0; (*Nonlinearized valve curve input volume flow. Unit: [lpm].*)
		OutputValveSignal : REAL := 0.0; (*Linearized valve curve output valve signal. Unit: [%].*)
		InputFlow2 : REAL := 0.0; (*Nonlinearized valve curve input volume flow 2. This signal is only used for load control by an external component (if "InExternalControl = TRUE", e.g. via the hydraulic axis controller). Unit: [lpm].*)
		OutputValveSignal2 : REAL := 0.0; (*Linearized valve curve output valve signal 2. This signal is only used for load control by an external component (if "InExternalControl = TRUE", e.g. via the hydraulic axis controller). Unit: [%].*)
	END_STRUCT;
	MpHydAxisPrValveSignalInfoType : 	STRUCT  (*Proportional valve signal information.*)
		InputValveSignal : REAL := 0.0; (*Input valve signal. Unit: [%].*)
	END_STRUCT;
	MpHydAxisPrValveSensorsInfoType : 	STRUCT  (*Proportional valve sensors information.*)
		PressureP : REAL := 0.0; (*Pressure on port P. Unit: [bar].*)
		PressureA : REAL := 0.0; (*Pressure on port A. Unit: [bar].*)
		PressureB : REAL := 0.0; (*Pressure on port B. Unit: [bar].*)
		PressureT : REAL := 0.0; (*Pressure on port T. Unit: [bar].*)
	END_STRUCT;
	MpHydAxisPrValveFlowDirEnum : 
		( (*Volume flow direction.*)
		mpHYDAXIS_FLOW_DIR_POS := 0, (*Set volume flow is positive.*)
		mpHYDAXIS_FLOW_DIR_NEG := 1 (*Set volume flow is negative.*)
		);
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of hydraulic axis controller *****************************************************)

TYPE
	MpHydAxisControllerInfoType : 	STRUCT  (*Hydraulic axis information.*)
		System : MpHydAxisCtrlSystemInfoType; (*Contains information about the hydraulic system.*)
		Action : MpHydAxisCtrlActionInfoType; (*Contains information about the current action.*)
		Diag : MpHydAxisDiagType; (*Diagnostic structure for the function block.*)
	END_STRUCT;
	MpHydAxisCtrlActionInfoType : 	STRUCT  (*Hydraulic axis control information.*)
		ActiveAction : USINT := 0; (*Active action. If no action is active, the value 0 is shown.*)
		Name : STRING[80]; (*Name of the active action.*)
		PositionControl : MpHydAxisPosCtrlInfoType; (*Position control information.*)
		LoadControl : MpHydAxisLoadCtrlInfoType; (*Load control information.*)
		AlternatingControl : MpHydAxisAlternatingCtrlInfoType; (*Alternating position/load control information.*)
	END_STRUCT;
	MpHydAxisPosCtrlInfoType : 	STRUCT  (*Position control information.*)
		FeedForward : MpHydAxisPosCtrlFFInfoType; (*Feed forward information of the position control.*)
		PositionController : MpHydAxisPosCtrlPositionInfoType; (*Position controller information of the position control.*)
	END_STRUCT;
	MpHydAxisPosCtrlFFInfoType : 	STRUCT  (*Hydraulic axis position feed forward information*)
		Active : BOOL; (*Position control feed forward is active/inactive.*)
		InputVelocity : REAL := 0.0; (*Position control feed forward input velocity. Unit: [Position units/s].*)
		OutputFlow : REAL := 0.0; (*Position control feed forward output flow. Unit: [lpm].*)
	END_STRUCT;
	MpHydAxisPosCtrlPositionInfoType : 	STRUCT  (*Hydraulic axis position controller information*)
		Active : BOOL; (*Position controller is active/inactive.*)
		ControlError : REAL := 0.0; (*Position controller lag error. Unit: [Position units].*)
		ProportionalPart : REAL := 0.0; (*Position controller proportional part. Unit: [%].*)
		IntegrationPart : REAL := 0.0; (*Position controller integration part. Unit: [%].*)
		DerivativePart : REAL := 0.0; (*Position controller derivative part. Unit: [%].*)
		OutputSignal : REAL := 0.0; (*Position controller output signal. Unit: [%].*)
	END_STRUCT;
	MpHydAxisLoadCtrlInfoType : 	STRUCT  (*Position control information.*)
		FeedForward : MpHydAxisLoadCtrlFFInfoType; (*Feed forward information of the load control.*)
		PIDController : MpHydAxisLoadCtrlPIDInfoType; (*Standard PID controller information of the load control.*)
	END_STRUCT;
	MpHydAxisLoadCtrlFFInfoType : 	STRUCT  (*Hydraulic axis load feed forward information*)
		Active : BOOL; (*Load control feed forward is active/inactive.*)
		OutputFlow : REAL := 0.0; (*Load control feed forward output flow. Unit: [lpm].*)
	END_STRUCT;
	MpHydAxisLoadCtrlPIDInfoType : 	STRUCT  (*Hydraulic axis load controller information*)
		Active : BOOL; (*Load controller is active/inactive.*)
		ControlError : REAL := 0.0; (*Control error of the load controller. Unit: [Load units].*)
		ProportionalPart : REAL := 0.0; (*Load controller proportional part. Unit: [%].*)
		IntegrationPart : REAL := 0.0; (*Load controller integration part. Unit: [%].*)
		DerivativePart : REAL := 0.0; (*Load controller derivative part. Unit: [%].*)
		OutputSignal : REAL := 0.0; (*Load controller output signal. Unit: [%].*)
	END_STRUCT;
	MpHydAxisAlternatingCtrlInfoType : 	STRUCT  (*Alternating position/load control information.*)
		IsUsed : BOOL; (*Alternating position/load controller is used/not used.*)
		ActuatorReference : STRING[32]; (*Name (mapp Link) of the actuator which is in alternating position/load control.*)
		InPositionControl : BOOL; (*The function block with the according actuator operates in position control.*)
		InLoadControl : BOOL; (*The function block with the according actuator operates in load control.*)
	END_STRUCT;
	MpHydAxisCtrlSystemInfoType : 	STRUCT  (*Hydraulic axis system information.*)
		ActValues : MpHydAxisCtrlActValuesInfoType; (*Hydraulic axis information of the current values.*)
		SetValues : MpHydAxisCtrlSetValuesInfoType; (*Hydraulic axis set value information.*)
	END_STRUCT;
	MpHydAxisCtrlActValuesInfoType : 	STRUCT  (*Hydraulic axis information of the current values.*)
		Position : LREAL := 0.0; (*Scaled and filtered position. Unit: [Position units].*)
		Velocity : REAL := 0.0; (*Scaled and filtered velocity. Unit: [Position units/s].*)
		Pressure1 : REAL := 0.0; (*Pressure of cylinder chamber 1. Unit: [bar].*)
		Pressure2 : REAL := 0.0; (*Pressure of cylinder chamber 2. Unit: [bar].*)
		Load : REAL := 0.0; (*Load of hydraulic cylinder. Unit: [Load units].*)
	END_STRUCT;
	MpHydAxisCtrlSetValuesInfoType : 	STRUCT  (*Hydraulic axis set value information.*)
		Position : LREAL := 0.0; (*Set position. Unit: [Position units].*)
		Velocity : REAL := 0.0; (*Set velocity. Unit: [Position units/s].*)
		Load : REAL := 0.0; (*Set load. Unit: [Load units].*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Info of Config function blocks *****************************************************)

TYPE
	MpHydAxisInfoType : 	STRUCT 
		Diag : MpHydAxisDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
END_TYPE

(************************************************ Config of switching valve *****************************************************)

TYPE
	MpHydAxisSwValveConfigType : 	STRUCT  (*Switching valve configuration*)
		Coils : MpHydAxisSwValveCoilsType; (*Configuration of the valve coils*)
		InputSignals : MpHydAxisSwValveInSignalsType; (*Input signals depending on the number of valve coils*)
		OutputSignals : MpHydAxisSwValveOutSignalsType; (*Output signals depending on the number of valve coils*)
	END_STRUCT;
	MpHydAxisSwValveCoilsType : 	STRUCT  (*Configuration of the valve coils*)
		NumberOfCoils : USINT := 1; (*Number of valve coils*)
		Coil1 : MpHydAxisSwValveCoilType; (*Configuration of the valve coil 1*)
		Coil2 : MpHydAxisSwValveCoilType; (*Configuration of the valve coil 2*)
	END_STRUCT;
	MpHydAxisSwValveCoilType : 	STRUCT  (*Configuration of a single valve coil*)
		Name : STRING[32] := 'Y101'; (*Name of the corresponding valve coil*)
		SwitchingDuration : REAL := 0.0; (*Duration which is needed to switch the valve energized with this coil. Unit:[s]*)
	END_STRUCT;
	MpHydAxisSwValveInSignalsType : 	STRUCT  (*Input signals depending on the number of valve coils*)
		EnergizeCoil1 : STRING[255]; (*String with the name of the process variable energize coil 1, PV of datatype BOOL for energizing coil 1 in manual mode*)
		EnergizeCoil2 : STRING[255]; (*String with the name of the process variable energize coil 2, PV of datatype BOOL for energizing coil 2 in manual mode*)
	END_STRUCT;
	MpHydAxisSwValveOutSignalsType : 	STRUCT  (*Output signals depending on the number of valve coils*)
		Coil1Signal : STRING[255]; (*String with the name of the process variable coil 1 signal, PV of datatype BOOL for the output signal which energizes coil 1*)
		Coil2Signal : STRING[255]; (*String with the name of the process variable coil 2 signal, PV of datatype BOOL for the output signal which energizes coil 2*)
	END_STRUCT;
END_TYPE

(**************************************************************************************************************************)
(************************************************ Config of proportional valve *****************************************************)

TYPE
	MpHydAxisPrValveConfigType : 	STRUCT  (*Proportional valve configuration*)
		Controller : MpHydAxisPrValveControllerType; (*Settings for the proportional valve controller*)
		ValveSignals : MpHydAxisPrValveSignalsType; (*Settings for the valve signals*)
		Sensors : MpHydAxisPrValveSensorsType; (*Settings for the sensor signals*)
	END_STRUCT;
	MpHydAxisPrValveControllerType : 	STRUCT  (*Settings for the proportional valve controller*)
		Type : MpHydAxisPrValveCtrlEnum := mpHYDAXIS_VALVECTRL_FLOW; (*Type of the proportional valve controller*)
		InputSignals : MpHydAxisPrValveInputSignalsType; (*PV selection of the input signals*)
		ValveCurve : MpHydAxisPrValveCurveType; (*Static curve for linearizing the proportional valve*)
		PressureFlowLinearization : MpHydAxisPrValveFlowLinType; (*Pressure-dependent volume flow linearization*)
	END_STRUCT;
	MpHydAxisPrValveInputSignalsType : 	STRUCT  (*Input signals*)
		SetFlow : STRING[255]; (*PV of datatype REAL for the set flow. Unit: [lpm]*)
		AdditionalValveSignal : STRING[255]; (*PV of datatype REAL for an additional valve signal input. Unit: [%]*)
		SetValveSignal : STRING[255]; (*PV of datatype REAL for the set valve signal. Unit: [%]*)
	END_STRUCT;
	MpHydAxisPrValveCurveType : 	STRUCT  (*Valve curve*)
		MinimumPoint : MpHydAxisPrValveCurvePointType; (*Minimum point of the valve curve. The output valve signal of the valve curve is limited with this point*)
		NumberOfAdditionalPoints : UINT := 1; (*Number of configured additional points*)
		AdditionalPoints : {REDUND_UNREPLICABLE} UDINT; (*List of configured additional points. The size of the array is not permitted to be less than the size defined via "NumberOfAdditionalPoints"*)
		MaximumPoint : MpHydAxisPrValveCurvePointType; (*Maximum point of the valve curve. The output valve signal of the valve curve is limited with this point*)
	END_STRUCT;
	MpHydAxisPrValveCurvePointType : 	STRUCT  (*Point of the valve curve*)
		ValveSignal : REAL := 0.0; (*Valve signal. Unit: [%]*)
		Flow : REAL := 0.0; (*Flow. Unit: [lpm]*)
	END_STRUCT;
	MpHydAxisPrValveSignalsType : 	STRUCT  (*Valve signals*)
		NumberOfValveSignals : USINT := 1; (*Number of valve signals for actuating the valve*)
		ValveSignal1 : MpHydAxisPrValveSignalType; (*Settings for valve signal 1*)
		ValveSignal2 : MpHydAxisPrValveSignalType; (*Settings for valve signal 2*)
	END_STRUCT;
	MpHydAxisPrValveSignalType : 	STRUCT  (*Valve signal*)
		Name : STRING[32] := 'Y101'; (*Name of the corresponding valve signal, e.g. the name which is used in the hydraulic circuit diagram. This name is for a better overview and is optional*)
		Limits : MpHydAxisPrValveLimitsType; (*Limits of the regarding valve signal*)
		OutputValveSignal : MpHydAxisPrValveOutputSignalType; (*Output valve signal*)
	END_STRUCT;
	MpHydAxisPrValveLimitsType : 	STRUCT  (*Limits of the valve signal*)
		MinimumValveSignal : REAL := -100.0; (*Minimum valve signal which is written to the output. Unit: [%]*)
		MaximumValveSignal : REAL := 100.0; (*Maximum valve signal which is written to the output. Unit: [%]*)
	END_STRUCT;
	MpHydAxisPrValveOutputSignalType : 	STRUCT  (*Output valve signal*)
		Destination : MpHydAxisPrValveDestinationType; (*Output signal which actuates the valve*)
	END_STRUCT;
	MpHydAxisPrValveDestinationType : 	STRUCT  (*Output signal which actuates the valve*)
		Type : MpHydAxisDestinationTypeEnum := mpHYDAXIS_DEST_VAR_REAL; (*Destination type*)
		PvMapping : STRING[255]; (*PV mapping for the output valve signal. The datatype of the PV depends on the destination type*)
		ScalingInt : MpHydAxisPrValveScalingIntType; (*Output valve signal scaling for destination type INT*)
		ScalingUint : MpHydAxisPrValveScalingUintType; (*Output valve signal scaling for destination type UINT*)
	END_STRUCT;
	MpHydAxisPrValveScalingIntType : 	STRUCT  (*Output valve signal scaling for destination type INT*)
		MinimumUnscaledValue : REAL := -100.0; (*First unscaled valve signal value which defines the scaling. Unit: [%]*)
		MaximumUnscaledValue : REAL := 100.0; (*Second unscaled valve signal value which defines the scaling. Unit: [%]*)
		MinimumScaledValue : INT := -32767; (*First scaled output value for the module which defines the scaling. The output is not limited with this value. Unit: [digits]*)
		MaximumScaledValue : INT := 32767; (*Second scaled output value for the module which defines the scaling. The output is not limited with this value. Unit: [digits]*)
	END_STRUCT;
	MpHydAxisPrValveScalingUintType : 	STRUCT  (*Output valve signal scaling for destination type UINT*)
		MinimumUnscaledValue : REAL := 0.0; (*First unscaled valve signal value which defines the scaling. Unit: [%]*)
		MaximumUnscaledValue : REAL := 100.0; (*Second unscaled valve signal value which defines the scaling. Unit: [%]*)
		MinimumScaledValue : UINT := 0; (*First scaled output value for the module which defines the scaling. The output is not limited with this value. Unit: [digits]*)
		MaximumScaledValue : UINT := 65535; (*Second scaled output value for the module which defines the scaling. The output is not limited with this value. Unit: [digits]*)
	END_STRUCT;
	MpHydAxisPrValveSensorsType : 	STRUCT  (*Sensor signals*)
		PressureP : MpHydAxisPrValvePressureSensType; (*Settings for pressure sensor of port P*)
		PressureA : MpHydAxisPrValvePressureSensType; (*Settings for pressure sensor of port A*)
		PressureB : MpHydAxisPrValvePressureSensType; (*Settings for pressure sensor of port B*)
		PressureT : MpHydAxisPrValvePressureSensType; (*Settings for pressure sensor of port T*)
	END_STRUCT;
	MpHydAxisPrValvePressureSensType : 	STRUCT  (*Pressure*)
		Source : MpHydAxisPrValvePressureSrcType; (*Sensor source for the pressure signal*)
	END_STRUCT;
	MpHydAxisPrValvePressureSrcType : 	STRUCT  (*Pressure*)
		Type : MpHydAxisPrValvePressureTypeEnum := mpHYDAXIS_PRS_NOT_USED; (*Sensor source for the pressure signal*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the pressure signal. Unit: [bar]. Data type: REAL*)
		ConstantPressure : REAL := 0.0; (*Constant pressure. Unit: [bar]*)
	END_STRUCT;
	MpHydAxisPrValveFlowLinType : 	STRUCT  (*Pressure-dependent volume flow linearization*)
		Type : MpHydAxisPrValveFlowLinTypeEnum := mpHYDAXIS_FLOW_LIN_TYPE_NOT_USED; (*Pressure-dependent volume flow linearization type*)
		PositiveFlowLinearization : MpHydAxisPrValvePosFlowLinType; (*Pressure-dependent volume flow linearization for positive flow values*)
		NegativeFlowLinearization : MpHydAxisPrValveNegFlowLinType; (*Pressure-dependent volume flow linearization for negative flow values*)
	END_STRUCT;
	MpHydAxisPrValvePosFlowLinType : 	STRUCT  (*Pressure-dependent volume flow linearization for positive flow values*)
		Type : MpHydAxisPrValveFlowLinUsedEnum := mpHYDAXIS_FLOW_LIN_USED; (*Use pressure-dependent volume flow linearization for positive flow values*)
		NominalPressureDrop : REAL := 5.0; (*Nominal pressure drop*)
		InputPort : MpHydAxisPrValveFlowLinPrsEnum := mpHYDAXIS_PRESSURE_P; (*Select pressure of valve input port*)
		OutputPort : MpHydAxisPrValveFlowLinPrsEnum := mpHYDAXIS_PRESSURE_A; (*Select pressure of valve output port*)
	END_STRUCT;
	MpHydAxisPrValveNegFlowLinType : 	STRUCT  (*Pressure-dependent volume flow linearization for negative flow values*)
		Type : MpHydAxisPrValveFlowLinUsedEnum := mpHYDAXIS_FLOW_LIN_USED; (*Use pressure-dependent volume flow linearization for negative flow values*)
		NominalPressureDrop : REAL := 5.0; (*Nominal pressure drop*)
		InputPort : MpHydAxisPrValveFlowLinPrsEnum := mpHYDAXIS_PRESSURE_P; (*Select pressure of valve input port*)
		OutputPort : MpHydAxisPrValveFlowLinPrsEnum := mpHYDAXIS_PRESSURE_B; (*Select pressure of valve output port*)
	END_STRUCT;
	MpHydAxisPrValveFlowLinTypeEnum : 
		( (*Pressure-dependent volume flow linearization type*)
		mpHYDAXIS_FLOW_LIN_TYPE_NOT_USED := 0, (*Pressure-dependent volume flow linearization is not used*)
		mpHYDAXIS_FLOW_LIN_TYPE_SQU_ROOT := 1 (*Square root relation is used for pressure-dependent volume flow linearization*)
		);
	MpHydAxisPrValveFlowLinUsedEnum : 
		( (*Pressure-dependent volume flow linearization direction enum*)
		mpHYDAXIS_FLOW_LIN_NOT_USED := 0, (*Pressure-dependent volume flow linearization is not used*)
		mpHYDAXIS_FLOW_LIN_USED := 1 (*Pressure-dependent volume flow linearization is used*)
		);
	MpHydAxisPrValveFlowLinPrsEnum : 
		( (*Pressure source enum*)
		mpHYDAXIS_PRESSURE_P := 0, (*Pressure at valve port P*)
		mpHYDAXIS_PRESSURE_A := 1, (*Pressure at valve port A*)
		mpHYDAXIS_PRESSURE_B := 2, (*Pressure at valve port B*)
		mpHYDAXIS_PRESSURE_T := 3 (*Pressure at valve port T*)
		);
	MpHydAxisPrValvePressureTypeEnum : 
		( (*Sensor source for the pressure signal*)
		mpHYDAXIS_PRS_NOT_USED := 0, (*Not used*)
		mpHYDAXIS_PRS_VARIABLE_REAL := 1, (*Process variable REAL*)
		mpHYDAXIS_PRS_CONSTANT := 2 (*Constant*)
		);
END_TYPE

(**************************************************************************************************************************)
(************************************************ Config of hydraulic axis controller *****************************************************)

TYPE
	MpHydAxisControllerConfigType : 	STRUCT  (*Hydraulic axis configuration*)
		HydraulicAxisType : MpHydAxisCtrlType; (*Hydraulic axis type*)
		ProfileGeneration : MpHydAxisCtrlProfileGenType; (*Profile generation*)
		Sensors : MpHydAxisCtrlSensorsType; (*Sensor signals of the hydraulic axis*)
		NumberOfActions : UINT; (*Number of defined actions*)
		Actions : {REDUND_UNREPLICABLE} UDINT; (*Defined actions. Adress of the variable of datatype MpHydAxisCtrlActionType. The size of the array has to match with 'NumberOfActions'.*)
		InputSignals : MpHydAxisCtrlInputSignalsType; (*process variable selection of the inputs*)
	END_STRUCT;
	MpHydAxisCtrlType : 	STRUCT  (*Hydraulic axis type*)
		Type : MpHydAxisCtrlTypeEnum := mpHYDAXIS_DIFFERENTIAL_CYLINDER; (*Hydraulic axis type*)
		Area1 : REAL := 160.0; (*Piston area for positive movement  in cm^2. Typically the big pistion area.*)
		Area2 : REAL := 80.0; (*Piston area for negative movement in cm^2. Typically the small pistion area.*)
	END_STRUCT;
	MpHydAxisCtrlProfileGenType : 	STRUCT  (*Profile generation*)
		Type : MpHydAxisCtrlProfileGenTypeEnum := mpHYDAXIS_APPLICATION; (*Profile generation type*)
		PositionUnit : MpHydAxisCtrlPositionUnitEnum := mpHYDAXIS_MILLIMETER; (*Position unit for the axis.*)
		LoadUnit : MpHydAxisCtrlLoadUnitEnum := mpHYDAXIS_KILONEWTON; (*Load unit for the axis.*)
		SetPosition : STRING[255]; (*String with the name of the process variable for the set position, process variable of datatype LREAL*)
		SetVelocity : STRING[255]; (*String with the name of the process variable for the set velocity, process variable of datatype REAL*)
		SetLoad : STRING[255]; (*String with the name of the process variable for the set load, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlSensorsType : 	STRUCT  (*Sensor signals of the hydraulic axis*)
		Position : MpHydAxisCtrlSensorsPosType; (*Position. Unit: [Position units]*)
		Velocity : MpHydAxisCtrlSensorsVelType; (*Velocity. Unit: [Position units/s]*)
		Pressure1 : MpHydAxisCtrlSensorsPressureType; (*Pressure in cylinder chamber 1. Unit: [bar]*)
		Pressure2 : MpHydAxisCtrlSensorsPressureType; (*Pressure in cylinder chamber 2. Unit: [bar]*)
		Load : MpHydAxisCtrlSensorsLoadType; (*Load. Unit: [Load units]*)
	END_STRUCT;
	MpHydAxisCtrlSensorsPosType : 	STRUCT  (*Position signal*)
		Source : MpHydAxisCtrlSourceEnum := mpHYDAXIS_NOT_USED; (*Position signal source*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the acutal position, process variable of datatype LREAL*)
	END_STRUCT;
	MpHydAxisCtrlSensorsVelType : 	STRUCT  (*Velocity signal*)
		Source : MpHydAxisCtrlSensorsVelEnum := mpHYDAXIS_VEL_NOT_USED; (*Velocity signal source*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the actual velocity, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlSensorsPressureType : 	STRUCT  (*Position signal*)
		Source : MpHydAxisCtrlSensorsPressureEnum := mpHYDAXIS_PRESSURE_NOT_USED; (*Pressure signal source*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the acutal pressure, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlSensorsLoadType : 	STRUCT  (*Load signal*)
		Source : MpHydAxisCtrlSensorsLoadEnum := mpHYDAXIS_LOAD_NOT_USED; (*Load signal source*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the acutal laod, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlActionType : 	STRUCT  (*Defined actions for controlling the hydraulic axis*)
		Name : STRING[80] := 'Action1'; (*Name of the action*)
		PositionControl : MpHydAxisCtrlPosCtrlType; (*Position and velocity control*)
		LoadControl : MpHydAxisCtrlLoadCtrlType; (*Position and velocity control*)
		NumberOfActuators : UINT; (*Number of defined actuators*)
		Actuators : {REDUND_UNREPLICABLE} UDINT; (*Defined actuators for executing this action. Adress of the array of datatype MpHydAxisCtrlActuatorType. The size of the array has to match with 'NumberOfActuators'.*)
	END_STRUCT;
	MpHydAxisCtrlPosCtrlType : 	STRUCT  (*Position and velocity control*)
		Used : MpHydAxisCtrlPosCtrlEnum := mpHYDAXIS_POS_CTRL_NOT_USED; (*Position control used or not used.*)
		Feedforward : MpHydAxisCtrlPosCtrlFFType; (*Velocity feed forward*)
		Controller : MpHydAxisCtrlPosControllerType; (*Position controller*)
	END_STRUCT;
	MpHydAxisCtrlPosCtrlFFType : 	STRUCT  (*Velocity feed forward*)
		Used : MpHydAxisCtrlPosCtrlFFEnum := mpHYDAXIS_FF_NOT_USED; (*Feed forward used or not used*)
		Gain : REAL := 100.0; (*Feed forward gain in %*)
		VelocityFlowConversion : MpHydAxisCtrlPosCtrlFFConvType; (*Feed forward velocity flow conversion*)
	END_STRUCT;
	MpHydAxisCtrlPosCtrlFFConvType : 	STRUCT  (*Feed forward velocity flow conversion*)
		Type : MpHydAxisCtrlPosCtrlFFConvEnum := mpHYDAXIS_FF_DEFAULT; (*Feed forward velocity flow conversion type*)
		EffectiveArea1 : REAL := 160.0; (*Effective area 1 for positive movement in cm^2*)
		EffectiveArea2 : REAL := 80.0; (*Effective area 2 for negative movement in cm^2*)
	END_STRUCT;
	MpHydAxisCtrlPosControllerType : 	STRUCT  (*Position controller*)
		Type : MpHydAxisCtrlPosCtrlTypeEnum := mpHYDAXIS_POS_CTRL_TYPE_NOT_USED; (*Position controller type*)
		Position : MpHydAxisCtrlPosPIDType; (*Position controller PID*)
	END_STRUCT;
	MpHydAxisCtrlPosPIDType : 	STRUCT  (*Position controller PID*)
		ProportionalGain : REAL := 10.0; (*Proportional gain. Unit: [%/Position units]*)
		IntegrationTime : REAL := 0.1; (*Integration time in s*)
		DerivativeTime : REAL := 0.0; (*Derivative time in s*)
		FilterTime : REAL := 0.0; (*Filter time for derivative part in s*)
		MinOutput : REAL := -100.0; (*Minimum controller output in %*)
		MaxOutput : REAL := 100.0; (*Maximum controller output in %*)
		MinIntegrationPart : REAL := -100.0; (*Minimum integration part of the controller output in %*)
		MaxIntegrationPart : REAL := 100.0; (*Maximum integration part of the controller output in %*)
	END_STRUCT;
	MpHydAxisCtrlLoadCtrlType : 	STRUCT  (*Load control*)
		Used : MpHydAxisCtrlLoadCtrlEnum := mpHYDAXIS_LOAD_CTRL_NOT_USED; (*Load control used or not used.*)
		Feedforward : MpHydAxisCtrlLoadCtrlFFType; (*Load control feed forward*)
		Controller : MpHydAxisCtrlLoadControllerType; (*Load  controller*)
	END_STRUCT;
	MpHydAxisCtrlLoadCtrlFFType : 	STRUCT  (*Load control feed forward*)
		Used : MpHydAxisCtrlLoadCtrlFFEnum := mpHYDAXIS_LOAD_FF_NOT_USED; (*Load control feed forward used or not used*)
		AdditionalFlow : STRING[32] := ''; (*String with the name of the process variable for additional flow of load control feed forward in lpm*)
	END_STRUCT;
	MpHydAxisCtrlLoadControllerType : 	STRUCT  (*Load controller*)
		Type : MpHydAxisCtrlLoadConTypeEnum := mpHYDAXIS_LOAD_CON_TYPE_NOT_USED; (*Load controller type*)
		PIDParameters : MpHydAxisCtrlLoadConPIDParType; (*Load controller PID parameters*)
		IntegratorSettings : MpHydAxisCtrlLoadConIntSetType; (*Load controller integrator settings*)
		MinOutput : REAL := -100.0; (*Minimum load controller output in %*)
		MaxOutput : REAL := 100.0; (*Maximum load controller output in %*)
	END_STRUCT;
	MpHydAxisCtrlLoadConPIDParType : 	STRUCT  (*Load controller PID parameters*)
		ProportionalGain : REAL := 0.1; (*Proportional gain. Unit: [%/Load units]*)
		IntegrationTime : REAL := 0.0; (*Integration time in s*)
		DerivativeTime : REAL := 0.0; (*Derivative time in s*)
		FilterTime : REAL := 0.0; (*Filter time for derivative part in s*)
	END_STRUCT;
	MpHydAxisCtrlLoadConIntSetType : 	STRUCT  (*Load controller integrator settings*)
		Type : MpHydAxisCtrlLoadConISetTypeEnum := mpHYDAXIS_LOAD_CON_I_SET_BASIC; (*Load controller integrator settings type*)
		Basic : MpHydAxisCtrlLoadConBasicIType; (*Basic settings for integration part*)
		Advanced : MpHydAxisCtrlLoadConAdvIType; (*Advanced settings for integration part*)
	END_STRUCT;
	MpHydAxisCtrlLoadConBasicIType : 	STRUCT  (*Basic settings for integration part*)
		InitialValue : REAL := -100.0; (*Initial value of the integration part in %*)
		MinIntegrationPart : REAL := -100.0; (*Minimum integration part of the controller output in %*)
		MaxIntegrationPart : REAL := 100.0; (*Maximum integration part of the controller output in %*)
	END_STRUCT;
	MpHydAxisCtrlLoadConAdvIType : 	STRUCT  (*Advanced settings for integration part*)
		InitialValue : STRING[32] := ''; (*String with the name of the process variable for the initial value of the integration part in %*)
		SetInitialValue : STRING[32] := ''; (*String with the name of the process variable to set the integration part to the initial value*)
		HoldIntegration : STRING[32] := ''; (*String with the name of the process variable to freeze the integration part*)
		MinIntegrationPart : STRING[32] := ''; (*String with the name of the process variable for the minimum integration part of the controller output in %*)
		MaxIntegrationPart : STRING[32] := ''; (*String with the name of the process variable for the maximum integration part of the controller output in %*)
	END_STRUCT;
	MpHydAxisCtrlActuatorType : 	STRUCT  (*Defined actuators for executing this action*)
		Type : MpHydAxisCtrlActuatorEnum := mpHYDAXIS_SWITCHING_VALVE; (*Actuator type*)
		SwitchingValve : MpHydAxisCtrlSwValveType; (*Switching valve*)
		Pump : MpHydAxisCtrlPumpType; (*Pump*)
		ProportionalValve : MpHydAxisCtrlPropValveType; (*Proportional valve*)
	END_STRUCT;
	MpHydAxisCtrlSwValveType : 	STRUCT  (*Switching valve*)
		ValveReference : STRING[32]; (*String with name (mapp Link) of linked switching valve component*)
		Actuation : MpHydAxisCtrlSwValveActuatType; (*Switching valve actuation mode*)
	END_STRUCT;
	MpHydAxisCtrlSwValveActuatType : 	STRUCT  (*Switching valve actuation*)
		Type : MpHydAxisCtrlSWValvActuationEnum := mpHYDAXIS_NO_COILS_ENERGIZED; (*Switching valve actuation mode*)
	END_STRUCT;
	MpHydAxisCtrlPumpType : 	STRUCT  (*Pump*)
		PumpReference : STRING[32]; (*String with name (mapp Link) of linked pump component*)
		FlowDirection : MpHydAxisCtrlPumpFlowDirectEnum := mpHYDAXIS_PUMP_DIRECTION_POS; (*Flow direction*)
		Actuation : MpHydAxisCtrlPumpActuationType; (*Pump actuation mode*)
	END_STRUCT;
	MpHydAxisCtrlPumpActuationType : 	STRUCT  (*Pump*)
		Type : MpHydAxisCtrlPumpActuationEnum := mpHYDAXIS_PUMP_FLOW; (*Actuation type of the pump*)
		SetFlowSource : MpHydAxisCtrlPumpSetFlowType; (*Set flow source for the pump*)
		SetPressureSource : MpHydAxisCtrlPumpSetPressureType; (*Set pressure source for the pump*)
		SetSpeedSource : MpHydAxisCtrlPumpSetSpeedType; (*Set speed source for the pump*)
		ControllerParameterSet : USINT := 0; (*Controller parameter set of pressure controller used in this action. The available parameter sets can be found in the configuration of the pump*)
	END_STRUCT;
	MpHydAxisCtrlPumpSetFlowType : 	STRUCT  (*Set flow source for the pump*)
		Type : MpHydAxisCtrlPumpFlowSrcEnum := mpHYDAXIS_PUMP_FLOW_CONSTANT; (*Set flow source*)
		FeedForwardMapping : MpHydAxisCtrlPumpFlowFFMapType; (*Assignment of the feed forward control value.*)
		ControllerMapping : MpHydAxisCtrlPumpFlowCtrlMapType; (*Assignment of the controller value.*)
		Value : REAL := 0.0; (*Constant set flow value in lpm*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the set flow in lpm, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlPumpFlowFFMapType : 	STRUCT  (*Assignment of the feed forward control value.*)
		Type : MpHydAxisCtrlPumpFlowMapEnum := mpHYDAXIS_PUMP_FLOW_KEEP_SIGN; (*Assignment of the feed forward control value.*)
		Usage : REAL := 100.0; (*Gain factor of the feed forward position control value.*)
	END_STRUCT;
	MpHydAxisCtrlPumpFlowCtrlMapType : 	STRUCT  (*Assignment of the controller value.*)
		Type : MpHydAxisCtrlPumpFlowMapEnum := mpHYDAXIS_PUMP_FLOW_KEEP_SIGN; (*Assignment of the controller value.*)
		Usage : REAL := 100.0; (*Gain factor of the position controller value.*)
	END_STRUCT;
	MpHydAxisCtrlPumpSetPressureType : 	STRUCT  (*Set pressure source for the pump*)
		Type : MpHydAxisCtrlPumpPressureSrcEnum := mpHYDAXIS_PUMP_PRESSURE_CONSTANT; (*Set pressure source*)
		Value : REAL := 0.0; (*Constant set pressure value in bar*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the set pressure in bar, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlPumpSetSpeedType : 	STRUCT  (*Source of the set speed value of the pump*)
		Type : MpHydAxisCtrlPumpSpeedSrcEnum := mpHYDAXIS_PUMP_SPEED_CONSTANT; (*Set speed source*)
		Value : REAL := 0.0; (*Constant set speed value in rpm*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the set speed in rpm, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlPropValveType : 	STRUCT  (*Proportional valve*)
		ValveReference : STRING[32]; (*String with name (mapp Link) of linked proportional valve component*)
		Actuation : MpHydAxisCtrlPropValveActType; (*Proportional valve actuation mode*)
	END_STRUCT;
	MpHydAxisCtrlPropValveActType : 	STRUCT  (*Proportional valve*)
		Type : MpHydAxisCtrlPValveActuationEnum := mpHYDAXIS_VALVE_FLOW; (*Actuation type of the proportional valve*)
		SetFlowSource : MpHydAxisCtrlPValveSetFlowType; (*Set flow source of the proportional valve*)
		SetValveSignalSource : MpHydAxisCtrlPValveSetSignalType; (*Set valve signal source of the proportional valve*)
	END_STRUCT;
	MpHydAxisCtrlPValveSetFlowType : 	STRUCT  (*Set flow source of the proportional valve*)
		Type : MpHydAxisCtrlPValveFlowSrcEnum := mpHYDAXIS_VALVE_FLOW_CONSTANT; (*Set flow source*)
		FeedForwardMapping : MpHydAxisCtrlPValveFlowFFMapType; (*Assignment of the feed forward control value.*)
		ControllerMapping : MpHydAxisCtrlPValveFlowCtMapType; (*Assignment of the controller value.*)
		Value : REAL := 0.0; (*Constant set flow value in lpm*)
		PVmapping : STRING[255]; (*String with the name of the process variable for the set flow in lpm, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlPValveFlowFFMapType : 	STRUCT  (*Assignment of the feed forward control value.*)
		Type : MpHydAxisCtrlPValveFlowMapEnum := mpHYDAXIS_VALVE_FLOW_KEEP_SIGN; (*Assignment of the feed forward control value.*)
		Usage : REAL := 100.0; (*Gain factor of the feed forward position control value.*)
		UsageLoadCtrl : REAL := 100.0; (*Gain factor of the feed forward load control value.*)
	END_STRUCT;
	MpHydAxisCtrlPValveFlowCtMapType : 	STRUCT  (*Assignment of the controller value.*)
		Type : MpHydAxisCtrlPValveFlowMapEnum := mpHYDAXIS_VALVE_FLOW_KEEP_SIGN; (*Assignment of the controller value.*)
		Usage : REAL := 100.0; (*Gain factor of the position controller value.*)
		UsageLoadCtrl : REAL := 100.0; (*Gain factor of the load controller value.*)
	END_STRUCT;
	MpHydAxisCtrlPValveSetSignalType : 	STRUCT  (*Set valve signal source of the proportional valve*)
		Type : MpHydAxisCtrlPValveSignalSrcEnum := mpHYDAXIS_VALVE_SIGNAL_CONSTANT; (*Set valve signal source*)
		Value : REAL := 0.0; (*Constant valve signal value in %*)
		PVmapping : STRING[255]; (*String with the name of the process variable valve signal in %, process variable of datatype REAL*)
	END_STRUCT;
	MpHydAxisCtrlInputSignalsType : 	STRUCT  (*Hydraulic axis input signals configuration*)
		Action : STRING[255]; (*String with the name of the process variable to set the action, process variable of datatype USINT*)
	END_STRUCT;
	MpHydAxisCtrlTypeEnum : 
		( (*Hydraulic axis type*)
		mpHYDAXIS_DIFFERENTIAL_CYLINDER := 0 (*Differential cylinder*)
		);
	MpHydAxisCtrlProfileGenTypeEnum : 
		( (*Profile generation*)
		mpHYDAXIS_APPLICATION := 0 (*Application*)
		);
	MpHydAxisCtrlPositionUnitEnum : 
		( (*Position unit*)
		mpHYDAXIS_MILLIMETER := 0 (*Millimeter*)
		);
	MpHydAxisCtrlLoadUnitEnum : 
		( (*Load unit*)
		mpHYDAXIS_KILONEWTON := 0 (*Kilonewton*)
		);
	MpHydAxisCtrlSensorsVelEnum : 
		( (*Velocity signal source*)
		mpHYDAXIS_VEL_NOT_USED := 0, (*Not used*)
		mpHYDAXIS_VEL_VARIABLE_REAL := 1 (*Variable REAL*)
		);
	MpHydAxisCtrlSensorsPressureEnum : 
		( (*Pressure signal source*)
		mpHYDAXIS_PRESSURE_NOT_USED := 0, (*Not used*)
		mpHYDAXIS_PRESSURE_VARIABLE_REAL := 1 (*Variable REAL*)
		);
	MpHydAxisCtrlSensorsLoadEnum : 
		( (*Load signal source*)
		mpHYDAXIS_LOAD_NOT_USED := 0, (*Not used*)
		mpHYDAXIS_LOAD_VARIABLE_REAL := 1, (*Variable REAL*)
		mpHYDAXIS_LOAD_CALCULATION := 2 (*Calculate from pressure signals *)
		);
	MpHydAxisCtrlPosCtrlEnum : 
		( (*Position control*)
		mpHYDAXIS_POS_CTRL_NOT_USED := 0, (*Position control not used*)
		mpHYDAXIS_POS_CTRL_USED := 1 (*Position control used*)
		);
	MpHydAxisCtrlPosCtrlTypeEnum : 
		( (*Position controller type*)
		mpHYDAXIS_POS_CTRL_TYPE_NOT_USED := 0, (*Position controller not used*)
		mpHYDAXIS_POS_CTRL_TYPE_POS := 1 (*Position controller*)
		);
	MpHydAxisCtrlPosCtrlFFEnum : 
		( (*Feed forward*)
		mpHYDAXIS_FF_NOT_USED := 0, (*Feed forward not used*)
		mpHYDAXIS_FF_USED := 1 (*Feed forward used*)
		);
	MpHydAxisCtrlPosCtrlFFConvEnum : 
		( (*Feed forward velocity flow conversion*)
		mpHYDAXIS_FF_DEFAULT := 0, (*Default velocity flow conversion*)
		mpHYDAXIS_FF_USER_DEFINED := 1 (*User defined velocity flow conversion*)
		);
	MpHydAxisCtrlLoadCtrlEnum : 
		( (*Load control*)
		mpHYDAXIS_LOAD_CTRL_NOT_USED := 0, (*Load control not used*)
		mpHYDAXIS_LOAD_CTRL_USED := 1 (*Load control used*)
		);
	MpHydAxisCtrlLoadCtrlFFEnum : 
		( (*Load control feed forward*)
		mpHYDAXIS_LOAD_FF_NOT_USED := 0, (*Feed forward of load control not used*)
		mpHYDAXIS_LOAD_FF_USED := 1 (*Feed forward of load control used*)
		);
	MpHydAxisCtrlLoadConTypeEnum : 
		( (*Load controller type*)
		mpHYDAXIS_LOAD_CON_TYPE_NOT_USED := 0, (*Load controller not used*)
		mpHYDAXIS_LOAD_CON_TYPE_PID := 1 (*PID load controller*)
		);
	MpHydAxisCtrlLoadConISetTypeEnum : 
		( (*Load controller integrator settings type*)
		mpHYDAXIS_LOAD_CON_I_SET_BASIC := 0, (*Basic settings for integration part*)
		mpHYDAXIS_LOAD_CON_I_SET_ADV := 1 (*Advanced settings for integration part*)
		);
	MpHydAxisCtrlPumpFlowDirectEnum : 
		( (*Flow direction*)
		mpHYDAXIS_PUMP_DIRECTION_POS := 0, (*Positive only*)
		mpHYDAXIS_PUMP_DIRECTION_POS_NEG := 1 (*Positive and negative*)
		);
	MpHydAxisCtrlPumpFlowMapEnum : 
		( (*Assignment of the control value*)
		mpHYDAXIS_PUMP_FLOW_KEEP_SIGN := 0, (*Keep the sign of the control value*)
		mpHYDAXIS_PUMP_FLOW_INVERT_SIGN := 1 (*Invert the sign of the control value*)
		);
	MpHydAxisCtrlPumpActuationEnum : 
		( (*Pump actuation mode*)
		mpHYDAXIS_PUMP_FLOW := 0, (*Flow*)
		mpHYDAXIS_PUMP_PRESSURE_FLOW := 1, (*Pressure/Flow*)
		mpHYDAXIS_PUMP_SPEED := 2, (*Speed*)
		mpHYDAXIS_PUMP_PRESSURE_SPEED := 3 (*Pressure/Speed*)
		);
	MpHydAxisCtrlPumpFlowSrcEnum : 
		( (*Actuator flow source*)
		mpHYDAXIS_PUMP_FLOW_CONTROL := 0, (*Position control*)
		mpHYDAXIS_PUMP_FLOW_CONSTANT := 1, (*Constant*)
		mpHYDAXIS_PUMP_FLOW_VARIABLE := 2 (*Process variable*)
		);
	MpHydAxisCtrlPumpSpeedSrcEnum : 
		( (*Actuator speed source*)
		mpHYDAXIS_PUMP_SPEED_CONSTANT := 0, (*Constant*)
		mpHYDAXIS_PUMP_SPEED_VARIABLE := 1 (*Process variable*)
		);
	MpHydAxisCtrlPumpPressureSrcEnum : 
		( (*Actuator pressure source*)
		mpHYDAXIS_PUMP_PRESSURE_CONSTANT := 0, (*Constant*)
		mpHYDAXIS_PUMP_PRESSURE_VARIABLE := 1 (*Process variable*)
		);
	MpHydAxisCtrlSWValvActuationEnum : 
		( (*Switching valve actuation mode*)
		mpHYDAXIS_NO_COILS_ENERGIZED := 0, (*No coils are energized*)
		mpHYDAXIS_COIL_1_ENERGIZED := 1, (*Energizes coil 1*)
		mpHYDAXIS_COIL_2_ENERGIZED := 2, (*Energizes coil 2*)
		mpHYDAXIS_COIL_1_AND_2_ENERGIZED := 3 (*Energizes coil 1 and coil 2*)
		);
	MpHydAxisCtrlPValveActuationEnum : 
		( (*Proportional valve actuation mode*)
		mpHYDAXIS_VALVE_FLOW := 0, (*Flow*)
		mpHYDAXIS_VALVE_SIGNAL := 2 (*Valve signal*)
		);
	MpHydAxisCtrlPValveFlowSrcEnum : 
		( (*Actuator flow source*)
		mpHYDAXIS_VALVE_FLOW_CONTROL := 0, (*Position control*)
		mpHYDAXIS_VALVE_FLOW_CONSTANT := 1, (*Constant*)
		mpHYDAXIS_VALVE_FLOW_VARIABLE := 2, (*Process variable*)
		mpHYDAXIS_VALVE_FLOW_LOAD_CTRL := 3, (*Load control*)
		mpHYDAXIS_VALVE_FLOW_ALT_CTRL := 4 (*Alternating position/load control*)
		);
	MpHydAxisCtrlPValveFlowMapEnum : 
		( (*Assignment of the control value.*)
		mpHYDAXIS_VALVE_FLOW_KEEP_SIGN := 0, (*Keep the sign of the control value*)
		mpHYDAXIS_VALVE_FLOW_INVERT_SIGN := 1 (*Invert the sign of the control value*)
		);
	MpHydAxisCtrlPValveSignalSrcEnum : 
		( (*Actuator signal source*)
		mpHYDAXIS_VALVE_SIGNAL_CONSTANT := 0, (*Constant*)
		mpHYDAXIS_VALVE_SIGNAL_VARIABLE := 1 (*Process variable*)
		);
	MpHydAxisCtrlActuatorEnum : 
		( (*Actuator type*)
		mpHYDAXIS_SWITCHING_VALVE := 0, (*Switching valve*)
		mpHYDAXIS_PUMP := 1, (*Pump*)
		mpHYDAXIS_PROPORTIONAL_VALVE := 2 (*Proportional valve*)
		);
END_TYPE

(************************************************ Config of hydraulic axis controller *****************************************************)
