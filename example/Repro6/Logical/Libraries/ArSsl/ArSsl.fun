
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslCreateCfg   					(*creates an SSL configuration entry*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 				(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
		Configuration		: ArSslCfgType;			(*configuration settings of an SSL configuration*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*interne Variable*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslDeleteCfg		   				(*deletes an existing SSL configuration entry*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 				(**) (*#PAR*)
		Name			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslOpen   		   				(*opens an existing SSL configuration*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Ident			: UDINT;			(*identifier of the SSL configuration*)
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslClose 	    					(*closes an existing SSL configuration*)
	VAR_INPUT
		Ident			: UDINT;			(*identifier of the SSL configuration*)
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslGetCfgDetails					(*gets details from an SSL configuration*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*)	(**) (*#PAR*)
		Index			: UDINT;			(*index of the SSL configuration*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Details			: ArSslCfgDetailsType;		(*details of an SSL configuration*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslGetCipher 						(*gets the cipher with given index of the given SSL configuration*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the cipher*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Cipher			: STRING[63];			(*cipher*) 	(**) (*#CMD*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*interne Variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslGetCertificate 					(*gets the trusted certificate with given index of the given SSL configuration*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the trusted certificate*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		TrustedCertificate	: STRING[255];			(*trusted certificate*) 	(**) (*#CMD*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*interne Variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSslGetCRL 					(*gets the certificate revocation list with given index of the given SSL configuration*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];			(*name of the SSL configuration*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the trusted certificate*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		CRL			: STRING[255];			(*certificate revocation list*) 	(**) (*#CMD*)
	END_VAR
	VAR
		Internal		: ArSslAsyncInternalType;	(*interne Variable*)
	END_VAR
END_FUNCTION_BLOCK
