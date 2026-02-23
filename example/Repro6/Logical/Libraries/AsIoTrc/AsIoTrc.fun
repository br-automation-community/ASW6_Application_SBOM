                                                                      
{REDUND_ERROR} FUNCTION_BLOCK AsIoTrcGet		(*reads from a specified device*)
	VAR_INPUT
		enable		: BOOL; 	(*enables execution*)
		pDevice		: UDINT; 	(*device name given as a pointer, e.g., "SS1.IF2.ST1.TRC."*)
		pBuffer		: UDINT;	(*pointer to the receive buffer*)
		bufferLen	: UDINT;	(*size of the data buffer in bytes = number of bytes to copy*)
	END_VAR
	VAR
		i_cache		: UDINT;	(*internal variable*)
		i_state		: UINT;		(*internal variable*)
		i_result	: UINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status		: UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		traceCnt	: DINT;		(*running number of the trace*)
		timeStamp	: DINT;		(*time stamp in microseconds*)
		bytes		: DINT;		(*number of bytes actually copied*)
	END_VAR
END_FUNCTION_BLOCK

