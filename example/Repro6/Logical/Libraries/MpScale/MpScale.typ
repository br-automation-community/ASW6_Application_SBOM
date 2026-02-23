(*Configuration structure*)

TYPE
	MpScalePotiConfigType : 	STRUCT  (*Potentiometer scaling configuration*)
		MinAnalogValue : INT := -32768; (*Minimum analog value for scaling*)
		MaxAnalogValue : INT := 32767; (*Maximum analog value for scaling*)
		MinPosition : REAL := 0; (*Minimum position (defining point with minimum analog value)*)
		MaxPosition : REAL := 200; (*Maximum position (defining point with maximum analog value)*)
		InputTolerance : INT := 10; (*Tolerance band for input monitoring during calibration (value must stay within this limit)*)
		ToleranceTime : REAL := 0.5; (*Tolerance time for input monitoring during calibration [s]*)
	END_STRUCT;
	MpScaleABRConfigType : 	STRUCT  (*AB(R) encoder scaling configuration*)
		ReferenceImpulseNumber : UDINT := 1000; (*Number of encoder impulses acquired through the reference distance*)
		ReferenceDistance : REAL := 5; (*Physical distance used as reference [mm]*)
		OffsetPosition : REAL := 0; (*Offset position for referencing [mm]*)
		PositionDataType : MpScaleABRPositionTypeEnum := mpSCALE_SOURCE_INT; (*Input position data type selection*)
		InputTolerance : UDINT := 10; (*Tolerance band for input monitoring during calibration (value must stay within this limit)*)
		ToleranceTime : REAL := 0.5; (*Tolerance time for input monitoring during calibration [s]*)
	END_STRUCT;
	MpScalePulseConfigType : 	STRUCT  (*Pulse scaling configuration*)
		AbsoluteMeasurement : BOOL := FALSE; (*Use absolute measurement if this is set to TRUE, otherwise relative measurement is done*)
		PulsesPerRotation : UINT := 10; (*Number of pulses per one rotation*)
		DistancePerRotation : REAL := 20; (*Distance per one rotation [mm]*)
		OffsetPosition : REAL := 0; (*Offset position for referencing [mm]*)
		InputSource : MpScalePulseInputSourceEnum := mpSCALE_SOURCE_PULSE; (*Input source selection*)
		MinPosition : REAL := 0; (*Minimum postion*)
		MaxPosition : REAL := 200; (*Maximum position*)
	END_STRUCT;
	MpScalePumpConfigType : 	STRUCT  (*Pump scaling configuration*)
		Name : STRING[100]; (*Descriptive name for scaling (e.g. Injection Piston)*)
		PositiveDirection : MpScalePumpDirectionType; (*Settings for positive direction*)
		NegativeDirection : MpScalePumpDirectionType; (*Settings for negative direction*)
	END_STRUCT;
	MpScalePumpDirectionType : 	STRUCT  (*Flow settings for each direction*)
		MinFlow : REAL := 0.0; (*Minimum flow of the pump [lpm]*)
		MaxFlow : REAL := 100.0; (*Maximum flow of the pump [lpm]*)
		FlowOffset : REAL := 0.0; (*Flow offset for any movement [lpm]*)
		MaxVelocity : REAL := 100.0; (*Maximum speed of the according axis in the specified direction [mm/s]*)
	END_STRUCT;
	MpScalePressureConfigType : 	STRUCT  (*Pressure scaling configuration*)
		FilterTime : REAL := 0.1; (*Filter time [s]*)
		MinAnalogValue : INT := 0; (*Minimum analog value for scaling*)
		MaxAnalogValue : INT := 32767; (*Maximum analog value for scaling*)
		MinPressure : REAL := 0.0; (*Minimum pressure (defining point with minimum analog value) [bar]*)
		MaxPressure : REAL := 250.0; (*Maximum pressure (defining point with maximum analog value) [bar]*)
	END_STRUCT;
END_TYPE

(*Additional info structure*)

TYPE
	MpScalePotiInfoType : 	STRUCT  (*Scale poti info structure*)
		OldCalibrationValueNegative : INT; (*Old calibration value for negative direction (analog minimum)*)
		NewCalibrationValueNegative : INT; (*New calibration value for negative direction (will be saved on command)*)
		OldCalibrationValuePositive : INT; (*Old calibration value for positive direction (analog minimum)*)
		NewCalibrationValuePositive : INT; (*New calibration value for positive direction (will be saved on command)*)
		Diag : MpScaleDiagExtType; (*Diagnosis information*)
	END_STRUCT;
	MpScaleABRInfoType : 	STRUCT  (*Scale ABR info structure*)
		Diag : MpScaleDiagExtType; (*Diagnosis information*)
	END_STRUCT;
	MpScalePulseInfoType : 	STRUCT  (*Scale pulse info structure*)
		Diag : MpScaleDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpScalePumpInfoType : 	STRUCT  (*Scale pump info structure*)
		Diag : MpScaleDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpScaleInfoType : 	STRUCT  (*Scale pulse config info structure*)
		Diag : MpScaleDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpScaleDiagType : 	STRUCT  (*MpScale diagnosis information*)
		StatusID : MpScaleStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpScaleDiagExtType : 	STRUCT  (*MpScale diagnosis information*)
		StatusID : MpScaleStatusIDType; (*Segmented StatusID output*)
		ExecutingCommand : MpScaleExecutingCmdEnum; (*Command currently being executed*)
	END_STRUCT;
	MpScaleStatusIDType : 	STRUCT  (*MpScale status ID information*)
		ID : MpScaleErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
	MpScaleExecutingCmdEnum : 
		(
		mpSCALE_CMD_IDLE := 0, (*No command is active*)
		mpSCALE_CMD_CALIBRATION_NEG := 1, (*Calibration in negative direction is active*)
		mpSCALE_CMD_CALIBRATION_POS := 2, (*Calibration in positive direction is active*)
		mpSCALE_CMD_CALIBRATION := 3 (*Calibration in positive direction is active*)
		);
	MpScalePulseInputSourceEnum : 
		( (*Scale Pulse input source *)
		mpSCALE_SOURCE_PULSE := 0, (*Pulse source from digital input *)
		mpSCALE_SOURCE_COUNTER_2BYTES := 1, (*Pulse source from 2 bytes counter input*)
		mpSCALE_SOURCE_COUNTER_4BYTES := 2 (*Pulse source from 4 bytes counter input*)
		);
	MpScalePulseDirectionEnum : 
		( (*Scale pulse counting direction*)
		mpSCALE_PULSE_UNDEFINED := 0, (*undefined counting direction*)
		mpSCALE_PULSE_POSITIVE := 1, (*Positive counting direction*)
		mpSCALE_PULSE_NEGATIVE := 2 (*Negative counting direction*)
		);
	MpScaleABRPositionTypeEnum : 
		( (*Scale ABR position input source*)
		mpSCALE_SOURCE_INT := 0, (*Source signal is read from INT position*)
		mpSCALE_SOURCE_DINT := 1 (*Source signal is read from DINT position*)
		);
END_TYPE
