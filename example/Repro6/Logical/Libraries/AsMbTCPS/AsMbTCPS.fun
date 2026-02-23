 
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbSlBoolPut							(*writes bit-oriented slave data; synchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		startAddress	: UINT;						(*starting address*)
		nrOfItems		: USINT;						(*number of items to write*)
	END_VAR
		
	VAR_IN_OUT
		station			: STRING[1]; 				(*station path e.g."IF2.MODBUSSLAVE_1"*)
		data			: ARRAY[0..127] OF BOOL;	(*array of data, only the first "nrOfItems" will be used*)
	END_VAR

	VAR
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbSlBoolGet							(*reads bit-oriented slave data; synchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		startAddress	: UINT;						(*starting address*)
		nrOfItems		: USINT;						(*number of items to read*)
	END_VAR
		
	VAR_IN_OUT
		station			: STRING[1]; 				(*station path e.g."IF2.MODBUSSLAVE_1"*)
		data			: ARRAY[0..127] OF BOOL;	(*array which will be filled with the requested data*)
	END_VAR

	VAR
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbSlWordPut							(*writes word-oriented slave data; synchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		startAddress	: UINT;						(*starting address*)
		nrOfItems		: USINT;						(*number of items to write*)
	END_VAR
		
	VAR_IN_OUT
		station			: STRING[1]; 				(*station path e.g."IF2.MODBUSSLAVE_1"*)
		data			: ARRAY[0..127] OF UINT;	(*array of data*)
	END_VAR

	VAR
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbSlWordGet							(*reads word-oriented slave data; synchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		startAddress	: UINT;						(*starting address*)
		nrOfItems		: USINT;						(*number of items to read*)
	END_VAR
		
	VAR_IN_OUT
		station			: STRING[1]; 				(*station path e.g."IF2.MODBUSSLAVE_1"*)
		data			: ARRAY[0..127] OF UINT;	(*array which will be filled with the requested data*)
	END_VAR

	VAR
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
