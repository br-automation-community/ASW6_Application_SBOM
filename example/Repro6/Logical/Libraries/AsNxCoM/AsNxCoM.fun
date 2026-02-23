                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomGetState			(*get state*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		flags			: UDINT;		(*flags*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
		nmtState		: UDINT;		(*state*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomRecvEmcyDev			(*receive emergency telegrams*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		flags			: UDINT;		(*flags*)
		pEmcyData		: UDINT;		(*data field for emergency entries given as pointer (consisting of 5 blocks each sized 8 bytes)*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
		emcyCount		: UDINT;		(*current number of emergency telegrams in buffer*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomGetDiag				(*get node diagnostics*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		flags			: UDINT;		(*flags*)
		pEmcyData		: UDINT;		(*data field for emergency entries given as pointer (consisting of 5 blocks each sized 8 bytes)*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
		nodeFlags		: UDINT;		(*node flags*)
		lastDiagInfo	: UDINT;		(*last diagnostics info*)
		devTypeValid	: BOOL;			(*is device type valid*)
		devType			: UDINT;		(*device type*)
		nmtState		: UDINT;		(*nmt state*)
		emcyCount		: UDINT;		(*current number of emergency telegrams in buffer*)
		addInfo			: UDINT;		(*additional info*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomNmt					(*send NMT command*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		command			: UDINT;		(*NMT command*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomSdoRead				(*read SDO data*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		index			: UDINT;		(*index*)
		subIndex		: UDINT;		(*sub index*)
		dataCount		: UDINT;		(*data count*)
		pData			: UDINT;		(*sdo data given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomSdoWrite			(*write SDO data*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		index			: UDINT;		(*index*)
		subIndex		: UDINT;		(*sub index*)
		dataCount		: UDINT;		(*data count*)
		pData			: UDINT;		(*sdo data given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomWriteEmcy			(*write emergency telegrams*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		errorCode		: UINT;			(*error code*)
		errorRegister	: USINT;		(*error register*)
		pManErrorCode	: UDINT;		(*man error code given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomStartStop			(*start/stop CANopen bus*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		mode			: UDINT;		(*mode 0 = stop/ 1 = start*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxcomSlaveActivate		(*activate/deactivate slave*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		node			: USINT;		(*node id*)
		mode			: UDINT;		(*mode activate/deactivate slave*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		coStatus		: UDINT;		(*CANopen stack status*)
	END_VAR
END_FUNCTION_BLOCK
