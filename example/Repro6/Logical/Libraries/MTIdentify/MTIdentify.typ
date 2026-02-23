(*Types*)

TYPE
	MTIdentifyTransferFcnParType : 	STRUCT  (*Parameter structur of MTIdentifyTransferFcn*)
		WeightingFactor : REAL := 1.0; (*Factor that decreases the weighting of older values. Should be in the range 0.9 ... 1.0.*)
		SystemCheckTime : REAL := 1.0; (*Settling time for SystemCheck phase.  Unit: [s]. 
SystemCheckTime = 0 disables the SystemCheck phase.*)
		FilterTime : REAL := 0.02; (*FilterTime.  Unit: [s].
Recommended Value: FilterTime >= 10*CycleTime.*)
		DownSamplingFactor : UINT := 1; (*Factor for down sampling.*)
	END_STRUCT;
END_TYPE

(*Enums*)

TYPE
	MTIdentifyTransferFcnModeEnum : 
		( (*Transfer function mode.*)
		mtIDENTIFY_CONTINUOUS_TF := 0 (*Continuous transfer function.*)
		);
END_TYPE

(*Internal Types*)

TYPE
	MTIdentifyTFInternalType : 	STRUCT  (*Internal variables of function block MTIdentifyTransferFcn.*)
		CycleTime : REAL; (*Task cycle time. Unit: [s].*)
		Parameters : MTIdentifyTransferFcnParType; (*Data for internal use.*)
		InhibitUpdate : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		IdentifyOld : BOOL; (*Data for internal use.*)
		OrderNumerator : USINT; (*Data for internal use.*)
		OrderDenominator : USINT; (*Data for internal use.*)
		MainState : USINT; (*Data for internal use.*)
		SystemCheck : MTIdentifyTFSystemCheckIntType; (*Data for internal use.*)
		IdentificationCounter : UDINT; (*Data for internal use.*)
		uOffset : LREAL; (*Data for internal use.*)
		yOffset : LREAL; (*Data for internal use.*)
		yOld : LREAL; (*Data for internal use.*)
		uFilt : ARRAY[0..4]OF LREAL; (*Data for internal use. (uFilt, uFilt2, uFilt3, uFilt4, uFilt5)*)
		yFilt : ARRAY[0..4]OF LREAL; (*Data for internal use. (yFilt, yFilt2, yFilt3, yFilt4, yFilt5)*)
		uDiff : ARRAY[0..4]OF LREAL; (*Data for internal use. (u, u_p, u_pp, u_p3, u_p4)*)
		yDiff : ARRAY[0..4]OF LREAL; (*Data for internal use. (y, y_p, y_pp, y_p3, y_p4)*)
		uDiffOld : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		yDiffOld : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		uInt : ARRAY[0..4]OF LREAL; (*Data for internal use. (u, u_Int, u_Int2, u_Int3, u_Int4)*)
		yInt : ARRAY[0..4]OF LREAL; (*Data for internal use. (y, y_Int, y_Int2, y_Int3, y_Int4)*)
		yStatistics : MTIdentifyStatisticsInternalType; (*Statistic evaluation of estimation deviation.*)
		ModifiedSystemOutputSignal : BOOL; (*there was a modification on the system output signal.*)
		ApproachCompareQuality : LREAL; (*Data for internal use.*)
		BestIdentificationResult : MTIdentifyBestResultInternalEnum; (*Data for internal use.*)
		DataDiffApproach : MTIdentifyTFIdentInternalType; (*Data for internal use.*)
		DataIntApproach : MTIdentifyTFIdentInternalType; (*Data for internal use.*)
	END_STRUCT;
	MTIdentifyTFSystemCheckIntType : 	STRUCT  (*Internal structure.*)
		uScan : MTIdentifyTFSignalScanIntType; (*Analysis of the signal u.*)
		yScan : MTIdentifyTFSignalScanIntType; (*Analysis of the signal y.*)
		Counter : UDINT; (*Data for internal use.*)
		ElapsedTime : REAL; (*Data for internal use.*)
		Status : MTIdentifySystemCheckInternEnum; (*Data for internal use.*)
	END_STRUCT;
	MTIdentifyTFSignalScanIntType : 	STRUCT  (*Internal structure.*)
		MinValue : LREAL; (*Minimum value during system check.*)
		MeanValue : LREAL; (*Mean value during system check.*)
		MaxValue : LREAL; (*Maximum value during system check.*)
	END_STRUCT;
	MTIdentifyTFIdentInternalType : 	STRUCT  (*Internal structure.*)
		PMatrix : ARRAY[0..80]OF LREAL; (*Matrix for the recursive LSQ - algorithm.*)
		DataVector : ARRAY[0..8]OF LREAL; (*Data vector which contains the current input and output value of the plant as well as past values to compute the recursive LSQ algorithm.*)
		ParameterVector : ARRAY[0..8]OF LREAL; (*Estimated coefficients of the transfer function.*)
		NumberOfParameters : USINT; (*Number of parameters to be estimated.*)
		Samples : UDINT; (*Number of samples of the LSQ algorithm up to now.*)
		Numerator : ARRAY[0..4]OF LREAL; (*Coefficients of numerator [b0, b1, b2, ... bm]. Maximum numerator order m = 5.*)
		Denominator : ARRAY[0..4]OF LREAL; (*Estimated coefficients of the transfer function.*)
		e : LREAL; (*Estimation deviation.*)
		eStatistics : MTIdentifyStatisticsInternalType; (*Statistic evaluation of estimation deviation.*)
		eQuality : LREAL; (*Estimation quality.*)
		IdentificationValid : BOOL; (*IdentificationValid recommends to use the identified data from up to now or even continue with the identification.*)
		tmpTimer : LREAL; (*Data for internal use.*)
		parSum : LREAL; (*Data for internal use.*)
		parSumStatistics : MTIdentifyStatisticsInternalType; (*Statistic evaluation of parSum.*)
		parQuality : LREAL; (*Parameter quality.*)
	END_STRUCT;
	MTIdentifyStatisticsInternalType : 	STRUCT  (*Internal structure for signal statistics.*)
		N : UDINT; (*Number of values of xi.*)
		Sum : LREAL; (*Sum of xi.*)
		Sum2 : LREAL; (*Sum of xi^2 (=Sum(xi^2)).*)
		Mean : LREAL; (*Mean of xi.*)
		Mean2 : LREAL; (*Mean squaer of xi (=Mean(xi^2)).*)
		RMS : LREAL; (*Root Mean Square of xi.*)
		Variance : LREAL; (*Variance of xi.*)
		StdDeviation : LREAL; (*Standard deviation of xi.*)
		idx : UINT; (*actual array index.*)
		Array : ARRAY[0..499]OF LREAL; (*Array with the last 500 values.*)
	END_STRUCT;
END_TYPE

(*Internal Enums*)

TYPE
	MTIdentifyBestResultInternalEnum : 
		( (*Internal Enum: which method gives the best result*)
		mtIDENTIFY_NO_INFO, (*unknown.*)
		mtIDENTIFY_DIFF_APPROACH, (*differential approach*)
		mtIDENTIFY_INT_APPROACH (*integral approach*)
		);
	MTIdentifySystemCheckInternEnum : 
		( (*Internal Enum: which method gives the best result*)
		mtIDENTIFY_SYSTEM_NOT_CHECKED, (*unknown.*)
		mtIDENTIFY_SYSTEMCHECK_PASSED, (*differential approach*)
		mtIDENTIFY_SYSTEMCHECK_FAILED (*integral approach*)
		);
END_TYPE
