
FUNCTION_BLOCK MpEjectorBasic (*Control for a hydraulic ejector*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpEjectorBasicParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Update : BOOL; (*Updates the parameters*) (* *) (*#PAR#; *)
		MoveType : MpEjectorMoveTypeEnum; (*Movement type (setup, normal)*) (* *) (*#CMD#*)
		TargetPosition : REAL; (*Target position for the movement [mm]*) (* *) (*#CMD#*)
		Forward : BOOL; (*Forward movement command*) (* *) (*#CMD#*)
		Backward : BOOL; (*Backward movement command*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop movement*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active *) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Update of parameters done *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		InPosition : BOOL; (*Ejector has reached the target position*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Ejector stopped by command. No movement can be started until the "Stop" command is reset*) (* *) (*#CMD#*)
		MoveActive : BOOL; (*A movement is currently active*) (* *) (*#CMD#*)
		Info : MpEjectorBasicInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpEjectorBasicEConfig (*Configuration for hydraulic ejector*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpEjectorBasicEConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpEjectorInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpEjectorBasicHConfig (*Configuration for electric ejector*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpEjectorBasicHConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpEjectorInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
