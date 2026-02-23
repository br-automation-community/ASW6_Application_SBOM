
TYPE
	MpReportCoreInfoType : 	STRUCT 
		NumberOfReports : UDINT; (*Number of created reports*)
		GeneratedFileName : STRING[255]; (*File name of created report*)
		Diag : MpReportDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpReportDiagType : 	STRUCT 
		StatusID : MpReportStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpReportStatusIDType : 	STRUCT 
		ID : MpReportErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpReportMeasurementSystemEnum : 
		(
		mpREPORT_ENGINEERING_UNITS := 0, (*Engineering Units*)
		mpREPORT_METRIC := 1, (*Metric*)
		mpREPORT_IMPERIAL := 2, (*Imperial*)
		mpREPORT_IMPERIAL_US := 3 (*Imperial US*)
		);
END_TYPE
