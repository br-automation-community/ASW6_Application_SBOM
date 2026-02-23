
TYPE
	MpUserXUIMessageEnum : 
		(
		mpUSERX_UI_MSG_NONE := 0, (*No dialog box*)
		mpUSERX_UI_MSG_WARNING := 1, (*Dialog box: Warnings*)
		mpUSERX_UI_MSG_ERROR := 2, (*Dialog box: Errors*)
		mpUSERX_UI_MSG_CONFIRM_DELETE := 3, (*Dialog box: Confirmation of user deletion*)
		mpUSERX_UI_MSG_CONFIRM_LOCK := 4, (*Dialog box: Confirmation of user block*)
		mpUSERX_UI_MSG_CONFIRM_UNLOCK := 5, (*Dialog box: Confirmation of user unblock*)
		mpUSERX_UI_MSG_CONFIRM_ROLE_DEL := 6 (*Dialog box: Confirmation of role deletion*)
		);
	MpUserXMgrUIImportConfirmEnum : 
		(
		mpUSERX_CONFIRM_USER := 0, (*Confirm overwrite of existing user*)
		mpUSERX_CONFIRM_ROLE := 1 (*Confirm overwrite of existing role*)
		);
	MpUserXUIStatusEnum : 
		(
		mpUSERX_UI_STATUS_IDLE := 0, (*Indicates that no process is currently active*)
		mpUSERX_UI_STATUS_WAIT_DLG := 1, (*Waiting for confirmation or cancelation*)
		mpUSERX_UI_STATUS_EXECUTE := 2, (*Executing a command*)
		mpUSERX_UI_STATUS_WARNING := 98, (*The last operation generated a warning*)
		mpUSERX_UI_STATUS_ERROR := 99 (*The last operation generated an error*)
		);
	MpUserXUserTypeEnum : 
		(
		mpUSERX_USER_LOCAL := 0, (*Local user*)
		mpUSERX_USER_CENTRAL := 1 (*Central user*)
		);
	MpUserXMeasurementSystemEnum : 
		(
		mpUSERX_ENGINEERING_UNITS := 0, (*Do not convert values (use engineering units)*)
		mpUSERX_METRIC := 1, (*Convert values to "metric" units*)
		mpUSERX_IMPERIAL := 2, (*Convert values to "imperial" units*)
		mpUSERX_IMPERIAL_US := 3 (*Convert values to "imperial-us" units*)
		);
	MpUserXUIMessageBoxType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box *)
		Type : MpUserXUIMessageEnum; (*Type of dialog box*)
		ErrorNumber : UINT; (*Current error number to be displayed *)
		StatusID : DINT; (*Current status identifier to be displayed*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXMgrUIUserListType : 	STRUCT 
		UserNames : ARRAY[0..19]OF WSTRING[100]; (*List of all available users*)
		MaxSelection : UINT; (*Index of the last entry in the list*)
		SelectedIndex : UINT; (*Index of the entry currently selected in the list*)
		PageUp : BOOL; (*Jumps to the start of the current page and then scrolls up one page at a time*)
		StepUp : BOOL; (* Selects the previous entry in the list*)
		PageDown : BOOL; (*Jumps to the end of the current page and then scrolls down one page at a time*)
		StepDown : BOOL; (*Selects the next entry in the list*)
		RangeStart : REAL; (*Shows a bar indicating which part of the list is currently being displayed-Start [%]*)
		RangeEnd : REAL; (*Shows a bar indicating which part of the list is currently being displayed-End[%]*)
	END_STRUCT;
	MpUserXMgrUIUserInfoType : 	STRUCT 
		UserName : WSTRING[100]; (*Display name*)
		FullName : WSTRING[100]; (*Complete username*)
		Roles : ARRAY[0..29]OF UINT; (*Assigned roles*)
		Locked : BOOL; (*User is blocked*)
		Expired : BOOL; (*User password expired*)
		RemainingAttempts : USINT; (*Number of login attempts left before the user is blocked*)
		Language : STRING[20]; (*Preferred language*)
		MeasurementSystem : MpUserXMeasurementSystemEnum; (*Preferred measurement system*)
		Creation : DATE_AND_TIME; (*Date and time this user was created*)
		FirstLogin : DATE_AND_TIME; (*Date and time of the first login*)
		LastLogin : DATE_AND_TIME; (*Date and time of the last login*)
		PasswordExpired : DATE_AND_TIME; (*Date and time of password expiration*)
		AdditionalData : ARRAY[0..9]OF MpUserXMgrUIAdditionalDataType; (*Additional user data*)
		UserType : MpUserXUserTypeEnum; (*User's user type*)
	END_STRUCT;
	MpUserXMgrUIAdditionalDataType : 	STRUCT 
		Key : WSTRING[100]; (*Value identifier*)
		Value : WSTRING[255]; (*Value*)
	END_STRUCT;
	MpUserXMgrUIRoleListType : 	STRUCT 
		Names : ARRAY[0..19]OF WSTRING[100]; (*List of all available user roles*)
		SelectedIndex : UINT; (*Index of the entry currently selected in the list*)
		MaxSelection : UINT; (*Index of the last entry in the list*)
		PageUp : BOOL; (*Jumps to the start of the current page and then scrolls up one page at a time*)
		StepUp : BOOL; (* Selects the previous entry in the list*)
		PageDown : BOOL; (*Jumps to the end of the current page and then scrolls down one page at a time*)
		StepDown : BOOL; (*Selects the next entry in the list*)
		RangeStart : REAL; (*Shows a bar indicating which part of the list is currently being displayed-Start [%]*)
		RangeEnd : REAL; (*Shows a bar indicating which part of the list is currently being displayed-End[%]*)
	END_STRUCT;
	MpUserXMgrUIRoleInfoType : 	STRUCT 
		Name : WSTRING[100]; (*Name of the user role*)
		Index : UINT; (*Index of the user role*)
		Level : DINT; (*Level of the user role*)
		Admin : BOOL; (*Indicates whether this role has administrator rights*)
	END_STRUCT;
	MpUserXMgrUIRoleDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		Name : WSTRING[100]; (*Name of the user role*)
		Index : UINT; (*Index of the user role in list*)
		Level : DINT; (*Level of the user role*)
		LevelLimit : DINT; (*Max. Level allowed to set*)
		Admin : BOOL; (*Defines whether this role has administrator rights*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXMgrUIRoleCreateDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		Name : WSTRING[100]; (*Name of the user role*)
		Level : DINT; (*Level of the user role*)
		LevelLimit : DINT; (*Max. Level allowed to set*)
		Admin : BOOL; (*Defines whether this role has administrator rights*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXMgrUIRoleCreateType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Lock : BOOL; (*Blocks the function for editing user role*)
		Dialog : MpUserXMgrUIRoleCreateDlgType; (*Dialog box for editing a user role*)
	END_STRUCT;
	MpUserXMgrUIRoleEditType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Lock : BOOL; (*Blocks the function for editing user role*)
		Dialog : MpUserXMgrUIRoleDlgType; (*Dialog box for editing a user role*)
	END_STRUCT;
	MpUserXMgrUICreateDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		UserName : WSTRING[100]; (*Username*)
		FullName : WSTRING[100]; (*Full name of the new user*)
		Roles : ARRAY[0..29]OF UINT; (*Assigned roles*)
		RoleOption : ARRAY[0..29]OF USINT; (*Sorts and removes user roles in the drop-down list that cannot be selected*)
		NewPassword : WSTRING[100]; (*New password*)
		ConfirmPassword : WSTRING[100]; (*Password confirmation*)
		Language : STRING[20]; (*Preferred language of the new user*)
		MeasurementSystem : MpUserXMeasurementSystemEnum; (*Preferred measurement system of the new user*)
		CriteriaNotMet : MpUserXUIPasswordCriteriaEnum; (*Password criterion not met by new password*)
		NewPasswordOk : UINT; (*New password OK (all criterions met)*)
		ConfirmPasswordOk : UINT; (*Password-confirmation OK*)
		UserNameOk : UINT; (*UserName OK*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
		AdditionalData : ARRAY[0..9]OF MpUserXMgrUIAdditionalDataType; (*Additional user data*)
	END_STRUCT;
	MpUserXMgrUICreateType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Lock : BOOL; (*Blocks the function for editing/creating users*)
		Dialog : MpUserXMgrUICreateDlgType; (*Dialog box for creating a user*)
	END_STRUCT;
	MpUserXMgrUIExportDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		FileName : STRING[255]; (*Name of the file to be exported*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXMgrUIExportType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Dialog : MpUserXMgrUIExportDlgType; (*Dialog box for exporting user data*)
	END_STRUCT;
	MpUserXMgrUISetupConfirmType : 	STRUCT 
		OverwriteUser : BOOL; (*Confirmation by operator for overwriting existing users required*)
		OverwriteRole : BOOL; (*Confirmation by operator for overwriting existing roles required*)
	END_STRUCT;
	MpUserXMgrUISetupType : 	STRUCT 
		UserListSize : UINT := 20; (*Number of users to be displayed on one page of the list in the HMI application*)
		ScrollWindow : USINT := 1; (*Determines how many entries from the list are displayed in advance when scrolling up and down*)
		FileDevice : STRING[20] := 'HD'; (*File device (data storage medium) for exporting/importing user data*)
		FileExtension : STRING[20] := 'usr'; (*File extension for export/import file*)
		RoleListSize : UINT := 9; (*Number of roles to be displayed on one page of the list in the HMI application*)
		Confirmation : MpUserXMgrUISetupConfirmType; (*Displaying the confirmation window*)
	END_STRUCT;
	MpUserXMgrUIImportListType : 	STRUCT 
		FileNames : ARRAY[0..4]OF STRING[255]; (*List of all files available for import*)
		SelectedIndex : UINT; (*Index of the entry currently selected in the list*)
		MaxSelection : UINT; (*Index of the last entry in the list*)
	END_STRUCT;
	MpUserXMgrUIImportDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		List : MpUserXMgrUIImportListType; (*List of all files available for import, as well as the navigation of the list*)
		FileName : STRING[255]; (*Name of the file to be imported*)
		Users : BOOL; (*Options that specifies whether user data should be applied*)
		Roles : BOOL; (*Options that specifies whether user role settings should be applied*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXMgrUIImportConfirmType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box*)
		Type : MpUserXMgrUIImportConfirmEnum; (*Confirmation type (user or role)*)
		Name : WSTRING[100]; (*Name of user / role*)
		NumberOfConflicts : UINT; (*Number of remaining conflicts*)
		ApplyForAll : BOOL; (*Apply selection for all remaining conflicts*)
		Confirm : BOOL; (*Confirm overwrite of item*)
		Cancel : BOOL; (*Reject overwrite of item (ignore)*)
	END_STRUCT;
	MpUserXMgrUIImportType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Dialog : MpUserXMgrUIImportDlgType; (*Dialog box for importing user data*)
		ConfirmDialog : MpUserXMgrUIImportConfirmType; (*Import confirmation dialog*)
	END_STRUCT;
	MpUserXMgrUIUserType : 	STRUCT 
		List : MpUserXMgrUIUserListType; (*List of all users, as well as the navigation of the list*)
		Info : MpUserXMgrUIUserInfoType; (*Contains detailed information about users*)
		Create : MpUserXMgrUICreateType; (*Contains the data necessary to create a user*)
		Edit : MpUserXMgrUICreateType; (*Contains the data necessary to edit a user*)
		Remove : BOOL; (*Deletes the selected user*)
		Lock : BOOL; (*Blocks the selected user*)
	END_STRUCT;
	MpUserXMgrUIRoleSelectType : 	STRUCT 
		Names : ARRAY[0..29]OF WSTRING[100]; (*List of all available user roles (not scrollable)*)
		MaxSelection : UINT; (*Index of the last entry in the list*)
	END_STRUCT;
	MpUserXMgrUIRoleType : 	STRUCT 
		List : MpUserXMgrUIRoleListType; (*List of all user roles, as well as the navigation of the list*)
		Info : MpUserXMgrUIRoleInfoType; (*Contains detailed information about user role*)
		Edit : MpUserXMgrUIRoleEditType; (*Contains the data necessary to edit a user role*)
		Create : MpUserXMgrUIRoleCreateType; (*Contains the data necessary to create a user-role*)
		Remove : BOOL; (*Deletes the selected role*)
		SelectList : MpUserXMgrUIRoleSelectType; (*List for selecting roles from dropdown*)
	END_STRUCT;
	MpUserXMgrUIConnectType : 	STRUCT 
		DefaultLayerStatus : UINT; (*Status data point for the default layer of the visualization page where the user management system is being displayed*)
		Status : MpUserXUIStatusEnum; (*Current operation*)
		User : MpUserXMgrUIUserType; (*User information*)
		Role : MpUserXMgrUIRoleType; (*User role information*)
		MessageBox : MpUserXUIMessageBoxType; (*Controls dialog boxes*)
		Export : MpUserXMgrUIExportType; (*Exports the user and user role settings*)
		Import : MpUserXMgrUIImportType; (*Imports the user and user role settings*)
	END_STRUCT;
	MpUserXUIPasswordCriteriaEnum : 
		(
		mpUSERX_PASSWORD_CRIT_NONE := 0, (*None*)
		mpUSERX_PASSWORD_CRIT_LENGTH := 1, (*Password length*)
		mpUSERX_PASSWORD_CRIT_ALPHA := 2, (*Password alpha-numeric*)
		mpUSERX_PASSWORD_CRIT_CASE := 3, (*Password case-sensitive (upper- and lower-case characters)*)
		mpUSERX_PASSWORD_CRIT_SPECIAL := 4 (*Password must contain special characters*)
		);
	MpUserXLoginUIPwdDlgType : 	STRUCT 
		OldPassword : WSTRING[100]; (*Old password*)
		NewPassword : WSTRING[100]; (*New password*)
		ConfirmPassword : WSTRING[100]; (*Confirmation of the new password*)
		LayerStatus : UINT; (*Visibility of the dialog box (status data point for the dialog box layer)*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
		CriteriaNotMet : MpUserXUIPasswordCriteriaEnum; (*Password criterion not met by new password*)
		NewPasswordOk : UINT; (*New password OK (all criterions met)*)
		ConfirmPasswordOk : UINT; (*Password-confirmation OK*)
	END_STRUCT;
	MpUserXLoginUIPwdType : 	STRUCT 
		ShowDialog : BOOL; (*Command that opens the dialog box*)
		Dialog : MpUserXLoginUIPwdDlgType; (*Dialog box for changing the password*)
	END_STRUCT;
	MpUserXLoginUILoginType : 	STRUCT 
		Login : BOOL; (*Command for logging in*)
		Logout : BOOL; (*Command for logging out*)
		UserName : WSTRING[100]; (*Username*)
		Password : WSTRING[100]; (*Password*)
	END_STRUCT;
	MpUserXLoginUIConnectType : 	STRUCT 
		Status : MpUserXUIStatusEnum; (*Current operation*)
		CurrentUser : WSTRING[100]; (*Currently logged in user*)
		Language : STRING[20]; (*Preferred language of the current (or previous) active user*)
		MeasurementSystem : MpUserXMeasurementSystemEnum; (*Preferred measurement system of the current (or previous) active user*)
		LoggedIn : BOOL; (*User is logged in*)
		UserLevel : DINT; (*Current user-level*)
		Login : MpUserXLoginUILoginType; (*Basic login information*)
		ChangePassword : MpUserXLoginUIPwdType; (*Used to change the password*)
		MessageBox : MpUserXUIMessageBoxType; (*Controls dialog boxes*)
		DefaultLayerStatus : UINT; (*Status data point for the default layer of the visualization page where logging in and out takes place*)
		UserType : MpUserXUserTypeEnum; (*Current user's user type*)
	END_STRUCT;
	MpUserXSignatureUIDlgType : 	STRUCT 
		LayerStatus : UINT; (*Visibility of the dialog box (status data point for the dialog box layer)*)
		UserName : WSTRING[100]; (*Username*)
		Password : WSTRING[100]; (*Password*)
		Comment : WSTRING[100]; (*Optional comment added by signing operator*)
		Confirm : BOOL; (*Confirms the operation*)
		Cancel : BOOL; (*Cancels the operation*)
	END_STRUCT;
	MpUserXSignatureUIConnectType : 	STRUCT 
		Status : MpUserXUIStatusEnum; (*Current status of the signature-procedure*)
		Dialog : MpUserXSignatureUIDlgType;
		MessageBox : MpUserXUIMessageBoxType; (*Controls dialog boxes*)
		DefaultLayerStatus : UINT; (*Status data point for the default layer of the visualization page where logging in and out takes place*)
	END_STRUCT;
END_TYPE

(*FB Infor Types*)

TYPE
	MpUserXLoginInfoType : 	STRUCT 
		AutoLogoutRemain : TIME; (*Time remaining before automatic logout [s]*)
		Diag : MpUserXDiagType; (*Diagnostic structure for the status ID*)
		DaysUntilPasswordExpiration : DINT; (*Time remaining before password expires [days]*)
		UserType : MpUserXUserTypeEnum; (*User's user type*)
	END_STRUCT;
	MpUserXManagerUIInfoType : 	STRUCT 
		Diag : MpUserXDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpUserXLoginUIInfoType : 	STRUCT 
		Diag : MpUserXDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpUserXSignatureUIInfoType : 	STRUCT 
		Diag : MpUserXDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpUserXSignatureInfoType : 	STRUCT 
		Diag : MpUserXDiagType; (*Diagnostic structure for the status ID*)
	END_STRUCT;
	MpUserXDiagType : 	STRUCT 
		StatusID : MpUserXStatusIDType; (*StatusID diagnostic structure*)
	END_STRUCT;
	MpUserXStatusIDType : 	STRUCT 
		ID : MpUserXErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
END_TYPE

(*FB Internal Types*)

TYPE
	MpUserXInternalType : 	STRUCT 
		pObject : UDINT;
		pInstance : UDINT; (*Marker for FB-instance (overload detection)*)
		State : DINT; (*State for internal life-time management*)
	END_STRUCT;
END_TYPE
