
FUNCTION_BLOCK MpInjectBasic (*Control for a hydraulic injection piston*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpInjectBasicParType; (*Function block parameters *) (* *) (*#PAR#; *)
		Update : BOOL; (*Updates the parameters *) (* *) (*#PAR#; *)
		MoveType : MpInjectMoveTypeEnum; (*Movement type (setting, manual, auto)*) (* *) (*#CMD#*)
		TargetPosition : REAL; (*Target position for the movement [mm]*) (* *) (*#CMD#*)
		Inject : BOOL; (*Start injection movement*) (* *) (*#CMD#*)
		Decompress : BOOL; (*Start decompression movement*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop movement*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Update of parameters done *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		InPosition : BOOL; (*Axis has reached the target position*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Axis stopped by command. No movement can be started until the "Stop" command is reset. *) (* *) (*#CMD#*)
		MoveActive : BOOL; (*A movement is active*) (* *) (*#CMD#*)
		Info : MpInjectBasicInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpInjectPlastificationBasic (*Control for a hydraulic plastification screw*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpInjectPlastBasicParType; (*Function block parameters *) (* *) (*#PAR#; *)
		Update : BOOL; (*Updates the parameters *) (* *) (*#PAR#; *)
		MoveType : MpInjectMoveTypeEnum; (*Movement type (setting, manual, auto)*) (* *) (*#CMD#*)
		TargetPosition : REAL; (*Target position for the movement [mm]*) (* *) (*#CMD#*)
		Plasticize : BOOL; (*Start plastification movement*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop movement*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Update of parameters done *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		InPosition : BOOL; (*Axis has reached the target position*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Axis stopped by command. No movement can be started until the "Stop" command is reset. *) (* *) (*#CMD#*)
		MoveActive : BOOL; (*A movement is active*) (* *) (*#CMD#*)
		Info : MpInjectPlastBasicInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpInjectBasicEConfig (*Configuration for hydraulic injection piston*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpInjectBasicEConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpInjectInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpInjectBasicHConfig (*Configuration for hydraulic injection piston*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpInjectBasicHConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpInjectInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpInjectPlastBasicEConfig (*Configuration for hydraulic plastification screw*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpInjectPlastBasicEConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpInjectInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpInjectPlastBasicHConfig (*Configuration for hydraulic plastification screw*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpInjectPlastBasicHConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpInjectInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
