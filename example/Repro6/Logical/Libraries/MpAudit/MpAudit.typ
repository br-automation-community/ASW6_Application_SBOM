
TYPE
	MpAuditTrailUIStatusEnum : 
		(
		mpAUDIT_UI_STATUS_IDLE, (*Indicates that no process is currently active*)
		mpAUDIT_UI_STATUS_UPDATE, (*Performs an update*)
		mpAUDIT_UI_STATUS_FILTER, (*Displays a window for filtering the results*)
		mpAUDIT_UI_STATUS_EXPORT, (*Exporting data*)
		mpAUDIT_UI_STATUS_WARNING, (*Warning pending*)
		mpAUDIT_UI_STATUS_ERROR (*Error pending*)
		);
	MpAuditFileTypeEnum : 
		(
		mpAUDIT_FILE_TYPE_TXT := 0, (*Export as text file*)
		mpAUDIT_FILE_TYPE_XML := 1 (*Export as .xml file*)
		);
	MpAuditArchiveModeEnum : 
		(
		mpAUDIT_ARCHIVE_DAILY := 0, (*Creates an archive daily*)
		mpAUDIT_ARCHIVE_MO_TO_FR := 1, (*Creates an archive from Monday to Friday*)
		mpAUDIT_ARCHIVE_BATCH := 2 (*Create archives at start of new batch*)
		);
	MpAuditQueryModeEnum : 
		(
		mpAUDIT_QUERY_MODE_ALL, (*Read all elements starting from newest entry*)
		mpAUDIT_QUERY_MODE_NEW (*Read only new elements (added since last successfull call of MpAuditQuery) - For the first call it behaves like mpAUDIT_QUERY_MODE_ALL*)
		);
	MpAuditExportFilterType : 	STRUCT 
		From : MpAuditTrailUICurrDTFilterType; (*Time from which events are displayed*)
		Until : MpAuditTrailUICurrDTFilterType; (*Time until which events are displayed*)
		Event : MpAuditTrailUIEventFilterType; (*Defines which events are displayed*)
		Operator : MpAuditTrailUIOpFilterType; (*Determines from which user events are displayed*)
		Pattern : MpAuditTrailUIPatternFilterType; (*Event-message filter (pattern matching)*)
		Batch : MpAuditTrailUIBatchFilterType; (*Batch filter*)
	END_STRUCT;
	MpAuditTrailUISetupType : 	STRUCT 
		EventListSize : UINT := 20; (*Number of events to be displayed on one page of the list in the HMI application*)
		ScrollWindow : USINT := 0; (*Determines how many entries from the list are displayed in advance when scrolling up and down*)
	END_STRUCT;
	MpAuditTrailUIConnectType : 	STRUCT 
		Status : MpAuditTrailUIStatusEnum; (*Current operation*)
		Output : MpAuditTrailUIOutputType; (*Indicates the filtered events*)
		Filter : MpAuditUIFilterType; (*Allows events to be filtered*)
		Export : BOOL; (*Export audit-data*)
		MessageBox : MpAuditUIMessageBoxType; (*Controls dialog boxes*)
	END_STRUCT;
	MpAuditUIMessageEnum : 
		(
		mpAUDIT_UI_MSG_NONE := 0, (*No dialog box*)
		mpAUDIT_UI_MSG_WARNING := 1, (*Dialog box: Warning*)
		mpAUDIT_UI_MSG_ERROR := 2 (*Dialog box: Errors*)
		);
	MpAuditUIMessageBoxType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box *)
		Type : MpAuditUIMessageEnum; (*Type of dialog box*)
		ErrorNumber : UINT; (*Current error number to be displayed *)
		StatusID : DINT;
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpAuditTrailUIInfoType : 	STRUCT 
		Diag : MpAuditDiagType; (*Diagnostic structure for the status ID*)
		GeneratedFileName : STRING[255]; (*Generated file name*)
	END_STRUCT;
	MpAuditExportInfoType : 	STRUCT 
		Diag : MpAuditDiagType; (*Diagnostic structure for the status ID*)
		GeneratedFileName : STRING[255]; (*Generated file name*)
	END_STRUCT;
	MpAuditQueryInfoType : 	STRUCT 
		AvailableSpace : UDINT; (*Number of available "rows" in the PV configured for the query*)
		RowsRead : UDINT; (*Actual number of rows read by the query*)
		HasMoreRows : BOOL; (*Query is complete (alll data read and copied to PV)*)
		Diag : MpAuditDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpAuditRegParInfoType : 	STRUCT 
		Diag : MpAuditDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpAuditTrailInfoType : 	STRUCT 
		NumberArchives : UINT; (*Number of available archives*)
		GeneratedFileName : STRING[255]; (*Generated file name*)
		Diag : MpAuditDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpAuditDiagType : 	STRUCT 
		StatusID : MpAuditStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpAuditStatusIDType : 	STRUCT 
		ID : MpAuditErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpAuditTrailUIOutputType : 	STRUCT 
		EventID : ARRAY[0..19]OF UINT; (*List of IDs from all events meeting the current filter criteria*)
		EventText : ARRAY[0..19]OF WSTRING[255]; (*List of all events meeting the current filter criteria*)
		PageUp : BOOL; (*Jumps to the start of the current page and then scrolls up one page at a time The size of the page is defined using the "EventListSize" parameter in the MpAuditTrailUISetupType structure*)
		StepUp : BOOL; (*Selects the previous entry in the list*)
		StepDown : BOOL; (*Selects the next entry in the list*)
		PageDown : BOOL; (*Jumps to the end of the current page and then scrolls down one page at a time The size of the page is defined using the "EventListSize" parameter in the MpAuditTrailUISetupType structure*)
		RangeStart : REAL; (*Shows a bar indicating which part of the list is currently being displayed. Used for the starting value of "Range" for a scaled element in the HMI application*)
		RangeEnd : REAL; (*Shows a bar indicating which part of the list is currently being displayed. Used for the ending value of "Range" for a scaled element in the HMI application*)
	END_STRUCT;
	MpAuditTrailUICurrDTFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		DateTime : DATE_AND_TIME; (*Time from/to which filtering should take place*)
	END_STRUCT;
	MpAuditTrailUISetDTFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		Year : UINT; (*Year from/to which filtering should take place*)
		Month : USINT; (*Month from/to which filtering should take place*)
		Day : USINT; (*Day from/to which filtering should take place*)
		Hour : USINT; (*Hour from/to which filtering should take place*)
		Minute : USINT; (*Minute from/to which filtering should take place*)
	END_STRUCT;
	MpAuditTrailUIEventFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		Exclude : BOOL; (*Either only this event type (FALSE) or all but this event type (TRUE)*)
		Event : ARRAY[0..4]OF UDINT; (*Events that should be filtered*)
	END_STRUCT;
	MpAuditTrailUIOpFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		Exclude : BOOL; (*Only this user (FALSE) / All other users (TRUE)*)
		Name : WSTRING[50]; (*Operator name*)
	END_STRUCT;
	MpAuditTrailUIPatternFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		Exclude : BOOL; (*Select events matching the pattern (FALSE) or all other events (TRUE)*)
		Compare : WSTRING[50]; (*String Pattern containing wildcards (* and ?) that is applied on the event-message*)
	END_STRUCT;
	MpAuditTrailUIBatchFilterType : 	STRUCT 
		Enable : BOOL; (*Enables the filter*)
		Name : WSTRING[50]; (*Name (identifier) of batch to be  included in output*)
	END_STRUCT;
	MpAuditTrailUIFilterDialogType : 	STRUCT 
		LayerStatus : UINT; (*Status data point for the default layer of the visualization page where the filter is configured*)
		From : MpAuditTrailUISetDTFilterType; (*Time from which events are displayed*)
		Until : MpAuditTrailUISetDTFilterType; (*Time until which events are displayed*)
		Event : MpAuditTrailUIEventFilterType; (*Defines which events are displayed*)
		Operator : MpAuditTrailUIOpFilterType; (*Determines from which user events are displayed*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
		Pattern : MpAuditTrailUIPatternFilterType; (*Event-message filter (pattern matching)*)
		Batch : MpAuditTrailUIBatchFilterType; (*Batch filter*)
	END_STRUCT;
	MpAuditTrailUICurrentFilterType : 	STRUCT 
		From : MpAuditTrailUICurrDTFilterType; (*Time from which events are displayed*)
		Until : MpAuditTrailUICurrDTFilterType; (*Time until which events are displayed*)
		Event : MpAuditTrailUIEventFilterType; (*Defines which events are displayed*)
		Operator : MpAuditTrailUIOpFilterType; (*Determines from which user events are displayed*)
		Pattern : MpAuditTrailUIPatternFilterType; (*Event-message filter (pattern matching)*)
		Batch : MpAuditTrailUIBatchFilterType; (*Batch filter*)
	END_STRUCT;
	MpAuditUIFilterType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Dialog : MpAuditTrailUIFilterDialogType; (*Window for selecting an event filter*)
		Current : MpAuditTrailUICurrentFilterType; (*Displays the current filter*)
		DefaultLayerStatus : UINT; (*Status data point for the default layer of the visualization page on which the filter options are available*)
	END_STRUCT;
	MpAuditVC4EventInternalType : 	STRUCT 
		hEventSys : UDINT;
	END_STRUCT;
	MpAuditMonitorInternalType : 	STRUCT 
		Handle : UDINT;
	END_STRUCT;
	MpAuditMeasurementSystemEnum : 
		(
		mpAUDIT_ENGINEERING_UNITS := 0, (*Engineering Units*)
		mpAUDIT_METRIC := 1, (*Metric*)
		mpAUDIT_IMPERIAL := 2, (*Imperial*)
		mpAUDIT_IMPERIAL_US := 3 (*Imperial US*)
		);
END_TYPE
