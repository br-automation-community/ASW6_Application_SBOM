
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitTextGetText		(*Get text of units.*)
	VAR_INPUT
		Execute				: BOOL;						(*Start execution.*)
		UnitID				: DINT;						(*Identifier of unit.*)
		Namespace			: UDINT;					(*Pointer to a string with the namespace of the unit, 0 for default namespace.*)
		TextType			: ARUnitTextTypeEnum;		(*Type of text (Symbol, Name, ...).*)
		ResultText			: UDINT;					(*Pointer to the buffer to which the resulting text is copied.*)
		ResultSize			: UDINT;					(*Maximal length of resulting text.*)
		UseBRText			: BOOL;						(*Use unit text from B+R namespace as default.*)
		LanguageCode		: STRING[18];				(*Language code (eg. en, de).*)
	END_VAR
	VAR_OUTPUT
		Done				: BOOL; 					(*Execution done.*)
		Busy				: BOOL; 					(*Execution running.*)
		Error				: BOOL; 					(*Execution failed.*)
		StatusID			: DINT;						(*Execution error: see help.*)
		TextSize			: UDINT;					(*Length of text copied into result buffer.*)
	END_VAR
	VAR
        Internal			: ArUnitTextAsyncInternalType;		(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK




{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArUnitTextCommonCodeToUnitID		(*Converts the common code of an unit to its identifier.*)
	VAR_INPUT
		Execute			: BOOL;				(*Start execution.*)
		CommonCode		: STRING[3];		(*Common code.*)
	END_VAR
	VAR_OUTPUT
		Done					: BOOL;		(*Execution done.*)
		Busy					: BOOL;     (*Execution running.*)
		Error					: BOOL;     (*Execution failed.*)
		StatusID		 		: DINT;	    (*Execution error: see help.*)
		UnitID					: DINT;     (*Unit identifier.*)
	END_VAR
	VAR
        Internal				: ArUnitTextAsyncInternalType;		(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK
