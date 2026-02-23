
 {REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaSubscribe			(*subscribes adapter; asynchronous execution*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaUnsubscribe			(*unsubscribes adapter; asynchronous execution*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaObjMrRegister			(*registers a new object at the message router; asynchronous execution*)
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
		eipStatus			: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaObjRegisterService	(*registers service; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pDevice				: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		service				: UDINT;		(*service code*)
	END_VAR
	VAR
        _state				: UINT;			(*internal variable*)
		_result				: UINT;			(*internal variable*)
        _srcId				: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status				: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus			: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaObjCl3ServiceInd		(*gets indication of acyclic data transfer; asynchronous execution*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaObjCl3ServiceRes		(*responds to acyclic data transfer; asynchronous execution*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaObjUnconnectMessage	(*sends an unconnected message request; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pDevice				: UDINT;		(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		pIpAddress			: UDINT;		(*destination ip address given as pointer, e.g. "192.168.100.2"*)
		service				: UDINT;		(*CIP service code*)
		class				: UDINT;		(*CIP class id*)
		instance			: UDINT;		(*CIP instance id*)
		attribute			: UDINT;		(*CIP attribute*)
		dataCount			: UDINT;		(*service data size*)
		pData				: UDINT;		(*service data buffer given as pointer*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
		resService		: UDINT;		(*response CIP service code*)
		resClass		: UDINT;		(*response CIP class*)
		resInstance		: UDINT;		(*response CIP instance*)
		resAttribute	: UDINT;		(*response CIP attribute*)
		resDataCount	: UDINT;		(*response service data size*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaSetIpConfig	(*set ip configuration*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pDevice			: UDINT;			(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		activateDhcp	: BOOL;				(*activate dhcp client*)
		activateBootp	: BOOL;				(*activate bootp client*)
		setIpAddress	: BOOL;				(*set ip address*)
		ipAddress		: nxeipaIpAddr_t;	(*ip address*)
		setGateway		: BOOL;				(*set gateway*)
		gateway			: STRING[16];		(*gateway*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaSetIpParameter	(*set ip parameter*)
	VAR_INPUT
		enable			: BOOL;				(*enables execution*)
		pDevice			: UDINT;			(*interface name given as a pointer, e.g. "SL<x>.SS<y>.IF<z>"*)
		mode			: UDINT;			(*operating mode - configured, dhcp, bootp, fixed*)
		ipAddress		: STRING[16];		(*IP address*)
		netMask			: STRING[16];		(*netmask*)
		gateway			: STRING[16];		(*gateway*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK eipaStartBusComm		(*start bus communication*)
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
		eipStatus		: UDINT;		(*EthernetIP stack status*)
	END_VAR
END_FUNCTION_BLOCK
