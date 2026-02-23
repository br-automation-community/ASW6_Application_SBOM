{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxClockGetPtpClock (*Get the clock handle of the first PTP clock*)
	VAR_INPUT
		Execute			: BOOL;					    (*Execution of the function block begins on a rising edge of this input.*)
		Config			: REFERENCE TO STRING[255];	(*Configuration name, given as a pointer to STRING*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		ClockID 		: DWORD;				(*Clock identifier*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxClockGetTstmpOfPrevSysTick (*Get the timestamp of the clock at the time of the previous SIOS full tick.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		ClockID 		: DWORD;				(*Clock identifier*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		Sec 			: UDINT;				(*Second part of the current timestamp*)
		Nsec 			: UDINT;				(*Nanosecond part of the current timestamp*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxClockGetTime (*Get the current timestamp of the given clock.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		ClockID 		: DWORD;				(*Clock identifier*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		Sec 			: UDINT;				(*Second part of the current timestamp*)
		Nsec 			: UDINT;				(*Nanosecond part of the current timestamp*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxClockGetSyncInfo (*Get the synchronization information of the given clock.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		ClockID 		: DWORD;				(*Clock identifier*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		Offset 			: DINT;					(*Offset in nanoseconds to the clock source*)
		IsOffsetValid		: BOOL;					(*Get the info if the output Offset is a valid value*)
		IsSync			: BOOL;					(*Get the info if the clock is syncronized to the clock source*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK