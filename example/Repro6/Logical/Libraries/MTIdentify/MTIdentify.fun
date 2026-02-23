
{REDUND_OK} FUNCTION_BLOCK MTIdentifyTransferFcn (*This function block implements a recursive LSQ identification to identify the transfer function of a dynamic system.*) (* $GROUP=mapp Control,$CAT=Control Tools,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpControlTools.png *)
	VAR_INPUT
		Enable : BOOL; (*Enable function block.*) (* *) (*#PAR#*)
		Parameters : MTIdentifyTransferFcnParType; (*Parameters for indentification*) (* *) (*#PAR#*)
		Mode : MTIdentifyTransferFcnModeEnum; (*Mode for identification*) (* *) (*#PAR#OPT#*)
		Update : BOOL; (*Parameters update trigger.*) (* *) (*#PAR#*)
		SystemInput : REAL; (*Input signal for unknown system.*) (* *) (*#CYC#*)
		SystemOutput : REAL; (*Output signal of unknown system.*) (* *) (*#CYC#*)
		OrderNumerator : USINT; (*System order of the numerator.*) (* *) (*#CMD#*)
		OrderDenominator : USINT; (*System order of the denominator.*) (* *) (*#CMD#*)
		Identify : BOOL; (*Start and stop identification.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update is sucessful.*) (* *) (*#PAR#*)
		SystemCheckActive : BOOL; (*SystemCheck is active.*) (* *) (*#CMD#*)
		IdentificationActive : BOOL; (*IdentificationActive denotes that the FB is identifying but can be stopped by the user any time.*) (* *) (*#CMD#*)
		IdentificationValid : BOOL; (*IdentificationValid recommends to use the identified data from up to now or even continue with the identification.*) (* *) (*#CMD#*)
		Numerator : ARRAY[0..4] OF REAL; (*Coefficients of numerator [b0, b1, b2, ... bm].*) (* *) (*#CMD#*)
		Denominator : ARRAY[0..4] OF REAL; (*Coefficients of denominator [a0, a1, a2, ... an].*) (* *) (*#CMD#*)
		Quality : REAL; (*Quality of the identified result.*) (* *) (*#CMD#*)
		EstimationDeviation : REAL; (*Difference between the estimated and real plant output*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : MTIdentifyTFInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
