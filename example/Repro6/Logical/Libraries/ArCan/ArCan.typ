TYPE
	ArCanFrameType : STRUCT
		Data			: ARRAY[0..63] OF BYTE; (*Data payload of the frame*)
		DataLength		: UDINT; (*Used length of Data in bytes*)
		ID				: UDINT; (*ID of the CAN frame*)
		Format			: UDINT; (*arCAN_11BIT or arCAN_29BIT*)
	END_STRUCT;

	ArCanTimestampType : STRUCT
		UTCSeconds		: UDINT; (*UTC time in seconds when the frame was received*)
		UTCNanoSeconds	: UDINT; (*UTC time in nano seconds when the frame was received*)
		LocalTime		: DINT; (*Local time provided by the CAN hardware - this timestamp does not jump (e.g. when setting the system time)*)
	END_STRUCT;
END_TYPE
