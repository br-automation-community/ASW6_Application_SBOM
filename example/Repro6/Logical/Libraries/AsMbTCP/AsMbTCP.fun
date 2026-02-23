                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbReadCoils							(*mfc Read Coils; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		pStation		: UDINT;					(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;						(*starting address*)
		nrCoils			: UINT;						(*number of coils to read*)
		pData			: UDINT;					(*pointer to local storage*)
		dataSize		: UINT;						(*size of local storage*)
	END_VAR

	VAR
		i_buffer		: ARRAY[0..249] OF USINT;	(*internal variable*)
        i_queryID		: UDINT;					(*internal variable*)
		i_hInstance		: UDINT;					(*internal variable*)
		i_hMbCons		: UDINT;					(*internal variable*)
		i_state			: UINT;						(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbReadDiscreteInputs					(*mfc Read Discrete Inputs; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		pStation		: UDINT;					(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;						(*starting address*)
		nrInputs		: UINT;						(*number of inputs to read*)
		pData			: UDINT;					(*pointer to local storage*)
		dataSize		: UINT;						(*size of local storage*)
	END_VAR

	VAR
		i_buffer		: ARRAY[0..249] OF USINT;	(*internal variable*)
        i_queryID		: UDINT;					(*internal variable*)
		i_hInstance		: UDINT;					(*internal variable*)
		i_hMbCons		: UDINT;					(*internal variable*)
		i_state			: UINT;						(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbReadHoldingRegisters		(*mfc Read Holding Registers; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g. "IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		nrRegisters		: UINT;				(*number of holding registers to read*)
		pData			: UDINT;			(*pointer to local storage*)
		dataSize		: UINT;				(*size of local storage*)
	END_VAR
	
	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbReadInputRegisters			(*mfc Read Input Register; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		nrRegisters		: UINT;				(*number of registers to read*)
		pData			: UDINT;			(*pointer to local storage*)
		dataSize		: UINT;				(*size of local storage*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbWriteSingleCoil			(*mfc Write Single Coil; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		value			: BOOL;				(*value to write*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbWriteSingleRegister		(*mfc Write Single Register; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		value			: UINT;				(*value to write*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbMaskWriteRegister		(*mfc Mask Write Register; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		andValue		: UINT;				(*value to write*)
		orValue			: UINT;				(*value to write*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbWriteMultipleCoils					(*mfc Write Multiple Coils; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;						(*enables execution*)
		pStation		: UDINT;					(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;						(*starting address*)
		nrCoils			: UINT;						(*number of coils to write*)
		pData			: UDINT;					(*pointer to local storage*)
		dataSize		: UINT;						(*size of local storage*)
	END_VAR

	VAR
		i_buffer		: ARRAY[0..249] OF USINT;	(*internal variable*)
        i_queryID		: UDINT;					(*internal variable*)
		i_hInstance		: UDINT;					(*internal variable*)
		i_hMbCons		: UDINT;					(*internal variable*)
		i_state			: UINT;						(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbWriteMultipleRegisters		(*mfc Write Multiple Registers; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pStation		: UDINT;			(*pointer to the station path e.g."IF2.ST1"*)
		startAddress	: UINT;				(*starting address*)
		nrRegisters		: UINT;				(*number of registers to write*)
		pData			: UDINT;			(*pointer to local storage*)
		dataSize		: UINT;				(*size of local storage*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbReadWriteMultipleRegisters	(*mfc Read Write Multiple Registers; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pStation			: UDINT;		(*pointer to the station path e.g."IF2.ST1"*)
		startAddressRead	: UINT;			(*starting address for read*)
		nrRegistersRead		: UINT;			(*number of registers to read*)
		pDataRead			: UDINT;		(*pointer to local storage for read data*)
		dataSizeRead		: UINT;			(*size of local storage for read data*)
		startAddressWrite	: UINT;			(*starting address for write*)
		nrRegistersWrite	: UINT;			(*number of registers to write*)
		pDataWrite			: UDINT;		(*pointer to local storage for write data*)
		dataSizeWrite		: UINT;			(*size of local storage for write data*)
	END_VAR

	VAR
        i_queryID		: UDINT;			(*internal variable*)
		i_hInstance		: UDINT;			(*internal variable*)
		i_hMbCons		: UDINT;			(*internal variable*)
		i_state			: UINT;				(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK mbGetLastException			(*get last modbus exception; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pStation			: UDINT;		(*pointer to the station path e.g."IF2.ST1"*)
	END_VAR

	VAR_OUTPUT
		mbExcp				: USINT;		(*last modbus exception*)
		status				: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK



