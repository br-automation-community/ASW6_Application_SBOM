{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscShmOpen		(*opens a shared memory partition*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the shared memory partition*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Ident			: UDINT;			(*identifier of the shared memory partition*)	(**) (*#PAR*)
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Size            : UDINT;            (*shared memory partition size*) 	(**) (*#PAR*)
		Address         : UDINT;            (*address of the shared memory partition*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArIscShmClose		(*closes the shared memory partition*)
	VAR_INPUT
		Ident			: UDINT;			(*identifier of the shared memory partition*)	(**) (*#PAR*)
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
