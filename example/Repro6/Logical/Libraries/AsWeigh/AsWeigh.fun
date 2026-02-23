                                                                      
{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK WGHscale					(*scales the raw value of a strain gauge module and records the standardization line and taring*)
	VAR_INPUT
		enable	:BOOL;					(*enables execution*)
		doTare	:BOOL;					(*positive edge on this input starts taring*)
		doStandardize1	:BOOL;			(*positive edge on this input starts recording the first reference point of the standardization line*)
		doStandardize2	:BOOL;			(*positive edge on this input starts recording the second reference point of the standardization line*)
		raw_value	:DINT;				(*raw value from the strain gauge module*)
		t_measure	:TIME;				(*time used when averaging taring or recording the standardization line*)
		pWGHscalePara	:REFERENCE TO WGHscalePara_typ;	(*pointer to the data type "WGHscalePara_typ"*)
	END_VAR
	VAR_OUTPUT
		std_value	:DINT;				(*standardized weight value*)
		doneTare	:BOOL;				(*set to 1 when taring is finished*)
		doneStandardize1	:BOOL;		(*set to 1 when recording the first reference point of the standardization line is finished*)
		doneStandardize2	:BOOL;		(*set to 1 when recording the second reference point of the standardization line is finished*)
		status	:UINT;					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		TON_measure	:TON;				(*internal variable*)
		cntMeasure	:UDINT;				(*internal variable*)
		step	:UINT;					(*internal variable*)
		errCnt	:UINT;					(*internal variable*)
		sumDat	:ARRAY[0..1] OF DINT;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
