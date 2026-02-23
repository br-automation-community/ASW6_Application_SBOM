
FUNCTION_BLOCK MpPickCore (*This function block handles a PickCore component*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickCoreType; (*Connection to PickCore component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickCoreParType; (*Function block parameters*) (* *) (*#PAR#; *)
		ProcessEnable : BOOL; (*Activates/Deactivates the PickCore component *) (* *) (*#CMD#;*)
		ProcessStart : BOOL; (*Starts the PickCore process*) (* *) (*#CMD#;*)
		ProcessStop : BOOL; (*Stops the PickCore process*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		ProcessActive : BOOL; (*PickCore component is active*) (* *) (*#CMD#; *)
		ProcessRunning : BOOL; (*PickCore component is running*) (* *) (*#CMD#; *)
		Info : MpPickCoreInfoType; (*Additional information*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegister (*This function block handles a PickRegister component*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors (standard interface)*) (* *) (*#PAR#;*)
		RegisterEnable : BOOL; (*Activates/Deactivates the PickRegister component *) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		RegisterActive : BOOL; (*PickRegister component is active*) (* *) (*#CMD#; *)
		Info : MpPickRegisterInfoType; (*Additional information*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegCreateObjects (*This function block creates objects on a PickRegister*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickRegCreateObjectsParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Create : BOOL; (*Creates pick-and-place objects on the PickRegister*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegCreateObject (*This function block creates objects on a PickRegister*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickRegCreateObjectParType; (*Function block parameters*) (* *) (*#PAR#;*)
		Create : BOOL; (*Creates a pick-and-place object on the PickRegister*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#; *)
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier of a pick-and-place object or placeholder*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegDeleteObjects (*This function block deletes objects from a PickRegister*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickRegDeleteObjectsParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Delete : BOOL; (*Deletes pick-and-place objects from the PickRegister*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegGetObjects (*This function block gets objects from the PickRegister*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickRegGetObjectsParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Get : BOOL; (*Gets info from objects on the PickRegister*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#;*)
		ObjectPositionsFound : UINT; (*Number of found object positions*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickRegSetObject (*This function block changes the attachment of an object objects on a PickRegister*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickRegisterType; (*Connection to PickRegister component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		Parameters : MpPickRegSetObjectParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Set : BOOL; (*Sets the attachment of a pick-and-place objects on the PickRegister*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPickGetObjectTypeIdent (*This function block returns the identifier for an object defined in a PickObjectList*)
	VAR_INPUT
		MpLink : REFERENCE TO MpPickObjectListType; (*Connection to PickObjectList component*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (standard interface)*) (* *) (*#PAR#;*)
		ObjectTypeName : STRING[250]; (*Name of the object type defined in the PickObjectList*) (* *) (*#CMD#;*)
		Get : BOOL; (*Get object type ident*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during operation (standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (standard interface)*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is currently executing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Function block has successfully executed a command*) (* *) (*#CMD#; *)
		ObjectTypeIdent : MpPickObjectTypeIdentType; (*Object type identifier*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK