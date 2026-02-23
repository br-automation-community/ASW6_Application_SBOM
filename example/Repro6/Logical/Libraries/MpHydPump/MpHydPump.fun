
FUNCTION_BLOCK MpHydPumpController (*mapp component which can be used for a hydraulic pump controller*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		Power : BOOL; (*Level-sensitive command for turning an servo pump axis on/off*) (* *) (*#CMD#;*)
		Control : BOOL; (*Command for starting control*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		PowerOn : BOOL; (*Axis is switched on.*) (* *) (*#CMD#; *)
		ControlActive : BOOL; (*Controlling is switched on.*) (* *) (*#CMD#; *)
		Info : MpHydPumpControllerInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpControllerConfig (*mapp component configuration for a hydraulic pump controller*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface)*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpHydPumpControllerConfigType; (*Configuration parameters (mapp standard interface)*) (* *) (*#PAR#; *)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpHydPumpInfoType; (*Additional information*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpAutotuning (*mapp component for the feature "Auto tuning" to tune the speed controller and/or the pressure controller.*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpHydPumpAutotuningParType; (*Function blocks parameters*) (* *) (*#PAR#;*)
		Update : BOOL; (*Applies changed parameters*) (* *) (*#PAR#;*)
		Mode : MpHydPumpAutotuningModeEnum; (*Tuning mode*) (* *) (*#CMD#;*)
		StartTuning : BOOL; (*Command for starting the auto tuning*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#; *)
		TuningActive : BOOL; (*Tuning is active*) (* *) (*#CMD#; *)
		TuningDone : BOOL; (*Tuning is done*) (* *) (*#CMD#; *)
		Info : MpHydPumpAutotuningInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpControllerFeatureConfig (*mapp component to configure a MpTensionController Feature.*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpHydPumpCtrlFeatureConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpHydPumpInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpGroup (*mapp component which can be used for a hydraulic pump group.*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		Power : BOOL; (*Level-sensitive command for turning the axis of the servo pumps in the group on/off*) (* *) (*#CMD#;*)
		Control : BOOL; (*Command for starting control*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		PowerOn : BOOL; (*Axis is switched on.*) (* *) (*#CMD#; *)
		ControlActive : BOOL; (*Controlling is switched on.*) (* *) (*#CMD#; *)
		Info : MpHydPumpGroupInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpGroupConfig (*mapp component configuration for a hydraulic pump group*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface)*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpHydPumpGroupConfigType; (*Configuration parameters (mapp standard interface)*) (* *) (*#PAR#; *)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpHydPumpInfoType; (*Additional information*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpHydPumpGroupFeatureConfig (*mapp component to configure a MpHydPumpGroup Feature.*) (* $GROUP=mapp Control,$CAT=Hydraulics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpHydraulics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The function block is active as long as this input is set.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpHydPumpGrpFeatureConfigType; (*Structure used to specify the configuration.*) (* *) (*#PAR#; *)
		Load : BOOL; (*Loads the configuration of the component.*) (* *) (*#CMD#*)
		Save : BOOL; (*Saves the configuration of the component.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#CMD#*)
		Info : MpHydPumpInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK
