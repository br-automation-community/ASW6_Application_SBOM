{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscEventCreate	(*creates an event*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the event*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Ident			: UDINT;			(*event identifier*)	(**) (*#PAR*)
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscEventOpen		(*opens an existing event*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the shared memory partition*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Ident			: UDINT;			(*event identifier*)	(**) (*#PAR*)
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscEventTrigger	(*triggers an event*)
	VAR_INPUT
		Ident			: UDINT;			(*event identifier*)			(**) (*#PAR*)
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscEventWait		(*waits for an event*)
	VAR_INPUT
		Ident			: UDINT;			(*event identifier*)			(**) (*#PAR*)
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Timeout         : UDINT;            (*timeout in milli seconds*)	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscEventClose		(*closes an event*)
	VAR_INPUT
		Ident			: UDINT;			(*event identifier*)			(**) (*#PAR*)
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK
