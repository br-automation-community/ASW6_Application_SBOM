
{REDUND_OK} FUNCTION_BLOCK MTFilterBandPass (*Band-pass filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		Type : MTFilterTypeEnum; (*Filter type. Valid value range: mtBESSEL, mtBUTTERWORTH*)
		Order : USINT; (*Filter order. Valid value range: {1,2}.*)
		CenterFrequency : REAL; (*Center frequency. Unit: [Hz]. Valid value range: 0 < CenterFrequency < Sampling frequency/2. Sampling frequency = 1/task cycle time.*)
		Bandwidth : REAL; (*Bandwidth. Unit: [Hz]. Valid value range: 0 < Bandwidth < 2·CenterFrequency.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterBandPassInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterBandStop (*Band-stop filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		Type : MTFilterTypeEnum; (*Filter type. Valid value range: mtBESSEL, mtBUTTERWORTH*)
		Order : USINT; (*Filter order. Valid value range: {1,2}.*)
		CenterFrequency : REAL; (*Center frequency. Unit: [Hz]. Valid value range: 0 < CenterFrequency < Sampling frequency/2. Sampling frequency = 1/task cycle time.*)
		Bandwidth : REAL; (*Bandwidth. Unit: [Hz]. Valid value range: 0 < Bandwidth < 2·CenterFrequency.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterBandStopInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterBiQuad (*Biquad filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		CenterFrequencyNum : REAL; (*Filter frequency numerator. Unit: [Hz]. Valid value range: 0 < FrequencyNumerator < 0.5·Sampling frequency. Sampling frequency = 1/task cycle time.*)
		DampingRatioNum : REAL; (*Damping numerator. Valid value range: 0 = DampingRatioNumerator = 1.*)
		CenterFrequencyDen : REAL; (*Filter frequency denominator. Unit: [Hz]. Valid value range: 0 < FrequencyDenominator <  0.5·Sampling frequency. Sampling frequency = 1/task cycle time.*)
		DampingRatioDen : REAL; (*Damping denominator. Valid value range: 0 = DampingRatioDenominator = 1*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterBiQuadInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterHighPass (*High-pass filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		Type : MTFilterTypeEnum; (*Filter type. Valid value range: mtBESSEL, mtBUTTERWORTH*)
		Order : USINT; (*Filter order. Valid value range: {1,2,..,5}.*)
		CutOffFrequency : REAL; (*Cut-off frequency. Unit: [Hz]. Valid value range: 0 < CutOffFrequency < Sampling frequency/2. Sampling frequency = 1/task cycle time.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterHighPassInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterLowPass (*Low-pass filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		Type : MTFilterTypeEnum; (*Filter type. Valid value range: mtBESSEL, mtBUTTERWORTH*)
		Order : USINT; (*Filter order. Valid value range: {1,2,..,5}.*)
		CutOffFrequency : REAL; (*Cut-off frequency. Unit: [Hz]. Valid value range: 0 < CutOffFrequency < Sampling frequency/2. Sampling frequency = 1/task cycle time.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterLowPassInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} FUNCTION_BLOCK MTFilterMovingAverage (*Moving average filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		WindowLength : UINT; (*Length of the moving view window. Numbers of values to be averaged Valid value range: 0 < WindowLength < 10000.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Floating average value.*)
	END_VAR
	VAR
		Internal : MTFilterMovingAvgInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterNotch (*Notch filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block.*)
		CenterFrequency : REAL; (*Center frequency. Unit: [Hz]. Valid value range: 0 < CenterFrequency < Sampling frequency/2. Sampling frequency = 1/task cycle time.*)
		Bandwidth : REAL; (*Bandwidth. Unit: [Hz]. Valid value range: 0 < Bandwidth < 2·CenterFrequency.*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*)
		In : REAL; (*Input value.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*)
		Active : BOOL; (*Function block is active.*)
		Error : BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : BOOL; (*Update is done.*)
		Out : REAL; (*Output value.*)
		SystemReference : {REDUND_UNREPLICABLE} UDINT; (*System reference.*)
	END_VAR
	VAR
		Internal : MTFilterNotchInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTFilterKalman (*Kalman filter.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enable function block.*) (* *) (*#PAR#*)
		Numerator : ARRAY[0..4] OF REAL; (*Numerator coefficients [b0, b1, b2, ..., bn]*) (* *) (*#PAR#*)
		Denominator : ARRAY[0..4] OF REAL; (*Denominator coefficients [a0, a1, a2, ..., an]*) (* *) (*#PAR#*)
		NoiseReduction : REAL := 2; (*Noise reduction factor.*) (* *) (*#PAR#OPT#*)
		DisturbanceModel : MTFilterKalmanDisturbanceType; (*Disturbance model mode.*) (* *) (*#PAR#OPT#*)
		Update : BOOL; (*Parameters update trigger.*) (* *) (*#PAR#*)
		SystemInput : REAL; (*Input signal of the system.*) (* *) (*#CYC#*)
		SystemOutput : REAL; (*Output signal of the system.*) (* *) (*#CYC#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update is sucessful.*) (* *) (*#PAR#*)
		FilteredOutput : ARRAY[0..1] OF REAL; (*Filtered output signal of the system and the first derivative.*) (* *) (*#CYC#*)
		Disturbance : REAL; (*Filtered Disturbance.*) (* *) (*#CYC##OPT#*)
	END_VAR
	VAR
		Internal : MTFilterKalmanInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
