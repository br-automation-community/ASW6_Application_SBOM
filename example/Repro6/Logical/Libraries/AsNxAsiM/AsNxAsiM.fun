{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimWriteParameterString		(*write parameter string*)
	VAR_INPUT
		enable					: BOOL;			(*enables execution*)
		pDevice					: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		slaveAddress			: UDINT;		(*slave address*)
		pParameterString		: UDINT;		(*parameter string given as pointer*)
		parameterStringLen		: UDINT;		(*parameter string length*)
	END_VAR
	VAR
        _state					: UINT;			(*internal variable*)
		_result					: UINT;			(*internal variable*)
        _srcId					: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status					: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus				: UDINT;		(*ASI stack status*)
	END_VAR
END_FUNCTION_BLOCK
 
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimWriteParameter			(*write parameter*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pDevice				: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		slaveAddress		: UDINT;		(*slave address*)
		parameterData		: UDINT;		(*parameter data*)
	END_VAR
	VAR
        _state				: UINT;			(*internal variable*)
		_result				: UINT;			(*internal variable*)
        _srcId				: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status				: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus			: UDINT;		(*ASI stack status*)
		parameterDataEcho	: UDINT;		(*parameter data echo*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimChangeSlaveAddress	(*change slave address*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		oldSlaveAddress	: UDINT;		(*old slave address*)
		newSlaveAddress	: UDINT;		(*new slave address*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimGetProjectedSlaves	(*get list of projected slaves*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pSlaveList		: UDINT;		(*slave list given as a pointer*)
		maxSlaveListLen	: UDINT;		(*max slave list length*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
		slaveListLen	: UDINT;		(*slave list length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimGetActivatedSlaves	(*get list of activated slaves*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pSlaveList		: UDINT;		(*slave list given as a pointer*)
		maxSlaveListLen	: UDINT;		(*max slave list length*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
		slaveListLen	: UDINT;		(*slave list length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimGetDetectedSlaves	(*get list of detected slaves*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pSlaveList		: UDINT;		(*slave list given as a pointer*)
		maxSlaveListLen	: UDINT;		(*max slave list length*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
		slaveListLen	: UDINT;		(*slave list length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimGetPeripheralFaults	(*get list of peripheral faults*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pSlaveList		: UDINT;		(*slave list given as a pointer*)
		maxSlaveListLen	: UDINT;		(*max slave list length*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
		slaveListLen	: UDINT;		(*slave list length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK asimGetSlaveDiagnosis	(*get slave diagnosis*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		slaveAddress	: UDINT;		(*slave address*)
		requestFlags	: UDINT;		(*request flags*)
		pSlaveDiagnosis	: UDINT;		(*slave diagnosis given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		asiStatus		: UDINT;		(*ASI stack status*)
	END_VAR
END_FUNCTION_BLOCK
