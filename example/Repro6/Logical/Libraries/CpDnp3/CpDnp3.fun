
{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3AnalogInput (*Handles an analog input data point (object groups 30 to 34)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		ValueType : {REDUND_UNREPLICABLE} CpDnp3AnalogValueEnum := cpDNP3_ANALOG_VALUE_INT; (*Specifies the data type of the data point*)
		UseFlags : {REDUND_UNREPLICABLE} BOOL := TRUE; (*Specifies whether flags are used*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_2; (*Class in which the data point is reported*)
		FrozenClass : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_NO_CLASS; (*Class in which the frozen data point is reported*)
		Deadband : {REDUND_UNREPLICABLE} LREAL; (*Deadband for event generation*)
		Value : {REDUND_UNREPLICABLE} CpDnp3AnalogValueType; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
		FrozenVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default frozen static variation*)
		FrozenEventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default frozen event variation*)
		FrozenValue : {REDUND_UNREPLICABLE} CpDnp3AnalogValueType; (*Frozen data point value*)
		FrozenFlags : {REDUND_UNREPLICABLE} USINT; (*Frozen data point flags*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3AnalogInputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3AnalogOutput (*Handles an analog output data point (object groups 40 to 43)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		ValueType : {REDUND_UNREPLICABLE} CpDnp3AnalogValueEnum := cpDNP3_ANALOG_VALUE_INT; (*Specifies the data type of the data point*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_2; (*Class in which the data point is reported*)
		CmdClass : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_NO_CLASS; (*Class used to report commands*)
		Deadband : {REDUND_UNREPLICABLE} LREAL; (*Deadband for event generation*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
		CommandEventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default command event variation*)
		Value : {REDUND_UNREPLICABLE} CpDnp3AnalogValueType; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3BinaryOutputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3BinaryInput (*Handles a binary input data point (object groups 1 and 2)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		UseFlags : {REDUND_UNREPLICABLE} BOOL := FALSE; (*Specifies whether flags are used*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_1; (*Class in which the data point is reported*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3BinaryInputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3BinaryOutput (*Handles a binary output data point (object groups 10 to 13)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		UseFlags : {REDUND_UNREPLICABLE} BOOL := TRUE; (*Specifies whether flags are used*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_1; (*Class in which the data point is reported*)
		CmdClass : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_NO_CLASS; (*Class used to report commands*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
		CommandEventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default command event variation*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3BinaryOutputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3Counter (*Handles a counter input data point (object groups 20 to 23)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		ValueType : {REDUND_UNREPLICABLE} CpDnp3CounterValueEnum := cpDNP3_COUNTER_VALUE_DINT; (*Specifies the data type of the data point*)
		UseFlags : {REDUND_UNREPLICABLE} BOOL := TRUE; (*Specifies whether flags are used*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_3; (*Class in which the data point is reported*)
		FrozenClass : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_3; (*Class in which the frozen data point is reported*)
		Value : {REDUND_UNREPLICABLE} CpDnp3CounterValueType; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
		FrozenVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default frozen static variation*)
		FrozenEventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default frozen event variation*)
		FrozenValue : {REDUND_UNREPLICABLE} CpDnp3CounterValueType; (*Frozen data point value*)
		FrozenFlags : {REDUND_UNREPLICABLE} USINT; (*Frozen data point flags*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3AnalogInputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3DoubleInput (*Handles a double-bit binary input data point (object groups 3 and 4)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		UseFlags : {REDUND_UNREPLICABLE} BOOL := FALSE; (*Specifies whether flags are used*)
		Class : {REDUND_UNREPLICABLE} CpDnp3ClassEnum := cpDNP3_CLASS_1; (*Class in which the data point is reported*)
		Value : {REDUND_UNREPLICABLE} CpDnp3DoubleInputEnum; (*Data point value*)
		Flags : {REDUND_UNREPLICABLE} USINT; (*Data point flags*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		Variation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default static variation*)
		EventVariation : {REDUND_UNREPLICABLE} CpDnp3VariationEnum; (*Default event variation*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3BinaryInputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3OctetString (*Handles an octet string data point (object groups 110 and 111)*)
	VAR_INPUT
		Outstation : REFERENCE TO CpDnp3Outstation; (*Reference to function block CpDnp3Outstation*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Index : {REDUND_UNREPLICABLE} UINT; (*Data point number*)
		Value : {REDUND_UNREPLICABLE} ARRAY[0..254] OF USINT; (*Octet string*)
		Length : {REDUND_UNREPLICABLE} USINT; (*Length of octet string*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3BinaryInputInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK CpDnp3Outstation (*Main function block for communication*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Parameters : {REDUND_UNREPLICABLE} CpDnp3ParametersType; (*Structure containing initialization parameters*)
		LogLevel : {REDUND_UNREPLICABLE} CpDnp3LogLevelEnum; (*Specifies the logging level*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is ready*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} CpDnp3ErrorEnum; (*Error number*)
		ColdRestart : {REDUND_UNREPLICABLE} BOOL; (*A cold restart request has been received*)
		WarmRestart : {REDUND_UNREPLICABLE} BOOL; (*A warm restart request has been received*)
		BufferUsage : {REDUND_UNREPLICABLE} CpDnp3BufferUsageType; (*Amount of events stored in buffers*)
		Clients : {REDUND_UNREPLICABLE} UINT; (*Number of connected clients*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} CpDnp3OutstationInternalType;
	END_VAR
END_FUNCTION_BLOCK
