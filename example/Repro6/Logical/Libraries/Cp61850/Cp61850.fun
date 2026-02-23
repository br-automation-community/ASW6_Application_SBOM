
{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850Client (*Handles client communication*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Parameters : {REDUND_UNREPLICABLE} Cp61850ClientParametersType; (*Structure containing initialization parameters*)
		LogLevel : {REDUND_UNREPLICABLE} Cp61850LogLevelEnum; (*Specifies the logging level*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error has occurred*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ClientInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ClientControl (*Sends a control command to the server*)
	VAR_INPUT
		Client : REFERENCE TO Cp61850Client; (*Reference to the client communication function block*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data object, e.g. 'BnRLD0/SWTCSWI0.CO.Pos'*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*Control value (FALSE = off, TRUE = on)*)
		Control : {REDUND_UNREPLICABLE} BOOL; (*A rising edge sends a control command to the server*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		ControlDone : {REDUND_UNREPLICABLE} BOOL; (*Control command was succesfull*)
		ControlCounter : {REDUND_UNREPLICABLE} UDINT; (*Counter of control commands*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ClientControlInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ClientGetAttribute (*Reads a data attribute from the server*)
	VAR_INPUT
		Client : REFERENCE TO Cp61850Client; (*Reference to the client communication function block*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data attribute, e.g. 'BnRLD0/DINGGIO0.ST.Input1.stVal'*)
		Variable : {REDUND_UNREPLICABLE} STRING[255]; (*Name of the variable on the controller, e.g. 'Client:getBooleanValue'*)
		PollingPeriod : {REDUND_UNREPLICABLE} TIME := T#1s; (*Polling time interval in [ms]*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		AttributeType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the referenced attribute*)
		VariableType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the PLC variable*)
		FunctionalConstraint : {REDUND_UNREPLICABLE} Cp61850FunctionalConstraintEnum; (*Functional constraint*)
		ReadCounter : {REDUND_UNREPLICABLE} UDINT; (*Reading counter*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ClientGetAttributeIntType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ClientSetAttribute (*Writes a data attribute to the server*)
	VAR_INPUT
		Client : REFERENCE TO Cp61850Client; (*Reference to the client communication function block*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data attribute, e.g. 'BnRLD0/LGOS1.SP.GoCBRef.tstEna'*)
		Variable : {REDUND_UNREPLICABLE} STRING[255]; (*Name of the variable on the controller, e.g. 'Client:setBooleanValue'*)
		Write : {REDUND_UNREPLICABLE} BOOL; (*A rising edge writes a value to the server*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		AttributeType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the referenced attribute*)
		VariableType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the PLC variable*)
		FunctionalConstraint : {REDUND_UNREPLICABLE} Cp61850FunctionalConstraintEnum; (*Functional constraint*)
		WriteDone : {REDUND_UNREPLICABLE} BOOL; (*Writing to was succesfull*)
		WriteCounter : {REDUND_UNREPLICABLE} UDINT; (*Write counter*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ClientSetAttributeIntType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850Server (*Handles server communication*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Parameters : {REDUND_UNREPLICABLE} Cp61850ServerParametersType; (*Structure containing initialization parameters*)
		LogLevel : {REDUND_UNREPLICABLE} Cp61850LogLevelEnum; (*Specifies the logging level*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error has occurred*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		Clients : {REDUND_UNREPLICABLE} UINT; (*Number of connected clients*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ServerInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ServerControl (*Handles a control command*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data object, e.g. 'BnRLD0/SWTCSWI0.Pos'*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		Value : {REDUND_UNREPLICABLE} BOOL; (*Control value*)
		ControlCounter : {REDUND_UNREPLICABLE} UDINT; (*Counter of control commands*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ServerControlInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ServerGetAttribute (*Gets a data attribute from the server*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data attribute, e.g. 'LD0/DINGGIO0.Input1.stVal'*)
		Variable : {REDUND_UNREPLICABLE} STRING[255]; (*Name of the variable on the controller, e.g. 'Server:getBooleanValue'*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		AttributeType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the referenced attribute*)
		VariableType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the PLC variable*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ServerSetAttributeIntType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ServerGoose (*Handles GOOSE communication*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Interface : {REDUND_UNREPLICABLE} STRING[80] := 'IF2'; (*Ethernet interface used for GOOSE communication, e.g. 'IF2'. This parameter is mandatory.*)
		EnableAllGooses : {REDUND_UNREPLICABLE} BOOL; (*Enables all GOOSE control blocks*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error has occurred*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		GoosesReceived : {REDUND_UNREPLICABLE} UDINT; (*Number of received GOOSEs*)
		GoosesSent : {REDUND_UNREPLICABLE} UDINT; (*Number of sent GOOSEs*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ServerGooseInternalType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Cp61850ServerSetAttribute (*Sets a data attribute on the server*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables execution of the function block*)
		Reference : {REDUND_UNREPLICABLE} STRING[255]; (*Path to the data attribute, e.g. 'LD0/DINGGIO0.Input1.stVal'*)
		Variable : {REDUND_UNREPLICABLE} STRING[255]; (*Name of the variable on the controller, e.g. 'Server:setBooleanValue'*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*The function block is working*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*The function block is active*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*An error occurred during execution*)
		ErrorID : {REDUND_UNREPLICABLE} Cp61850ErrorEnum; (*Error number*)
		AttributeType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the referenced attribute*)
		VariableType : {REDUND_UNREPLICABLE} Cp61850AttributeEnum; (*Data type of the PLC variable*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Cp61850ServerSetAttributeIntType;
	END_VAR
END_FUNCTION_BLOCK

