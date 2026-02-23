
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArStorageGetInfo (*Get material and serial number of a storage device*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Storage : UDINT; (*Ident number of the storage device*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
		MaterialNumber : STRING[80]; (*Material number*)
		SerialNumber : STRING[80]; (*Serial number*)
	END_VAR
	VAR
        Internal : ARRAY[0..31] OF UDINT; (*Internal variable*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArStorageGetWear (*Get current wear of a storage device*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Storage : UDINT; (*Ident number of the storage device*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
		WearPercentage : UINT; (*Current wear in percent; value >100 indicates exceedance of expected lifetime*)
	END_VAR
	VAR
        Internal : ARRAY[0..31] OF UDINT; (*Internal variable*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArStorageGetHealthData (*Get health data of storage device*)
	VAR_INPUT
		Execute : BOOL; (*Start execution*)
		Storage : UDINT; (*Ident number of the storage device*)
		Buffer : UDINT; (*Pointer to data buffer for the raw health data*)
		BufferSize : UDINT; (*Size of data buffer in bytes*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution done*)
		Busy : BOOL; (*Execution running*)
		Error : BOOL; (*Execution failed*)
		StatusID : DINT; (*Status information: see help*)
		MinBufferSize : UDINT; (*Minimal buffer size to hold the raw health data*)
	END_VAR
	VAR
        Internal : ARRAY[0..31] OF UDINT; (*Internal variable*)
	END_VAR	
END_FUNCTION_BLOCK

