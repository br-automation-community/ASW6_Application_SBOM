
FUNCTION_BLOCK MC_BR_TrackingFramesCreate
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
		Parameters : McTrkFramesCreateParType; (*Parameters*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingFrameCreate
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
		Parameters : McTrkFrmCreateParType; (*Parameters*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
		TrackingFrameID : McTrkFrmIdentType; (*ID of created tracking fram*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingFrameDelete
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
		Mode : McTrkFrmDeleteModEnum; (*Deletion mode*) (* *) (*#PAR#;*)
		TrackingFrameID : McTrkFrmIdentType; (*ID of tracking frame to be deleted*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingPathGetFrames
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
		Parameters : McTrkPathGetFrmParType; (*Parameters*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
		TrackingFrameCount : UINT; (*Number of tracking frames existing in TrackingPath when executed*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingFrameSetAttribute
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
		TrackingFrameID : McTrkFrmIdentType; (*ID of tracking frame to be changed*) (* *) (*#PAR#;*)
		Attribute : UDINT; (*Attribute to be set*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingPathReadStatus
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block's output values can be used.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
		TrackingPathReady : BOOL; (* TrackingPath ready*) (* *) (*#PAR#;*)
		TrackingPathErrorStop : BOOL; (* TrackingPath in error state*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingPathReadInfo
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*The function block's output values can be used.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
		TrackingPathInfo : McTrkPathInfoType; (*TrackingPath Information*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingPathReset
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath.*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution.*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_TrackingFrameCopyUserData
	VAR_INPUT
		TrackingPath : REFERENCE TO McTrackingPathType; (*The TrackingPath reference establishes the connection between the function block and the TrackingPath*) (* *) (*#PAR#;*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input*) (* *) (*#PAR#;*)
		TrackingFrameID : McTrkFrmIdentType; (*ID of tracking frame to be changed*) (* *) (*#PAR#;*)
		DataAddress : UDINT; (*Address of the user data process variable. The size must match with the configured user data size in TrackingPath configuration*) (* *) (*#PAR#;*)
		Mode : McTrkFrmCpyUserDatModeEnum; (*Defines whether the user data for a Tracking Frame should be read or written*) (* *) (*#PAR#;*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished*) (* *) (*#PAR#;*)
		Busy : BOOL; (*Function block is active and must continue to be called*) (* *) (*#PAR#;*)
		Error : BOOL; (*Error occurred during execution*) (* *) (*#PAR#;*)
		ErrorID : DINT; (*Error number*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK
