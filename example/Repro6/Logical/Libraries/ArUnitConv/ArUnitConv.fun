
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitConvIsConvertible		(*Checks if units are convertible*)
	VAR_INPUT
		Execute					: BOOL;			(*Start execution.*)
		InputUnitID				: UDINT;		(*Identifier of input unit.*)
		InputUnitNamespaceID	: UDINT;		(*Identifier of input unit namespace, 0 for default namespace.*)
		OutputUnitID			: UDINT;		(*Identifier of output unit.*)
		OutputUnitNamespaceID	: UDINT;		(*Identifier of output unit namespace, 0 for default namespace.*)
	END_VAR
	VAR_OUTPUT
		Done					: BOOL;			(*Execution done.*)
		Busy					: BOOL;			(*Execution running.*)
		Error					: BOOL;			(*Execution failed.*)
		StatusID		 		: DINT;			(*Execution error: see help.*)
		Convertible				: BOOL;			(*Returns TRUE when the units are convertible, FALSE if not.*)
	END_VAR
	VAR
        Internal				: ArUnitConvAsyncInternalType;		(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitConvConvert		(*Converts a value from one unit to another.*)
	VAR_INPUT
		Execute					: BOOL;			(*Start execution.*)
		InputUnitID				: UDINT;		(*Identifier of input unit.*)
		InputUnitNamespaceID	: UDINT;		(*Identifier of input unit namespace, 0 for default namespace.*)
		OutputUnitID			: UDINT;		(*Identifier of output unit.*)
		OutputUnitNamespaceID	: UDINT;		(*Identifier of output unit namespace, 0 for default namespace.*)
		InputValue				: LREAL;		(*Value for conversion.*)
	END_VAR
	VAR_OUTPUT
		Done					: BOOL;			(*Execution done.*)
		Busy					: BOOL;         (*Execution running.*)
		Error					: BOOL;         (*Execution failed.*)
		StatusID		 		: DINT;			(*Execution error: see help.*)
		OutputValue				: LREAL;		(*Converted value.*)
	END_VAR
	VAR
        Internal				: ArUnitConvAsyncInternalType;		(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitConvCommonCodeToUnitID		(*Converts the common code of an unit to its identifier.*)
	VAR_INPUT
		Execute			: BOOL;				(*Start execution.*)
		CommonCode		: STRING[3];		(*Common code.*)
	END_VAR
	VAR_OUTPUT
		Done					: BOOL;		(*Execution done.*)
		Busy					: BOOL;     (*Execution running.*)
		Error					: BOOL;     (*Execution failed.*)
		StatusID		 		: DINT;	    (*Execution error: see help.*)
		UnitID					: UDINT;    (*Unit identifier.*)
	END_VAR
	VAR
        Internal				: ArUnitConvAsyncInternalType;		(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitConvGetNamespaceID		(*Converts the namespace string to a namespace identifier*)
	VAR_INPUT
		Execute			: BOOL;				(*Start execution.*)
		Namespace		: UDINT;			(*Pointer to a string containing the namespace.*)
	END_VAR
	VAR_OUTPUT
		Done					: BOOL;		(*Execution done.*)
		Busy					: BOOL;     (*Execution running.*)
		Error					: BOOL;     (*Execution failed.*)
		StatusID		 		: DINT;	    (*Execution error: see help.*)
		NamespaceID				: USINT;    (*Namespace identifier.*)
	END_VAR
	VAR
        Internal				: ArUnitConvAsyncInternalType;		(*Internal Variable.*)
	END_VAR
END_FUNCTION_BLOCK
