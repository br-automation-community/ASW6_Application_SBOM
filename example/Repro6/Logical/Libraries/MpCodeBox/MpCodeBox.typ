
TYPE
	MpCodeBoxProgramStateEnum : 
		(
		mpCODEBOX_STATE_UNDEFINED, (*Program state is undefined (inactive)*)
		mpCODEBOX_STATE_LOADING, (*Program is loading (compiling)*)
		mpCODEBOX_STATE_INIT_UP, (*Program INIT_UP is excuted*)
		mpCODEBOX_STATE_RUNNING, (*Program executed cyclically*)
		mpCODEBOX_STATE_SUSPENDED, (*Program is suspended (stopped)*)
		mpCODEBOX_STATE_ERROR, (*Program is stopped due to error*)
		mpCODEBOX_STATE_FINISHED, (*Program is finished*)
		mpCODEBOX_STATE_HALTED_BRKPOINT (*Program is halted at breakpoint*)
		);
	MpCodeBoxItemEnum : 
		(
		mpCODEBOX_ITEM_PROGRAM, (*Item-Type: Program (LD or ST)*)
		mpCODEBOX_ITEM_MACRO (*Item-Type: Macro*)
		);
	MpCodeBoxCodeEnum : 
		(
		mpCODEBOX_CODE_LD_SIMPLE, (*Code-Type: LD (simple)*)
		mpCODEBOX_CODE_ST (*Code-Type: ST (structured text)*)
		);
	MpCodeBoxCoroutineStateEnum : 
		(
		mpCODEBOX_COSTATE_UNDEFINED,
		mpCODEBOX_COSTATE_SUSPENDED,
		mpCODEBOX_COSTATE_RUNNING,
		mpCODEBOX_COSTATE_WAITING,
		mpCODEBOX_COSTATE_DEAD
		);
	MpCodeBoxMeasurementSystemEnum : 
		(
		mpCODEBOX_ENGINEERING_UNITS, (*Default*)
		mpCODEBOX_METRIC, (*Metric*)
		mpCODEBOX_IMPERIAL, (*Imperial*)
		mpCODEBOX_IMPERIAL_US (*Imperial US*)
		);
	MpCodeBoxCoreProgramsType : 	STRUCT  (*Parameter structure*)
		Name : ARRAY[0..9]OF STRING[100]; (*Program#1 to start*)
	END_STRUCT;
	MpCodeBoxStatusIDType : 	STRUCT 
		ID : MpCodeBoxErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
	MpCodeBoxDiagType : 	STRUCT 
		StatusID : MpCodeBoxStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpCodeBoxProgramInfoType : 	STRUCT 
		Name : STRING[100];
		State : MpCodeBoxProgramStateEnum;
		Error : DINT;
	END_STRUCT;
	MpCodeBoxCoreInfoType : 	STRUCT 
		NumberOfActivePrograms : UINT; (*Number of active programs*)
		Program : ARRAY[0..9]OF MpCodeBoxProgramInfoType; (*Overview of running programs*)
		Diag : MpCodeBoxDiagType;
	END_STRUCT;
	MpCodeBoxBasicSandboxType : 	STRUCT 
		DigIn : ARRAY[0..11]OF BOOL;
		DigOut : ARRAY[0..11]OF BOOL;
	END_STRUCT;
	MpCodeBoxFlexControlInfoType : 	STRUCT 
		Diag : MpCodeBoxDiagType; (*Information about FB-Staus*)
		ProgramName : STRING[255]; (*Name of currently executed program*)
		State : MpCodeBoxProgramStateEnum; (*State of last / currently executed program*)
	END_STRUCT;
	MpCodeBoxFlexConsoleType : 	STRUCT 
		Severity : MpComSeveritiesEnum; (*Severity of entry*)
		Text : STRING[255]; (*Console-text*)
	END_STRUCT;
	MpCodeBoxFlexCoroutineType : 	STRUCT 
		Name : STRING[50]; (*Name of couroutine*)
		State : MpCodeBoxCoroutineStateEnum; (*Current state of coroutine*)
		FileName : STRING[255]; (*Name of file that is currently executed*)
		CurrentLineNumber : UDINT; (*Line-number of currently executed line*)
	END_STRUCT;
	MpCodeBoxFlexMonitorType : 	STRUCT 
		ProgramState : MpCodeBoxProgramStateEnum; (*State of last / currently executed program*)
		ProgramName : STRING[255]; (*Name of currently executed program*)
		FileName : STRING[255]; (*Name of currenly executed file*)
		CurrentLineNumber : UDINT; (*Line number in current file*)
		PreviousLine : STRING[255]; (*Content of previous code-line (was already executed)*)
		CurrentLine : STRING[255]; (*Content of current code-line (is currently executed)*)
		NextLine : STRING[255]; (*Content of next code-line (to be executed)*)
		CallStack : ARRAY[0..4]OF STRING[255]; (*Callstack for the current line*)
		BreakPointCount : UDINT; (*Total number of break-points in program*)
	END_STRUCT;
	MpCodeBoxFlexMonitorInfoType : 	STRUCT 
		Diag : MpCodeBoxDiagType; (*Information about FB-Staus*)
	END_STRUCT;
	MpCodeBoxProgramControlInfoType : 	STRUCT 
		Diag : MpCodeBoxDiagType;
	END_STRUCT;
	MpCodeBoxManagerInfoType : 	STRUCT 
		Diag : MpCodeBoxDiagType;
	END_STRUCT;
END_TYPE
