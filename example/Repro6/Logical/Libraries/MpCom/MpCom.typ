
TYPE
	MpComConfigScopeEnum : 
		(
		mpCOM_CONFIG_SCOPE_COMPONENT := 0, (*Import / Export configuration only for given component*)
		mpCOM_CONFIG_SCOPE_BRANCH := 1 (*Import / Export configuration for given component and all its sub-components*)
		);
	MpComConfigAdvancedSourceEnum : 
		(
		mpCOM_CONFIGADVANCED_SOURCE_NEW := 0, (*Open new configuration - all values are set to default*)
		mpCOM_CONFIGADVANCED_SOURCE_PAR := 1, (*Open new configuration with currently active parameter*)
		mpCOM_CONFIGADVANCED_SOURCE_CFG := 2 (*Open new configuration with values from actual configuration*)
		);
	MpComConfigBasicSourceEnum : 
		(
		mpCOM_CONFIGBASIC_SOURCE_PAR := 0, (*Open new configuration with currently active parameter*)
		mpCOM_CONFIGBASIC_SOURCE_CFG := 1 (*Open new configuration with values from actual configuration*)
		);
	MpComConfigWriteModeEnum : 
		(
		mpCOM_CONFIG_WRITE_DEFAULT := 0, (*Write values independent on whether entries exist or not*)
		mpCOM_CONFIG_WRITE_APPEND := 1, (*Append entry (entry must not exist yet) - only for dynamic lists!*)
		mpCOM_CONFIG_WRITE_REPLACE := 2, (*Replace entry (entry must exist) - only for dynamic list*)
		mpCOM_CONFIG_WRITE_DELETE := 3 (*Delete entry - only for dynamic lists!*)
		);
	MpComConfigTargetEnum : 
		(
		mpCOM_CONFIG_TARGET_PAR := 0, (*Apply values to actual parameters*)
		mpCOM_CONFIG_TARGET_CFG := 1 (*Apply values to configuration*)
		);
	MpComDataSourceEnum : 
		(
		mpCOM_DATA_SOURCE_PAR := 0, (*Data source: Parameter*)
		mpCOM_DATA_SOURCE_CFG := 1 (*Data source: Configuration*)
		);
	MpComStatusIDType : 	STRUCT 
		ID : MpComErrorEnum; (*Status ID*)
		Severity : MpComSeveritiesEnum; (*Status severity*)
		Facility : MpComFacilitiesEnum; (*Status facility*)
	END_STRUCT;
	MpComDiagType : 	STRUCT 
		StatusID : MpComStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpComConfigManagerInfoType : 	STRUCT 
		Diag : MpComDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpComDumpInternalType : 	STRUCT 
		CmdOld : BOOL;
	END_STRUCT;
	MpComLoggerUISetupType : 	STRUCT 
		LoggerListSize : UINT := 20; (*Number of logger entries to be displayed on one page of the list in the HMI application*)
		LoggerScrollWindow : USINT := 0; (*Determines how many entries from the list are displayed in advance when scrolling up and down*)
	END_STRUCT;
	MpComLoggerUIConnectType : 	STRUCT 
		Status : MpComLoggerUIStatusEnum;
		List : MpComLoggerUILoggerListType; (*List of resultant logger entries*)
		Clear : BOOL; (*Clean the internal buffer*)
		SearchFilter : WSTRING[255]; (*Filter used to define the visibility of entries*)
	END_STRUCT;
	MpComLoggerUIStatusEnum : 
		(
		mpCOM_LOGGERUI_IDLE := 0,
		mpCOM_LOGGERUI_REFRESH := 1,
		mpCOM_LOGGERUI_ERROR := 2
		);
	MpComLoggerUILoggerListType : 	STRUCT 
		Message : ARRAY[0..19]OF WSTRING[255]; (*List of logger entries: message*)
		StatusID : ARRAY[0..19]OF DINT; (*List of logger entries: status ID*)
		Time : ARRAY[0..19]OF MpComLoggerUIDateTimeType; (*List of logger entries: date, time and microseconds*)
		Component : ARRAY[0..19]OF STRING[50]; (*List of logger entries: component name*)
		Facility : ARRAY[0..19]OF MpComFacilitiesEnum; (*List of logger entries: facility as part of Status ID*)
		Severity : ARRAY[0..19]OF MpComSeveritiesEnum; (*List of logger entries: severity as part of Status ID*)
		PageUp : BOOL; (*Jumps to the start of the current page and then scrolls up one page at a time *)
		PageDown : BOOL; (*Jumps to the end of the current page and then scrolls down one page at a time *)
		StepUp : BOOL; (*Selects the previous entry in the list*)
		StepDown : BOOL; (*Selects the next entry in the list*)
		RangeStart : REAL; (*Shows a bar indicating which part of the list is currently being displayed-Start [%]*)
		RangeEnd : REAL; (*Shows a bar indicating which part of the list is currently being displayed-End [%]*)
	END_STRUCT;
	MpComLoggerUIDateTimeType : 	STRUCT 
		DateTime : DATE_AND_TIME; (*List of logger entries: date and time: the view could be customized on VC*)
		Microseconds : UDINT; (*List of logger entries: additional information about microseconds when the event was triggered*)
	END_STRUCT;
	MpComLoggerUIInfoType : 	STRUCT 
		CurrentBufferEntries : UINT; (*Number of entries currently in the internal buffer. It is a ring buffer, it means that reached the BufferSize it doesn't increase any more*)
		Diag : MpComDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpComConfigArrayType : 	STRUCT 
		Data : UDINT; (*Address of array*)
		Capacity : UDINT; (*Capacity of linked array [bytes]*)
		Size : UDINT; (*Size of linked data [number of entries]*)
	END_STRUCT;
	MpComConfigAdvancedInfoType : 	STRUCT 
		Diag : MpComDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpComConfigBasicInfoType : 	STRUCT 
		Diag : MpComDiagType; (*Additional diagnostic information*)
	END_STRUCT;
END_TYPE
