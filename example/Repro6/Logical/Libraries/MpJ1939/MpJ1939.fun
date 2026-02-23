
FUNCTION_BLOCK MpJ1939SpecificRequest (*Generic specific request function*) (* $GROUP=mapp Services,$CAT=SAE J1939,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpJ1939.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		PGN : UDINT; (*PGN to receive*) (* *) (*#PAR#;*)
		Priority : USINT; (*PGN to receive*) (* *) (*#PAR#;*)
		Data : UDINT; (*Pointer to data buffer to write to*) (* *) (*#PAR#;*)
		DataLength : UINT; (*Length of the data array used in bytes*) (* *) (*#PAR#;*)
		Request : BOOL; (*Triggers the request of the data*) (* *) (*#CMD#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Command busy*) (* *) (*#CMD#; *)
		CommandDone : BOOL; (*Command done*) (* *) (*#CMD#; *)
		Info : MpJ193SpecificRequestInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} USINT; (*Internal state*)
		InternalData : ARRAY[0..13] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpJ1939Receive (*Generic receive function*) (* $GROUP=mapp Services,$CAT=SAE J1939,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpJ1939.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		PGN : UDINT; (*PGN to receive*) (* *) (*#PAR#;*)
		Priority : USINT; (*PGN to receive*) (* *) (*#PAR#;*)
		Data : UDINT; (*Pointer to data buffer to write to*) (* *) (*#PAR#;*)
		DataLength : UINT; (*Length of the data array used in bytes*) (* *) (*#PAR#;*)
		Receive : BOOL; (*Triggers the reception of the data*) (* *) (*#CMD#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandDone : BOOL; (*Command done*) (* *) (*#CMD#; *)
		CommandBusy : BOOL; (*Command busy*) (* *) (*#CMD#; *)
		Info : MpJ1939ReceiveInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} USINT; (*Internal state*)
		InternalData : ARRAY[0..13] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpJ1939Transmit (*Generic transmit function*) (* $GROUP=mapp Services,$CAT=SAE J1939,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpJ1939.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		PGN : UDINT; (*PGN to transmit*) (* *) (*#PAR#;*)
		Priority : USINT; (*PGN to receive*) (* *) (*#PAR#;*)
		Data : UDINT; (*Pointer to data buffer to send data from*) (* *) (*#PAR#;*)
		DataLength : UINT; (*Length of the data array used in bytes*) (* *) (*#PAR#; *)
		Transmit : BOOL; (*Triggers the transmission of the data*) (* *) (*#CMD#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandDone : BOOL; (*Command done*) (* *) (*#CMD#; *)
		CommandBusy : BOOL; (*Command busy*) (* *) (*#CMD#; *)
		Info : MpJ193TransmitInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} USINT; (*Internal state*)
		InternalData : ARRAY[0..13] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
