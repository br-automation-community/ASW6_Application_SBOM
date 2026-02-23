{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxNetMgrTriggerCmdExecution (*Trigger the execution of a network manager command.*)
    VAR_INPUT
		Execute			: BOOL;					            (*Execution of the function block begins on a rising edge of this input.*)
		Command         : FxNetMgrCommandEnum;              (*The command to be executed by the network manager.*)
		Strategy        : FxNetMgrProcessingStrategyEnum;   (*The processing strategy for the network manager command.*)
		Domain          : REFERENCE TO STRING[255];	        (*The domain the command should be executed on.*)
		TimeoutSec      : UDINT;					        (*Timeout in seconds for the network manager command run.*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					        (*Execution successful. Function block is finished.*)
		Busy			: BOOL;					        (*The function block must continue to be called.*)
		Error			: BOOL;					        (*Error occurred during operation.*)
		StatusID		: DINT;  				        (*Status information.*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxNetMgrGetNetworkState (*Get the current state of the OPC UA FX network.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Domain          : REFERENCE TO STRING[255];	    (*The domain the command should be executed on.*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					        (*Execution successful. Function block is finished.*)
		Busy			: BOOL;					        (*The function block must continue to be called.*)
		Error			: BOOL;					        (*Error occurred during operation.*)
		StatusID		: DINT;  				        (*Status information.*)
		State           : FxNetMgrNetworkStateEnum;     (*The current state of the OPC UA FX network.*)
		NetMgrBusy      : BOOL;					        (*The network manager is busy executing a command.*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxNetMgrGetLastError (*Get the last error which occurred during a network manager command execution*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Domain          : REFERENCE TO STRING[255];	    (*The domain the command should be executed on.*)
	END_VAR

	VAR_OUTPUT
		Done			: BOOL;					        (*Execution successful. Function block is finished.*)
		Busy			: BOOL;					        (*The function block must continue to be called.*)
		Error			: BOOL;					        (*Error occurred during operation.*)
		StatusID		: DINT;  				        (*Status information.*)
		LastError       : FxNetMgrErrorStateEnum;       (*The last error which occurred during a network manager command execution.*)

	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK
