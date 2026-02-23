
FUNCTION CpIsobusAllocateBuffers : DINT (*This function allocates buffers needed by the stack.*)
	VAR_INPUT
		ControlFunction : USINT; (*Control Function used. The allowed range is 0 (E_LOCAL_CF_1) to 3 (E_LOCAL_CF_4).*)
		VtCommandBufferSize : UDINT; (*VT command buffer size in bytes.*)
		AuxFunctions : USINT; (*Maximum number of auxiliary functions used.*)
		AuxInputs : USINT; (*Maximum number of auxiliary inputs used.*)
		PdValueEntries : UINT; (*Maximum number of entries in process data (PD) table.*)
		MeasurementEntries : UINT; (*Maximum number of entries in measurement table.*)
		ActiveDtcsRecords : UINT; (*Maximum number of active Diagnostic Trouble Code (DTC) records.*)
		PreviouslyActiveDtcsRecords : UINT; (*Maximum number of previously active DTC records.*)
	END_VAR
END_FUNCTION

FUNCTION CpIsobusExit : DINT (*This function starts the termination of the stack.*)
END_FUNCTION

FUNCTION CpIsobusExitDone : DINT (*This function completes the termination of the stack.*)
END_FUNCTION

FUNCTION CpIsobusInit : DINT (*This function starts the initialization of the stack.*)
	VAR_INPUT
		DeviceName : STRING[80]; (*Address of the CAN interface, e.g. "IF7".*)
		SafetyNotificationCallback : UDINT; (*Address of Safety Notification callback function.*)
	END_VAR
END_FUNCTION

FUNCTION CpIsobusInitDone : DINT (*This function completes the initialization of the stack.*)
END_FUNCTION

FUNCTION CpIsobusLog : DINT (*This function writes an entry to the Logger.*)
	VAR_INPUT
		EventID : CpIsobusErrorEnum; (*Status code to be written to the logger.*)
		Message : STRING[80]; (*Additional text.*)
	END_VAR
END_FUNCTION

FUNCTION CpIsobusRun : DINT (*This function implements the cyclic functionality of the stack.*)
END_FUNCTION

FUNCTION CpIsobusSetLogLevel : DINT (*This function sets the logging level.*)
	VAR_INPUT
		LogLevel : CpIsobusLogLevelEnum; (*Required logging level.*)
	END_VAR
END_FUNCTION
