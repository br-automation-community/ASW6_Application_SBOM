                                                                     
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmCommand				(*send command*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		syncCommand		: UDINT;		(*sync command*)
		freezeCommand	: UDINT;		(*freeze command*)
		group			: UDINT;		(*group*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmSetMode				(*set mode*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		mode			: UDINT;		(*mode to set*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmActivate			(*activate/deactivate slave*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		activate		: UDINT;		(*activate/deactivate slave*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmGetDiag				(*get diagnostic*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		flags			: UDINT;		(*flags*)
		pDiagData		: UDINT;		(*diagnostic data given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		diagDataLen		: UDINT;		(*diagnostic data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmLifeList			(*life list*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pLifeList		: UDINT;		(*life list area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C1Read			(*DPV1 class 1 read request*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		slotNumber		: UDINT;		(*slot number*)
		index			: UDINT;		(*index*)
		dataLen			: UDINT;		(*data length*)
		pData			: UDINT;		(*data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		readDataLen		: UDINT;		(*read data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C1Write			(*DPV1 class 1 write request*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		slotNumber		: UDINT;		(*slot number*)
		index			: UDINT;		(*index*)
		dataLen			: UDINT;		(*data length*)
		pData			: UDINT;		(*data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmSubscribe			(*subscribe master*)
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
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmUnsubscribe			(*unsubscribe master*)
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
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmAlarmReceive		(*receive alarm*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		maxAlarmDataLen	: UDINT;		(*max alarm data length*)
		pAlarmData		: UDINT;		(*alarm data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		slotNumber		: USINT;		(*slot number*)
		seqNumber		: USINT;		(*sequence number*)
		alarmType		: USINT;		(*alarm type*)
		alarmSpecifier	: USINT;		(*alarm specifier*)
		addAck			: BOOL;			(*additional acknowledgement flag*)
		alarmDataLen	: UDINT;		(*alarm data length*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmAlarmReset			(*reset alarm*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		slotNumber		: USINT;		(*slot number*)
		seqNumber		: USINT;		(*sequence number*)
		alarmType		: USINT;		(*alarm type*)
		alarmSpecifier	: USINT;		(*alarm specifier*)
		addAck			: BOOL;			(*additional acknowledgement flag*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C2Initiate		(*DPV1 class 2 initiate connection*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		remoteAdr		: UDINT;		(*remote address*)
		sendTimeout		: UINT;			(*send timeout*)
		featuresSup1	: USINT;		(*service functionality supported*)
		featuresSup2	: USINT;		(*additional service functionality supported*)
		profileFeatSup1	: USINT;		(*profile supported features*)
		profileFeatSup2	: USINT;		(*profile additional supported features*)
		profileIdent	: UINT;			(*profile ident number*)
		pAddAdrParam	: UDINT;		(*additional address parameter given as pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		connectionRef	: UDINT;		(*connection reference*)
		dataUnitSizeMax	: USINT;		(*maximum size of data unit to transfer*)
		slFeaturesSup1	: USINT;		(*service functionality supported by the slave*)
		slFeaturesSup2	: USINT;		(*additional service functionality supported by the slave*)
		slProfFeatSup1	: USINT;		(*supported profile features by the slave*)
		slProfFeatSup2	: USINT;		(*additional supported profile features by the slave*)
		errorDecode		: USINT;
		errorCode1		: USINT;
		errorCode2		: USINT;
		detail			: UINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C2Read			(*DPV1 class 2 read request*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: UDINT;		(*slot number*)
		index			: UDINT;		(*index*)
		dataLen			: UDINT;		(*number of bytes to read*)
		pData			: UDINT;		(*data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		readDataLen		: UDINT;		(*read data length*)
		errorDecode		: USINT;
		errorCode1		: USINT;
		errorCode2		: USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C2Write			(*DPV1 class 2 write request*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: UDINT;		(*slot number*)
		index			: UDINT;		(*index*)
		dataLen			: UDINT;		(*number of bytes to write*)
		pData			: UDINT;		(*data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		errorDecode		: USINT;
		errorCode1		: USINT;
		errorCode2		: USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C2Data			(*combined DPV1 class 2 read and write request*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: UDINT;		(*slot number*)
		index			: UDINT;		(*index*)
		dataLen			: UDINT;		(*number of bytes to write*)
		pDataWrite		: UDINT;		(*write data area given as a pointer*)
		pDataRead		: UDINT;		(*read data area given as a pointer*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
		readDataLen		: UDINT;		(*read data length*)
		errorDecode		: USINT;
		errorCode1		: USINT;
		errorCode2		: USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpmV1C2Abort			(*V1 class 2 request abort of connection*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		connectionRef	: UDINT;		(*connection reference*)
		subnet			: USINT;		(*subnet*)
		instance		: USINT;		(*instance number*)
		reasonCode		: USINT;		(*reason code why an abort is requested*)
	END_VAR
	VAR
        _state			: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
        _srcId			: UDINT;		(*internal variable*)
	END_VAR
	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK
