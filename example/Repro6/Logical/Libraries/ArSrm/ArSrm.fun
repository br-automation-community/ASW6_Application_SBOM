
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSrmGetSiteManagerPar (*Get several SiteManager parameters with one execution*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Start execution*) (* *) (*#PAR#;*)
		DeviceName : {REDUND_UNREPLICABLE} STRING[255]; (*Device name of the SiteManager hardware module (for example: 'IF2.ST1')*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO ArSrmSiteManagerParType; (*SiteManager parameters to be read. Given as a reference to an array of type ArSrmSiteManagerParType.*) (* *) (*#PAR#;*)
		NrOfParameters : {REDUND_UNREPLICABLE} UINT; (*Number of parameters specified in Parameters array*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful*) (* *) (*#PAR#;*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Execution running*) (* *) (*#PAR#;*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Execution failed*) (* *) (*#PAR#;*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Execution status information: see help*) (* *) (*#PAR#;*)
		InvalidSiteManagerPar : {REDUND_UNREPLICABLE} STRING[80]; (*Name of the wrong parameter*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArSrmSetSiteManagerPar (*Set several SiteManager parameters with one execution*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Start execution*) (* *) (*#PAR#;*)
		DeviceName : {REDUND_UNREPLICABLE} STRING[255]; (*Device name of the SiteManager hardware module (for example: 'IF2.ST1')*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO ArSrmSiteManagerParType; (*SiteManager parameters to be written. Given as a reference to an array of type ArSrmSiteManagerParType.*) (* *) (*#PAR#;*)
		NrOfParameters : {REDUND_UNREPLICABLE} UINT; (*Number of parameters specified in Parameters array*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execution successful*) (* *) (*#PAR#;*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Execution running*) (* *) (*#PAR#;*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Execution failed*) (* *) (*#PAR#;*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Execution status information: see help*) (* *) (*#PAR#;*)
		InvalidSiteManagerPar : {REDUND_UNREPLICABLE} STRING[80]; (*Name of the wrong parameter*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ARRAY[0..31] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
