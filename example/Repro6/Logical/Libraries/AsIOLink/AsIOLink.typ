
TYPE
	ioLinkState_t : 
		(
		READY,
		WORK,
		DONE
		);
	ioLinkInternalAccess_t : 	STRUCT  (*internal data*)
		state : ioLinkState_t;
		idCount : UDINT;
		drvInstHandle : UDINT;
		error : UINT;
		done : UDINT;
		serviceResponse : UDINT;
		datatype : USINT;
		buffer : UDINT;
		bufferSize : UDINT;
		bufferFeatures : ARRAY[0..15]OF USINT;
	END_STRUCT;
	ioLinkInternalEvent_t : 	STRUCT  (*internal data*)
		state : ioLinkState_t;
		drvInstHandle : UDINT;
		eventQualifier : USINT;
		eventData : UINT;
		eventLost : BOOL;
		eventPending : BOOL;
		error : UINT;
		bufferFeatures : ARRAY[0..7]OF USINT;
	END_STRUCT;
	ioLinkInternalSetMode_t : 	STRUCT  (*internal data*)
		state : ioLinkState_t;
		error : UINT;
		deviceName : STRING[128];
		channelName : STRING[32];
		accWrite : AsIOAccWrite;
		bufferFeatures : ARRAY[0..7]OF USINT;
	END_STRUCT;
	ioLinkInternalParDownload_t : 	STRUCT  (*internal data*)
		state : ioLinkState_t;
		drvInstHandle : UDINT;
		error : UINT;
		bufferFeatures : ARRAY[0..7]OF USINT;
	END_STRUCT;
END_TYPE
