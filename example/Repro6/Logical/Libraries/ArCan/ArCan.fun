
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanSend (*Sends the provided CAN frame.*)
	VAR_INPUT
		Enable			: BOOL;					(*The function block is active as long as this input is set.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		Frame			: ArCanFrameType;		(*CAN frame.*)
		SendFrame		: BOOL;					(*When this input is TRUE the frame will be queued for sending and NumberOfFreeBuffers will be reduced by one until the frame is sent.*)
	END_VAR
	
	VAR_OUTPUT
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Active			: BOOL;					(*The function block is active.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		NumberOfFreeBuffers	: UDINT;			(*Number of free buffers for this device.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanSendAcknowledged (*Sends the provided CAN frame - signals Done when the frame has been sent.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		Frame			: ArCanFrameType;		(*CAN frame.*)
		Timeout			: UDINT;				(*Timeout for waiting for acknowledgement in ms.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanReceive (*Receives data when Active=TRUE and indicates new data with NewDataValid=TRUE.*)
	VAR_INPUT
		Enable			: BOOL;					(*The function block is active as long as this input is set.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		ID				: UDINT;				(*Receive frames with matching IDs.*)
		IDMask		 	: UDINT;				(*Use arCAN_RECEIVE_ALL, arCAN_RECEIVE_SINGLE_ID, or custom mask. All CAN IDs with ReceivedId & IDMask == ID & IDMask will be received.*)
		Format			: UDINT;				(*arCAN_11BIT and/or arCAN_29BIT.*)
		QueueSize		: UDINT;				(*Size of internal receive queue. When the queue is full, old frames are overwritten and the output NumberOfLostFrames will count up.*)
	END_VAR
	
	VAR_OUTPUT
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Active			: BOOL;					(*The function block is active.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		ReceivedFrame	: ArCanFrameType;		(*Received CAN frame.*)
		Timestamp		: ArCanTimestampType;	(*Time when the CAN frame was received.*)
		NewDataValid 	: BOOL;					(*Is TRUE if new data was received.*)
		NumberOfLostFrames	: UDINT;			(*Number of lost frames since the FUB was enabled.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanGetRtrData (*Sends an RTR frame and waits for the received RTR data.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		ID				: UDINT;				(*CAN ID to be requested.*)
		Format			: UDINT;				(*arCAN_11BIT or arCAN_29BIT.*)
		ResponseDataLength		: UDINT;		(*Length of the data to be requested, set to 0 to let the responder decide.*)
		Timeout			: UDINT;				(*Timeout for waiting for the response in ms.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		RtrFrame		: ArCanFrameType;		(*Received CAN frame.*)
		Timestamp		: ArCanTimestampType;	(*Time when the CAN frame was received.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanRtr (*Configures a data frame to be sent in response to an RTR frame. Data stays available until Enable == FALSE.*)
	VAR_INPUT
		Enable			: BOOL;					(*The function block is active as long as this input is set.*)		
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		ID				: UDINT;				(*RTR frames to the provided ID and Format will be answered with the provided Data.*)
		Format			: UDINT;				(*arCAN_11BIT or arCAN_29BIT - RTR frames to the provided ID and Format will be answered with the provided Data.*)
		DataLength		: UDINT;				(*Length of Data.*)
		Data			: ARRAY[0..63] OF BYTE; (*Data to be sent in response to an RTR frame with the specified ID and Format.*)
		SetData			: BOOL;					(*Triggers the configuration of the provided Data as response data, resets ResponseSent.*)
	END_VAR
	
	VAR_OUTPUT
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Active			: BOOL;					(*The function block is active.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		ResponseSent	: BOOL;					(*Is TRUE if provided data was sent as a response to an RTR frame at least once since the last call with SetData == TRUE.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanSetBaudrate (*Set baudrate of a CAN device in bits/s.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		Baudrate		: UDINT;				(*Baudrate in bits/s.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCanSetBitTimingRegisters (*Set bit timing registers of a CAN device.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		DeviceName		: STRING[127];			(*Name of the CAN device e.g. SS1.IF1.*)
		Register0		: BYTE;					(*Bit timing register 0.*)	
		Register1		: BYTE;					(*Bit timing register 1.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK
