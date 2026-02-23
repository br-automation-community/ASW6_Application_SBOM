                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK S39SRk512		(*receives commands from the master to read or write data blocks*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		ident	:UDINT;			(*identifier returned from S39SOpen()*)
		mode	:USINT;			(*mode: s39MODE_DISABLE, s39MODE_RECV_ONLY, s39MODE_SEND_ONLY, s39MODE_SEND_RECV*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		exec	:UINT;			(*bits return information about what the function is executing, e.g. bit0 = data is being received*)
		type	:UINT;			(*"telegram type" from the RK512 request header from the master*)
		cmd	:UINT;				(*"command type" from the RK512 request header from the master*)
		db	:USINT;				(*"data block number" from the RK512 request header from the master*)
		dw	:USINT;				(*"data word number" from the RK512 request header from the master*)
		len	:UINT;				(*"length" from the RK512 request header from the master*)
		coinf	:UINT;			(*"coordination information" from the RK412 request header from the master*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK S39SClose		(*enables the interface and restores it to its original configuration before S39SOpen() was called*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		ident	:UDINT;			(*identifier returned from S39SOpen()*)
	END_VAR	
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		InitCount	:USINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK S39Slave			(*receives commands from the master to read or write data blocks*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		ident	:UDINT;			(*identifier returned from S39SOpen()*)
		mode	:USINT;			(*mode: s39MODE_DISABLE, s39MODE_RECV_ONLY, s39MODE_SEND_ONLY, s39MODE_SEND_RECV*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		exec	:UINT;			(*bits return information about what the function is executing, e.g. bit0 = data has been received*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE}  FUNCTION_BLOCK S39SOpen			(*initializes the interface defined with the pdevice and pmode parameters*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		pDevice	:UDINT;			(*string given as a pointer, which clearly describes the interface used*)
		pMode	:UDINT;			(*string given as a pointer, which configures the interface to be used*)
		rk512	:BOOL;			(*1 ... 3964R RK512 protocol*)
		buflen	:UINT;			(*parameter not used for the RK512 protocol*)
		timeout	:UINT;			(*response timeout*)
		retry	:USINT;			(*number of retries after a timeout*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident	:UDINT;			(*identifier of the communication code*)
		tx_buf	:UDINT;			(*always returns 0*)
		rx_buf	:UDINT;			(*always returns 0*)
	END_VAR	
	VAR
		InitCount	:USINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
