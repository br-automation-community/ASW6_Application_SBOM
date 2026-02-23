FUNCTION_BLOCK MC_BR_GroupDynModIdent_PathGen
	VAR_INPUT
		AxesGroup : REFERENCE TO McAxesGroupType; (*The axis group reference establishes the connection between the function block and the axis group.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Mode : McPathGenDynModIdentModeEnum; (*Defines the mode for dynamic model identification*)
		StartpointParameters : McPathGenDynModIdentSpParType; (*Startpoint parameters for dynamic model identification*)
		AdvancedParameters : McPathGenDynModIdentAdvParType; (*Advanced parameters for dynamic model identification*)
	END_VAR
	VAR_OUTPUT
		Done: BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Active : BOOL; (*Indicates that the function block is currently controlling the axis group.*)
		CommandAborted : BOOL; (*Command aborted by another command*)
		Error : BOOL; (*Error occurred during execution.*)
		ErrorID : DINT; (*Error number*)
		Phase : McPathGenDynModIdentPhaseEnum; (*Indicates the current phase of the identification.*)
	END_VAR
	VAR
		Internal : McInternalType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingStatus_PathGen
	VAR_INPUT
		AxesGroup : REFERENCE TO McAxesGroupType; (*The axis group reference establishes the connection between the function block and the axis group.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;(*The function block's output values can be used.*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Error occurred during execution.*)
		ErrorID : DINT; (*Error number*)
		TrackingState: McPathGenTrackingStateEnum;(*Tracking state*)
		TrackingAdditionalInfo: McPathGenTrackingInfoType; (*additional tracking info*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK
