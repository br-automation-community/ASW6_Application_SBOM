                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBMCmd				(*operates the modbus protocol in runtime*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)				
		ident	:UDINT;				(*identifier of the MBMOpen() FBK*)
		mfc	:USINT;					(*modbus function call*)
		node	:USINT;				(*station number (0 = broadcast)*)
		data	:UDINT;				(*pointer to the data area*)
		offset	:UINT;				(*offset*)
		len	:UINT;					(*size of data*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBMClose				(*closes the driver environment to enable the MBMOpen() FBK to be called again*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*identifier of the MBMOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBMaster				(*operates the modbus protocol in runtime*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*identifier of the MBMOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		execute	:BOOL;				(*command executed (execute = 1)*)
		recordnum	:UINT;			(*number of the entry in the data object currently being processed*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBMOpen				(*configures the interface and initializes the internal structures that are required*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		pDevice	:UDINT;				(*device name given as a pointer*)
		pMode	:UDINT;				(*pointer to the mode description string*)
		pConfig	:UDINT;				(*pointer to the data object name*)
		timeout	:UINT;				(*response timeout in milliseconds (the value must be a multiple of 10)*)
		ascii	:USINT;				(*modBus mode (0 = RTU / 1 = ASCII)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident	:UDINT;				(*identifier for the MBMaster(), MBMCmd() and MBMClose() FBKs*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBSClose				(*closes the driver environment to enable the MBSOpen() FBK to be called again*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*identifier of the MBSOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		InitCount	:USINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBSlave				(*operates the modbus protocol in runtime*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*identifier of the MBSOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		exec	:UINT;				(*counter for modbus commands received*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK MBSOpen				(*configures the interface and initializes the internal structures that are required*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		pDevice	:UDINT;				(*device name given as a pointer*)
		pMode	:UDINT;				(*pointer to the mode description string*)
		pCoilStat	:UDINT;			(*pointer to the coil status (modbus simulation variable)*)
		pInputStat	:UDINT;			(*pointer to the input status (modbus simulation variable)*)
		pHoldingReg	:UDINT;			(*pointer to the holding register (modbus simulation variable)*)
		pInputReg	:UDINT;			(*pointer to the input register (modbus simulation variable)*)
		own_ID	:USINT;				(*own node number*)
		timeout	:UINT;				(*response timeout in milliseconds (the value must be a multiple of 10)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident	:UDINT;				(*identifier for the MBClient() and MBSClose() FBKs*)
	END_VAR
	VAR
		FirstInit	:UDINT;			(*internal variable*)
		InitCount	:USINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
