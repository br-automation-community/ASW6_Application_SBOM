
TYPE
	MpJ193SpecificRequestInfoType : 	STRUCT  (*Status information*)
		Diag : MpJ1939DiagType; (*Diagnostic structure for the function block*)
		ReceivedBytes : UINT; (*Received bytes*)
	END_STRUCT;
	MpJ193TransmitInfoType : 	STRUCT  (*Status information*)
		Diag : MpJ1939DiagType; (*Diagnostic structure for the function block*)
	END_STRUCT;
	MpJ1939ACCRSEnum : 
		(
		mpJ1939_ACCRS_NOT_AVAILABLE := 3,
		mpJ1939_ACCRS_ERROR_CONDITION := 2,
		mpJ1939_ACCRS_ON := 1,
		mpJ1939_ACCRS_OFF := 0
		);
	MpJ1939ACHPFSEnum : 
		(
		mpJ1939_ACHPFS_NOT_AVAILABLE := 3,
		mpJ1939_ACHPFS_ERROR := 2,
		mpJ1939_ACHPFS_PRESSURE_HIGH := 1,
		mpJ1939_ACHPFS_PRESSURE_NORMAL := 0
		);
	MpJ1939AEBSRSEnum : 
		(
		mpJ1939_AEBSRS_NOT_AVAILABLE := 3,
		mpJ1939_AEBSRS_ERROR := 2,
		mpJ1939_AEBSRS_ON := 1,
		mpJ1939_AEBSRS_OFF := 0
		);
	MpJ1939AEPTHREnum : 
		(
		mpJ1939_AEPTHR_0875 := 7,
		mpJ1939_AEPTHR_0125 := 1,
		mpJ1939_AEPTHR_0000 := 0
		);
	MpJ1939AFT1DPFCNMFAREnum : 
		(
		mpJ1939_AFT1DPFCNMFAR_NOT_AVAILA := 3,
		mpJ1939_AFT1DPFCNMFAR_RESERVED := 2,
		mpJ1939_AFT1DPFCNMFAR_INHIBIT := 1,
		mpJ1939_AFT1DPFCNMFAR_NOT_INHIBI := 0
		);
	MpJ1939AFT1EDPEnum : 
		(
		mpJ1939_AFT1EDP_NOT_AVAILABLE := 3,
		mpJ1939_AFT1EDP_ERROR := 2,
		mpJ1939_AFT1EDP_EXCEEDED := 1,
		mpJ1939_AFT1EDP_NOT_EXCEED := 0
		);
	MpJ1939AFT1IDPEnum : 
		(
		mpJ1939_AFT1IDP_NOT_AVAILABLE := 3,
		mpJ1939_AFT1IDP_ERROR := 2,
		mpJ1939_AFT1IDP_EXCEEDED := 1,
		mpJ1939_AFT1IDP_NOT_EXCEED := 0
		);
	MpJ1939AFT2EDPEnum : 
		(
		mpJ1939_AFT2EDP_NOT_AVAILABLE := 3,
		mpJ1939_AFT2EDP_ERROR := 2,
		mpJ1939_AFT2EDP_EXCEEDED := 1,
		mpJ1939_AFT2EDP_NOT_EXCEED := 0
		);
	MpJ1939AFT2IDPEnum : 
		(
		mpJ1939_AFT2IDP_NOT_AVAILABLE := 3,
		mpJ1939_AFT2IDP_ERROR := 2,
		mpJ1939_AFT2IDP_EXCEEDED := 1,
		mpJ1939_AFT2IDP_NOT_EXCEED := 0
		);
	MpJ1939AFTDPFARSEnum : 
		(
		mpJ1939_AFTDPFARS_NOT_AVAILABLE := 3,
		mpJ1939_AFTDPFARS_NEEDED := 2,
		mpJ1939_AFTDPFARS_ACTIVE := 1,
		mpJ1939_AFTDPFARS_NOT_ACTIVE := 0
		);
	MpJ1939AFTDPFPRSEnum : 
		(
		mpJ1939_AFTDPFPRS_NOT_AVAILABLE := 3,
		mpJ1939_AFTDPFPRS_RESERVED := 2,
		mpJ1939_AFTDPFPRS_ACTIVE := 1,
		mpJ1939_AFTDPFPRS_NOT_ACTIVE := 0
		);
	MpJ1939AFTDPFSEnum : 
		(
		mpJ1939_AFTDPFS_NOT_AVAILABLE := 7,
		mpJ1939_AFTDPFS_RESERVED6 := 6,
		mpJ1939_AFTDPFS_RESERVED5 := 5,
		mpJ1939_AFTDPFS_RESERVED4 := 4,
		mpJ1939_AFTDPFS_HIGHEST_LEVEL := 3,
		mpJ1939_AFTDPFS_MODERATE_LEVEL := 2,
		mpJ1939_AFTDPFS_LOWEST_LEVEL := 1,
		mpJ1939_AFTDPFS_NOT_NEEDED := 0
		);
	MpJ1939AFTRFSEnum : 
		(
		mpJ1939_AFTRFS_NOT_AVAILABLE := 3,
		mpJ1939_AFTRFS_ERROR := 2,
		mpJ1939_AFTRFS_ACTIVE := 1,
		mpJ1939_AFTRFS_NOT_ACTIVE := 0
		);
	MpJ1939AFTRISEnum : 
		(
		mpJ1939_AFTRIS_NOT_AVAILABLE := 3,
		mpJ1939_AFTRIS_ERROR := 2,
		mpJ1939_AFTRIS_ACTIVE := 1,
		mpJ1939_AFTRIS_NOT_ACTIVE := 0
		);
	MpJ1939AGSESEnum : 
		(
		mpJ1939_AGSES_NOT_AVAILABLE := 3,
		mpJ1939_AGSES_ERROR := 2,
		mpJ1939_AGSES_AUTO_ENABLED := 1,
		mpJ1939_AGSES_AUTO_DISABLED := 0
		);
	MpJ1939AHCPREnum : 
		(
		mpJ1939_AHCPR_DONT_CARE := 3,
		mpJ1939_AHCPR_RESERVED := 2,
		mpJ1939_AHCPR_ACTIVATE := 1,
		mpJ1939_AHCPR_DEACTIVATE := 0
		);
	MpJ1939AHMREnum : 
		(
		mpJ1939_AHMR_DONT_CARE := 15,
		mpJ1939_AHMR_RESERVED := 14,
		mpJ1939_AHMR_HEATER_PUMP_UPKEEP := 4,
		mpJ1939_AHMR_NORMAL_MODE := 3,
		mpJ1939_AHMR_ECONOMY_MODE := 2,
		mpJ1939_AHMR_OFF_HAZARDOUS := 1,
		mpJ1939_AHMR_DEACTIVATE_AUX := 0
		);
	MpJ1939AMBType : 	STRUCT 
		RoadSurfaceTemp : REAL;
		EngAirIntakeTemp : INT;
		AmbientAirTemp : REAL;
		CabInteriorTemp : REAL;
		BarometricPress : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AP1LISEnum : 
		(
		mpJ1939_AP1LIS_NOT_AVAILABLE := 3,
		mpJ1939_AP1LIS_ERROR := 2,
		mpJ1939_AP1LIS_IN_LOW_IDLE := 1,
		mpJ1939_AP1LIS_NOT_IN_LOW_IDLE := 0
		);
	MpJ1939AP2LISEnum : 
		(
		mpJ1939_AP2LIS_NOT_AVAILABLE := 3,
		mpJ1939_AP2LIS_ERROR := 2,
		mpJ1939_AP2LIS_IN_LOW_IDLE := 1,
		mpJ1939_AP2LIS_NOT_IN_LOW_IDLE := 0
		);
	MpJ1939APKSEnum : 
		(
		mpJ1939_APKS_NOT_AVAILABLE := 3,
		mpJ1939_APKS_ERROR := 2,
		mpJ1939_APKS_KICKDOWN_ACTIVE := 1,
		mpJ1939_APKS_KICKDOWN_PASSIVE := 0
		);
	MpJ1939AT1IG1Type : 	STRUCT 
		NOxSnsr1SelfDiagStatus : MpJ1939NOS1SDSEnum;
		O2Snsr1PreliminaryFMI : SINT;
		SCRInNOxSnsr1PreliminaryFMI : SINT;
		Snsr1HtrCtrl : MpJ1939S1HCEnum;
		Snsr1HtrPreliminaryFMI : SINT;
		WRPercentO21ReadingStable : MpJ1939WRPO21RSEnum;
		SCRInNOx1ReadingStable : MpJ1939SCRINO1RSEnum;
		Snsr1AtTemp : MpJ1939S1ATEnum;
		Snsr1PwrInRange : MpJ1939S1PIREnum;
		PercentO21 : REAL;
		SCRInNOx1 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1IG2Type : 	STRUCT 
		DPFInTempPreliminaryFMI : INT;
		ExhTemp1PreliminaryFMI : INT;
		DPFInTemp : REAL;
		ExhTemp1 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1IMGType : 	STRUCT 
		DPFIntmdTempPreliminaryFMI : SINT;
		DPFDiffPressPreliminaryFMI : SINT;
		ExhTemp2PreliminaryFMI : SINT;
		DPFDiffPress : REAL;
		DPFIntmdTemp : REAL;
		ExhTemp2 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1OG1Type : 	STRUCT 
		O2Snsr1PreliminaryFMI : SINT;
		NOxSnsr1SelfDiagStatus : MpJ1939NOS1SDSEnum;
		NOxSnsr1PreliminaryFMI : SINT;
		Snsr1HtrCtrl : MpJ1939S1HCEnum;
		Snsr1HtrPreliminaryFMI : SINT;
		WRPercentO21ReadingStable : MpJ1939WRPO21RSEnum;
		NOx1ReadingStable : MpJ1939NO1RSEnum;
		Snsr1AtTemp : MpJ1939S1ATEnum;
		Snsr1PwrInRange : MpJ1939S1PIREnum;
		PercentO21 : REAL;
		NOx1 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1OG2Type : 	STRUCT 
		DPFOutExhTempPreliminaryFMI : SINT;
		ExhTemp3PreliminaryFMI : SINT;
		DPFOutTemp : REAL;
		ExhTemp3 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1S1Type : 	STRUCT 
		DPFSootLoadRegenThreshold : REAL;
		DPFTimeSinceLastActiveRegen : UDINT;
		DPFAshLoadPercent : USINT;
		DPFSootLoadPercent : USINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1T1I1Type : 	STRUCT 
		HtrPreliminaryFMI : SINT;
		Htr : REAL;
		SCROpIndSev : MpJ1939SCROISEnum;
		TempPreliminaryFMI : SINT;
		DEFTankLowLvlInd : MpJ1939DEFTLLIEnum;
		LvlVolPreliminaryFMI : SINT;
		Lvl : REAL;
		Temp1 : INT;
		Volume : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AT1TIType : 	STRUCT 
		DPFTripNumOfActiveRegenManReq : INT;
		DPFTripNumOfActiveRegenInhReq : INT;
		DPFTripNumOfPassiveRegens : INT;
		DPFTripPassiveRegenTime : INT;
		DPFTripNumOfActiveRegens : INT;
		DPFTripDisdTime : INT;
		DPFTripActiveRegenTime : INT;
		DPFTripFuelUsed : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939AWLSEnum : 
		(
		mpJ1939_AWLS_NOT_AVAILABLE := 3,
		mpJ1939_AWLS_RESERVED := 2,
		mpJ1939_AWLS_LAMP_ON := 1,
		mpJ1939_AWLS_LAMP_OFF := 0
		);
	MpJ1939BMSHREnum : 
		(
		mpJ1939_BMSHR_DONT_CARE := 3,
		mpJ1939_BMSHR_UNDEFINED := 2,
		mpJ1939_BMSHR_HOLD_BATTERY := 1,
		mpJ1939_BMSHR_RELEASE_BATTERY := 0
		);
	MpJ1939BSEnum : 
		(
		mpJ1939_BS_NOT_AVAILABLE := 3,
		mpJ1939_BS_ERROR := 2,
		mpJ1939_BS_DEPRESSED := 1,
		mpJ1939_BS_RELEASED := 0
		);
	MpJ1939CCAEnum : 
		(
		mpJ1939_CCA_NOT_AVAILABLE := 3,
		mpJ1939_CCA_ERROR := 2,
		mpJ1939_CCA_ON := 1,
		mpJ1939_CCA_OFF := 0
		);
	MpJ1939CCASEnum : 
		(
		mpJ1939_CCAS_NOT_AVAILABLE := 3,
		mpJ1939_CCAS_ERROR := 2,
		mpJ1939_CCAS_IN_POS_ACCEL := 1,
		mpJ1939_CCAS_NOT_IN_POS_ACCEL := 0
		);
	MpJ1939CCCSEnum : 
		(
		mpJ1939_CCCS_NOT_AVAILABLE := 3,
		mpJ1939_CCCS_ERROR := 2,
		mpJ1939_CCCS_IN_POS_COAST := 1,
		mpJ1939_CCCS_NOT_IN_POS_COAST := 0
		);
	MpJ1939CCDCEnum : 
		(
		mpJ1939_CCDC_DONT_CARE := 3,
		mpJ1939_CCDC_RESERVED := 2,
		mpJ1939_CCDC_NOT_ALLOWED := 1,
		mpJ1939_CCDC_IS_ALLOWED := 0
		);
	MpJ1939CCESEnum : 
		(
		mpJ1939_CCES_NOT_AVAILABLE := 3,
		mpJ1939_CCES_ERROR := 2,
		mpJ1939_CCES_ENABLED := 1,
		mpJ1939_CCES_DISABLED := 0
		);
	MpJ1939CCPCEnum : 
		(
		mpJ1939_CCPC_DONT_CARE := 3,
		mpJ1939_CCPC_RESERVED := 2,
		mpJ1939_CCPC_NOT_ALLOWED := 1,
		mpJ1939_CCPC_ALLOWED := 0
		);
	MpJ1939CCPSEnum : 
		(
		mpJ1939_CCPS_TAKE_NO_ACTION := 3,
		mpJ1939_CCPS_ERROR_INDICATOR := 2,
		mpJ1939_CCPS_ON := 1,
		mpJ1939_CCPS_OFF := 0
		);
	MpJ1939CCRCEnum : 
		(
		mpJ1939_CCRC_DONT_CARE := 3,
		mpJ1939_CCRC_RESERVED := 2,
		mpJ1939_CCRC_REQUESTED := 1,
		mpJ1939_CCRC_NOT_REQUESTED := 0
		);
	MpJ1939CCRSEnum : 
		(
		mpJ1939_CCRS_NOT_AVAILABLE := 3,
		mpJ1939_CCRS_ERROR := 2,
		mpJ1939_CCRS_IN_POS_RESUME := 1,
		mpJ1939_CCRS_NOT_IN_POS_RESUME := 0
		);
	MpJ1939CCSCSEnum : 
		(
		mpJ1939_CCSCS_NOT_SUPPORTED := 7,
		mpJ1939_CCSCS_RECEIVED_RESUME_CM := 4,
		mpJ1939_CCSCS_REACTIVATED_RESUME := 3,
		mpJ1939_CCSCS_PAUSE_CMD := 2,
		mpJ1939_CCSCS_DISABLED_CMD := 1,
		mpJ1939_CCSCS_NO_CMD := 0
		);
	MpJ1939CCSEnum : 
		(
		mpJ1939_CCS_NOT_AVAILABLE := 7,
		mpJ1939_CCS_ACCELERATOR_OVERRIDE := 6,
		mpJ1939_CCS_SET := 5,
		mpJ1939_CCS_RESUME := 4,
		mpJ1939_CCS_DECELERATE := 3,
		mpJ1939_CCS_ACCELERATE := 2,
		mpJ1939_CCS_HOLD := 1,
		mpJ1939_CCS_OFF := 0
		);
	MpJ1939CCSSEnum : 
		(
		mpJ1939_CCSS_NOT_AVAILABLE := 3,
		mpJ1939_CCSS_ERROR := 2,
		mpJ1939_CCSS_IN_POS_SET := 1,
		mpJ1939_CCSS_NOT_IN_POS_SET := 0
		);
	MpJ1939CCVS1Type : 	STRUCT 
		EngShutdownOverrideSwitch : MpJ1939ESOSEnum;
		EngTestModeSwitch : MpJ1939ETMSEnum;
		EngIdleDecrementSwitch : MpJ1939EIDSEnum;
		EngIdleIncrementSwitch : MpJ1939EIISEnum;
		CruiseCtrlStates : MpJ1939CCSEnum;
		PTOGovernorState : MpJ1939PTOGSEnum;
		CruiseCtrlSetSpeed : INT;
		CruiseCtrlAccelerateSwitch : MpJ1939CCASEnum;
		CruiseCtrlResumeSwitch : MpJ1939CCRSEnum;
		CruiseCtrlCoastSwitch : MpJ1939CCCSEnum;
		CruiseCtrlSetSwitch : MpJ1939CCSSEnum;
		ClutchSwitch : MpJ1939CSEnum;
		BrakeSwitch : MpJ1939BSEnum;
		CruiseCtrlEnableSwitch : MpJ1939CCESEnum;
		CruiseCtrlActive : MpJ1939CCAEnum;
		WheelBasedVehicleSpeed : REAL;
		ParkBrakeReleaseInhibitRq : MpJ1939PBRIREnum;
		CruiseCtrlPauseSwitch : MpJ1939CCPSEnum;
		ParkingBrakeSwitch : MpJ1939PBSEnum;
		TwoSpeedAxleSwitch : MpJ1939TSASEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CCVS2Type : 	STRUCT 
		CruiseCtrlPauseCmd : MpJ1939CCPCEnum;
		CruiseCtrlResumeCmd : MpJ1939CCRCEnum;
		CruiseCtrlDisableCmd : MpJ1939CCDCEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CCVS3Type : 	STRUCT 
		CruiseCtrlSpeed : REAL;
		CruiseCtrlSetSpeed : REAL;
		PrdctvCrsCtrlStSpeedOffsetStatus : MpJ1939PCCSSOSEnum;
		AEBSReadinessState : MpJ1939AEBSRSEnum;
		SrcAddrssOfCntrllngDvcFrPsngCrsC : INT;
		SrcAddrssOfCntrllngDvcFrDsblngCr : INT;
		CruiseCtrlSystemCmdState : MpJ1939CCSCSEnum;
		AdptiveCruiseCtrlReadinessStatus : MpJ1939ACCRSEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CCVS4Type : 	STRUCT 
		CruiseCtrlAdjustedMaxSpeed : REAL;
		AppliedVehicleSpeedLimit : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CIType : 	STRUCT 
		UnitNumber : INT;
		SerialNumber : INT;
		Model : INT;
		Make : INT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CLEPSSEnum : 
		(
		mpJ1939_CLEPSS_NOT_AVAILABLE := 3,
		mpJ1939_CLEPSS_RESERVED := 2,
		mpJ1939_CLEPSS_ENABLED := 1,
		mpJ1939_CLEPSS_DISABLED := 0
		);
	MpJ1939CM1Type : 	STRUCT 
		SelectedMaxVehicleSpeedLimit : INT;
		RqCabZoneHeating : MpJ1939RCZHEnum;
		RqEngZoneHeating : MpJ1939REZHEnum;
		AuxHeaterModeRq : MpJ1939AHMREnum;
		EngAutomaticStartEnableSwitch : MpJ1939EASESEnum;
		AtomaticGearShiftingEnableSwitch : MpJ1939AGSESEnum;
		AFTRegenForceSw : MpJ1939AFTRFSEnum;
		AFTRegenInhSw : MpJ1939AFTRISEnum;
		VhclLmtngSpdGovernorEnableSwitch : MpJ1939VLSGESEnum;
		VhclLmtngSpdGvrnrIncrementSwitch : MpJ1939VLSGISEnum;
		VhclLmtngSpdGvrnrDecrementSwitch : MpJ1939VLSGDSEnum;
		ParkBrakeCmd : MpJ1939PBCEnum;
		SeatBeltSwitch : MpJ1939SBSEnum;
		OperatorSeatDirectionSwitch : MpJ1939OSDSEnum;
		BatteryMainSwitchHoldRq : MpJ1939BMSHREnum;
		AuxHeaterCoolantPumpRq : MpJ1939AHCPREnum;
		CabInteriorTempCmd : REAL;
		RequestedPercentFanSpeed : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939CSEnum : 
		(
		mpJ1939_CS_NOT_AVAILABLE := 3,
		mpJ1939_CS_ERROR := 2,
		mpJ1939_CS_DEPRESSED := 1,
		mpJ1939_CS_RELEASED := 0
		);
	MpJ1939DEFTLLIEnum : 
		(
		mpJ1939_DEFTLLI_NOT_AVAILABLE := 7,
		mpJ1939_DEFTLLI_RESERVED6 := 6,
		mpJ1939_DEFTLLI_RESERVED5 := 5,
		mpJ1939_DEFTLLI_ON_FAST_BLINK := 4,
		mpJ1939_DEFTLLI_RESERVED3 := 3,
		mpJ1939_DEFTLLI_RESERVED2 := 2,
		mpJ1939_DEFTLLI_ON_SOLID := 1,
		mpJ1939_DEFTLLI_OFF := 0
		);
	MpJ1939DiagType : 	STRUCT  (*Diagnostics information*)
		StatusID : MpJ1939StatusIDType; (*StatusID diagnostic structure *)
	END_STRUCT;
	MpJ1939DM01Type : 	STRUCT 
		FlashRedStopLamp : MpJ1939FRSLEnum;
		FlashProtectLamp : MpJ1939FPLEnum;
		FlashMalfuncIndicatorLamp : MpJ1939FMILEnum;
		FlashAmberWarningLamp : MpJ1939FAWLEnum;
		MalfunctionIndicatorLampStatus : MpJ1939MILSEnum;
		AmberWarningLampStatus : MpJ1939AWLSEnum;
		RedStopLampState : MpJ1939RSLSEnum;
		ProtectLampStatus : MpJ1939PLSEnum;
		DTC5 : UDINT;
		DTC4 : UDINT;
		DTC3 : UDINT;
		DTC2 : UDINT;
		DTC1 : UDINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939DPFAARIEnum : 
		(
		mpJ1939_DPFAARI_NOT_AVAILABLE := 3,
		mpJ1939_DPFAARI_RESERVED := 2,
		mpJ1939_DPFAARI_ENABLED := 1,
		mpJ1939_DPFAARI_NOT_ENABLED := 0
		);
	MpJ1939DPFARFSEnum : 
		(
		mpJ1939_DPFARFS_RESERVED3 := 3,
		mpJ1939_DPFARFS_SERVICE_TOOL := 2,
		mpJ1939_DPFARFS_SWITCH := 1,
		mpJ1939_DPFARFS_NOT_ACTIVE := 0,
		mpJ1939_DPFARFS_NOT_AVAILABLE := 7,
		mpJ1939_DPFARFS_RESERVED6 := 6,
		mpJ1939_DPFARFS_RESERVED5 := 5,
		mpJ1939_DPFARFS_RESERVED4 := 4
		);
	MpJ1939DPFARI3710Enum : 
		(
		mpJ1939_DPFARI3710_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI3710_RESERVED := 2,
		mpJ1939_DPFARI3710_INHIBITED := 1,
		mpJ1939_DPFARI3710_NOT_INHIBITED := 0
		);
	MpJ1939DPFARI3712Enum : 
		(
		mpJ1939_DPFARI3712_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI3712_RESERVED := 2,
		mpJ1939_DPFARI3712_INHIBITED := 1,
		mpJ1939_DPFARI3712_NOT_INHIBITED := 0
		);
	MpJ1939DPFARI3713Enum : 
		(
		mpJ1939_DPFARI3713_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI3713_RESERVED := 2,
		mpJ1939_DPFARI3713_INHIBITED := 1,
		mpJ1939_DPFARI3713_NOT_INHIBITED := 0
		);
	MpJ1939DPFARI3715Enum : 
		(
		mpJ1939_DPFARI3715_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI3715_RESERVED := 2,
		mpJ1939_DPFARI3715_INHIBITED := 1,
		mpJ1939_DPFARI3715_NOT_INHIBITED := 0
		);
	MpJ1939DPFARI3717Enum : 
		(
		mpJ1939_DPFARI3717_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI3717_RESERVED := 2,
		mpJ1939_DPFARI3717_INHIBITED := 1,
		mpJ1939_DPFARI3717_NOT_INHIBITED := 0
		);
	MpJ1939DPFARI5629Enum : 
		(
		mpJ1939_DPFARI5629_NOT_AVAILABLE := 3,
		mpJ1939_DPFARI5629_RESERVED := 2,
		mpJ1939_DPFARI5629_INHIBIT := 1,
		mpJ1939_DPFARI5629_NOT_INHIBIT := 0
		);
	MpJ1939DPFARIDTAEnum : 
		(
		mpJ1939_DPFARIDTA_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTA_RESERVED := 2,
		mpJ1939_DPFARIDTA_INHIBITED := 1,
		mpJ1939_DPFARIDTA_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTCEnum : 
		(
		mpJ1939_DPFARIDTC_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTC_RESERVED := 2,
		mpJ1939_DPFARIDTC_INHIBITED := 1,
		mpJ1939_DPFARIDTC_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTEEnum : 
		(
		mpJ1939_DPFARIDTE_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTE_RESERVED := 2,
		mpJ1939_DPFARIDTE_INHIBITED := 1,
		mpJ1939_DPFARIDTE_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTIEnum : 
		(
		mpJ1939_DPFARIDTI_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTI_RESERVED := 2,
		mpJ1939_DPFARIDTI_INHIBITED := 1,
		mpJ1939_DPFARIDTI_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTLEnum : 
		(
		mpJ1939_DPFARIDTL_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTL_RESERVED := 2,
		mpJ1939_DPFARIDTL_INHIBITED := 1,
		mpJ1939_DPFARIDTL_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTOEnum : 
		(
		mpJ1939_DPFARIDTO_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTO_RESERVED := 2,
		mpJ1939_DPFARIDTO_INHIBITED := 1,
		mpJ1939_DPFARIDTO_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTPEnum : 
		(
		mpJ1939_DPFARIDTP_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTP_RESERVED := 2,
		mpJ1939_DPFARIDTP_INHIBITED := 1,
		mpJ1939_DPFARIDTP_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTSEnum : 
		(
		mpJ1939_DPFARIDTS_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTS_RESERVED := 2,
		mpJ1939_DPFARIDTS_INHIBITED := 1,
		mpJ1939_DPFARIDTS_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTTEnum : 
		(
		mpJ1939_DPFARIDTT_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTT_RESERVED := 2,
		mpJ1939_DPFARIDTT_INHIBITED := 1,
		mpJ1939_DPFARIDTT_NOT_INHIBITED := 0
		);
	MpJ1939DPFARIDTVEnum : 
		(
		mpJ1939_DPFARIDTV_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIDTV_RESERVED := 2,
		mpJ1939_DPFARIDTV_INHIBITED := 1,
		mpJ1939_DPFARIDTV_NOT_INHIBITED := 0
		);
	MpJ1939DPFARISEnum : 
		(
		mpJ1939_DPFARIS_NOT_AVAILABLE := 3,
		mpJ1939_DPFARIS_RESERVED := 2,
		mpJ1939_DPFARIS_INHIBITED := 1,
		mpJ1939_DPFARIS_NOT_INHIBITED := 0
		);
	MpJ1939DPFC1Type : 	STRUCT 
		DslPrtcltFltrActvRgnrtnInhbt5629 : MpJ1939DPFARI5629Enum;
		AFT1DPFCondNotMetForActiveRegen : MpJ1939AFT1DPFCNMFAREnum;
		HydrocarbonDoserPurgingEnable : MpJ1939HDPEEnum;
		DslPrtcltFltrActvRgnrtnFrcdSttus : MpJ1939DPFARFSEnum;
		ExhaustSystemHighTempLampCmd : MpJ1939ESHTLCEnum;
		DslPrtcltFltrAtmtcActvRgnrtnIntt : MpJ1939DPFAARIEnum;
		DslPrtcltFltrActvRgnrtnInhbt3717 : MpJ1939DPFARI3717Enum;
		DslPrtcltFltrActvRgnrtnInhbtdDTE : MpJ1939DPFARIDTEEnum;
		DslPrtcltFltrActvRgnrtnInhbt3715 : MpJ1939DPFARI3715Enum;
		DslPrtcltFltrActvRgnrtnInhbtdDTT : MpJ1939DPFARIDTTEnum;
		DslPrtcltFltrActvRgnrtnInhbt3713 : MpJ1939DPFARI3713Enum;
		DslPrtcltFltrActvRgnrtnInhbt3712 : MpJ1939DPFARI3712Enum;
		DslPrtcltFltrActvRgnrtnInhbtdDTL : MpJ1939DPFARIDTLEnum;
		DslPrtcltFltrActvRgnrtnInhbt3710 : MpJ1939DPFARI3710Enum;
		DslPrtcltFltrActvRgnrtnInhbtdDTV : MpJ1939DPFARIDTVEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTO : MpJ1939DPFARIDTOEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTA : MpJ1939DPFARIDTAEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTP : MpJ1939DPFARIDTPEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTS : MpJ1939DPFARIDTSEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTC : MpJ1939DPFARIDTCEnum;
		DslPrtcltFltrActvRgnrtnInhbtdDTI : MpJ1939DPFARIDTIEnum;
		DslPrtcltFltrActvRgnrtnInhbtdStt : MpJ1939DPFARISEnum;
		AFTDPFStatus : MpJ1939AFTDPFSEnum;
		AFTDPFActiveRegenStatus : MpJ1939AFTDPFARSEnum;
		AFTDPFPassiveRegenStatus : MpJ1939AFTDPFPRSEnum;
		DieselParticulateFilterLampCmd : MpJ1939DPFLCEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939DPFLCEnum : 
		(
		mpJ1939_DPFLC_NOT_AVAILABLE := 7,
		mpJ1939_DPFLC_RESERVED6 := 6,
		mpJ1939_DPFLC_RESERVED5 := 5,
		mpJ1939_DPFLC_ON_FAST_BLINK := 4,
		mpJ1939_DPFLC_RESERVED3 := 3,
		mpJ1939_DPFLC_RESERVED2 := 2,
		mpJ1939_DPFLC_ON_SOLID := 1,
		mpJ1939_DPFLC_OFF := 0
		);
	MpJ1939DPFTMAEnum : 
		(
		mpJ1939_DPFTMA_DONT_CARE := 3,
		mpJ1939_DPFTMA_RESERVED := 2,
		mpJ1939_DPFTMA_ACTIVE := 1,
		mpJ1939_DPFTMA_NOT_ACTIVE := 0
		);
	MpJ1939EAAEnum : 
		(
		mpJ1939_EAA_NOT_AVAILABLE := 3,
		mpJ1939_EAA_ERROR := 2,
		mpJ1939_EAA_ACTIVE := 1,
		mpJ1939_EAA_NOT_ACTIVE := 0
		);
	MpJ1939EAOCSEnum : 
		(
		mpJ1939_EAOCS_NOT_AVAILABLE := 3,
		mpJ1939_EAOCS_RESERVED := 2,
		mpJ1939_EAOCS_ACTIVE := 1,
		mpJ1939_EAOCS_NOT_ACTIVE := 0
		);
	MpJ1939EASCSEnum : 
		(
		mpJ1939_EASCS_NOT_AVAILABLE := 3,
		mpJ1939_EASCS_RESERVED := 2,
		mpJ1939_EASCS_ENABLED := 1,
		mpJ1939_EASCS_DISABLED := 0
		);
	MpJ1939EASESEnum : 
		(
		mpJ1939_EASES_NOT_AVAILABLE := 3,
		mpJ1939_EASES_ERROR := 2,
		mpJ1939_EASES_ON_STATE := 1,
		mpJ1939_EASES_OFF_STATE := 0
		);
	MpJ1939EASSEnum : 
		(
		mpJ1939_EASS_ERROR := 2,
		mpJ1939_EASS_RESTRICTED := 1,
		mpJ1939_EASS_ALLOWED := 0,
		mpJ1939_EASS_NOT_AVAILABLE := 3
		);
	MpJ1939EC1Type : 	STRUCT 
		DefaultIdleTrqLmt : SINT;
		SupportTSC1CtrlPurposeGroup4 : USINT;
		SupportTSC1CtrlPurposeGroup3 : USINT;
		SupportTSC1CtrlPurposeGroup2 : USINT;
		SupportTSC1CtrlPurposeGroup1 : USINT;
		SupportVariableRateTSC1Message : USINT;
		EngDefaultTorqueLimit : UINT;
		EngMomentOfInertia : REAL;
		EngExRngRqstdSpdCtrlRngUpprLimit : REAL;
		EngRqstdTrqueCtrlRangeUpperLimit : SINT;
		EngRqstdTrqueCtrlRangeLowerLimit : SINT;
		EngRqstdSpeedCtrlRangeUpperLimit : INT;
		EngRqstdSpeedCtrlRangeLowerLimit : INT;
		EngMaxMomentaryOverrideTimeLimit : REAL;
		EngMxMmentaryOverrideSpeedPoint7 : REAL;
		EngReferenceTorque : UINT;
		EngGain : REAL;
		EngSpeedAtHighIdlePoint6 : REAL;
		EngPercentTorqueAtPoint5 : SINT;
		EngSpeedAtPoint5 : REAL;
		EngPercentTorqueAtPoint4 : SINT;
		EngSpeedAtPoint4 : REAL;
		EngPercentTorqueAtPoint3 : SINT;
		EngSpeedAtPoint3 : REAL;
		EngPercentTorqueAtPoint2 : SINT;
		EngSpeedAtPoint2 : REAL;
		EngPercentTorqueAtIdlePoint1 : SINT;
		EngSpeedAtIdlePoint1 : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939EEC1Type : 	STRUCT 
		EngDemandPercentTorque : SINT;
		EngStarterMode : MpJ1939ESMEnum;
		SrcAddrssOfCntrllngDvcForEngCtrl : USINT;
		EngSpeed : REAL;
		ActualEngPercentTorque : SINT;
		DriversDemandEngPercentTorque : SINT;
		ActlEngPrcntTorqueHighResolution : REAL;
		EngTorqueMode : SINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939EEC2Type : 	STRUCT 
		EstPumpingPercentTorque : SINT;
		ActlMaxAvailableEngPercentTorque : REAL;
		SCRThermalManagementActive : MpJ1939SCRTMAEnum;
		DPFThermalManagementActive : MpJ1939DPFTMAEnum;
		MmntaryEngMaxPowerEnableFeedback : MpJ1939MEMPEFEnum;
		VhcleAccelerationRateLimitStatus : MpJ1939VARLSEnum;
		AccelPedalPos2 : REAL;
		RemoteAccelPedalPos : REAL;
		EngPercentLoadAtCurrentSpeed : USINT;
		AccelPedalPos1 : REAL;
		AccelPedal2LowIdleSwitch : MpJ1939AP2LISEnum;
		RoadSpeedLimitStatus : MpJ1939RSLiSEnum;
		AccelPedalKickdownSwitch : MpJ1939APKSEnum;
		AccelPedal1LowIdleSwitch : MpJ1939AP1LISEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939EEC3Type : 	STRUCT 
		AFT2ExhDewPoint : MpJ1939AFT2EDPEnum;
		AFT2InDewPoint : MpJ1939AFT2IDPEnum;
		AFT1ExhDewPoint : MpJ1939AFT1EDPEnum;
		AFT1InDewPoint : MpJ1939AFT1IDPEnum;
		AFT1ExhGasMFR : REAL;
		EstEngPrsiticLossesPercentTorque : SINT;
		EngnsDsrdOprtngSpdAsymmtryAdjstm : USINT;
		EnginesDesiredOperatingSpeed : REAL;
		NominalFrictionPercentTorque : SINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939EFL_P1Type : 	STRUCT 
		EngCoolantLevel : REAL;
		EngCoolantPress : INT;
		EngCrankcasePress : REAL;
		EngOilPress : INT;
		EngOilLevel : REAL;
		EngExCrankcaseBlowbyPress : REAL;
		EngFuelDeliveryPress : INT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939EIDSEnum : 
		(
		mpJ1939_EIDS_NOT_AVAILABLE := 3,
		mpJ1939_EIDS_ERROR := 2,
		mpJ1939_EIDS_ON := 1,
		mpJ1939_EIDS_OFF := 0
		);
	MpJ1939EIISEnum : 
		(
		mpJ1939_EIIS_NOT_AVAILABLE := 3,
		mpJ1939_EIIS_ERROR := 2,
		mpJ1939_EIIS_ON := 1,
		mpJ1939_EIIS_OFF := 0
		);
	MpJ1939EISDAMEnum : 
		(
		mpJ1939_EISDAM_NOT_AVAILABLE := 3,
		mpJ1939_EISDAM_ERROR := 2,
		mpJ1939_EISDAM_ACTIVE := 1,
		mpJ1939_EISDAM_INACTIVE := 0
		);
	MpJ1939EISHSEEnum : 
		(
		mpJ1939_EISHSE_NOT_AVAILABLE := 3,
		mpJ1939_EISHSE_ERROR := 2,
		mpJ1939_EISHSE_YES := 1,
		mpJ1939_EISHSE_NO := 0
		);
	MpJ1939EISTFEnum : 
		(
		mpJ1939_EISTF_NOT_AVAILABLE := 3,
		mpJ1939_EISTF_ERROR := 2,
		mpJ1939_EISTF_ENABLED := 1,
		mpJ1939_EISTF_DISABLED := 0
		);
	MpJ1939EISTOEnum : 
		(
		mpJ1939_EISTO_NOT_AVAILABLE := 3,
		mpJ1939_EISTO_ERROR := 2,
		mpJ1939_EISTO_ACTIVE := 1,
		mpJ1939_EISTO_INACTIVE := 0
		);
	MpJ1939EISTSEnum : 
		(
		mpJ1939_EISTS_NOT_AVAILABLE := 3,
		mpJ1939_EISTS_ERROR := 2,
		mpJ1939_EISTS_ACTIVE := 1,
		mpJ1939_EISTS_INACTIVE := 0
		);
	MpJ1939EOCMEnum : 
		(
		mpJ1939_EOCM_SPEED := 3,
		mpJ1939_EOCM_TORQUE_CONTROL := 2,
		mpJ1939_EOCM_SPEED_CONTROL := 1,
		mpJ1939_EOCM_OVERRIDE_DISABLED := 0
		);
	MpJ1939EOTEnum : 
		(
		mpJ1939_EOT_NOT_AVAILABLE := 3,
		mpJ1939_EOT_RESERVED := 2,
		mpJ1939_EOT_ACTIVE := 1,
		mpJ1939_EOT_NOT_ACTIVE := 0
		);
	MpJ1939EPSASEnum : 
		(
		mpJ1939_EPSAS_NOT_AVAILABLE := 3,
		mpJ1939_EPSAS_ERROR := 2,
		mpJ1939_EPSAS_APPROACHING := 1,
		mpJ1939_EPSAS_NOT_APPROACHING := 0
		);
	MpJ1939EPSCEnum : 
		(
		mpJ1939_EPSC_NOT_AVAILABLE := 3,
		mpJ1939_EPSC_ERROR := 2,
		mpJ1939_EPSC_ENABLED := 1,
		mpJ1939_EPSC_DISABLED := 0
		);
	MpJ1939EPSHSEEnum : 
		(
		mpJ1939_EPSHSE_NOT_AVAILABLE := 3,
		mpJ1939_EPSHSE_ERROR := 2,
		mpJ1939_EPSHSE_YES := 1,
		mpJ1939_EPSHSE_NO := 0
		);
	MpJ1939EPSTOEnum : 
		(
		mpJ1939_EPSTO_NOT_AVAILABLE := 3,
		mpJ1939_EPSTO_ERROR := 2,
		mpJ1939_EPSTO_ACTIVE := 1,
		mpJ1939_EPSTO_INACTIVE := 0
		);
	MpJ1939EPSTSEnum : 
		(
		mpJ1939_EPSTS_NOT_AVAILABLE := 3,
		mpJ1939_EPSTS_ERROR := 2,
		mpJ1939_EPSTS_ACTIVE := 1,
		mpJ1939_EPSTS_INACTIVE := 0
		);
	MpJ1939ERSCCEnum : 
		(
		mpJ1939_ERSCC_ENGAGED_AND3 := 3,
		mpJ1939_ERSCC_ENGAGED_AND2 := 2,
		mpJ1939_ERSCC_DISENGA_NONLOCKUP1 := 1,
		mpJ1939_ERSCC_DISENGA_NONLOCKUP2 := 0
		);
	MpJ1939ERTHREnum : 
		(
		mpJ1939_ERTHR_0875 := 7,
		mpJ1939_ERTHR_0125 := 1,
		mpJ1939_ERTHR_0000 := 0
		);
	MpJ1939ESHTLCEnum : 
		(
		mpJ1939_ESHTLC_NOT_AVAILABLE := 7,
		mpJ1939_ESHTLC_RESERVED6 := 6,
		mpJ1939_ESHTLC_RESERVED5 := 5,
		mpJ1939_ESHTLC_RESERVED4 := 4,
		mpJ1939_ESHTLC_RESERVED3 := 3,
		mpJ1939_ESHTLC_RESERVED2 := 2,
		mpJ1939_ESHTLC_ON := 1,
		mpJ1939_ESHTLC_OFF := 0
		);
	MpJ1939ESMEnum : 
		(
		mpJ1939_ESM_INHIBIT_OVERTEMP := 8,
		mpJ1939_ESM_INHIBIT_IMMOBILIZER := 7,
		mpJ1939_ESM_INHIBIT_ENGAGED := 6,
		mpJ1939_ESM_INHIBIT_ENG_NOT_RDY := 5,
		mpJ1939_ESM_INHIBIT_ENG_RUNNING := 4,
		mpJ1939_ESM_FINISHED := 3,
		mpJ1939_ESM_ACTIVE_GEAR_ENGAGED := 2,
		mpJ1939_ESM_ACTIVE_GEAR_NOT_ENGA := 1,
		mpJ1939_ESM_NOT_REQUESTED := 0,
		mpJ1939_ESM_NOT_AVAILABLE := 15,
		mpJ1939_ESM_ERROR := 14,
		mpJ1939_ESM_ERROR_LEGACY := 13,
		mpJ1939_ESM_INHIBITED := 12,
		mpJ1939_ESM_RESERVED := 11,
		mpJ1939_ESM_INHIBIT_ACTIVE_INDUC := 10,
		mpJ1939_ESM_INHIBIT_AIR_SHT_VALV := 9
		);
	MpJ1939ESOSEnum : 
		(
		mpJ1939_ESOS_NOT_AVAILABLE := 3,
		mpJ1939_ESOS_ERROR := 2,
		mpJ1939_ESOS_ON := 1,
		mpJ1939_ESOS_OFF := 0
		);
	MpJ1939ET1Type : 	STRUCT 
		EngIntercoolerThermostatOpening : REAL;
		EngIntercoolerTemp : INT;
		EngTurboOilTemp : REAL;
		EngOilTemp1 : REAL;
		EngFuelTemp1 : INT;
		EngCoolantTemp : INT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939ETMSEnum : 
		(
		mpJ1939_ETMS_NOT_AVAILABLE := 3,
		mpJ1939_ETMS_ERROR := 2,
		mpJ1939_ETMS_ON := 1,
		mpJ1939_ETMS_OFF := 0
		);
	MpJ1939EWTSLEnum : 
		(
		mpJ1939_EWTSL_NOT_AVAILABLE := 3,
		mpJ1939_EWTSL_ERROR := 2,
		mpJ1939_EWTSL_ON := 1,
		mpJ1939_EWTSL_OFF := 0
		);
	MpJ1939FAWLEnum : 
		(
		mpJ1939_FAWL_UNAVAILABLE := 3,
		mpJ1939_FAWL_RESERVED := 2,
		mpJ1939_FAWL_FAST_FLASH := 1,
		mpJ1939_FAWL_SLOW_FLASH := 0
		);
	MpJ1939FMILEnum : 
		(
		mpJ1939_FMIL_UNAVAILABLE := 3,
		mpJ1939_FMIL_CLASS_C_DTC := 2,
		mpJ1939_FMIL_FAST_FLASH := 1,
		mpJ1939_FMIL_SLOW_FLASH := 0
		);
	MpJ1939FPLEnum : 
		(
		mpJ1939_FPL_UNAVAILABLE := 3,
		mpJ1939_FPL_RESERVED := 2,
		mpJ1939_FPL_FAST_FLASH := 1,
		mpJ1939_FPL_SLOW_FLASH := 0
		);
	MpJ1939FRSLEnum : 
		(
		mpJ1939_FRSL_UNAVAILABLE := 3,
		mpJ1939_FRSL_RESERVED := 2,
		mpJ1939_FRSL_FAST_FLASH := 1,
		mpJ1939_FRSL_SLOW_FLASH := 0
		);
	MpJ1939HDPEEnum : 
		(
		mpJ1939_HDPE_NOT_AVAILABLE := 3,
		mpJ1939_HDPE_URGENT := 2,
		mpJ1939_HDPE_LESS_URGENT := 1,
		mpJ1939_HDPE_NOT_ENABLED := 0
		);
	MpJ1939HOURSType : 	STRUCT 
		EngTotalRevolutions : REAL;
		EngTotalHoursOfOperation : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939IC1Type : 	STRUCT 
		EngCoolantFilterDiffPress : REAL;
		EngExhaustGasTemp : REAL;
		EngAirFilter1DiffPress : REAL;
		EngAirIntakePress : INT;
		EngIntakeManifold1Temp : INT;
		EngIntakeManifold1Press : INT;
		AFT1DPFInPress : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939LFC1Type : 	STRUCT 
		EngTotalFuelUsed : REAL;
		EngTripFuel : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939LFC2Type : 	STRUCT 
		EngTotalDieselFuelDemand : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939LFE1Type : 	STRUCT 
		EngThrottleValve2Pos : REAL;
		EngThrottleValve1Pos : REAL;
		EngAverageFuelEconomy : REAL;
		EngInstantaneousFuelEconomy : REAL;
		EngFuelRate : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939LFE2Type : 	STRUCT 
		EngDieselFuelDemandRate : REAL;
		HighResolutionEngFuelRate : REAL;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939MEMPEFEnum : 
		(
		mpJ1939_MEMPEF_DONT_CARE := 3,
		mpJ1939_MEMPEF_RESERVED := 2,
		mpJ1939_MEMPEF_SUPPORTED := 1,
		mpJ1939_MEMPEF_DISABLED := 0
		);
	MpJ1939MILSEnum : 
		(
		mpJ1939_MILS_NOT_AVAILABLE := 3,
		mpJ1939_MILS_SHORT_FOR_WWH_OBD := 2,
		mpJ1939_MILS_LAMP_ON := 1,
		mpJ1939_MILS_LAMP_OFF := 0
		);
	MpJ1939NO1RSEnum : 
		(
		mpJ1939_NO1RS_NOT_AVAILABLE := 3,
		mpJ1939_NO1RS_ERROR := 2,
		mpJ1939_NO1RS_STABLE := 1,
		mpJ1939_NO1RS_NOT_STABLE := 0
		);
	MpJ1939NOS1SDSEnum : 
		(
		mpJ1939_NOS1SDS_NOT_SUPPOR := 7,
		mpJ1939_NOS1SDS_NOT_POSSIBLE := 4,
		mpJ1939_NOS1SDS_ABORTED := 3,
		mpJ1939_NOS1SDS_COMPLETE := 2,
		mpJ1939_NOS1SDS_ACTIVE := 1,
		mpJ1939_NOS1SDS_NOT_ACTIVE := 0
		);
	MpJ1939OCMPEnum : 
		(
		mpJ1939_OCMP_LOW_PRIORITY := 3,
		mpJ1939_OCMP_MEDIUM_PRIORITY := 2,
		mpJ1939_OCMP_HIGH_PRIORITY := 1,
		mpJ1939_OCMP_HIGHEST_PRIORITY := 0
		);
	MpJ1939OSDSEnum : 
		(
		mpJ1939_OSDS_NOT_AVAILABLE := 3,
		mpJ1939_OSDS_ERROR := 2,
		mpJ1939_OSDS_FACING_FORWARD := 1,
		mpJ1939_OSDS_NOT_FACING_FORWARD := 0
		);
	MpJ1939PBCEnum : 
		(
		mpJ1939_PBC_DONT_CARE := 3,
		mpJ1939_PBC_SAE_RESERVED := 2,
		mpJ1939_PBC_REQUESTED := 1,
		mpJ1939_PBC_NOT_REQUESTED := 0
		);
	MpJ1939PBRIREnum : 
		(
		mpJ1939_PBRIR_UNAVAILABLE := 3,
		mpJ1939_PBRIR_SAE_RESERVED := 2,
		mpJ1939_PBRIR_REQUESTED := 1,
		mpJ1939_PBRIR_NOT_REQUESTED := 0
		);
	MpJ1939PBSEnum : 
		(
		mpJ1939_PBS_NOT_AVAILABLE := 3,
		mpJ1939_PBS_ERROR := 2,
		mpJ1939_PBS_SET := 1,
		mpJ1939_PBS_NOT_SET := 0
		);
	MpJ1939PCCSSOSEnum : 
		(
		mpJ1939_PCCSSOS_NOT_AVAILABLE := 3,
		mpJ1939_PCCSSOS_SAE_RESERVED := 2,
		mpJ1939_PCCSSOS_INCLUDES := 1,
		mpJ1939_PCCSSOS_DOES_NOT_INCLUDE := 0
		);
	MpJ1939PGNStatusEnum : 
		(
		mpJ1939_PGN_IDLE := 1, (*PGN is in idle state (waiting)*)
		mpJ1939_PGN_NEW_DATA := 2, (*New data has been received*)
		mpJ1939_PGN_ERROR_CYCLE_TIME := 3, (*Cycle too slow for PGN (lost messages)*)
		mpJ1939_PGN_ERROR_LIMITS := 4, (*Physical values out of boundaries*)
		mpJ1939_PGN_ERROR_TRANSMIT := 5, (*Transmission failed*)
		mpJ1939_PGN_ERROR_RECEIVE := 6, (*Reception failed*)
		mpJ1939_PGN_NOT_ACTIVE := 0 (*PGN is not enabled*)
		);
	MpJ1939PLSEnum : 
		(
		mpJ1939_PLS_NOT_AVAILABLE := 3,
		mpJ1939_PLS_RESERVED := 2,
		mpJ1939_PLS_LAMP_ON := 1,
		mpJ1939_PLS_LAMP_OFF := 0
		);
	MpJ1939PTOGSEnum : 
		(
		mpJ1939_PTOGS_NOT_AVAILABL := 31,
		mpJ1939_PTOGS_SPEED_MEMORY_2 := 19,
		mpJ1939_PTOGS_SPEED_MEMORY_1 := 18,
		mpJ1939_PTOGS_SET_SPEED_8 := 17,
		mpJ1939_PTOGS_SET_SPEED_7 := 16,
		mpJ1939_PTOGS_SET_SPEED_6 := 15,
		mpJ1939_PTOGS_SET_SPEED_5 := 14,
		mpJ1939_PTOGS_SET_SPEED_4 := 13,
		mpJ1939_PTOGS_SET_SPEED_3 := 12,
		mpJ1939_PTOGS_SET_SPEED_2 := 11,
		mpJ1939_PTOGS_SET_SPEED_1 := 10,
		mpJ1939_PTOGS_ACCEL_OVERRIDE := 9,
		mpJ1939_PTOGS_ACCELERATE := 8,
		mpJ1939_PTOGS_RESUME := 7,
		mpJ1939_PTOGS_DECELERATE := 6,
		mpJ1939_PTOGS_SET := 5,
		mpJ1939_PTOGS_REMOTE_STANDBY := 4,
		mpJ1939_PTOGS_STANDBY := 3,
		mpJ1939_PTOGS_REMOTE_HOLD := 2,
		mpJ1939_PTOGS_HOLD := 1,
		mpJ1939_PTOGS_OFF := 0
		);
	MpJ1939PTOSHSEEnum : 
		(
		mpJ1939_PTOSHSE_NOT_AVAILABLE := 3,
		mpJ1939_PTOSHSE_ERROR := 2,
		mpJ1939_PTOSHSE_YES := 1,
		mpJ1939_PTOSHSE_NO := 0
		);
	MpJ1939RCZHEnum : 
		(
		mpJ1939_RCZH_DONT_CARE := 3,
		mpJ1939_RCZH_RESERVED := 2,
		mpJ1939_RCZH_HEAT_CAB_ZONE := 1,
		mpJ1939_RCZH_DO_NOT_HEAT := 0
		);
	MpJ1939ReceiveInfoType : 	STRUCT  (*Status information*)
		Diag : MpJ1939DiagType; (*Diagnostic structure for the function block*)
		ReceivedBytes : UINT; (*Received bytes*)
	END_STRUCT;
	MpJ1939REZHEnum : 
		(
		mpJ1939_REZH_DONT_CARE := 3,
		mpJ1939_REZH_RESERVED := 2,
		mpJ1939_REZH_HEAT_ENGINE_ZONE := 1,
		mpJ1939_REZH_DO_NOT_HEAT := 0
		);
	MpJ1939RHPSEnum : 
		(
		mpJ1939_RHPS_NOT_AVAILABLE := 3,
		mpJ1939_RHPS_ERROR := 2,
		mpJ1939_RHPS_PRESSURE_TOO_HIGH := 1,
		mpJ1939_RHPS_PRESSURE_NORMAL := 0
		);
	MpJ1939RLPSEnum : 
		(
		mpJ1939_RLPS_NOT_AVAILABLE := 3,
		mpJ1939_RLPS_ERROR := 2,
		mpJ1939_RLPS_PRESSURE_TOO_LOW := 1,
		mpJ1939_RLPS_PRESSURE_NORMAL := 0
		);
	MpJ1939RSLiSEnum : 
		(
		mpJ1939_RSLIS_NOT_AVAILABLE := 3,
		mpJ1939_RSLIS_ERROR := 2,
		mpJ1939_RSLIS_NOT_ACTIVE := 1,
		mpJ1939_RSLIS_ACTIVE := 0
		);
	MpJ1939RSLSEnum : 
		(
		mpJ1939_RSLS_NOT_AVAILABLE := 3,
		mpJ1939_RSLS_RESERVED := 2,
		mpJ1939_RSLS_LAMP_ON := 1,
		mpJ1939_RSLS_LAMP_OFF := 0
		);
	MpJ1939S1ATEnum : 
		(
		mpJ1939_S1AT_NOT_AVAILABLE := 3,
		mpJ1939_S1AT_ERROR := 2,
		mpJ1939_S1AT_IN_RANGE := 1,
		mpJ1939_S1AT_NOT_IN_RANGE := 0
		);
	MpJ1939S1HCEnum : 
		(
		mpJ1939_S1HC_HEATER_OFF := 3,
		mpJ1939_S1HC_PREHEAT_1 := 2,
		mpJ1939_S1HC_PREHEAT_2 := 1,
		mpJ1939_S1HC_AUTOMATIC := 0
		);
	MpJ1939S1PIREnum : 
		(
		mpJ1939_S1PIR_NOT_AVAILABLE := 3,
		mpJ1939_S1PIR_ERROR := 2,
		mpJ1939_S1PIR_IN_RANGE := 1,
		mpJ1939_S1PIR_NOT_IN_RANGE := 0
		);
	MpJ1939SBSEnum : 
		(
		mpJ1939_SBS_NOT_AVAILABLE := 3,
		mpJ1939_SBS_ERROR := 2,
		mpJ1939_SBS_OK := 1,
		mpJ1939_SBS_NOT_BUCKLED := 0
		);
	MpJ1939SCRINO1RSEnum : 
		(
		mpJ1939_SCRINO1RS_NOT_AVAILABLE := 3,
		mpJ1939_SCRINO1RS_ERROR := 2,
		mpJ1939_SCRINO1RS_STABLE := 1,
		mpJ1939_SCRINO1RS_NOT_STABLE := 0
		);
	MpJ1939SCROISEnum : 
		(
		mpJ1939_SCROIS_NOT_AVAILABLE := 7,
		mpJ1939_SCROIS_TEMP_OVERRIDE := 6,
		mpJ1939_SCROIS_INDUCEMENT_LEVEL5 := 5,
		mpJ1939_SCROIS_INDUCEMENT_LEVEL4 := 4,
		mpJ1939_SCROIS_INDUCEMENT_LEVEL3 := 3,
		mpJ1939_SCROIS_INDUCEMENT_LEVEL2 := 2,
		mpJ1939_SCROIS_INDUCEMENT_LEVEL1 := 1,
		mpJ1939_SCROIS_DRIVER_WARNING := 0
		);
	MpJ1939SCRTMAEnum : 
		(
		mpJ1939_SCRTMA_DONT_CARE := 3,
		mpJ1939_SCRTMA_RESERVED := 2,
		mpJ1939_SCRTMA_ACTIVE := 1,
		mpJ1939_SCRTMA_NOT_ACTIVE := 0
		);
	MpJ1939EOPSEnum : 
		(
		mpJ1939_EOPS_NOT_AVAILABLE := 3,
		mpJ1939_EOPS_ERROR := 2,
		mpJ1939_EOPS_NOK := 1,
		mpJ1939_EOPS_OK := 0
		);
	MpJ1939SHUTDNType : 	STRUCT 
		EngOilPressSw : MpJ1939EOPSEnum;
		ClntLvlEngPrtctionShutdownStatus : MpJ1939CLEPSSEnum;
		PTOShutdownHasShutdownEng : MpJ1939PTOSHSEEnum;
		EngAirShutoffStatus : MpJ1939EASSEnum;
		EngOverspeedTest : MpJ1939EOTEnum;
		EngAirShutoffCmdStatus : MpJ1939EASCSEnum;
		EngAlarmOutputCmdStatus : MpJ1939EAOCSEnum;
		EngAlarmAcknowledge : MpJ1939EAAEnum;
		EngProtectionSystemConfig : MpJ1939EPSCEnum;
		EngProtectionSystemTimerState : MpJ1939EPSTSEnum;
		EngProtectionSystemTimerOverride : MpJ1939EPSTOEnum;
		EngPrtctnSystmApprachingShutdown : MpJ1939EPSASEnum;
		EngPrtectionSystemHasShutdownEng : MpJ1939EPSHSEEnum;
		EngWaitToStartLamp : MpJ1939EWTSLEnum;
		RefrigerantHighPressSwitch : MpJ1939RHPSEnum;
		RefrigerantLowPressSwitch : MpJ1939RLPSEnum;
		A_CHighPressFanSwitch : MpJ1939ACHPFSEnum;
		EngIdleShutdownTimerFunction : MpJ1939EISTFEnum;
		EngIdleShutdownTimerState : MpJ1939EISTSEnum;
		EngIdleShutdownTimerOverride : MpJ1939EISTOEnum;
		EngIdleShutdownDriverAlertMode : MpJ1939EISDAMEnum;
		EngIdleShutdownHasShutdownEng : MpJ1939EISHSEEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939SOFTType : 	STRUCT 
		NmbrOfSftwreIdentificationFields : USINT;
		SoftwareIdentification : USINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939StatusIDType : 	STRUCT  (*Status ID details*)
		ID : MpJ1939ErrorEnum; (*Error code for mapp component*)
		Severity : MpComSeveritiesEnum; (*Describes the type of information supplied by the status ID (success, information, warning, error)*)
	END_STRUCT;
	MpJ1939TSASEnum : 
		(
		mpJ1939_TSAS_NOT_AVAILABLE := 3,
		mpJ1939_TSAS_ERROR := 2,
		mpJ1939_TSAS_HIGH_SPEED_RANGE := 1,
		mpJ1939_TSAS_LOW_SPEED_RANGE := 0
		);
	MpJ1939TSC1CPEnum : 
		(
		mpJ1939_TSC1CP_P32_TEMP_PWR_CTRL := 31,
		mpJ1939_TSC1CP_P5_ENG_PROTECTION := 4,
		mpJ1939_TSC1CP_P4_ROAD_SPEED_GVN := 3,
		mpJ1939_TSC1CP_P3_PTO_GOVERNOR := 2,
		mpJ1939_TSC1CP_P2_CRUISE_CONTROL := 1,
		mpJ1939_TSC1CP_P1_ACCEL_PEDAL := 0
		);
	MpJ1939TSC1TREnum : 
		(
		mpJ1939_TSC1TR_100_MS := 4,
		mpJ1939_TSC1TR_250_MS := 3,
		mpJ1939_TSC1TR_500_MS := 2,
		mpJ1939_TSC1TR_750_MS := 1,
		mpJ1939_TSC1TR_1000_MS := 0,
		mpJ1939_TSC1TR_STANDARD_10_MS := 7,
		mpJ1939_TSC1TR_20_MS := 6,
		mpJ1939_TSC1TR_50_MS := 5
		);
	MpJ1939TSC1Type : 	STRUCT 
		MessageChecksum : SINT;
		MessageCounter : SINT;
		EngRequestedTorqueHighResolution : REAL;
		TSC1CtrlPurpose : MpJ1939TSC1CPEnum;
		TSC1TransRate : MpJ1939TSC1TREnum;
		EngRequestedTorque_TorqueLimit : SINT;
		EngRequestedSpeed_SpeedLimit : REAL;
		OverrideCtrlModePriority : MpJ1939OCMPEnum;
		EngRequestedSpeedCtrlConditions : MpJ1939ERSCCEnum;
		EngOverrideCtrlMode : MpJ1939EOCMEnum;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939VARLSEnum : 
		(
		mpJ1939_VARLS_NOT_AVAILABLE := 3,
		mpJ1939_VARLS_RESERVED := 2,
		mpJ1939_VARLS_LIMIT_ACTIVE := 1,
		mpJ1939_VARLS_LIMIT_NOT_ACTIVE := 0
		);
	MpJ1939VEP1Type : 	STRUCT 
		KeyswitchBatteryPotential : REAL;
		BatteryPotential_PowerInput1 : REAL;
		ChargingSystemPotential : REAL;
		AltCurrent : USINT;
		NetBatteryCurrent : SINT;
		Status : MpJ1939PGNStatusEnum;
	END_STRUCT;
	MpJ1939VLSGDSEnum : 
		(
		mpJ1939_VLSGDS_ERROR := 2,
		mpJ1939_VLSGDS_ON_STATE := 1,
		mpJ1939_VLSGDS_OFF_STATE := 0,
		mpJ1939_VLSGDS_NOT_AVAILABLE := 3
		);
	MpJ1939VLSGESEnum : 
		(
		mpJ1939_VLSGES_NOT_AVAILABLE := 3,
		mpJ1939_VLSGES_ERROR := 2,
		mpJ1939_VLSGES_SWITCHED_ENABLED := 1,
		mpJ1939_VLSGES_SWITCH_DISABLED := 0
		);
	MpJ1939VLSGISEnum : 
		(
		mpJ1939_VLSGIS_NOT_AVAILABLE := 3,
		mpJ1939_VLSGIS_ERROR := 2,
		mpJ1939_VLSGIS_ON_STATE := 1,
		mpJ1939_VLSGIS_OFF_STATE := 0
		);
	MpJ1939WRPO21RSEnum : 
		(
		mpJ1939_WRPO21RS_NOT_AVAILABLE := 3,
		mpJ1939_WRPO21RS_ERROR := 2,
		mpJ1939_WRPO21RS_STABLE := 1,
		mpJ1939_WRPO21RS_NOT_STABLE := 0
		);
END_TYPE
