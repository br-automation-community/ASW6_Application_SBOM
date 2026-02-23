{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnDeviceRecord (*Handles record data on a PROFINET device*)
	VAR_INPUT
		Enable				: BOOL;							(*The function block is active as long as this input is set*)
		Device				: STRING[127];					(*Name of the PROFINET device e.g. 'SS1'*)
		Api					: UDINT;						(*PROFINET Application Process Indentifier - not supported til now, set to arPNDEVICE_DEFAULT_API*)
		Slot				: ArPnDeviceSlotType;			(*PROFINET Slot number (0-16#7FFF)*)
		Subslot				: ArPnDeviceSubslotType;		(*PROFINET Subslot number (0-16#7FFF)*)
		Index				: ArPnDeviceIndexType;			(*PROFINET Vendor specific index (0-16#7FFF)*)
		AccessRights		: ArPnDeviceRecordAccessEnum;	(*Access rights for the record (e.g. read/writeable by a controller)*)
		Data				: REFERENCE TO USINT;			(*Reference of data to be set (array of USINT)*)
		DataLength			: UDINT;						(*Length of data to be set*)
		Get					: BOOL;							(*Get data of record*)
		Set					: BOOL;							(*Set data of record*)
	END_VAR
	VAR_OUTPUT
		Busy 				: BOOL;							(*The function block must continue to be called.*)
		Active				: BOOL;							(*The function block is active.*)
		Error				: BOOL;							(*Error occurred during operation.*)
		StatusID			: DINT;  						(*Status information.*)
		NewDataAvailable	: BOOL;							(*New data available*)
		GetDone				: BOOL;							(*Get record data finished*)
		SetDone				: BOOL;							(*Set record data finished*)
	END_VAR
	VAR
		Internal			: ARRAY[0..31] OF UDINT;		(*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK
