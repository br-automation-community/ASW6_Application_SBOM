
{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArEcoPlcShutdown (*Select wake-up triggers and shutdown the PLC; asynchronous execution*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		WakeupTriggers : REFERENCE TO ArEcoWakeupTriggerType; (*Array of wake-up triggers*)
		NrOfWakeupTriggers : UINT; (*Number of wake-up triggers in array*)
		WakeupTime : ArEcoWakeupTimeType; (*Target time for wake-up*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Execution status information: see help*)
		InvalidWakeupTrigger : STRING[80]; (*Name of the wrong wake-up trigger*)
	END_VAR
	VAR
		Internal : ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArEcoPlcWakeupInfo (*Get PLC wake-up information; asynchronous execution*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Execution status information: see help*)
		TriggeredWakeup : BOOL; (*A wake-up trigger has triggered*)
		TimedWakeup : BOOL; (*Wake-up time has triggered*)
		SilentWakeup : BOOL; (*The wake-up was silent: Display and LEDs are switched off*)
	END_VAR
	VAR
		Internal : ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArEcoPlcWakeupTriggerState (*Get the state of a specified wake-up trigger; asynchronous execution*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Name : STRING[80]; (*Name of the wake-up trigger*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Execution status information: see help*)
		Triggered : BOOL; (*The wake-up trigger has triggered*)
	END_VAR
	VAR
		Internal : ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
