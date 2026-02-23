                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK rtUpdate					(*Updates the reACTION task on a station*)
	VAR_INPUT
		enable		:BOOL;						(*enables execution*)
		pDevice		:REFERENCE TO STRING[80];	(*device name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>..."*)
		pRtObject	:REFERENCE TO STRING[80];	(*reACTION Technology Object (=BR module) name* given as pointer*)
	END_VAR
	
	VAR_OUTPUT
		status		:UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	
	VAR
		intern		:RT_I_TYPE;					(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
