(*Configuration structure*)

TYPE
	MpPumpBasicConfigType : 	STRUCT  (*PumpBasic configuration parameters*)
		MaxFlowIn : REAL := 100.0; (*Maximum flow representing 100% input value [lpm]*)
		MaxPressureIn : REAL := 100.0; (*Maximum pressure representing 100% input value [bar]*)
		MinFlowOut : REAL := 0.0; (*Output value minimum in percentage of int range (-100%...100% = -32768...32767)*)
		MaxFlowOut : REAL := 100.0; (*Output value maximum in percentage of int range (-100%...100% = -32768...32767)*)
		MinPressureOut : REAL := 0.0; (*Output value minimum in percentage of int range (-100%...100% = -32768...32767)*)
		MaxPressureOut : REAL := 100.0; (*Output value maximum in percentage of int range (-100%...100% = -32768...32767)*)
		Linearization : MpPumpBasicLinearizationType; (*Configuration parameters for linearization*)
	END_STRUCT;
	MpPumpBasicLinearizationType : 	STRUCT  (*PumpBasic configuration parameters*)
		Mode : MpPumpBasicLinearizationModeEnum; (*Llinearization functionality type*)
		FlowTable : MpPumpBasicTableType; (*Configuration parameters for flow linearization*)
		PressureTable : MpPumpBasicTableType; (*Configuration parameters for pressure linearization*)
		AutoSettings : MpPumpBasicAutoType; (*Configuration parameters for automatic linearization*)
	END_STRUCT;
	MpPumpBasicTableType : 	STRUCT  (*PumpBasic configuration input and output values used for linearization*)
		LinearizationCurveX : ARRAY[0..49]OF REAL; (*Values used for linearization representing input (x axis) [%]*)
		LinearizationCurveY : ARRAY[0..49]OF REAL; (*Values used for linearization representing output (y axis) [%]*)
	END_STRUCT;
	MpPumpBasicAutoType : 	STRUCT  (*PumpBasic configuration for automatic pump linearization measurement*)
		Flow : MpPumpBasicAutoSetType; (*Settings for automatic flow measurement*)
		Pressure : MpPumpBasicAutoSetType; (*Settings for automatic pressure measurement*)
	END_STRUCT;
	MpPumpBasicAutoSetType : 	STRUCT 
		MinChange : REAL := 1.0; (*Minimal change in physical unit to find minimum/offset*)
		StepSizeToFindMinChange : UINT := 128; (*Step size to increment integer output value during minimum/offset search*)
		StepSizeToFindMax : UINT := 256; (*Step size to increment integer output value during maximum search*)
		NumberOfValues : USINT := 10; (*Number of values which will be measured (2..50)*)
	END_STRUCT;
END_TYPE

(*Additional info structure*)

TYPE
	MpPumpBasicInfoType : 	STRUCT  (*PumpBasic info structure*)
		Mode : MpPumpBasicInfoModeEnum; (*Indicates current functionality*)
		Measurement : MpPumpBasicInfoMeasurementEnum; (*Indicates measurement status*)
		Diag : MpPumpDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpPumpInfoType : 	STRUCT  (*PumpBasicConfig info structure*)
		Diag : MpPumpDiagType;
	END_STRUCT;
	MpPumpDiagType : 	STRUCT  (*MpPump diagnosis information*)
		StatusID : MpPumpStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpPumpStatusIDType : 	STRUCT  (*MpPump status ID information*)
		ID : MpPumpErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
	MpPumpBasicInfoModeEnum : 
		( (*PumpBasic info mode providing current functionality information*)
		mpPUMP_SCALING := 0, (*Scaling functionality active (linearization off)*)
		mpPUMP_LINEARIZING := 1, (*Linearizing functionality active*)
		mpPUMP_PRESSURE_MEASUREMENT := 2, (*Pressure measurement active*)
		mpPUMP_FLOW_MEASUREMENT := 3 (*Flow measurement active*)
		);
	MpPumpBasicLinearizationModeEnum : 
		( (*PumpBasic linearization mode used*)
		mpPUMP_LINEARIZATION_OFF := 0,
		mpPUMP_LINEARIZATION_MANUAL := 1,
		mpPUMP_LINEARIZATION_AUTO := 2
		);
	MpPumpBasicInfoMeasurementEnum : 
		( (*PumpBasic measurement info providing current measurement step information*)
		mpPUMP_MEASUREMENT_IDLE := 0, (*Waiting state*)
		mpPUMP_MEASUREMENT_SEARCH_MIN := 1, (*Searching for minimum (first point)*)
		mpPUMP_MEASUREMENT_SEARCH_MAX := 2, (*Searching for maximum (last point)*)
		mpPUMP_MEASUREMENT_SEARCH_POINTS := 3 (*Measuring table values*)
		);
END_TYPE
