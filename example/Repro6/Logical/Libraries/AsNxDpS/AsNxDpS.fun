
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsSubscribe			(*subscribe slave*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsUnsubscribe			(*unsubscribe slave*)
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
                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsAlarmNotification	(*alarm notification*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		slotNumber		: USINT;		(*slot number*)
		seqNumber		: USINT;		(*sequence number*)
		alarmType		: USINT;		(*alarm type*)
		alarmSpecifier	: USINT;		(*alarm specifier*)
		addAck			: BOOL;			(*additional acknowledgement flag*)
		alarmDataLen	: USINT;		(*alarm data length*)
		pAlarmData		: UDINT;		(*alarm data given as a pointer*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsAlarmAckReceive		(*receive alarm acknowledgement*)
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
		slotNumber		: USINT;		(*slot number*)
		seqNumber		: USINT;		(*sequence number*)
		alarmType		: USINT;		(*alarm type*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C1WriteInd		(*V1 class 1 write indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		maxDataLen		: UDINT;		(*max data length*)
		pData			: UDINT;		(*data buffer given as a pointer*)
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
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C1WriteAck		(*V1 class 1 write acknowledgement*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C1ReadInd			(*V1 class 1 read indication*)
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
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)		
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C1ReadAck			(*V1 class 1 read acknowledgement*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
		pData			: UDINT;		(*data buffer given as pointer*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsSetDiag				(*set diagnostic*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		extDiag			: BOOL;			(*extended diagnostic*)
		extDiagOverflow	: BOOL;			(*extended diagnostic overflow*)
		pDiagData		: UDINT;		(*diagnostic data given as a pointer*)
		diagDataLen		: UDINT;		(*diagnostic data length*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsSetIm0				(*change I&M0 parameter settings*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pDevice				: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		im0Param			: nxdpsIm0_t;	(*I&M0 parameter*)
		profSpecSupp		: BOOL;
		manuSpecSupp		: BOOL;
		slotsNotZeroSupp	: BOOL;
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsSetAdr				(*set address*)
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
		dpStatus		: UDINT;		(*profibus DP stack status*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsStartBusComm		(*start bus communication*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2InitiateInd		(*V1 class2 initiate connection indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		pAddAdrParam	: UDINT;		(*additional address parameter table given as pointer*)
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
		featuresSup		: UINT;			(*requested featrures of the DP master class 2 connection*)
		profileFeatSup	: UINT;			(*requested profile featrures of the DP master class 2 connection*)
		profileIdent	: UINT;			(*profile ident number*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2InitiateRes		(*V1 class 2 initiate connection response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		connectionRef	: UDINT;		(*connection reference*)
		dataUnitSizeMax	: USINT;		(*maximum size of data unit to transfer*)
		featuresSup		: UINT;			(*requested featrures of the DP master class 2 connection*)
		profileFeatSup	: UINT;			(*requested profile featrures of the DP master class 2 connection*)
		profileIdent	: UINT;			(*profile ident number*)
		pAddAdrParam	: UDINT;		(*additional address parameter table given as pointer*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2ReadInd			(*V1 class 2 read indication*)
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
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2ReadRes			(*V1 class 2 read response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
		pData			: UDINT;		(*data buffer given as pointer*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2WriteInd		(*V1 class 2 write indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		maxDataLen		: UDINT;		(*max data length*)
		pData			: UDINT;		(*data buffer given as a pointer*)
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
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2WriteRes		(*V1 class 2 write response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2DataInd			(*V1 class 2 data transport indication*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		maxDataLen		: UDINT;		(*max data length*)
		pData			: UDINT;		(*data buffer given as a pointer*)
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
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2DataRes			(*V1 class 2 data transport response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		ackType			: BOOL;			(*type of acknowledgement*)
		connectionRef	: UDINT;		(*connection reference*)
		slotNumber		: USINT;		(*slot number*)
		index			: USINT;		(*index*)
		dataLen			: USINT;		(*data length*)
		errorDecode		: USINT;		(*error decode*)
		errorCode1		: USINT;		(*error code 1*)
		errorCode2		: USINT;		(*error code 2*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
		pData			: UDINT;		(*data buffer given as pointer*)
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

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2AbortInd		(*V1 class 2 abort indication*)
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
		connectionRef	: UDINT;		(*connection reference*)
		local			: UDINT;		(*local*)
		subnet			: UDINT;		(*subnet*)
		instance		: UDINT;		(*instance*)
		reasonCode		: UDINT;		(*reason code*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxdpsV1C2AbortRes		(*V1 class 2 abort response*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*interface name given as a pointer, e.g., "SL<x>.SS<y>.IF<z>"*)
		connectionRef	: UDINT;		(*connection reference*)
		source			: UDINT;		(*source*)
		sourceId		: UDINT;		(*source id*)
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
