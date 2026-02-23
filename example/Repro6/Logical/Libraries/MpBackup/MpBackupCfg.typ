
TYPE
	MpBackupCfgEnum : 
		(
		mpBACKUP_CFG_CORE := 100 (*MpBackupCfgCoreType: Root element of the Core Configuration*)
		);
	MpBackupCfgCoreGeneralType : 	STRUCT  (*General Settings*)
		Enable : BOOL; (*Enable/Disable of component*)
		EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
		EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
		Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
	END_STRUCT;
	MpBackupCfgCoreScheduleType : 	STRUCT  (*Schedule*)
		Day : MpBackupCfgCoreWeekDayEnum; (*Specifies the day of the week (0-6, Monday = 0)*)
		Time : UDINT; (*Specifies the time of day*)
	END_STRUCT;
	MpBackupCfgCoreModeEnum : 
		( (*Disables/Enables the backup function*)
		mpBACKUP_CFG_CORE_DISABLED := 0, (*Disables the backup function*)
		mpBACKUP_CFG_CORE_ENABLED := 1 (*Enables the backup function*)
		);
	MpBackupCfgCoreWeekDayEnum : 
		( (*Day*)
		mpBACKUP_CFG_CORE_MONDAY := 0, (*Monday*)
		mpBACKUP_CFG_CORE_TUESDAY := 1, (*Tuesday*)
		mpBACKUP_CFG_CORE_WEDNESDAY := 2, (*Wednesday*)
		mpBACKUP_CFG_CORE_THURSDAY := 3, (*Thursday*)
		mpBACKUP_CFG_CORE_FRIDAY := 4, (*Friday*)
		mpBACKUP_CFG_CORE_SATURDAY := 5, (*Saturday*)
		mpBACKUP_CFG_CORE_SUNDAY := 6 (*Sunday*)
		);
	MpBackupCfgCoreScheduleModeEnum : 
		( (*Schedule mode*)
		mpBACKUP_CFG_CORE_DAILY := 0, (*Schedule mode daily*)
		mpBACKUP_CFG_CORE_WEEKLY := 1, (*Schedule mode weekly*)
		mpBACKUP_CFG_CORE_ON_ENABLE := 2 (*Schedule when the function block is enabled*)
		);
	MpBackupCfgCoreScheduleModeType : 	STRUCT  (*Creation mode for the automatic backup*)
		Type : MpBackupCfgCoreScheduleModeEnum; (*Definition of Mode*)
		Schedule : MpBackupCfgCoreScheduleType; (*Schedule to creates an automatic backup*)
	END_STRUCT;
	MpBackupCfgCoreOvrEnableType : 	STRUCT  (*Enables overwriting of the oldest backup*)
		MaximumBackups : UINT; (*Maximum number of backups on the specified device*)
	END_STRUCT;
	MpBackupCfgCoreOvrOldestType : 	STRUCT  (*Defines whether old backups should be deleted manually*)
		Type : MpBackupCfgCoreModeEnum; (*Definition of Overwrite oldest*)
		Overwrite : MpBackupCfgCoreOvrEnableType; (*Enables overwriting of the oldest backup*)
	END_STRUCT;
	MpBackupCfgCoreAutoEnabledType : 	STRUCT  (*Enables automatic backups*)
		NamePrefix : STRING[255]; (*First part of the backup name. MpBackup automatically adds a timestamp at the end. Format: myPrefix_%Y_%m_%d_%H_%M_%S*)
		DeviceName : STRING[50]; (*Absolute path including file device where the cyclic backup should be created (DeviceName/Path)*)
		Mode : MpBackupCfgCoreScheduleModeType; (*Creation mode for the automatic backup*)
		OverwriteOldest : MpBackupCfgCoreOvrOldestType; (*Defines whether old backups should be deleted manually*)
	END_STRUCT;
	MpBackupCfgCoreAutoBackupType : 	STRUCT  (*Automatic backup settings*)
		Type : MpBackupCfgCoreModeEnum; (*Definition of Automatic backup*)
		Data : MpBackupCfgCoreAutoEnabledType; (*Enables automatic backups*)
	END_STRUCT;
	MpBackupCfgCoreUpdateEnabledType : 	STRUCT  (*Enables automatic update checks. A notification is shown if an update is available.*)
		DeviceName : STRING[50]; (*Absolute path including file device where updates are provided (DeviceName/Path)*)
		Check : MpBackupCfgCoreScheduleModeType; (*Defines when the component should check if updates are available*)
	END_STRUCT;
	MpBackupCfgCoreAutoUpdateType : 	STRUCT  (*Automatic update settings*)
		Type : MpBackupCfgCoreModeEnum; (*Definition of Automatic update*)
		Data : MpBackupCfgCoreUpdateEnabledType; (*Enables automatic update checks. A notification is shown if an update is available.*)
	END_STRUCT;
	MpBackupCfgCoreBackupType : 	STRUCT  (*Backup*)
		AutomaticBackup : MpBackupCfgCoreAutoBackupType; (*Automatic backup settings*)
		AutomaticUpdate : MpBackupCfgCoreAutoUpdateType; (*Automatic update settings*)
	END_STRUCT;
	MpBackupCfgCoreType : 	STRUCT  (*Complete MpBackupCore configuration structure.*)
		General : MpBackupCfgCoreGeneralType; (*General Settings*)
		Backup : MpBackupCfgCoreBackupType; (*Backup*)
	END_STRUCT;
END_TYPE
