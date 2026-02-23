                                                                      
{REDUND_ERROR} FUNCTION_BLOCK EIPExit			(*stops the communication driver and frees up all resources*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		handle	:UDINT;			(*handle from the EIPInit() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR} FUNCTION_BLOCK EIPCyclic		(*performs the cyclic processing for ethernet/IP communication*)
	VAR_INPUT	
		enable	:BOOL;			(*enables execution*)
		handle	:UDINT;			(*handle from the EIPInit() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR} FUNCTION_BLOCK EIPInit			(*initializes the ethernet/IP library*)
	VAR_INPUT	
		enable	:BOOL;			(*enables execution*)
		pconfig	:UDINT;			(*pointer to the name of the configuration data object*)
	END_VAR
	VAR_OUTPUT
		extstatus :STRING[80];  (*error message in detail*)
		handle	:UDINT;			(*FBK writes the handle to this variable*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
