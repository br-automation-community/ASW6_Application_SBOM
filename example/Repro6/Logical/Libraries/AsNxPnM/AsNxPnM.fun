
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmGetHandle			(*get handle*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pName			: UDINT;		(*device name given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		handle			: UDINT;		(*handle*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmSubscribe			(*subscribe slave*)
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
		pnStatus		: UDINT;		(*profinet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmUnsubscribe			(*unsubscribe slave*)
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
		pnStatus		: UDINT;		(*profinet stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmAcyclicRead			(*acyclic read*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		handle			: UDINT;		(*device handle*)
		api				: UDINT;		(*API*)
		slot			: UINT;			(*slot*)
		subslot			: UINT;			(*subslot*)
		index			: UINT;			(*index*)
		dataLengthMax	: UDINT;		(*maximum read data buffer length*)
		pData			: UDINT;		(*read data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		pnIoStatus		: UDINT;		(*profinet io status*)
		dataLength		: UDINT;		(*read data length*)
		addValue1		: UINT;			(*additional value 1*)
		addValue2		: UINT;			(*additional value 2*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmAcyclicWrite		(*acyclic write*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		handle			: UDINT;		(*device handle*)
		api				: UDINT;		(*API*)
		slot			: UINT;			(*slot*)
		subslot			: UINT;			(*subslot*)
		index			: UINT;			(*index*)
		dataLength		: UDINT;		(*write data buffer length*)
		pData			: UDINT;		(*write data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		pnIoStatus		: UDINT;		(*profinet io status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmDeviceDiagnosis		(*device diagnosis*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		handle			: UDINT;		(*device handle*)
		flags			: UDINT;		(*flags*)
		diagLengthMax	: UDINT;		(*maximum diagnostic data length*)
		pDiagData		: UDINT;		(*diagnostic data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		diagLength		: UDINT;		(*diagnostic data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmDiagDataInd			(*diagnostics data indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		diagLengthMax	: UDINT;		(*maximum diagnostics data length*)
		pDiagData		: UDINT;		(*diagnostics data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		handle			: UDINT;		(*handle of the device that reported the alarm*)
		api				: UDINT;		(*API of alarm*)
		slot			: UINT;			(*slot of alarm*)
		subslot			: UINT;			(*subslot of alarm*)
		moduleId		: UDINT;		(*module id of alarm*)
		subModuleId		: UDINT;		(*submodule id of alarm*)
		alarmPriority	: UINT;			(*priority of alarm*)
		alarmType		: UINT;			(*type of alarm*)
		alarmSpecifier	: UINT;			(*alarm specifier*)
		userStructId	: UINT;			(*user struct ident*)
		diagLength		: UDINT;		(*diagnostics data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmAlarmInd			(*alarm indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		alarmLengthMax	: UDINT;		(*maximum alarm data length*)
		pAlarmData		: UDINT;		(*alarm data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		handle			: UDINT;		(*handle of the device that reported the alarm*)
		api				: UDINT;		(*API of alarm*)
		slot			: UINT;			(*slot of alarm*)
		subslot			: UINT;			(*subslot of alarm*)
		moduleId		: UDINT;		(*module id of alarm*)
		subModuleId		: UDINT;		(*submodule id of alarm*)
		alarmPriority	: UINT;			(*priority of alarm*)
		alarmType		: UINT;			(*type of alarm*)
		alarmSpecifier	: UINT;			(*alarm specifier*)
		userStructId	: UINT;			(*user struct ident*)
		alarmLength		: UDINT;		(*alarm data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmAlarmAck			(*alarm acknowledge*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		handle			: UDINT;		(*device handle*)
		alarmSpecifier	: UINT;			(*alarm specifier*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		pnIoStatus		: UDINT;		(*profinet io status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxpnmDiffBlock			(*module difference block*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		handle			: UDINT;		(*device handle*)
		dataLengthMax	: UINT;			(*maximum response data length*)
		pData			: UDINT;		(*difference block data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		pnStatus		: UDINT;		(*profinet stack status*)
		flags			: UDINT;		(*flags*)
		numApi			: UINT;			(*number of APIs inside the module difference block*)
		dataLength		: UDINT;		(*response data length*)
	END_VAR
END_FUNCTION_BLOCK
