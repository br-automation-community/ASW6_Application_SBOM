
TYPE
	MpDataRecorderHeaderType : 	STRUCT  (*Data record header type*)
		Name : STRING[100]; (*The name of the data recording*)
		Description : STRING[255]; (*Optional user comment describing the data recording*)
	END_STRUCT;
	MpDataRegParInfoType : 	STRUCT  (*MpDataRecorder current file information*)
		Diag : MpDataDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpDataStatisticsUIInfoType : 	STRUCT  (*MpDataRecorder current file information*)
		Diag : MpDataDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpDataTableUIInfoType : 	STRUCT  (*MpDataRecorder current file information*)
		Diag : MpDataDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpDataRecorderInfoType : 	STRUCT  (*MpDataRecorder current file information*)
		FileCount : UINT; (*Number of created files*)
		CurrentFileName : STRING[50]; (*Name of the current file*)
		CurrentFileSize : UDINT; (*Size of the current file [kB]*)
		CurrentBufferSize : UINT; (*Amount of internal memory currently being used [kB]*)
		RegisteredPVCount : UINT; (*Number of currently registered PVs*)
		TotalSamples : UDINT; (*Number of entries of each registered PV since the start of recording*)
		ValueOutsideLimits : BOOL; (*One of the registered PVs violated limits in the current cycle. Only applicable if limits are configured and recording is active*)
		Diag : MpDataDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpDataDiagType : 	STRUCT  (*Component diagnostics type*)
		StatusID : MpDataStatusIDType; (*StatusID diagnostics structure*)
	END_STRUCT;
	MpDataStatusIDType : 	STRUCT  (*Component diagnostics status ID type*)
		ID : MpDataErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpDataRecordModeEnum : 
		( (*Recording modes enumeration*)
		mpDATA_RECORD_MODE_TIME := 0, (*New data is recorded on a time basis*)
		mpDATA_RECORD_MODE_TRIGGER := 1, (*New data is recorded after a trigger*)
		mpDATA_RECORD_MODE_VALUE := 2, (*New data from all PVs is recorded after the value of any registered PV is changed*)
		mpDATA_RECORD_MODE_TIME_TRIGGER := 3, (*New data is recorded on a time basis and after a trigger (whichever comes first)*)
		mpDATA_RECORD_MODE_TIME_VALUE := 4, (*New data is recorded on a time basis and in case PV value changed (whichever comes first)*)
		mpDATA_RECORD_MODE_TRIGGER_VALUE := 5, (*New data is recorded after a trigger or in case PV value changed (whichever comes first)*)
		mpDATA_RECORD_MODE_TIME_TRIG_VAL := 6 (*New data is recorded on time basis, after a trigger or in case PV value changed (whichever comes first)*)
		);
	MpDataTableUISetupType : 	STRUCT 
		ValueListSize : UINT := 20; (*Ammount of values shown at once*)
		ValueListScrollWindow : USINT := 1; (*Scroll window for values*)
		PVListSize : UINT := 10; (*Ammount of variables shown at once*)
		PVListScrollWindow : USINT := 1; (*Scroll window for variables*)
	END_STRUCT;
	MpDataTableUIConnectType : 	STRUCT 
		Table : MpDataTableType; (*Table view*)
		Status : MpDataUIStatusEnum; (*Current status of MpDataTableUI*)
		AutoRefresh : BOOL := TRUE; (*Setting: If TRUE, values in Items array will automatically be refreshed when there are newer values in MpDataRecorder internal buffer*)
		Refresh : BOOL := FALSE; (*Command: Trigger refresh now*)
	END_STRUCT;
	MpDataTableUIPVItemType : 	STRUCT 
		Name : STRING[100]; (*Name of the variable*)
		Description : WSTRING[255]; (*Description of the variable*)
		DescriptionIndex : UINT; (*Index for a description within a text group*)
		Unit : WSTRING[20]; (*Unit of the variable*)
		Value : ARRAY[0..19]OF LREAL; (*Value of the variable*)
		LimitMonitor : ARRAY[0..19]OF MpDataPVItemLimitEnum; (*Shows whether value is within limits. Only applicable if limits are configured*)
	END_STRUCT;
	MpDataPVItemLimitEnum : 
		( (*Current state of value limit violation*)
		mpDATA_NO_LIMITS_CONFIGURED := 0, (*PV was registered without information about limits or limits for this datatype are not applicable*)
		mpDATA_WITHIN_LIMITS := 1, (*Value is within limits*)
		mpDATA_UPPER_LIMIT_VIOLATED := 2, (*Upper limit is violated*)
		mpDATA_LOWER_LIMIT_VIOLATED := 3 (*Lower limit is violated*)
		);
	MpDataUIStatusEnum : 
		( (*MpDataUI current status enumeration*)
		mpDATA_UI_STATUS_IDLE := 0, (*Status: Idle*)
		mpDATA_UI_STATUS_REFRESH := 1, (*Status: Refreshing*)
		mpDATA_UI_STATUS_ERROR := 99 (*Status: In Error*)
		);
	MpDataTableType : 	STRUCT 
		PV : ARRAY[0..9]OF MpDataTableUIPVItemType;
		Index : ARRAY[0..19]OF UDINT; (*Sample index of variable*)
		TimeStamp : ARRAY[0..19]OF STRING[50]; (*Timestamp of recording*)
		StepUp : BOOL; (*Command: Line up (scroll up)*)
		PageUp : BOOL; (*Command: Page up (scroll up)*)
		StepDown : BOOL; (*Command: Line down (scroll down)*)
		PageDown : BOOL; (*Command: Page down (scroll down)*)
		StepLeft : BOOL; (*Command: Column left (scroll left)*)
		PageLeft : BOOL; (*Command: Page left (scroll left)*)
		StepRight : BOOL; (*Command: Column right (scroll right)*)
		PageRight : BOOL; (*Command: Page right (scroll right)*)
		RangeStartRows : REAL; (*Displayed range for rows: Start %*)
		RangeEndRows : REAL; (*Displayed range for rows: End %*)
		RangeStartColumns : REAL; (*Displayed range for columns: Start %*)
		RangeEndColumns : REAL; (*Displayed range for columns: End %*)
	END_STRUCT;
END_TYPE

(* MpDataStatisticsUI datatypes *)

TYPE
	MpDataStatisticsUISetupType : 	STRUCT 
		PVListSize : UINT := 10; (*Ammount of variables shown at once*)
		PVListScrollWindow : USINT := 1; (*Scroll window for variables*)
	END_STRUCT;
	MpDataStatisticsUIConnectType : 	STRUCT 
		Table : MpDataStatisticsUITableType; (*Statistical data of registered PVs*)
		Status : MpDataUIStatusEnum; (*Current status of MpDataTableUI*)
	END_STRUCT;
	MpDataStatisticsUITableType : 	STRUCT 
		Data : ARRAY[0..19]OF MpDataStatisticsUIPVItemType; (*Statistics table view*)
		StepLeft : BOOL; (*Command: Column left (scroll left)*)
		PageLeft : BOOL; (*Command: Page left (scroll left)*)
		StepRight : BOOL; (*Command: Column right (scroll right)*)
		PageRight : BOOL; (*Command: Page right (scroll right)*)
		RangeStart : REAL; (*Displayed range for columns: Start %*)
		RangeEnd : REAL; (*Displayed range for columns: End %*)
	END_STRUCT;
	MpDataStatisticsUIPVItemType : 	STRUCT 
		Name : STRING[100]; (*Name of the variable*)
		Description : WSTRING[255]; (*Description of the variable*)
		Unit : WSTRING[20]; (*Unit of the variable*)
		Minimum : LREAL; (*Minimum logged value of variable since start of recording*)
		Maximum : LREAL; (*Maximum logged value of variable since start of recording*)
		Mean : LREAL; (*Mean value of variable since start of recording*)
		Range : LREAL; (*Range of values since start of recording*)
		StandardDeviation : LREAL; (*Standard deviation of variable since start of recording*)
		DescriptionIndex : UINT; (*Index for a description within a text group*)
	END_STRUCT;
	MpDataMeasurementSystemEnum : 
		(
		mpDATA_ENGINEERING_UNITS := 0, (*Engineering Units*)
		mpDATA_METRIC := 1, (*Metric*)
		mpDATA_IMPERIAL := 2, (*Imperial*)
		mpDATA_IMPERIAL_US := 3 (*Imperial US*)
		);
END_TYPE
