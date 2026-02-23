
FUNCTION_BLOCK CpLinReceive (*Reads a frame from LIN bus*)
	VAR_INPUT
		Enable : BOOL; (*The function block is active as long as Enable is set*)
		DeviceName : STRING[80]; (*Address of LIN interface, e.g. IF6.ST1.IF4*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*The function block must continue to be called*)
		Active : BOOL; (*The function block is ready to act*)
		Error : BOOL; (*An error occured during operation*)
		ErrorID : CpLinErrorEnum; (*Error code*)
		FrameReceived : BOOL; (*New LIN frame has been received*)
		Frame : CpLinReceiveFrameType; (*Received LIN frame*)
	END_VAR
	VAR
		Internal : CpLinReceiveInternalType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CpLinSend (*Sends a frame to LIN bus*)
	VAR_INPUT
		Enable : BOOL; (*The function block is active as long as this input is set*)
		DeviceName : STRING[80]; (*Address of LIN interface, e.g. IF6.ST1.IF4*)
		Frame : CpLinSendFrameType; (*LIN frame to be sent*)
		SendFrame : BOOL; (*Command to send a LIN frame. Level sensitive.*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*The function block must continue to be called*)
		Active : BOOL; (*The function block is ready to act*)
		Error : BOOL; (*An error occured during operation*)
		ErrorID : CpLinErrorEnum; (*Error code*)
	END_VAR
	VAR
		Internal : CpLinSendInternalType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CpLinScheduler (*Implements a LIN bus Scheduler*)
	VAR_INPUT
		Enable : BOOL; (*The function block is active as long as this input is set*)
		DeviceName : STRING[80]; (*Address of LIN interface, e.g. IF6.ST1.IF4*)
		Schedule : REFERENCE TO CpLinScheduleItemType; (*Reference to a schedule table*)
		ScheduleLength : USINT; (*Lenght of schedule table*)
		Run : CpLinRunEnum; (*Command to run scheduler*)
		LogLevel : CpLinLogLevelEnum; (*Defines the logging level*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*The function block must continue to be called*)
		Active : BOOL; (*The function block is ready to act*)
		Error : BOOL; (*Error occured during operation*)
		ErrorID : CpLinErrorEnum; (*Error code*)
		BusState : CpLinBusStateEnum; (*State of bus/Scheduler*)
		FrameReceived : BOOL; (*New LIN frame has been received*)
		Frame : CpLinReceiveFrameType; (*Received LIN frame*)
		FrameSent : BOOL; (*A Scheduler frame was sent*)
		SlotIndex : USINT; (*The slot currenlty being processed*)
		CycleCounter : UDINT; (*Number of finished bus cycles*)
	END_VAR
	VAR
		Internal : CpLinSchedulerInternalType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
