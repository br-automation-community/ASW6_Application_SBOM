                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1Master			(*operates the DF1 protocol (full-duplex) at runtime*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*ident from the ABDF1MOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		execute	:BOOL;				(*command was executed (execute = 1)*)
		recordnum	:UINT;			(*number of the entry in the data object currently being processed*)
		sts	:USINT;					(*status byte (STS)*)
		ext_sts	:USINT;				(*extended status byte (EXT STS)*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1MOpen			
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		pDevice	:UDINT;				(*device description string*)
		pMode	:UDINT;				(*mode description string*)
		pConfig	:UDINT;				(*data object name*)
		own_ID	:USINT;				(*own station number (0-254)*)
		checksum	:USINT;			(*checksum (BCC or CRC)*)
		timeout	:UINT;				(*timeout in milliseconds (multiple of 10)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident	:UDINT;				(*ident*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1SOpen			(*returns the ident for ABDF1Slave(), ABDF1SClose(), ABDF1Master() and ABDF1MClose()*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		pDevice	:UDINT;				(*device description string*)
		pMode	:UDINT;				(*mode description string*)
		pConfig	:UDINT;				(*name of a data object*)
		own_ID	:USINT;				(*own node number (0-254)*)
		checksum	:USINT;			(*checksum (BCC or CRC)*)
		timeout	:UINT;				(*timeout in milliseconds (multiple of 10)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident	:UDINT;				(*ident*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1Slave			(*operates the DF1 protocol (full-duplex) at runtime*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*ident from the ABDF1SOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		exec	:UINT;				(*counter for DF1 commands received*)
		cmd	:USINT;					(*last received command*)
		fct	:USINT;					(*last received function*)
		len	:UDINT;					(*length of the data to be copied*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1SClose			(*closes the driver environment, after which the ABDF1SOpen() FBK can be called again*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*ident from the ABDF1SOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK ABDF1MClose			(*closes the driver environment, after which the ABDF1MOpen() FBK can be called again*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		ident	:UDINT;				(*ident from the ABDF1MOpen() FBK*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
