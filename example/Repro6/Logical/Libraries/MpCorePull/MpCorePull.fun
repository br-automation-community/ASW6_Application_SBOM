
FUNCTION_BLOCK MpCorePullBasic (*Control for a hydraulic core pull*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpCorePullBasicParType; (*Function block parameters *) (* *) (*#PAR#; *)
		Update : BOOL; (*Updates the parameters *) (* *) (*#PAR#; *)
		MoveType : MpCorePullMoveTypeEnum; (*Movement type (setting, manual, auto)*) (* *) (*#CMD#*)
		ParameterSet : USINT; (*Selecting parameter set*) (* *) (*#CMD#*)
		In : BOOL; (*Start movement command*) (* *) (*#CMD#*)
		Out : BOOL; (*Start movement command*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop movement*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active *) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Update of parameters done *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		InPosition : BOOL; (*End position was reached*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Axis stopped by command. No movement can be started until the "Stop" command is reset*) (* *) (*#CMD#*)
		MoveActive : BOOL; (*A movement is currently active*) (* *) (*#CMD#*)
		Info : MpCorePullBasicInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpCorePullBasicHConfig (*Configuration for hydraulic core pull*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpCorePullBasicHConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active *) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpCorePullInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
