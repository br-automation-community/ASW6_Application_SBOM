
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxecsStartBusComm		(*start bus communication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ecStatus		: UDINT;		(*EtherCAT stack status*)
	END_VAR
END_FUNCTION_BLOCK
