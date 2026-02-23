FUNCTION_BLOCK MC_BR_InitHome_StpAx (*initializes homing parameter for usage with MC_Home*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Execute : BOOL; (*execution of this FB is started on rising edge of the input*)
		HomingParameters : McStpAxHomingParType; (*parameter used with MC_Home if HomingMode=mcHomeInit*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*execution successful. FB finished*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SelectMotorCurrent_StpAx (*used motor current can be selected*)
	VAR_INPUT
		Axis : REFERENCE TO McAxisType; (*axis reference*)
		Enable : BOOL; (*FB is active as long as input is set and "UsedMotorCurrent" is output*)
		MotorCurrent : McStpAxMotorCurrentEnum; (*Motor current which should be used*)
		SetMotorCurrent : BOOL; (*With a positive edge on this input, the value of "MotorCurrent" is used.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Value from output "UsedMotorCurrent" can be used; "SetMotorCurrent" can be called*)
		Busy : BOOL; (*FB is active and needs to be called*)
		Error : BOOL; (*error occurred during operation*)
		ErrorID : DINT; (*error number*)
		UsedMotorCurrent : McStpAxUsedMotorCurrentEnum; (*Shows which motor current is in use*)
	END_VAR
	VAR
		Internal : McInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK