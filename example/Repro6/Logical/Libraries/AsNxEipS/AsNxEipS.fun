
 {REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsSubscribe			(*subscribes adapter; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsUnsubscribe			(*unsubscribes adapter; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjMrRegister			(*registers a new object at the message router; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pDevice				: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		class				: UDINT;		(*class identifier*)
		accessType			: UDINT;		(*flags for access types. Reserved, set to 0*)
	END_VAR
	VAR
        _state				: UINT;			(*internal variable*)
		_result				: UINT;			(*internal variable*)
        _srcId				: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status				: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus			: UDINT;		(*ethernet ip stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjCl3ServiceInd		(*gets indication of acyclic data transfer; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		maxDataCount	: UDINT;		(*maximum service data size*)
		pData			: UDINT;		(*service data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source ID*)
		connectionId	: UDINT;		(*connection handle*)
		service			: UDINT;		(*CIP service code*)
		class			: UDINT;		(*CIP class*)
		instance		: UDINT;		(*CIP instance*)
		attribute		: UDINT;		(*CIP attribute*)
		dataCount		: UDINT;		(*size of service data area*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjCl3ServiceRes		(*responds to acyclic data transfer; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source ID*)
		connectionId	: UDINT;		(*connection handle*)
		service			: UDINT;		(*CIP service code*)
		class			: UDINT;		(*CIP class*)
		instance		: UDINT;		(*CIP instance*)
		attribute		: UDINT;		(*CIP attribute*)
		generalError	: UDINT;		(*general error code*)
		extendedError	: UDINT;		(*extended error code*)
		dataCount		: UDINT;		(*service data size*)
		pData			: UDINT;		(*service data buffer given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjOpenCl3	(*opens class 3 connection; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		pIpAddress		: UDINT;		(*destination ip address given as pointer, e.g. "192.168.100.2"*)
		time			: UDINT;		(*expected message time*)
		timeoutMult		: UDINT;		(*timeout multiplier*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
		connectionId	: UDINT;		(*connection handle*)
		generalError	: UDINT;		(*general error code*)
		extendedError	: UDINT;		(*extended error code*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjCloseCl3	(*closes class 3 connection; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		connectionId	: UDINT;		(*connection handle*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjConnectMessage	(*sends a connected class 3 message request; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		connectionId	: UDINT;		(*connection id*)
		service			: UDINT;		(*CIP service code*)
		class			: UDINT;		(*CIP class id*)
		instance		: UDINT;		(*CIP instance id*)
		attribute		: UDINT;		(*CIP attribute*)
		dataCount		: UDINT;		(*service data size*)
		pData			: UDINT;		(*service data buffer given as pointer*)
		maxResDataCount		: UDINT;		(*maximum response service data size*)
		pResData			: UDINT;		(*response service data buffer given as pointer*)		
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
		resService		: UDINT;		(*response CIP service code*)
		resClass		: UDINT;		(*response CIP class*)
		resInstance		: UDINT;		(*response CIP instance*)
		resAttribute	: UDINT;		(*response CIP attribute*)
		resDataCount	: UDINT;		(*response service data size*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipsObjUnconnectMessage	(*sends an unconnected message request; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		pIpAddress		: UDINT;		(*destination ip address given as pointer, e.g. "192.168.100.2"*)
		service			: UDINT;		(*CIP service code*)
		class			: UDINT;		(*CIP class id*)
		instance		: UDINT;		(*CIP instance id*)
		attribute		: UDINT;		(*CIP attribute*)
		dataCount		: UDINT;		(*service data size*)
		pData			: UDINT;		(*service data buffer given as pointer*)
		maxResDataCount	: UDINT;		(*maximum response service data size*)
		pResData		: UDINT;		(*response service data buffer given as pointer*)		
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*ethernet ip stack status*)
		resService		: UDINT;		(*response CIP service code*)
		resClass		: UDINT;		(*response CIP class*)
		resInstance		: UDINT;		(*response CIP instance*)
		resAttribute	: UDINT;		(*response CIP attribute*)
		resDataCount	: UDINT;		(*response service data size*)
	END_VAR
END_FUNCTION_BLOCK
