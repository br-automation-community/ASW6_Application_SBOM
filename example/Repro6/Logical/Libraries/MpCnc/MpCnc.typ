
TYPE
	MpCncDiagExtType : 	STRUCT 
		StatusID : MpCncStatusIDType; (*StatusID information*)
	END_STRUCT;
	MpCnc5AxisInfoType : 	STRUCT 
		CommunicationReady : BOOL; (*TRUE if MpCnc2Axis is ready to communicate*)
		ReadyToPowerOn : BOOL; (*TRUE if MpCnc2Axis is ready for operation*)
		WaitForContinue : BOOL; (*Command "Continue" is expected (currently not implemented)*)
		Program : McPrgInfoType; (*Program information*)
		Path : McPathInfoType; (*Path information*)
		JogStatus : McJogStatusEnum; (*Jog state*)
		PLCopenState : McGroupPLCopenStateEnum; (*PLCopen state for axis group*)
		Diag : MpCncDiagExtType; (*Information about internal error*)
	END_STRUCT;
	MpCnc4AxisInfoType : 	STRUCT 
		CommunicationReady : BOOL; (*TRUE if MpCnc2Axis is ready to communicate*)
		ReadyToPowerOn : BOOL; (*TRUE if MpCnc2Axis is ready for operation*)
		WaitForContinue : BOOL; (*Command "Continue" is expected (currently not implemented)*)
		Program : McPrgInfoType; (*Program information*)
		Path : McPathInfoType; (*Path information*)
		JogStatus : McJogStatusEnum; (*Jog state*)
		PLCopenState : McGroupPLCopenStateEnum; (*PLCopen state for axis group*)
		Diag : MpCncDiagExtType; (*Information about internal error*)
	END_STRUCT;
	MpCnc3AxisInfoType : 	STRUCT 
		CommunicationReady : BOOL; (*TRUE if MpCnc2Axis is ready to communicate*)
		ReadyToPowerOn : BOOL; (*TRUE if MpCnc2Axis is ready for operation*)
		WaitForContinue : BOOL; (*Command "Continue" is expected (currently not implemented)*)
		Program : McPrgInfoType; (*Program information*)
		Path : McPathInfoType; (*Path information*)
		JogStatus : McJogStatusEnum; (*Jog state*)
		PLCopenState : McGroupPLCopenStateEnum; (*PLCopen state for axis group*)
		Diag : MpCncDiagExtType; (*Information about internal error*)
	END_STRUCT;
	MpCnc2AxisInfoType : 	STRUCT 
		CommunicationReady : BOOL; (*TRUE if MpCnc2Axis is ready to communicate*)
		ReadyToPowerOn : BOOL; (*TRUE if MpCnc2Axis is ready for operation*)
		WaitForContinue : BOOL; (*Command "Continue" is expected (currently not implemented)*)
		Program : McPrgInfoType; (*Program information*)
		Path : McPathInfoType; (*Path information*)
		JogStatus : McJogStatusEnum; (*Jog state*)
		PLCopenState : McGroupPLCopenStateEnum; (*PLCopen state for axis group*)
		Diag : MpCncDiagExtType; (*Information about internal error*)
	END_STRUCT;
	MpCnc2AxisParType : 	STRUCT 
		ProgramName : STRING[260]; (*Name of the primary program that should be executed*)
		MoveProgramOptions : McPrgAdvParType; (*Additional MoveProgram options*)
		Jog : MpCnc2AxisJogType := (PathLimits:=(Velocity:=1000,Acceleration:=10000,Deceleration:=10000,Jerk:=0)); (*Jog parameter*)
		Block : STRING[260]; (*Single instruction*)
	END_STRUCT;
	MpCnc5AxisParType : 	STRUCT 
		ProgramName : STRING[260]; (*Name of the primary program that should be executed*)
		MoveProgramOptions : McPrgAdvParType; (*Additional MoveProgram options*)
		Jog : MpCnc5AxisJogType := (PathLimits:=(Velocity:=1000,Acceleration:=10000,Deceleration:=10000,Jerk:=0)); (*Jog parameter*)
		Block : STRING[260]; (*Single instruction*)
	END_STRUCT;
	MpCnc4AxisParType : 	STRUCT 
		ProgramName : STRING[260]; (*Name of the primary program that should be executed*)
		MoveProgramOptions : McPrgAdvParType; (*Additional MoveProgram options*)
		Jog : MpCnc4AxisJogType := (PathLimits:=(Velocity:=1000,Acceleration:=10000,Deceleration:=10000,Jerk:=0)); (*Jog parameter*)
		Block : STRING[260]; (*Single instruction*)
	END_STRUCT;
	MpCnc3AxisParType : 	STRUCT 
		ProgramName : STRING[260]; (*Name of the primary program that should be executed*)
		MoveProgramOptions : McPrgAdvParType; (*Additional MoveProgram options*)
		Jog : MpCnc3AxisJogType := (PathLimits:=(Velocity:=1000,Acceleration:=10000,Deceleration:=10000,Jerk:=0)); (*Jog parameter*)
		Block : STRING[260]; (*Single instruction*)
	END_STRUCT;
	MpCnc2AxisJogType : 	STRUCT 
		Velocity : ARRAY[0..1]OF REAL; (*Jog velocities [application units / s]*)
		PathLimits : McJogPathLimitsType; (*Path limits*)
		CoordSystem : UDINT; (*Coordinate system*)
	END_STRUCT;
	MpCnc3AxisJogType : 	STRUCT 
		Velocity : ARRAY[0..2]OF REAL; (*Jog velocities [application units / s]*)
		PathLimits : McJogPathLimitsType; (*Path limits*)
		CoordSystem : UDINT; (*Coordinate system*)
	END_STRUCT;
	MpCnc4AxisJogType : 	STRUCT 
		Velocity : ARRAY[0..3]OF REAL; (*Jog velocities [application units / s]*)
		PathLimits : McJogPathLimitsType; (*Path limits*)
		CoordSystem : UDINT; (*Coordinate system*)
	END_STRUCT;
	MpCnc5AxisJogType : 	STRUCT 
		Velocity : ARRAY[0..4]OF REAL; (*Jog velocities [application units / s]*)
		PathLimits : McJogPathLimitsType; (*Path limits*)
		CoordSystem : UDINT; (*Coordinate system*)
	END_STRUCT;
	MpCncStatusIDType : 	STRUCT 
		ID : MpCncErrorEnum; (*Error numbers of library MpCnc*)
		Severity : MpComSeveritiesEnum; (*Error severity*)
	END_STRUCT;
	MpCncFlexParType : 	STRUCT
		ProgramName : STRING[260]; (*Name of the primary program that should be executed*)
		MoveProgramOptions : McPrgAdvParType; (*Additional MoveProgram options*)
		Jog : MpCncFlexJogType; (*Jog parameter*)
		Block : STRING[260]; (*Single instruction*)
	END_STRUCT;
	MpCncFlexJogType : 	STRUCT 
		Velocity : ARRAY[0..14]OF REAL; (*Jog velocities [application units / s]*)
		PathLimits : McJogPathLimitsType; (*Path limits*)
		CoordSystem : UDINT; (*Coordinate system*)
	END_STRUCT;
	MpCncFlexInfoType : 	STRUCT 
		CommunicationReady : BOOL; (*TRUE if MpCnc2Axis is ready to communicate*)
		ReadyToPowerOn : BOOL; (*TRUE if MpCnc2Axis is ready for operation*)
		WaitForContinue : BOOL; (*Command "Continue" is expected (currently not implemented)*)
		Program : McPrgInfoType; (*Program information*)
		Path : McPathInfoType; (*Path information*)
		JogStatus : McJogStatusEnum; (*Jog state*)
		PLCopenState : McGroupPLCopenStateEnum; (*PLCopen state for axis group*)
		Diag : MpCncDiagExtType; (*Information about internal error*)
	END_STRUCT;
END_TYPE
