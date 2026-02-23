
FUNCTION_BLOCK MpSequenceCore (*Machine sequence execution*) (* $GROUP=mapp Services,$CAT=Programmable Machine Sequence,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSequence.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpSequenceCoreParType; (*Function block parameters*) (* *) (*#PAR#; *)
		Update : BOOL; (*Applies changed parameters*) (* *) (*#PAR#; *)
		Mode : MpSequenceModeEnum; (*Sequence execution mode*) (* *) (*#CMD#;*)
		Start : BOOL; (*Start command*) (* *) (*#CMD#; *)
		StopImmediate : BOOL; (*Stop command*) (* *) (*#CMD#; *)
		Stop : BOOL; (*Stop command*) (* *) (*#CMD#; *)
		Suspend : BOOL; (*Suspend command*) (* *) (*#CMD#OPT#;*)
		Resume : BOOL; (*Resume command*) (* *) (*#CMD#OPT#;*)
		Import : BOOL; (*Import a sequence*) (* *) (*#CMD#;*)
		Export : BOOL; (*Export a sequence*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#;*)
		Running : BOOL; (*A sequence is currently running*) (* *) (*#CMD#; *)
		Suspended : BOOL; (*Sequence execution is suspended*) (* *) (*#CMD#OPT#; *)
		Stopped : BOOL; (*Sequence execution is stopped*) (* *) (*#CMD#; *)
		Info : MpSequenceCoreInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} USINT; (*Internal data*)
		InternalData : {REDUND_UNREPLICABLE} ARRAY[0..26] OF UDINT; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
