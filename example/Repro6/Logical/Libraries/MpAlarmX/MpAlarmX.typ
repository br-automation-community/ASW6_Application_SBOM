(*Enumerations*)

TYPE
	MpAlarmXListUIStatusEnum : 
		(
		mpALARMX_LIST_UI_STATUS_IDLE := 0, (*Indicates that no process is currently active*)
		mpALARMX_LIST_UI_STATUS_BUSY := 1, (*Indicates that a process is currently active*)
		mpALARMX_LIST_UI_STATUS_WARNING := 98, (*The last operation generated a warning*)
		mpALARMX_LIST_UI_STATUS_ERROR := 99 (*The last operation generated an error*)
		);
	MpAlarmXStateEnum : 
		(
		mpALARMX_STATE_NONE := 0, (*Default state, alarm is not enabled*)
		mpALARMX_STATE_ACTIVE := 1, (*Active state, according OPC UA state model*)
		mpALARMX_STATE_INACTIVE := 2, (*Inactive state, according OPC UA state model*)
		mpALARMX_STATE_ACKNOWLEDGED := 3, (*Acknowledged state, according OPC UA state model*)
		mpALARMX_STATE_UNACKNOWLEDGED := 4, (*Unacknowledged state, according OPC UA state model*)
		mpALARMX_STATE_CONFIRMED := 5, (*Confirmed state, according OPC UA state model*)
		mpALARMX_STATE_UNCONFIRMED := 6 (*Unconfirmed state, according OPC UA state model*)
		);
	MpAlarmXHistoryUIStatusEnum : 
		(
		mpALARMX_HISTORY_UI_STATUS_IDLE := 0, (*Indicates that no process is currently active*)
		mpALARMX_HISTORY_UI_STATUS_BUSY := 1, (*Indicates that the list is being updated*)
		mpALARMX_HISTORY_UI_STATUS_ERROR := 99 (*The last operation generated an error*)
		);
	MpAlarmXQueryModeEnum : 
		(
		mpALARMX_QUERY_MODE_ALL := 0, (*Read all elements starting form the newest entry.*)
		mpALARMX_QUERY_MODE_NEW := 1 (*Read only new elements (elements added since the last successful call of MpAlarmXQuery). For the first call it behaves like the mpALARMX_QUERY_MODE_ALL.*)
		);
	MpAlarmXMeasurementSystemEnum : 
		(
		mpALARMX_ENGINEERING_UNITS := 0, (*Do not convert values (use engineering units)*)
		mpALARMX_METRIC := 1, (*Convert values to "metric" units*)
		mpALARMX_IMPERIAL := 2, (*Convert values to "imperial" units*)
		mpALARMX_IMPERIAL_US := 3 (*Convert values to "imperial-us" units*)
		);
END_TYPE

(*FB Info Types*)

TYPE
	MpAlarmXStatusIDType : 	STRUCT 
		ID : MpAlarmXErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
	MpAlarmXDiagType : 	STRUCT 
		StatusID : MpAlarmXStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpAlarmXHistoryUIInfoType : 	STRUCT 
		Diag : MpAlarmXDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpAlarmXHistoryInfoType : 	STRUCT 
		GeneratedFileName : STRING[255]; (*Name of last created export-file*)
		Diag : MpAlarmXDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpAlarmXAlarmControlInfoType : 	STRUCT 
		Diag : MpAlarmXDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpAlarmXCoreInfoType : 	STRUCT 
		Diag : MpAlarmXDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpAlarmXListUIInfoType : 	STRUCT 
		Diag : MpAlarmXDiagType; (*Additional diagnostic information*)
	END_STRUCT;
	MpAlarmXQueryInfoType : 	STRUCT 
		AvailableSpace : UDINT; (*Number of available "rows" int the PV configured for the query.*)
		RowsRead : UDINT; (*Actual number of rows read by the query.*)
		HasMoreRows : BOOL; (*Query is complete (all data read and copied to the PV).*)
		Diag : MpAlarmXDiagType;
	END_STRUCT;
	MpAlarmXControlInfoType : 	STRUCT 
		Diag : MpAlarmXDiagType;
	END_STRUCT;
END_TYPE

(*UIConnect Types*)

TYPE
	MpAlarmXListUIBacktraceType : 	STRUCT 
		RecordID : ARRAY[0..9]OF UDINT; (*The record ID of the logbook entry*)
		LogbookName : ARRAY[0..9]OF STRING[100]; (*The name of the logbook*)
		EventID : ARRAY[0..9]OF DINT; (*The event ID of the logbook entry*)
		Description : ARRAY[0..9]OF WSTRING[255]; (*The description text of this event ID*)
	END_STRUCT;
	MpAlarmXListUIAlarmListType : 	STRUCT 
		Severity : ARRAY[0..49]OF UDINT; (*Alarm severity*)
		Code : ARRAY[0..49]OF UDINT; (*Alarm code*)
		Message : ARRAY[0..49]OF WSTRING[255]; (*Message describing the alarm*)
		AdditionalInformation1 : ARRAY[0..49]OF WSTRING[255]; (*A link with additional information*)
		AdditionalInformation2 : ARRAY[0..49]OF WSTRING[255]; (*A link with additional information*)
		InstanceID : ARRAY[0..49]OF UDINT; (*Unique alarm identity*)
		Scope : ARRAY[0..49]OF STRING[255]; (*The scope of the alarm*)
		Name : ARRAY[0..49]OF STRING[255]; (*Unique alarm name within the current scope*)
		StateActive : ARRAY[0..49]OF BOOL; (*Alarm is in Active state (according OPC UA Part 9: Alarms and Conditions)*)
		StateAcknowledged : ARRAY[0..49]OF BOOL; (*Alarm is in Acknowledged state (according OPC UA Part 9: Alarms and Conditions)*)
		StateConfirmed : ARRAY[0..49]OF BOOL; (*Alarm is in Confirmed state (according OPC UA Part 9: Alarms and Conditions)*)
		Timestamp : ARRAY[0..49]OF STRING[50]; (*Timestamp of when the alarm was set*)
		SelectedIndex : UINT; (*The index of the currently selected alarm*)
		MaxSelection : UINT; (*The index of the last available alarm*)
		PageUp : BOOL; (*Command: Page Up (Scroll Up)*)
		PageDown : BOOL; (*Command: Page Down (Scroll Down)*)
		StepUp : BOOL; (*Command: Line Up (Scroll Up)*)
		StepDown : BOOL; (*Command: Line Down (Scroll Down)*)
		RangeStart : REAL; (*Displayed range: Start %*)
		RangeEnd : REAL; (*Displayed range: End %*)
	END_STRUCT;
	MpAlarmXListUIDetailsType : 	STRUCT 
		Severity : UDINT; (*Alarm severity*)
		Code : UDINT; (*Alarm code*)
		Message : WSTRING[255]; (*Message describing the alarm*)
		AdditionalInformation1 : WSTRING[255]; (*A link with additional information*)
		AdditionalInformation2 : WSTRING[255]; (*A link with additional information*)
		InstanceID : UDINT; (*Unique alarm identity*)
		Scope : STRING[255]; (*The scope of the alarm*)
		Name : STRING[255]; (*Unique alarm name within the current scope*)
		StateActive : BOOL; (*Alarm is in Active state (according OPC UA Part 9: Alarms and Conditions)*)
		StateAcknowledged : BOOL; (*Alarm is in Acknowledged state (according OPC UA Part 9: Alarms and Conditions)*)
		StateConfirmed : BOOL; (*Alarm is in Confirmed state (according OPC UA Part 9: Alarms and Conditions)*)
		Timestamp : STRING[50]; (*Timestamp of when the alarm was set*)
		Backtrace : MpAlarmXListUIBacktraceType; (*Backtrace of the alarm (origin logger entries)*)
	END_STRUCT;
	MpAlarmXListUIConnectType : 	STRUCT 
		Status : MpAlarmXListUIStatusEnum; (*Current operation*)
		AlarmList : MpAlarmXListUIAlarmListType; (*List of available alarms*)
		Acknowledge : BOOL; (*Command: Acknowledge the selected alarm*)
		Confirm : BOOL; (*Command: Confirm the selected alarm*)
		AcknowledgeAll : BOOL; (*Command: Acknowledge all alarms*)
		Details : MpAlarmXListUIDetailsType; (*Currently selected alarm*)
		AcknowledgeID : UDINT; (*Command: Acknowledge the alarm with this instance ID*)
		ConfirmID : UDINT; (*Command: Confirm the alarm with this instance ID*)
	END_STRUCT;
	MpAlarmXListUISetupType : 	STRUCT 
		AlarmListSize : UINT := 20; (*Alarm list size*)
		AlarmListScrollWindow : USINT := 1; (*Scroll window (overlap for PageUp/Down)*)
		TimeStampPattern : STRING[50] := '%Y-%m-%d %H:%M:%S:%L'; (*Format pattern for the timestamp shown in the UIConnect structure. See MpAlarmXHistory configuration for details about the pattern syntax.*)
	END_STRUCT;
	MpAlarmXHistoryUIAlarmListType : 	STRUCT 
		Severity : ARRAY[0..49]OF UDINT; (*Alarm severity*)
		Code : ARRAY[0..49]OF UDINT; (*Alarm code*)
		Message : ARRAY[0..49]OF WSTRING[255]; (*Message describing the alarm*)
		AdditionalInformation1 : ARRAY[0..49]OF WSTRING[255]; (*A link with additional information*)
		AdditionalInformation2 : ARRAY[0..49]OF WSTRING[255]; (*A link with additional information*)
		Scope : ARRAY[0..49]OF STRING[255]; (*The scope of the alarm*)
		Name : ARRAY[0..49]OF STRING[255]; (*Unique alarm name within the current scope*)
		OldState : ARRAY[0..49]OF MpAlarmXStateEnum; (*State change of this entry - the old state (according OPC UA Part 9: Alarms and Conditions)*)
		NewState : ARRAY[0..49]OF MpAlarmXStateEnum; (*State change of this entry - the new state (according OPC UA Part 9: Alarms and Conditions)*)
		Timestamp : ARRAY[0..49]OF STRING[50]; (*Timestamp of the state change (from OldState to NewState)*)
		SelectedIndex : UINT; (*The index of the currently selected alarm*)
		MaxSelection : UINT; (*The index of the last available alarm*)
		PageUp : BOOL; (*Command: Page Up (Scroll Up)*)
		PageDown : BOOL; (*Command: Page Down (Scroll Down)*)
		StepUp : BOOL; (*Command: Line Up (Scroll Up)*)
		StepDown : BOOL; (*Command: Line Down (Scroll Down)*)
		RangeStart : REAL; (*Displayed range: Start %*)
		RangeEnd : REAL; (*Displayed range: End %*)
	END_STRUCT;
	MpAlarmXHistoryUIDetailsType : 	STRUCT 
		Severity : UDINT; (*Alarm severity*)
		Code : UDINT; (*Alarm code*)
		Message : WSTRING[255]; (*Message describing the alarm*)
		AdditionalInformation1 : WSTRING[255]; (*A link with additional information*)
		AdditionalInformation2 : WSTRING[255]; (*A link with additional information*)
		Scope : STRING[255]; (*The scope of the alarm*)
		Name : STRING[255]; (*Unique alarm name within the current scope*)
		OldState : MpAlarmXStateEnum; (*State change of this entry - the old state (according OPC UA Part 9: Alarms and Conditions)*)
		NewState : MpAlarmXStateEnum; (*State change of this entry - the new state (according OPC UA Part 9: Alarms and Conditions)*)
		Timestamp : STRING[50]; (*Timestamp of the state change (from OldState to NewState)*)
	END_STRUCT;
	MpAlarmXHistoryUIConnectType : 	STRUCT 
		Status : MpAlarmXHistoryUIStatusEnum; (*Current operation*)
		AlarmList : MpAlarmXHistoryUIAlarmListType; (*List of available alarms*)
		Details : MpAlarmXHistoryUIDetailsType; (*Currently selected alarm*)
	END_STRUCT;
	MpAlarmXHistoryUISetupType : 	STRUCT 
		AlarmListSize : UINT := 20; (*Alarm list size*)
		AlarmListScrollWindow : USINT := 1; (*Scroll window (overlap for PageUp/Down)*)
		TimeStampPattern : STRING[50] := '%Y-%m-%d %H:%M:%S:%L'; (*Format pattern for the timestamp shown in the UIConnect structure. See MpAlarmXHistory configuration for details about the pattern syntax.*)
	END_STRUCT;
END_TYPE
