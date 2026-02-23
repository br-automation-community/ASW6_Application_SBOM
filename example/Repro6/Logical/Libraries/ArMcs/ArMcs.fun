
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArMcsRecreateCert		(*recreates the default certificate*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		McsName 		: STRING[255];		(*name of managed cert store*)	(**) (*#PAR*)
		URI				: STRING[513];		(*URI*) 						(**) (*#PAR*)
		DnsNames		: UDINT;			(*pointer to the DNS names (given as pointer to ARRAY OF STRING[255]DNS names)*)	(**) (*#PAR*)
		DnsNameCount	: UDINT;			(*number of DNs names*)			(**) (*#PAR*)
		IPs				: UDINT;			(*pointer to the IPs (given as pointer to ARRAY OF STRING[255]IP names)*) 			(**) (*#PAR*)
		IPCount			: UDINT;			(*number of IPs*)				(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArMcsAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK