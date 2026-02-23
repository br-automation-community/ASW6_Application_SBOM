(*Enumerators*)

TYPE
	MpSequenceModeEnum : 
		( (*Sequence execution modes*)
		mpSEQUENCE_MODE_AUTOMATIC := 0, (*Automatic mode*)
		mpSEQUENCE_MODE_SINGLE_CYCLE := 1, (*Semi-automatic mode (wait after end of cycle)*)
		mpSEQUENCE_MODE_SINGLE_STEP := 2, (*Single step mode (only one step at a time)*)
		mpSEQUENCE_MODE_SINGLE_COMMAND := 3, (*Single command mode (only one command, no relation to a sequence)*)
		mpSEQUENCE_MODE_MANUAL := 5 (*Manual mode; command from the parameter structure, but the command will be looked up inside the currently loaded sequence*)
		);
	MpSequenceStartModeEnum : 
		( (*Start modes for sequence execution*)
		mpSEQUENCE_START_NORMAL := 0, (*Start from sequence start point*)
		mpSEQUENCE_START_SELECT_STEP := 1, (*Start from selected step (input)*)
		mpSEQUENCE_START_AUTO_STEP := 2, (*Start from automatically detected step (based on machine state)*)
		mpSEQUENCE_RESUME_EXECUTION := 3 (*Resume from the last active steps before interruption (e.g. by interlock error)*)
		);
	MpSequenceStopModeEnum : 
		( (*Stop modes for sequence stop*)
		mpSEQUENCE_STOP_IMMEDIATE := 0, (*Stop the execution immediately*)
		mpSEQUENCE_STOP_END_OF_STEP := 1, (*Stop the execution after all currently active steps have ended*)
		mpSEQUENCE_STOP_END_OF_CYCLE := 2 (*Stop the execution after the sequence end (like semi-automatic mode)*)
		);
	MpSequenceSuspendModeEnum : 
		( (*Suspend modes for sequence halt*)
		mpSEQUENCE_SUSPEND_IMMEDIATE := 0, (*Suspend the execution immediately*)
		mpSEQUENCE_SUSPEND_END_OF_STEP := 1 (*Suspend the execution after all active steps have ended*)
		);
	MpSequenceMovementStateEnum : 
		( (*Movement state of the current movement*)
		mpSEQUENCE_MOVEMENT_IDLE := 0, (*Idle: No movement is currently active*)
		mpSEQUENCE_MOVEMENT_ACTIVE := 1, (*Active: A movement is currently active*)
		mpSEQUENCE_MOVEMENT_DONE := 2, (*Done: A movement command has finished*)
		mpSEQUENCE_MOVEMENT_ERROR := 99 (*Error: A movement is in error state*)
		);
END_TYPE

(*Parameters*)

TYPE
	MpSequenceCoreParType : 	STRUCT  (*Parameter structure*)
		Sequence : STRING[255]; (*Name of the sequence to be executed*)
		InitSequence : STRING[255]; (*Name of the init sequence to be executed*)
		ExitSequence : STRING[255]; (*Name of the exit sequence to be executed*)
		Start : MpSequenceCoreStartType; (*Start parameters*)
		Stop : MpSequenceCoreStopType; (*Stop parameters*)
		Suspend : MpSequenceSuspendType; (*Suspend parameters*)
		Manual : MpSequenceManualType; (*Manual mode parameters*)
		SingleCommand : MpSequenceSingleCommandType; (*Single command parameters*)
	END_STRUCT;
	MpSequenceCoreStartType : 	STRUCT  (*Start parameters*)
		Mode : MpSequenceStartModeEnum := mpSEQUENCE_START_NORMAL; (*Sequence Start Mode*)
		Step : STRING[255] := ''; (*Sequence start step (only used with start mode select step)*)
	END_STRUCT;
	MpSequenceCoreStopType : 	STRUCT  (*Stop parameters*)
		Mode : MpSequenceStopModeEnum := mpSEQUENCE_STOP_IMMEDIATE; (*Sequence stop mode*)
	END_STRUCT;
	MpSequenceSuspendType : 	STRUCT  (*Suspend parameters*)
		Mode : MpSequenceSuspendModeEnum := mpSEQUENCE_SUSPEND_IMMEDIATE; (*Sequence suspend mode*)
	END_STRUCT;
	MpSequenceManualType : 	STRUCT 
		Command : {REDUND_UNREPLICABLE} STRING[255]; (*Command name for manual mode*)
	END_STRUCT;
	MpSequenceSingleCommandType : 	STRUCT 
		Command : {REDUND_UNREPLICABLE} STRING[255]; (*Command name for manual mode*)
		ParametersArraySize : UDINT; (*Number of elements in Parameters array*)
		Parameters : UDINT; (*Parameter list for the command: pointer to an array of MpSequenceManualParType; the array size must not be smaller than defined with ParameterArraySize*)
	END_STRUCT;
	MpSequenceManualParType : 	STRUCT 
		Name : {REDUND_UNREPLICABLE} STRING[255]; (*Parameter name*)
		Value : {REDUND_UNREPLICABLE} LREAL; (*Parameter value*)
	END_STRUCT;
END_TYPE

(*Info*)

TYPE
	MpSequenceCoreInfoType : 	STRUCT  (*Sequence core info structure*)
		ReadyToStart : BOOL; (*A sequence has been loaded or transferred from the HMI and is ready to start*)
		ReadyToResume : BOOL; (*A sequence has been suspended and is ready to be resumed*)
		ActiveMode : MpSequenceModeEnum; (*Currently active mode*)
		ActiveSteps : ARRAY[0..9]OF STRING[255]; (*Currently active steps (first 10 layers)*)
		ActiveCommands : ARRAY[0..9]OF STRING[255]; (*Currently active commands (first 10 layers)*)
		ElapsedTime : ARRAY[0..9]OF REAL; (*Currently active step elapsed time [s]*)
		Cycle : MpSequenceCycleType; (*Cycle information*)
		Diag : MpSequenceDiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
	MpSequenceDiagType : 	STRUCT 
		StatusID : MpSequenceStatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpSequenceStatusIDType : 	STRUCT 
		ID : MpSequenceErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpSequenceCycleType : 	STRUCT  (*Cycle information*)
		Count : UDINT; (*Number of cycles passed since last boot*)
		CurrentDuration : REAL; (*Duration of currently running cycle [s]*)
		LastDuration : REAL; (*Duration of last run cycle [s]*)
	END_STRUCT;
END_TYPE

(*Command structure*)

TYPE
	MpSequencerCommandType : 	STRUCT  (*Command structure for axis movements*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		Actuator : STRING[255]; (*Actuator used for the movement*)
		CurrentMode : MpSequenceModeEnum; (*Current active mode*)
		MovementState : MpSequenceMovementStateEnum; (*Feedback: Current state of the movement*)
		CurrentRunTime : REAL; (*Duration of the running movement [s]*)
		LastRunTime : REAL; (*Duration of the last movement [s]*)
	END_STRUCT;
END_TYPE
