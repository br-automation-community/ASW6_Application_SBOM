(*Enumerators*)

TYPE
	MpIOUIMessageEnum : 
		(
		mpIO_UI_MSG_NONE := 0, (*No dialog box*)
		mpIO_UI_MSG_WARNING := 1, (*Dialog box: Warning*) 
		mpIO_UI_MSG_ERROR := 2, (*Dialog box: Error*)
		mpIO_UI_MSG_CONFIRM_IMPORT := 2, (*Dialog box: Confirmation for importing config-file*)
		mpIO_UI_MSG_CONFIRM_REBOOT := 3 (*Dialog box: Confirmation for importing config-file with reboot*)
		);
	MpIOImportUIStatusEnum : 
		(
		mpIO_UI_STATUS_IDLE := 0, (*No function active - waiting for commands*)
		mpIO_UI_STATUS_REFRESH := 1, (*File-List is being refreshed*)
		mpIO_UI_STATUS_BUILD := 2, (*Building import-data from import-file(s)*)
		mpIO_UI_STATUS_DIALOG := 3, (*Dialog is being displayed - waiting for user-entry*)
		mpIO_UI_STATUS_DISPOSE := 4, (*Import-Data is being disposed (after user cancelled)*)
		mpIO_UI_STATUS_IMPORT := 5, (*Import of hardware-configuration is being done*)
		mpIO_UI_STATUS_WARNING := 6, (*A warning has occurred (warning-dialog is being displayed)*) 
		mpIO_UI_STATUS_ERROR := 7 (*A error has occurred (error-dialog is being displayed)*)
		);
END_TYPE

(*UI Connect Types*)

TYPE
	MpIOUIMessageBoxType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box *)
		Type : MpIOUIMessageEnum; (*Type of dialog box*)
		StatusID : DINT; (*Current status ID (error number + facility + severity)*)
		ErrorNumber : UINT; (*Current error number to be displayed *)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpIOUIScrollSelectType : 	STRUCT 
		MaxSelection : UINT; (*Index of the last module in the list*)
		SelectedIndex : UINT; (*Index of the module currently selected in the list*)
		PageUp : BOOL; (*Jumps to the start of the current page and then scrolls up one page at a time*)
		StepUp : BOOL; (* Selects the previous entry in the list*)
		StepDown : BOOL; (*Selects the next entry in the list*)
		PageDown : BOOL; (*Jumps to the end of the current page and then scrolls down one page at a time*)
		RangeStart : REAL; (*Shows a bar indicating which part of the list is currently being displayed-Start [%]*)
		RangeEnd : REAL; (*Shows a bar indicating which part of the list is currently being displayed-End[%]*)
		ScrollStatus : UINT; (*Status-datapoint for scroll-icons (to hide them when no scrolling is necessary)*)
	END_STRUCT;
	MpIOUIFileListType : 	STRUCT 
		Names : ARRAY[0..19]OF STRING[100]; (*List of all files available for import*)
		Scroll : MpIOUIScrollSelectType; (*Index of the entry currently selected in the list*)
		Refresh : BOOL; (*Refresh file-list*)
	END_STRUCT;
	MpIOImportUIConnectType : 	STRUCT 
		DefaultLayerStatus : UINT; (*Status data point for the default layer of the visualization page where the user management system is being displayed*)
		Status : MpIOImportUIStatusEnum; (*Current operation*)
		FileList : MpIOUIFileListType; (*List of all files available for import, as well as the navigation of the list*)
		MessageBox : MpIOUIMessageBoxType; (*Controls dialog boxes*)
		Import : BOOL; (*Import command*)
	END_STRUCT;
	MpIOImportUISetupType : 	STRUCT 
		FileListSize : UINT := 20; (*Number of files that can be displayed on HMI*)
		FileListScrollWindow : USINT := 1; (*Determines how many entries from the list are displayed in advance when scrolling up and down*)
	END_STRUCT;
END_TYPE

(*FB Info Types*)

TYPE
	MpIOImportInfoType : 	STRUCT 
		ImportFileActive : BOOL; (*File was imported (hardware config changed)*)
		Diag : MpIODiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpIOImportUIInfoType : 	STRUCT 
		Diag : MpIODiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpIODiagType : 	STRUCT 
		StatusID : MpIOStatusIDType; (*StatusID diagnostic structure*)
	END_STRUCT;
	MpIOStatusIDType : 	STRUCT 
		ID : MpIOErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
END_TYPE

(*FB Internal Types*)

TYPE
	MpIOInternalType : 	STRUCT 
		pObject : UDINT;
		pInstance : UDINT; (*Marker for FB-instance (overload detection)*)
		State : UDINT;
	END_STRUCT;
END_TYPE
