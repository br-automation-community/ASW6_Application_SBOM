                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HostByName					(*returns the accompanying IP address for the specified host name*)
	VAR_INPUT
		enable       : BOOL;				(*enables execution*)
		pName		 : UDINT;				(*pointer to the name to be resolved, e.g. "sun.galaxy.one"*)
	END_VAR
	
	VAR
		Obj			 : ASHOST_LOCAL_OBJ;	(*internal variable*)
	END_VAR 
	
	VAR_OUTPUT
		status		 : UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		address		 : UDINT;				(*IP address in HEX format, e.g. "10.43.75.1" -> 0x014B2B0A*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HostByAddress				(*returns the accompanying host name for the specified IP address*)
	VAR_INPUT
		enable       : BOOL; 				(*enables execution*)
		address	 	 : UDINT;				(*IP address to be resolved in HEX format, e.g. "10.43.75.1" -> 0x014B2B0A*)
		pName		 : UDINT;				(*pointer to the name buffer*)
		buflng		 : UDINT;				(*length of the buffer*)
	END_VAR

	VAR
		Obj			 : ASHOST_LOCAL_OBJ;	(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		 : UINT; 				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

