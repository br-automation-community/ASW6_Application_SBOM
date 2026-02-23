
TYPE
	MpBackupCoreInfoType : 	STRUCT  (*Info structure of core function block*)
		LastBackup : MpBackupLastBackupType; (*Last backup created*)
		Project : MpBackupProjectInfoType; (*Project information*)
		Diag : MpBackupDiagType; (*Diagnostic structure for the function block*)
		Automatic : MpBackupAutoInfoType; (*Information about automatic processes*)
	END_STRUCT;
	MpBackupDiagType : 	STRUCT 
		StatusID : MpBackupStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpBackupStatusIDType : 	STRUCT 
		ID : MpBackupErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpBackupLastBackupType : 	STRUCT 
		Name : STRING[255]; (*Name of last backup created*)
		DateTime : DATE_AND_TIME; (*Data and Time when last backup was created*)
		GenerationType : MpBackupGenerationTypeEnum; (*Specifies if last backup was created manually or automatically*)
	END_STRUCT;
	MpBackupGenerationTypeEnum : 
		(
		mpBACKUP_GENERATION_AUTO := 1, (*Backup was created automatically by mapp backup*)
		mpBACKUP_GENERATION_MANUAL := 0 (*Backup was created manually using function block interface of mapp backup*)
		);
	MpBackupProjectInfoCurrentType : 	STRUCT 
		ConfigurationID : STRING[255]; (*ConfigurationID of the project *)
		ConfigurationVersion : STRING[64]; (*Configuration version of the project *)
	END_STRUCT;
	MpBackupProjectInfoRequestType : 	STRUCT 
		Name : STRING[255]; (*Name of backup/update for which this information has been requested*)
		ConfigurationID : STRING[255]; (*ConfigurationID of the project *)
		ConfigurationVersion : STRING[64]; (*Configuration version of the project *)
	END_STRUCT;
	MpBackupProjectInfoType : 	STRUCT 
		Current : MpBackupProjectInfoCurrentType; (*Project installed on target system*)
		Requested : MpBackupProjectInfoRequestType; (*Project of specified backup/update*)
	END_STRUCT;
	MpBackupAutoInfoType : 	STRUCT 
		Backup : MpBackupAutoBackupInfoType; (*Automatic backup creation information*)
		Update : MpBackupAutoUpdateInfoType; (*Automatic update information*)
	END_STRUCT;
	MpBackupAutoBackupInfoType : 	STRUCT 
		InProgress : BOOL; (*TRUE if an automic backup is currently being created*)
	END_STRUCT;
	MpBackupAutoUpdateInfoType : 	STRUCT 
		IsAvailable : BOOL; (*A newer project version is available*)
		Name : STRING[255]; (*Name of the update*)
		ConfigurationID : STRING[255]; (*ConfigurationID of the project *)
		ConfigurationVersion : STRING[64]; (*Configuration version of the project *)
	END_STRUCT;
END_TYPE
