
TYPE
	MpDatabaseQueryRowsInfoType : 	STRUCT 
		Total : UDINT; (*How many rows did the query from the database totally return*)
		Read : UDINT; (*How many rows have been read already*)
		Remaining : UDINT; (*How many rows are left to be read (to control the 'Next' pin)*)
	END_STRUCT;
	MpDatabaseQueryInfoType : 	STRUCT 
		ArraySize : UDINT; (*For how many rows is space in the configured PV*)
		Rows : MpDatabaseQueryRowsInfoType; (*Information on how many rows the result set contains, how many rows have been read already and how many rows are left to be read.*)
		Diag : MpDatabaseDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
	MpDatabaseDiagType : 	STRUCT 
		StatusID : MpDatabaseStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpDatabaseStatusIDType : 	STRUCT 
		ID : MpDatabaseErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpDatabaseDateTimeType : 	STRUCT 
		DateTime : DATE_AND_TIME;
		Milliseconds : UDINT;
	END_STRUCT;
END_TYPE
