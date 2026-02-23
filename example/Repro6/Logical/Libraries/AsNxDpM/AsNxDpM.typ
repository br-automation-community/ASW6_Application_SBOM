                                                                      
TYPE
	nxdpmLifeList_t			: STRUCT			(*life list*)
		node				: ARRAY[0..127] OF USINT;
	END_STRUCT;
	
	nxdpmDiagData_t			: STRUCT			(*diagnoctic data*)
		status1				: USINT;			(*status1*)
		status2				: USINT;			(*status2*)
		status3				: USINT;			(*status3*)
		address				: USINT;			(*address*)
		identHigh			: USINT;			(*ident high*)
		identLow			: USINT;			(*ident low*)
		blockData			: ARRAY[0..237] OF USINT;
	END_STRUCT;
	
	nxdpmAddAdrParam_t		: STRUCT			(*additional address parameter*)
		srcType				: USINT;
		srcSize				: USINT;
		destType			: USINT;
		destSize			: USINT;
		addParam			: ARRAY[0..227] OF USINT;
	END_STRUCT;
END_TYPE
