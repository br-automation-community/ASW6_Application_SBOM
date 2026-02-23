
FUNCTION_BLOCK MpIOImport (*Import hardware configuration*) (* $GROUP=mapp Services,$CAT=Hardware Management,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpIO.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*Name of device where the file is located*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of file to be imported*) (* *) (*#CMD#;*)
		Import : BOOL; (*Import hardware configuration*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#;*)
		Info : MpIOImportInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT; (*Internal stucture*)
		InternalData : ARRAY[0..20] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpIOImportUI (*UI connection for VC4 io import page*) (* $GROUP=mapp Services,$CAT=Hardware Management,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpIO.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*Name of device where the import-files are located*) (* *) (*#CMD#;*)
		UISetup : MpIOImportUISetupType := (0); (*Used to configure the elements connected to the HMI application*) (* *) (*#PAR#;*)
		UIConnect : REFERENCE TO MpIOImportUIConnectType; (*This structure contains the parameters needed for the connection to the HMI application*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		Info : MpIOImportUIInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT; (*Internal stucture*)
		InternalData : ARRAY[0..29] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
