TYPE
	ArPnDeviceRecordAccessEnum : 
		(
		arPNDEVICE_RECORD_ACCESS_RW := 0,	(*Record can be read and written by a PROFINET IO controller*)
		arPNDEVICE_RECORD_ACCESS_RO := 1,	(*Record can only be read by a PROFINET IO controller*)
		arPNDEVICE_RECORD_ACCESS_WO := 2	(*Record can only be written by a PROFINET IO controller*)
		);
	ArPnDeviceSlotType : UINT(0..16#7FFF);
	ArPnDeviceSubslotType : UINT(0..16#7FFF);
	ArPnDeviceIndexType : UINT(0..16#7FFF);
END_TYPE
