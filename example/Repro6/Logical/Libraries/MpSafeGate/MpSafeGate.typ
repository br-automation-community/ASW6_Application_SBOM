(*Enumerators*)

TYPE
	MpSafeGateSwitchTypeEnum : 
		( (*Movement types for axes*)
		mpSAFEGATE_SWITCH_NONE := 0, (*Movement in setup mode (axis will use the defined speed and pressure)*)
		mpSAFEGATE_SWITCH_SINGLE_PULSE := 1, (*Movement in manual or semi-(automatic) mode (axis will follow the profile)*)
		mpSAFEGATE_SWITCH_LEVEL := 2 (*Movement in manual or semi-(automatic) mode (axis will follow the profile)*)
		);
END_TYPE

(*Configuration structure*)

TYPE
	MpSafeGateBasicPConfigType : 	STRUCT  (*Safety gate configuration parameters*)
		Location : STRING[100]; (*Location of the safety gate (front, back, ...)*)
		InputSignals : MpSafeGateInputSignalsType; (*Input signals*)
		OutputSignals : MpSafeGateOutputSignalsType; (*Output signals*)
		Open : MpSafeGateConfigDirType; (*Configuration parameters for positive direction*)
		Close : MpSafeGateConfigDirType; (*Configuration parameters for negative direction*)
	END_STRUCT;
	MpSafeGateInputSignalsType : 	STRUCT  (*Input signals*)
		OpenEnd : STRING[255]; (*Datapoint containing open end input signal*)
		OpenSlow : STRING[255]; (*Datapoint containing open slowdown input signal*)
		CloseEnd : STRING[255]; (*Datapoint containing close end input signal*)
		CloseSlow : STRING[255]; (*Datapoint containing close slowdown input signal*)
	END_STRUCT;
	MpSafeGateOutputSignalsType : 	STRUCT  (*Output signals*)
		OpenValve : STRING[255]; (*Datapoint for open valve signal*)
		CloseValve : STRING[255]; (*Datapoint for close valve signal*)
		OpenFast : STRING[255]; (*Datapoint for open fast valve signal*)
		CloseFast : STRING[255]; (*Datapoint for close fast valve signal*)
	END_STRUCT;
	MpSafeGateConfigDirType : 	STRUCT  (*Safety gate configuration parameters for each direction*)
		MoveTime : REAL; (*This time is used for judage the end of movements without sensor*)
		DelayTime : REAL; (*This time is used for judage the end of movements without sensor*)
		Timeout : REAL; (*Confirmation time for the end of the movement[s]*)
		SlowdownSwitchType : MpSafeGateSwitchTypeEnum;
		EndSwitchType : MpSafeGateSwitchTypeEnum;
	END_STRUCT;
END_TYPE

(*Additional info structure*)

TYPE
	MpSafeGateInfoType : 	STRUCT  (*Safety gate info structure*)
		Diag : MpSafeGateDiagType;
	END_STRUCT;
	MpSafeGateDiagType : 	STRUCT  (*MpSG diagnosis information*)
		StatusID : MpSafeGateStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpSafeGateStatusIDType : 	STRUCT  (*MpS status ID information*)
		ID : MpSafeGateErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
