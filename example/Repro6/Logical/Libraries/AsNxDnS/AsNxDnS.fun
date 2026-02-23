
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsSubscribe			(*subscribe slave*)
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
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsUnsubscribe			(*unsubscribe slave*)
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
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsRegisterClass		(*register class ID*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		classId			: UDINT;		(*class designator*)
		accessType		: UDINT;		(*reserved unused, set to 0*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsUnregisterClass		(*unregister class ID*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		classId			: UDINT;		(*class designator*)
		accessType		: UDINT;		(*reserved unused, set to 0*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsGetAttributeInd		(*get attribute indication*)
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
		dnStatus		: UDINT;		(*devicenet stack status*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source ID*)
		classId			: UINT;			(*class ID of user application object requested by master*)
		instanceId		: UINT;			(*instance ID of user application object requested by master*)
		attributeId		: UINT;			(*attribute ID of user application object requested by master*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsSetAttributeInd		(*set attribute indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		maxDataCount	: UDINT;		(*maximum data count*)
		pData			: UDINT;		(*information data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dnStatus		: UDINT;		(*devicenet stack status*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source ID*)
		classId			: UINT;			(*class ID of user application object requested by master*)
		instanceId		: UINT;			(*instance ID of user application object requested by master*)
		attributeId		: UINT;			(*attribute ID of user application object requested by master*)
		dataCount		: UINT;			(*data count of bytes to be written by the user application*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsGetAttributeRes		(*get attribute response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source ID*)
		classId			: UINT;			(*class ID of user application object requested by master*)
		instanceId		: UINT;			(*instance ID of user application object requested by master*)
		attributeId		: UINT;			(*attribute ID of user application object requested by master*)
		dataCount		: UINT;			(*data count of bytes to be read by the user application*)
		generalError	: USINT;		(*general error code returned by the user, see help*)
		additionalError	: USINT;		(*additional error code, user specific*)
		pData			: UDINT;		(*information data buffer given as pointer*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsSetAttributeRes		(*set attribute response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		source			: UDINT;		(*message source*)
		sourceId		: UDINT;		(*message source ID*)
		classId			: UINT;			(*class ID of user application object requested by master*)
		instanceId		: UINT;			(*instance ID of user application object requested by master*)
		attributeId		: UINT;			(*attribute ID of user application object requested by master*)
		dataCount		: UINT;			(*data count of bytes written by the user application*)
		generalError	: USINT;		(*general error code returned by the user, see help*)
		additionalError	: USINT;		(*additional error code, user specific*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsSetAdr				(*set address*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		address			: UDINT;		(*new slave address*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdnsStartBusComm		(*start bus communication*)
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
		dnStatus		: UDINT;		(*devicenet stack status*)
	END_VAR
END_FUNCTION_BLOCK
