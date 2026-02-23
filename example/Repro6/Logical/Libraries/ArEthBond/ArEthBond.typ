
 TYPE
	ArEthBondStateType : STRUCT											(*status data of a bond*)
		ActiveDevice 						: STRING[128];				(*name of the currently active device*)
		PrimaryLinkStatus 					: UDINT;					(*link status of the primary device*)
		SecondaryLinkStatus 				: UDINT;					(*link status of the secondary device*)
		NumberArpReachedTargets 			: UDINT;					(*number of currently reached ARP targets*)
	END_STRUCT;
	
	ArEthBondStatisticsType : STRUCT									(*statistical data of a bond*)
		SwitchCount 						: UDINT; 					(*number of occurred switches*)					
		PrimaryLinkErrorCount 				: UDINT;					(*number of link errors of the primary device*)
		SecondaryLinkErrorCount 			: UDINT;					(*number of link errors of the secondary device*)
		PrimaryArpErrorCount 				: UDINT;					(*number of ARP errors of the primary device*)
		SecondaryArpErrorCount 				: UDINT;					(*number of ARP errors of the secondary device*)
		LastErrorUtcTimeStampSeconds 		: UDINT;					(*seconds part of the last error time stamp*)
		LastErrorUtcTimeStampNanoSeconds 	: UDINT;					(*nano seconds part of the last error time stamp*)
	END_STRUCT;
	
	ArEthBondConfigurationType : STRUCT
		ArpMonitorPeriodMs 					: UDINT; 					(*period of the ARP monitoring in ms*)
		NumberArpConfiguredTargets 			: UDINT; 					(*number of configured ARP targets*)
	END_STRUCT;

	ArEthBondInternalType : STRUCT
		FBStateCtx							: ArFBStateInternalType; 	(*internal status*)
	END_STRUCT;
END_TYPE
