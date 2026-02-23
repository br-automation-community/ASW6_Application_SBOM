
FUNCTION_BLOCK MpBackupCore (*This function block can create or restore backups of the machine software. Also newer versions of the machine software can be installed.*) (* $GROUP=mapp Services,$CAT=Backup & Restore,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpBackup.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*Name of  the file device on which a manual backup should be created or wherefrom  a backup or update should be installed*) (* *) (*#CMD#; *)
		Name : REFERENCE TO STRING[255]; (*Name and path of the backup to create or restore. (e.g. "FolderName/Name"). Together with the file device name an absolute path including name is being built*) (* *) (*#CMD#; *)
		Overwrite : BOOL; (*Overwrite existing file when necessary*) (* *) (*#CMD#;*)
		Create : BOOL; (*Creates a new software image of the running target and stores it on the defined DeviceName/Name*) (* *) (*#CMD#; *)
		Install : BOOL; (*Restores a backup or updates new software version given by DeviceName/Name*) (* *) (*#CMD#; *)
		RequestInfo : BOOL; (*Determines project infomation of the specified update/backup*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#; *)
		Info : MpBackupCoreInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : USINT; (*Internal*)
		InternalData : ARRAY[0..22] OF UDINT; (*Internal*)
	END_VAR
END_FUNCTION_BLOCK
