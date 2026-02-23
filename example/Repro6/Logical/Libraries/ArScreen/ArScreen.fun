
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenGetBrightness (*Read out the current screen brightness*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Screen : UDINT; (*Screen selector*)
	END_VAR
	
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
		Percent : USINT; (*Current screen brightness in percent, 0..100*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenSetBrightness (*Set screen brightness*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Screen : UDINT; (*Screen selector*)
		Percent : USINT; (*Screen brightness to be set, in percent, 0..100*)
	END_VAR
	
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenAwake (*Wake up from the screensaver*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Screen : UDINT; (*Screen selector*)
	END_VAR
	
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenEnableRemoteControl (*Enable remote control of the screen*)
    VAR_INPUT
        Execute : BOOL; (*Start execution*)
        Screen : UDINT; (*Screen selector*)
    END_VAR
    
    VAR_OUTPUT
        Done : BOOL; (*Execution done*)
        Busy : BOOL; (*Execution running*)
        Error : BOOL; (*Execution failed*)
        StatusID : DINT; (*Status information: see help*)
    END_VAR
    
    VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenDisableRemoteControl (*Disable remote control of the screen*)
    VAR_INPUT
        Execute : BOOL; (*Start execution*)
        Screen : UDINT; (*Screen selector*)
    END_VAR
    
    VAR_OUTPUT
        Done : BOOL; (*Execution done*)
        Busy : BOOL; (*Execution running*)
        Error : BOOL; (*Execution failed*)
        StatusID : DINT; (*Status information: see help*)
    END_VAR
    
    VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArScreenTriggerGPOSUpdate (*Trigger GPOS update on the screen*)
    VAR_INPUT
        Execute : BOOL; (*Start execution*)
        Screen : UDINT; (*Screen selector*)
        Url : STRING[513]; (*Url of GPOS to be updated*)
    END_VAR
    
    VAR_OUTPUT
        Done : BOOL; (*Execution done*)
        Busy : BOOL; (*Execution running*)
        Error : BOOL; (*Execution failed*)
        StatusID : DINT; (*Status information: see help*)
    END_VAR
    
    VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK
