                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNMclose				(*enables the interface specified in MNMopen() and restores it to its original configuration*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*communication code: this code is returned by the MNMopen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNMclien				(*implements the cyclic processing of the Command Data Table*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*communication code: this code is returned by the MNMopen() FBK*)
	END_VAR
	VAR_OUTPUT
		exec	:USINT;				(*set to 1 for one cycle when a command from the Command Data Table has been executed*)
		rec	:UINT;					(*indicates which command from the Command Data Table has just been successfully completed*)
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNMopen				(*initializes the interface which is defined with the device and mode parameters*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		device	:UDINT;				(*pointer to a string which clearly describes the interface used*)
		mode	:UDINT;				(*pointer to the string which configures the interface to be used*)
		vars	:UDINT;				(*name of the data object for the the Command Data Table*)
		frmtout	:UINT;				(*response timeout in milliseconds*)
		chartout	:UINT;			(*character timeout in milliseconds*)
		retry	:USINT;				(*number of retries of the request frame if no response was received*)
	END_VAR
	VAR_OUTPUT
		ident	:UDINT;				(*communication code: in the MNMclien() and MNMclose() FBKs*)
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		FirstInit	:USINT;			(*internal variable*)
		InitCount	:UDINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNSclose				(*enables the interface specified in MNSopen() and restores it to its original configuration*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*communication code: this code is returned by the MNSopen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNSservr				(*waits for commands from the MININET master and executes them*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*communication code: this code is returned by the MNSopen() FBK*)
	END_VAR
	VAR_OUTPUT
		exec	:USINT;				(*goes to 1 for one cycle when a MININET command has been executed*)
		cmd	:USINT;					(*MININET command that has just been executed (see Command Data Table)*)
		cmd_addr	:UINT;			(*offset of the counter, flag, input or output that has just been read/written*)
		cmd_len	:USINT;				(*length of the read/written data*)
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MNSopen				(*initializes the interface which is defined with the device and mode parameters*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		device	:UDINT;				(*pointer to a string which clearly describes the interface used*)
		mode	:UDINT;				(*pointer to the string which configures the interface to be used*)
		node	:USINT;				(*slave node number*)
	END_VAR
	VAR_OUTPUT
		ident	:UDINT;				(*communication code: in the MNSservr() and MNSclose() FBKs*)
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		FirstInit	:USINT;			(*internal variable*)
		InitCount	:UDINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK	
