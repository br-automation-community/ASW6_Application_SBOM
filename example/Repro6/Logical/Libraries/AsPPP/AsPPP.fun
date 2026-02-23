                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK PPPStart					(*starts a ppp device; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*device name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pDeviceParam	: UDINT;		(*pointer to the parent device parameter (optional)*)
		pPppParam		: UDINT;		(*pointer to the ppp parameter*)
	END_VAR
	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
        i_tmp			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK PPPStop					(*stops a ppp device; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*device name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
        i_tmp			: UDINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
