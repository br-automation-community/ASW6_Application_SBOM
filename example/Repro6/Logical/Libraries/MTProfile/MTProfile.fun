
{REDUND_ERROR} FUNCTION_BLOCK MTProfilePositionGenerator (*Position generator.*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables/Disables the function block.*)
		Parameter : {REDUND_UNREPLICABLE} MTProfilePositionParameterType; (*Motion parameters.*)
		Update : {REDUND_UNREPLICABLE} BOOL; (*Updates the parameters listed above on a rising edge.*)
		EndPosition : {REDUND_UNREPLICABLE} REAL; (*End position of the trajectory. Unit: [Units].*)
		Start : {REDUND_UNREPLICABLE} BOOL; (*A rising edge on Start starts a new trajectory that begins at the present state and ends at EndPosition.*)
		Stop : {REDUND_UNREPLICABLE} BOOL; (*A rising edge on Stop brakes the movement with maximum deceleration.*)
		Abort : {REDUND_UNREPLICABLE} BOOL; (*A rising edge on Abort immediately aborts the trajectory planning.*)
		HomePosition : {REDUND_UNREPLICABLE} REAL; (*Starting position. Unit: [Units].*)
		SetHomePosition : {REDUND_UNREPLICABLE} BOOL; (*Sets the rising edge to HomePosition.*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active.*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error.*)
		StatusID : DINT; (*Status information.*)
		UpdateDone : {REDUND_UNREPLICABLE} BOOL; (*Update is done.*)
		Position : {REDUND_UNREPLICABLE} REAL; (*Position setpoint. Unit: [Units].*)
		Velocity : {REDUND_UNREPLICABLE} REAL; (*Velocity setpoint. Unit: [Units/s]. Value range: -VelocityNegDirection <= Velocity <= VelocityPosDirection.*)
		Acceleration : {REDUND_UNREPLICABLE} REAL; (*Acceleration setpoint. Unit: [Units/s²]. Value range: -max(DecelerationPosDirection, AccelerationNegDirection) <= Acceleration <= max(AccelerationPosDirection, DecelerationNegDirection).*)
		MotionState : {REDUND_UNREPLICABLE} MTProfilePositionStateEnum; (*Current direction of movement. Value range: {-3,-2,-1: Moving in the "negative" direction, 0: Standstill, 1,2,3: Moving in the "positive" direction}.*)
		Done : {REDUND_UNREPLICABLE} BOOL; (*Done indicates that the end position has been reached or the movement is complete.*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MTProfilePosGenInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MTProfileFunctionGenerator (*Function generator.*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables/Disables the function block.*)
		Nodes : REFERENCE TO MTProfileFunctionNodeType; (*Pointer to the array of interpolation points.*)
		NumberOfNodes : {REDUND_UNREPLICABLE} UINT; (*Number of interpolation points in the array. Valid value range: NumberOfNodes >= 2.*)
		Mode : {REDUND_UNREPLICABLE} MTProfileFunctionModeEnum; (*Interpolation mode. Valid value range: Mode = mtPROFILE_ZERO_ORDER_HOLD or mtPROFILE_FIRST_ORDER_HOLD.*)
		Update : {REDUND_UNREPLICABLE} BOOL; (*Updates the parameters listed above on a rising edge.*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active.*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error.*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Status information.*)
		UpdateDone : {REDUND_UNREPLICABLE} BOOL; (*Update is done.*)
		Out : {REDUND_UNREPLICABLE} REAL; (*Periodic output fp(t) of function f(t).*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MTProfileFcnGenInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
