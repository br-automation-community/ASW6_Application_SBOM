
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmSetOperationMode	(*set operation mode*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		mode			: UDINT;		(*operation mode*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmGetAttribute		(*get attribute*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		macId			: USINT;		(*device mac id*)
		classId			: UINT;			(*class id*)
		instanceId		: UINT;			(*instance id*)
		attributeId		: UINT;			(*attribute id*)
		attLengthMax	: UINT;			(*maximum attribute data length*)
		pAttData		: UDINT;		(*attribute data given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
		attLength		: UINT;			(*attribute data length*)
		generalError	: USINT;		(*general error*)
		additionalError	: USINT;		(*additional error*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmSetAttribute		(*set attribute*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		macId			: USINT;		(*device mac id*)
		classId			: UINT;			(*class id*)
		instanceId		: UINT;			(*instance id*)
		attributeId		: UINT;			(*attribute id*)
		attLength		: UINT;			(*attribute data length*)
		pAttData		: UDINT;		(*attribute data given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
		generalError	: USINT;		(*general error*)
		additionalError	: USINT;		(*additional error*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmAcyclicBitStrobing	(*acyclic bit strobing*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pStrobeMask		: UDINT;		(*strobe mask given as pointer*)
		pStrobeCommand	: UDINT;		(*strobe command given as pointer*)
		pStatusList		: UDINT;		(*status list given as pointer*)
		pResDataList	: UDINT;		(*response data list given as pointer*)
		timeout			: UDINT;		(*timeout*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmLifeList			(*life list*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		timeout			: UDINT;		(*timeout*)
		pLifeList		: UDINT;		(*life list given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnmDiagnostics			(*diagnostics*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		macId			: USINT;		(*device mac id*)
		getOnly			: BOOL;			(*get only flag*)
		diagLengthMax	: UDINT;		(*maximum diagnostic data length*)
		pDiagData		: UDINT;		(*diagnostic data given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
		diagLength		: UDINT;		(*diagonstic data length*)
	END_VAR
END_FUNCTION_BLOCK
