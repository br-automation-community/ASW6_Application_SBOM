
FUNCTION_BLOCK MpFileManagerUI (*File management system and UI connection to VC4*) (* $GROUP=mapp Services,$CAT=File Explorer,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpFile.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		UISetup : MpFileManagerUISetupType; (*Used to configure the elements connected to the HMI application*) (* *) (*#PAR#;*)
		UIConnect : REFERENCE TO MpFileManagerUIConnectType; (*This structure contains the parameters needed for the connection to the HMI application*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		Info : MpFileManagerUIInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT; (*Internal data*)
		InternalData : ARRAY[0..50] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
