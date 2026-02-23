TYPE
   McStpAxHomingParType : STRUCT
        HomingMode : McHomingModeEnum; (*The following homing modes are supported:*)
        Position : LREAL; (*Absolute position or homing offset when homing signal [Measurement units] occurs*)
        StartVelocity : REAL; (*Velocity for reference switch search [Measurement units/s]*)
        HomingVelocity : REAL; (*Velocity (after reaching reference switch) [Measurement units/s]*)
        Acceleration : REAL; (*Maximum acceleration [Measurement units/s]*)
        SwitchEdge : McDirectionEnum; (*Edge of reference switch*)
        StartDirection : McDirectionEnum; (*Start direction for searching the reference edge*)
        HomingDirection : McDirectionEnum; (*Direction for homing (after reaching reference switch) *)
        ReferencePulse : McSwitchEnum; (*The encoder's reference pulse is used for homing*)
        KeepDirection : McSwitchEnum; (*The direction of movement is or is not permitted to be changed during the homing procedure*)
		ReferencePulseBlockingDistance : REAL; (*Distance for blocking activation of "triggering reference pulse" [Measurement units]*)
		RestorePositionVariableAddress : UDINT; (*Address of a remanent variable of type McStpAxRestorePosType that is needed for "HomingMode" mcHOMING_RESTORE_POSITION*)
		BlockDetectionPositionError : REAL; (*Lag error for block detection [Measurement units]*)
		PositionErrorStopLimit : REAL; (*Lag error for canceling homing procedure [Measurement units]*)
		ClearPositionError : McSwitchEnum; (*Clear the lag error during the homing procedure*)
    END_STRUCT;

    McStpAxRestorePosType: STRUCT
		Data : ARRAY[0..17] OF DINT; (*Data for restoring the position*)
	END_STRUCT;

	McStpAxMotorCurrentEnum :
	(
		mcSTPAX_CURRENT_AUTOMATIC := 0,	(*Automatic motor current selection is used*)
		mcSTPAX_CURRENT_STANDSTILL,		(*Use configured motor current "Standstill"*)
		mcSTPAX_CURRENT_CONST_SPEED,	(*Use configured motor current "Constant speed"*)
		mcSTPAX_CURRENT_SPEED_CHANGE	(*Use configured motor current "Speed change"*)
	);

	McStpAxUsedMotorCurrentEnum :
	(
		mcSTPAX_USED_CURRENT_OFF := 0,		(*No motor current active*)
		mcSTPAX_USED_CURRENT_STANDSTILL,	(*Configured motor current "Standstill" is used*)
		mcSTPAX_USED_CURRENT_CONST_SPEED,	(*Configured motor current "Constant speed" is used*)
		mcSTPAX_USED_CURRENT_SPEED_CHG		(*Configured motor current "Speed change" is used*)
	);

END_TYPE