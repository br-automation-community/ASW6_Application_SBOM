
TYPE
	CpDnp3AnalogInputInternalType : {REDUND_UNREPLICABLE} 	STRUCT 
		FubState : {REDUND_UNREPLICABLE} CpDnp3FubStateEnum;
		pPoint : {REDUND_UNREPLICABLE} UDINT;
		pFrozenPoint : {REDUND_UNREPLICABLE} UDINT;
		InitStep : {REDUND_UNREPLICABLE} INT;
	END_STRUCT;
	CpDnp3AnalogInputsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of analog inputs*)
		Points : {REDUND_UNREPLICABLE} UINT := 3; (*Number of data points*)
	END_STRUCT;
	CpDnp3AnalogOutputsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of analog outputs*)
		Points : {REDUND_UNREPLICABLE} UINT := 3; (*Number of data points*)
	END_STRUCT;
	CpDnp3AnalogValueEnum : 
		( (*Specifies the data type of the analog data point*)
		cpDNP3_ANALOG_VALUE_INT, (*Used value type: INT*)
		cpDNP3_ANALOG_VALUE_DINT, (*Used value type: DINT*)
		cpDNP3_ANALOG_VALUE_REAL, (*Used value type: REAL*)
		cpDNP3_ANALOG_VALUE_LREAL (*Used value type: LREAL*)
		);
	CpDnp3AnalogValueType : {REDUND_UNREPLICABLE} 	STRUCT  (*Analog data point value*)
		INT_ : {REDUND_UNREPLICABLE} INT; (*Used when ValueType = cpDNP3_ANALOG_VALUE_INT*)
		DINT_ : {REDUND_UNREPLICABLE} DINT; (*Used when ValueType = cpDNP3_ANALOG_VALUE_DINT*)
		REAL_ : {REDUND_UNREPLICABLE} REAL; (*Used when ValueType = cpDNP3_ANALOG_VALUE_REAL*)
		LREAL_ : {REDUND_UNREPLICABLE} LREAL; (*Used when ValueType = cpDNP3_ANALOG_VALUE_LREAL*)
	END_STRUCT;
	CpDnp3BinaryInputInternalType : {REDUND_UNREPLICABLE} 	STRUCT 
		FubState : {REDUND_UNREPLICABLE} CpDnp3FubStateEnum;
		pPoint : {REDUND_UNREPLICABLE} UDINT;
		InitStep : {REDUND_UNREPLICABLE} INT;
	END_STRUCT;
	CpDnp3BinaryInputsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of binary inputs*)
		Points : {REDUND_UNREPLICABLE} UINT := 3; (*Number of data points*)
	END_STRUCT;
	CpDnp3BinaryOutputInternalType : {REDUND_UNREPLICABLE} 	STRUCT 
		FubState : {REDUND_UNREPLICABLE} CpDnp3FubStateEnum;
		pPoint : {REDUND_UNREPLICABLE} UDINT;
		pCmdPoint : {REDUND_UNREPLICABLE} UDINT;
		InitStep : {REDUND_UNREPLICABLE} INT;
	END_STRUCT;
	CpDnp3BinaryOutputsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of binary outputs*)
		Points : {REDUND_UNREPLICABLE} UINT := 3; (*Number of data points*)
	END_STRUCT;
	CpDnp3BufferUsageType : {REDUND_UNREPLICABLE} 	STRUCT  (*Amount of events stored in buffers*)
		BinaryInputs : {REDUND_UNREPLICABLE} UDINT;
		DoubleInputs : {REDUND_UNREPLICABLE} UDINT;
		Counters : {REDUND_UNREPLICABLE} UDINT;
		AnalogInputs : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	CpDnp3ClassEnum : 
		( (*Class in which the data point is reported*)
		cpDNP3_CLASS_0 := 1, (*Data points are included in Class 0 polls only*)
		cpDNP3_CLASS_1 := 2, (*Data points are included in Class 0 and Class 1 polls*)
		cpDNP3_CLASS_2 := 4, (*Data points are included in Class 0 and Class 2 polls*)
		cpDNP3_CLASS_3 := 8, (*Data points are included in Class 0 and Class 3 polls*)
		cpDNP3_NO_CLASS := 16 (*Data points are not included in class polls*)
		);
	CpDnp3CountersType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of counters*)
		Points : {REDUND_UNREPLICABLE} UINT; (*Number of data points*)
	END_STRUCT;
	CpDnp3CounterValueEnum : 
		( (*Specifies the data type of the counter data point*)
		cpDNP3_COUNTER_VALUE_INT, (*Used value type: INT*)
		cpDNP3_COUNTER_VALUE_DINT, (*Used value type: DINT*)
		cpDNP3_COUNTER_VALUE_UINT, (*Used value type: UINT*)
		cpDNP3_COUNTER_VALUE_UDINT (*Used value type: UDINT*)
		);
	CpDnp3CounterValueType : {REDUND_UNREPLICABLE} 	STRUCT  (*Counter point value*)
		INT_ : {REDUND_UNREPLICABLE} INT; (*Used when ValueType = cpDNP3_COUNTER_VALUE_INT*)
		DINT_ : {REDUND_UNREPLICABLE} DINT; (*Used when ValueType = cpDNP3_COUNTER_VALUE_DINT*)
		UINT_ : {REDUND_UNREPLICABLE} UINT; (*Used when ValueType = cpDNP3_COUNTER_VALUE_UINT*)
		UDINT_ : {REDUND_UNREPLICABLE} UDINT; (*Used when ValueType = cpDNP3_COUNTER_VALUE_UDINT*)
	END_STRUCT;
	CpDnp3DoubleInputEnum : 
		( (*Double-bit point value*)
		cpDNP3_DI_INTERMEDIATE, (*Transitioning between end conditions*)
		cpDNP3_DI_OFF, (*Determined to be OFF*)
		cpDNP3_DI_ON, (*Determined to be ON*)
		cpDNP3_DI_INDETERMINATE (*Abnormal or custom condition*)
		);
	CpDnp3DoubleInputsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of double-bit binary inputs*)
		Points : {REDUND_UNREPLICABLE} UINT; (*Number of data points*)
	END_STRUCT;
	CpDnp3ErrorEnum : 
		( (*Status and error numbers*)
		cpDNP3_NO_ERROR := 0,
		cpDNP3_ERR_ASSERT := -1057216752, (*TEST_ASSERT failed*)
		cpDNP3_ERR_STACK_INIT_FAILED := -1057216751, (*Outstation initialization failed*)
		cpDNP3_ERR_MASTER_NOT_REGISTERED := -1057216750, (*Master IP could not be registered*)
		cpDNP3_ERR_DP_WRITE_FAILED := -1057216749, (*Write to datapoint failed*)
		cpDNP3_ERR_INVALID_DP := -1057216748, (*Invalid data point*)
		cpDNP3_WRN_TERMINATED := -2130958576, (*Outstation has been stopped*)
		cpDNP3_WRN_INVALID_POINT_COUNT := -2130958575, (*Number of points exceeds max value*)
		cpDNP3_SUC_STARTED := 16525072, (*Outstation started*)
		cpDNP3_INF_DEBUG := 1090266896 (*DEBUG_INFO message*)
		);
	CpDnp3FubStateEnum : 
		(
		cpDNP3_FS_DISABLED,
		cpDNP3_FS_INIT,
		cpDNP3_FS_ACTIVE,
		cpDNP3_FS_DEINIT,
		cpDNP3_FS_ERROR
		);
	CpDnp3GroupEnum : 
		(
		cpDNP3_GRP_BINARY_INPUT := 1,
		cpDNP3_GRP_BINARY_INPUT_E := 2,
		cpDNP3_GRP_DOUBLE_BINARY_INPUT := 3,
		cpDNP3_GRP_DOUBLE_BINARY_INPUT_E := 4,
		cpDNP3_GRP_BINARY_OUTPUT_STATUS := 10,
		cpDNP3_GRP_BINARY_OUTPUT_E := 11,
		cpDNP3_GRP_BINARY_OUTPUT_CMD := 12,
		cpDNP3_GRP_BINARY_OUTPUT_CMD_E := 13,
		cpDNP3_GRP_COUNTER := 20,
		cpDNP3_GRP_FROZEN_COUNTER := 21,
		cpDNP3_GRP_COUNTER_E := 22,
		cpDNP3_GRP_FROZEN_COUNTER_E := 23,
		cpDNP3_GRP_ANALOG_INPUT := 30,
		cpDNP3_GRP_FROZEN_ANALOG_INPUT := 31,
		cpDNP3_GRP_ANALOG_INPUT_E := 32,
		cpDNP3_GRP_FROZEN_ANALOG_INPUT_E := 33,
		cpDNP3_GRP_ANALOG_INPUT_DB := 34,
		cpDNP3_GRP_ANALOG_OUTPUT_STATUS := 40,
		cpDNP3_GRP_ANALOG_OUTPUT := 41,
		cpDNP3_GRP_ANALOG_OUTPUT_E := 42,
		cpDNP3_GRP_ANALOG_OUTPUT_CMD_E := 43,
		cpDNP3_GRP_OCTET_STRING := 110,
		cpDNP3_GRP_OCTET_STRING_E := 111
		);
	CpDnp3LogLevelEnum : 
		( (*Specifies the logging level*)
		cpDNP3_LOG_LEVEL_INFO, (*Logs all messages except debugging messages*)
		cpDNP3_LOG_LEVEL_SUCCESS, (*Logs errors, warnings and success messages*)
		cpDNP3_LOG_LEVEL_WARNING, (*Logs errors and warnings*)
		cpDNP3_LOG_LEVEL_ERROR, (*Logs errors only*)
		cpDNP3_LOG_LEVEL_DEBUG (*Logs all messages including debugging messages*)
		);
	CpDnp3OctetStringsType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of octet strings*)
		Points : {REDUND_UNREPLICABLE} UINT; (*Number of data points*)
		Class0 : {REDUND_UNREPLICABLE} BOOL; (*Include data points in Class 0 polls*)
	END_STRUCT;
	CpDnp3OutstationInternalType : {REDUND_UNREPLICABLE} 	STRUCT 
		FubState : {REDUND_UNREPLICABLE} CpDnp3FubStateEnum;
		CycleTime : {REDUND_UNREPLICABLE} UINT;
		InitStep : {REDUND_UNREPLICABLE} INT;
		pOs : {REDUND_UNREPLICABLE} UDINT;
		pServer : {REDUND_UNREPLICABLE} UDINT;
		StartTime : {REDUND_UNREPLICABLE} TIME;
		InitializationTime : {REDUND_UNREPLICABLE} TIME;
	END_STRUCT;
	CpDnp3ParametersType : {REDUND_UNREPLICABLE} 	STRUCT  (*Structure containing initialization parameters*)
		OutstationAddress : {REDUND_UNREPLICABLE} UINT := 1; (*Outstation link layer address*)
		TcpParameters : {REDUND_UNREPLICABLE} CpDnp3TcpParType; (*TCP configuration*)
		BinaryInputs : {REDUND_UNREPLICABLE} CpDnp3BinaryInputsType; (*Configuration of binary inputs*)
		DoubleInputs : {REDUND_UNREPLICABLE} CpDnp3DoubleInputsType; (*Configuration of double-bit binary inputs*)
		BinaryOutputs : {REDUND_UNREPLICABLE} CpDnp3BinaryOutputsType; (*Configuration of binary outputs*)
		Counters : {REDUND_UNREPLICABLE} CpDnp3CountersType; (*Configuration of counters*)
		AnalogInputs : {REDUND_UNREPLICABLE} CpDnp3AnalogInputsType; (*Configuration of analog inputs*)
		AnalogOutputs : {REDUND_UNREPLICABLE} CpDnp3AnalogOutputsType; (*Configuration of analog outputs*)
		OctetStrings : {REDUND_UNREPLICABLE} CpDnp3OctetStringsType; (*Configuration of octet strings*)
		Unsolicited : {REDUND_UNREPLICABLE} CpDnp3UnsolicitedType; (*Configuration of unsolicited messages*)
		SelfAddress : {REDUND_UNREPLICABLE} BOOL; (*Enable self-address feature (outstation responds to requests with a destination address 0xFFFC)*)
		TlsParameters : {REDUND_UNREPLICABLE} CpDnp3TlsParType; (*Configuration of Transport Layer Security*)
	END_STRUCT;
	CpDnp3TcpParType : {REDUND_UNREPLICABLE} 	STRUCT  (*TCP configuration of the outstation*)
		TcpPort : {REDUND_UNREPLICABLE} UINT := 20000; (*Port on which the outstation is listening*)
		ReceiveTimeout : {REDUND_UNREPLICABLE} UINT := 4000; (*Receive timeout*)
		Retries : {REDUND_UNREPLICABLE} UINT := 5; (*Retries after timeout*)
		KeepAliveTimeout : {REDUND_UNREPLICABLE} UINT := 2000; (*Keep alive timeout*)
		InterfaceName : {REDUND_UNREPLICABLE} STRING[80]; (*Optional parameter, e.g. "IF2"*)
		MasterAddress : {REDUND_UNREPLICABLE} STRING[255]; (*List of permissible master addresses separated by a comma or semicolon, e.g. "192.168.0.10"*)
		MultipleMasters : {REDUND_UNREPLICABLE} BOOL; (*Permits the connection of multiple masters to the outstation*)
	END_STRUCT;
	CpDnp3TlsParType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of Transport Layer Security*)
		Enabled : {REDUND_UNREPLICABLE} BOOL := FALSE; (*Use TLS for security*)
		ConfigurationName : {REDUND_UNREPLICABLE} STRING[80] := ''; (*Name of TLS configuration in the AS project*)
	END_STRUCT;
	CpDnp3UnsolicitedType : {REDUND_UNREPLICABLE} 	STRUCT  (*Configuration of unsolicited messages*)
		Enabled : {REDUND_UNREPLICABLE} BOOL := FALSE; (*Permits unsolicited messages*)
		MasterAddress : {REDUND_UNREPLICABLE} UINT := 65535; (*Destination link address used for unsolicited messages. Use 65535 to determine the address automatically*)
	END_STRUCT;
	CpDnp3VariationEnum : 
		( (*Default variation*)
		cpDNP3_VARIATION_1 := 1, (*Uses variation 1*)
		cpDNP3_VARIATION_2, (*Uses variation 2*)
		cpDNP3_VARIATION_3, (*Uses variation 3*)
		cpDNP3_VARIATION_4, (*Uses variation 4*)
		cpDNP3_VARIATION_5, (*Uses variation 5*)
		cpDNP3_VARIATION_6, (*Uses variation 6*)
		cpDNP3_VARIATION_7, (*Uses variation 7*)
		cpDNP3_VARIATION_8, (*Uses variation 8*)
		cpDNP3_VARIATION_9, (*Uses variation 9*)
		cpDNP3_VARIATION_10, (*Uses variation 10*)
		cpDNP3_VARIATION_11, (*Uses variation 11*)
		cpDNP3_VARIATION_12 (*Uses variation 12*)
		);
END_TYPE
