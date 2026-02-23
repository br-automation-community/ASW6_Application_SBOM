
TYPE
	Cp61850AttributeEnum : 
		( (*Data attribute type*)
		cp61850_DA_UNKNOWN,
		cp61850_DA_BOOLEAN, (*Value 0 or 1*)
		cp61850_DA_INT8, (*Value range -128 to 127*)
		cp61850_DA_INT16, (*Value range –32768 to 32767*)
		cp61850_DA_INT32, (*Value range –2147483648 to 2147483647*)
		cp61850_DA_INT64, (*Value range –263 to (263) –1*)
		cp61850_DA_INT8U, (*Value range 0 to 255*)
		cp61850_DA_INT16U, (*Value range 0 to 65535*)
		cp61850_DA_INT32U, (*Value range 0 to 4294967295*)
		cp61850_DA_FLOAT32, (*Single-precision floating point*)
		cp61850_DA_DBPOS, (*Double point position*)
		cp61850_DA_QUALITY, (*Quality*)
		cp61850_DA_TIMESTAMP, (*Time stamp*)
		cp61850_DA_VSTRING, (*Text string*)
		cp61850_DA_ENUMERATED, (*Extensible set of values*)
		cp61850_DA_CODEDENUM, (*Fixed set of values*)
		cp61850_DA_OSTRING (*Octet string*)
		);
	Cp61850ClientControlInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		CycleTime : UINT;
		InitStep : INT;
		pNode : UDINT;
		HandleControl : Cp61850ClientHandleControlType;
		oldControl : BOOL;
	END_STRUCT;
	Cp61850ClientGetAttributeIntType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		CycleTime : UINT;
		InitStep : INT;
		pVariable : UDINT;
		pNode : UDINT;
		PollingTimer : TIME;
		pMmsVariable : UDINT;
		HandleRead : Cp61850ClientHandleReadType;
	END_STRUCT;
	Cp61850ClientHandleControlType : 	STRUCT 
		Status : UINT;
		NewEvent : BOOL;
	END_STRUCT;
	Cp61850ClientHandleReadType : 	STRUCT 
		Status : UINT;
		NewEvent : BOOL;
	END_STRUCT;
	Cp61850ClientHandleWriteType : 	STRUCT 
		Status : UINT;
		NewEvent : BOOL;
	END_STRUCT;
	Cp61850ClientInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		CycleTime : UINT;
		InitStep : INT;
		DiscoveryCompleted : BOOL;
		IpAddress : UDINT;
		pMmsClient : UDINT;
		pClientCB : UDINT;
		StartTime : TIME;
		InitializationTime : TIME;
	END_STRUCT;
	Cp61850ClientParametersType : 	STRUCT  (*Structure containing initialization parameters for the client*)
		IpAddress : STRING[80]; (*IP address of server, e.g. '192.168.0.10'*)
		TcpPort : UINT := 102; (*TCP port number on the server*)
	END_STRUCT;
	Cp61850ClientSetAttributeIntType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		CycleTime : UINT;
		InitStep : INT;
		pVariable : UDINT;
		pNode : UDINT;
		pMmsVariable : UDINT;
		HandleRead : Cp61850ClientHandleReadType;
		HandleWrite : Cp61850ClientHandleWriteType;
		oldWrite : BOOL;
	END_STRUCT;
	Cp61850DbposEnum : 
		( (*Double-bit point value*)
		cp61850_DBPOS_INTERMEDIATE, (*Intermediate state*)
		cp61850_DBPOS_OFF, (*Off*)
		cp61850_DBPOS_ON, (*On*)
		cp61850_DBPOS_BAD (*Bad state*)
		);
	Cp61850ErrorEnum : 
		( (*Status and error numbers*)
		cp61850_NO_ERROR := 0,
		cp61850_ERR_ASSERT := -1057216702, (*TEST_ASSERT failed*)
		cp61850_ERR_INIT_SERVER := -1057216701, (*Server initialization failed*)
		cp61850_ERR_SET_ATTRIBUTE_FAILED := -1057216700, (*Failed to set attribute on server*)
		cp61850_ERR_GET_ATTRIBUTE_FAILED := -1057216699, (*Failed to get attribute from server*)
		cp61850_ERR_INVALID_REFERENCE := -1057216698, (*Invalid reference*)
		cp61850_ERR_INVALID_VARIABLE := -1057216697, (*Invalid variable*)
		cp61850_ERR_INIT_GOOSE := -1057216696, (*Goose initialization failed*)
		cp61850_ERR_DATA_TYPE_MISMATCH := -1057216695, (*Data types do not match*)
		cp61850_ERR_CONF_FILE_NOT_FOUND := -1057216694, (*Configuration file not found*)
		cp61850_ERR_INIT_CLIENT := -1057216693, (*Client initialization failed*)
		cp61850_ERR_CONTROL_FAILED := -1057216692, (*Control operation failed*)
		cp61850_ERR_LOG_OPERATION_FAILED := -1057216691, (*Log control block operation failed*)
		cp61850_WRN_TERMINATED := -2130958526, (*Server stopped*)
		cp61850_WRN_CLIENT_TERMINATED := -2130958525, (*Client stopped*)
		cp61850_SUC_STARTED := 16525122, (*Server started*)
		cp61850_SUC_CLIENT_STARTED := 16525123, (*Client started*)
		cp61850_INF_DEBUG := 1090266946 (*Debug message*)
		);
	Cp61850FubStateEnum : 
		(
		cp61850_FS_DISABLED,
		cp61850_FS_INIT,
		cp61850_FS_ACTIVE,
		cp61850_FS_DEINIT,
		cp61850_FS_ERROR
		);
	Cp61850FunctionalConstraintEnum : 
		( (*For detailed information see the IEC 61850-7-2 standard, table 4*)
		cp61850_FC_NONE,
		cp61850_FC_ST,
		cp61850_FC_MX,
		cp61850_FC_SP,
		cp61850_FC_SV,
		cp61850_FC_CF,
		cp61850_FC_DC,
		cp61850_FC_SG,
		cp61850_FC_SE,
		cp61850_FC_SR,
		cp61850_FC_OR,
		cp61850_FC_BL,
		cp61850_FC_EX,
		cp61850_FC_CO,
		cp61850_FC_GO
		);
	Cp61850LogLevelEnum : 
		( (*Specifies the logging level*)
		cp61850_LOG_LEVEL_INFO, (*Logs all messages except debugging messages*)
		cp61850_LOG_LEVEL_SUCCESS, (*Logs errors, warnings and success messages*)
		cp61850_LOG_LEVEL_WARNING, (*Logs errors and warnings*)
		cp61850_LOG_LEVEL_ERROR, (*Logs errors only*)
		cp61850_LOG_LEVEL_DEBUG (*Logs all messages including debugging messages*)
		);
	Cp61850QualityDetailType : 	STRUCT  (*See the IEC 61850-7-1 standard for detailed information*)
		Overflow : BOOL;
		OutOfRange : BOOL;
		BadReference : BOOL;
		Oscillatory : BOOL;
		Failure : BOOL;
		OldData : BOOL;
		Inconsistent : BOOL;
		Inaccurate : BOOL;
	END_STRUCT;
	Cp61850QualityType : 	STRUCT  (*See the IEC 61850-7-1 standard for detailed information*)
		Validity : Cp61850QualityValidityEnum;
		Detail : Cp61850QualityDetailType;
		SourceSubstituted : BOOL;
		Test : BOOL;
		OperatorBlocked : BOOL;
	END_STRUCT;
	Cp61850QualityValidityEnum : 
		( (*See the IEC 61850-7-1 standard for detailed information*)
		cp61850_QV_GOOD,
		cp61850_QV_INVALID,
		cp61850_QV_RESERVED,
		cp61850_QV_QUESTIONABLE
		);
	Cp61850ServerControlInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		InitStep : INT;
		pDataObject : UDINT;
		pDataAttribute : UDINT;
		HandleControl : Cp61850ServerHandleControlType;
	END_STRUCT;
	Cp61850ServerGooseInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		InitStep : INT;
		EnableAllGooses : BOOL;
	END_STRUCT;
	Cp61850ServerHandleControlType : 	STRUCT 
		NewEvent : BOOL;
	END_STRUCT;
	Cp61850ServerInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		CycleTime : UINT;
		InitStep : INT;
		StartTime : TIME;
		InitializationTime : TIME;
	END_STRUCT;
	Cp61850ServerParametersType : 	STRUCT  (*Structure containing initialization parameters for the server*)
		Interface : STRING[80]; (*Ethernet interface used for MMS communication, e.g. 'IF2'. This parameter is optional.*)
		FileDevice : STRING[80] := 'USER'; (*Location where the configuration file is stored. Default value 'USER' means that the configuration file is on the USER partition of the controller*)
		ConfigFile : STRING[80]; (*Configuration file name, e.g. 'bnr_sample.cid'*)
		IedName : STRING[80]; (*If the configuration file contains multiple IEDs, select the one to use*)
	END_STRUCT;
	Cp61850ServerSetAttributeIntType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		InitStep : INT;
		pDataAttribute : UDINT;
		pVariable : UDINT;
	END_STRUCT;
	LogTestInternalType : 	STRUCT 
		FubState : Cp61850FubStateEnum;
		InitStep : INT;
		pLog : UDINT;
	END_STRUCT;
END_TYPE
