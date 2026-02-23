
FUNCTION_BLOCK MpClampBasic (*Control for a clamp unit*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpClampBasicParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Update : BOOL; (*Updates the parameters*) (* *) (*#PAR#; *)
		MoveType : MpClampMoveTypeEnum; (*Movement type (setting, manual, auto)*) (* *) (*#CMD#*)
		TargetPosition : REAL; (*Target position for the movement [mm] (open, close)*) (* *) (*#CMD#*)
		Open : BOOL; (*Start movement in open direction (positive)*) (* *) (*#CMD#*)
		Close : BOOL; (*Start movement in close direction (negative) *) (* *) (*#CMD#*)
		Unlock : BOOL; (*Start unlock movement (positive direction)*) (* *) (*#CMD#OPT#*)
		Lock : BOOL; (*Start lock movement (negative direction)*) (* *) (*#CMD#OPT#*)
		PostUnlock : BOOL; (*Start postlock movement (positive direction)*) (* *) (*#CMD#OPT#*)
		PreLock : BOOL; (*Start prelock movement (negative direction)*) (* *) (*#CMD#OPT#*)
		Stop : BOOL; (*Stop movement*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Update of parameters done*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		InPosition : BOOL; (*Axis has reached the target position*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Axis stopped by command. No movement can be started until the "Stop" command is reset*) (* *) (*#CMD#*)
		MoveActive : BOOL; (*A movement is currently active*) (* *) (*#CMD#*)
		Info : MpClampBasicInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpClampBasicEConfig (*Configuration for electric toggle/direct clamp*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpClampBasicEConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpClampInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpClampBasicHConfig (*Configuration for hydraulic toggle/direct clamp*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpClampBasicHConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpClampInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
