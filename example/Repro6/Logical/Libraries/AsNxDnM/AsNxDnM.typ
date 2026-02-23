
TYPE
	nxdnmSlaveList_t		: STRUCT			(*slave list*)
		slave				: ARRAY[0..63] OF BOOL;
	END_STRUCT;
	
	nxdnmLifeList_t			: STRUCT			(*life list*)
		slave				: ARRAY[0..63] OF USINT;
	END_STRUCT;
	
	nxdnmDiagData_t			: STRUCT			(*diagnostic data*)
		nodeExtraDiag		: USINT;
		devMainState		: USINT;
		onlineError			: USINT;
		generalErrorCode	: USINT;
		additionalCode		: USINT;
		heartBeatTimeout	: UINT;
	END_STRUCT;
	
	nxdnmResData_t			: STRUCT			(*response data*)
		macId				: USINT;
		length				: USINT;
		data				: ARRAY[0..7] OF USINT;
	END_STRUCT;
	
	nxdnmResDataList_t		: STRUCT			(*response data list*)
		slave				: ARRAY[0..63] OF nxdnmResData_t;
	END_STRUCT;
END_TYPE
