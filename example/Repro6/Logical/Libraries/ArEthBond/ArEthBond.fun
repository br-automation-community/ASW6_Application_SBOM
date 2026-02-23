
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArEthBondGetData 					 		(*reads data from a bond*)
	VAR_INPUT
		Execute				: BOOL;							(*execute the FB*)
		Name				: STRING[128];					(*name of the bond*)
	END_VAR

	VAR_OUTPUT
		Done	 			: BOOL;							(*execution of the FB finished*)
		Error				: BOOL;							(*execution of the FB failed*)
		ErrorID				: DINT;  						(*error number if execution of the FB has failed*)
		Configuration		: ArEthBondConfigurationType;	(*configuration data of the bond*)
		State				: ArEthBondStateType;			(*status data of the bond*)
		Statistics			: ArEthBondStatisticsType;		(*statistical data of the bond*)
	END_VAR

	VAR
        Internal			: ArEthBondInternalType; 		(*internal variable*)
	END_VAR		
END_FUNCTION_BLOCK
