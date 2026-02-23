{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrSetIPAddress (*Set the IP address / subnet mask for a device.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];		(*Identifier of the device to set the address for. E.g. 'IF3.ST1'*)
		Address         : REFERENCE TO STRING[255];     (*IP address and subnet mask to set, specified in the format A.B.C.D/M. E.g. 192.168.0.1/24. The subnet mask is optional and ignored for fxDEVMGR_SCOPE_LOCAL.*)
		Scope			: FxDevMgrScopeEnum;			(*Scope for which the changes are to be applied.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrSetHostname (*Set the address hostname for a device.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];		(*Identifier of the device to set the address for. E.g. 'IF3.ST1'*)
		Hostname        : REFERENCE TO STRING[255];     (*Hostname to set.*)
		Scope			: FxDevMgrScopeEnum;			(*Scope for which the changes are to be applied.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrSetUsername (*Set the username for a device.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];		(*Identifier of the device to set the address for. E.g. 'IF3.ST1'*)
		Username        : REFERENCE TO STRING[255];     (*Username to set.*)
		Scope			: FxDevMgrScopeEnum;			(*Scope for which the changes are to be applied.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrSetPassword (*Set the password for a device.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];		(*Identifier of the device to set the address for. E.g. 'IF3.ST1'*)
		Password        : REFERENCE TO STRING[255];     (*Password to set.*)
		Scope			: FxDevMgrScopeEnum;			(*Scope for which the changes are to be applied.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrRestoreInitialSettings (*Restore initial settings for a device. From this point on, data configured in Automation Studio is used again.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];	    (*Identifier of the device to restore previously changed settings for.*)
		Scope			: FxDevMgrScopeEnum;			(*Scope for which the changes are to be applied.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrRebootDevice (*Reboots a remote device.*)
    VAR_INPUT
		Execute			: BOOL;					        (*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];	    (*Identifier of the device to reboot.*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxDevMgrApplySoftwareUpdate (*Applies a software update to a remote device.*)
    VAR_INPUT
		Execute			: BOOL;							(*Execution of the function block begins on a rising edge of this input.*)
		Device			: REFERENCE TO STRING[255];		(*Identifier of the remote device to update.*)
		Path			: REFERENCE TO STRING[255];		(*Path to the software update file.*)
	END_VAR

	VAR_OUTPUT
		ErrorMessage	: STRING[255];					(*Short description which explains the error which happened.*)
		Done			: BOOL;							(*Execution successful. Function block is finished.*)
		Busy			: BOOL;							(*The function block must continue to be called.*)
		Error			: BOOL;							(*Error occurred during operation.*)
		StatusID		: DINT;							(*Status information.*)
	END_VAR

	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
    END_VAR
END_FUNCTION_BLOCK
