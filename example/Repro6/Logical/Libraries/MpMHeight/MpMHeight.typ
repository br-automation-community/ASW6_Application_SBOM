(*Enumerations*)

TYPE
	MpMHeightProfileGenerationEnum : 
		( (*Define how the profile is generated*)
		mpMHEIGHT_POSITION_BASED := 0, (*The profile is based on position*)
		mpMHEIGHT_TIME_BASED := 1 (*The profile is based on time*)
		);
	MpMHeightMoveTypeEnum : 
		( (*Movement types for axes*)
		mpMHEIGHT_MOVE_TYPE_SETUP := 0 (*Movement in manual mode (mold heightwill follow the profile)*)
		);
	MpMHeightStateEnum : 
		( (*mold heightstate information*)
		mpMHEIGHT_UNDEFINED := 0, (*mold heightstatus is not defined *)
		mpMHEIGHT_NEGATIVE_END_POSITION := 1, (*mold heightis in negative end position *)
		mpMHEIGHT_NEGATIVE_STOP_POSITION := 2, (*mold heightis in negative stop position *)
		mpMHEIGHT_NEGATIVE_MOVEMENT := 3, (*mold heightmoves in negative direction *)
		mpMHEIGHT_POSITIVE_END_POSITION := 4, (*mold heightis in positive end position *)
		mpMHEIGHT_POSITIVE_STOP_POSITION := 5, (*mold heightis in positive stop position *)
		mpMHEIGHT_POSITIVE_MOVEMENT := 6 (*mold heightmoves in positive direction *)
		);
END_TYPE

(*Configuration structure*)

TYPE
	MpMHeightBasicHConfigType : 	STRUCT  (*mold heightconfiguration parameters*)
		MaxPosition : REAL := 100; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.0; (*Velocity filter time [s]*)
		InputSignals : MpMHeightInputSignalsType; (*Input signals*)
		OutputSignals : MpMHeightOutputSignalsType; (*Output signals*)
		Positive : MpMHeightMoveConfigType; (*Configuration parameters for Positive direction*)
		Negative : MpMHeightMoveConfigType; (*Configuration parameters for Negative direction*)
	END_STRUCT;
	MpMHeightInputSignalsType : 	STRUCT  (*Input signals*)
		CurrentPosition : STRING[255]; (*Datapoint containing current position*)
		PositiveEnd : STRING[255]; (*Datapoint containing positive end input signal*)
		NegativeEnd : STRING[255]; (*Datapoint containing negative end input signal*)
	END_STRUCT;
	MpMHeightOutputSignalsType : 	STRUCT  (*Output signals*)
		SetVelocity : STRING[255]; (*Datapoint that gets set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets set force*)
		PositiveValve : STRING[255]; (*Datapoint for positive valve signal*)
		NegativeValve : STRING[255]; (*Datapoint for negative valve signal*)
	END_STRUCT;
	MpMHeightMoveConfigType : 	STRUCT  (*mold heightconfiguration parameters for each direction*)
		ProfileGeneration : MpMHeightProfileGenerationEnum := mpMHEIGHT_POSITION_BASED; (*How the profile is generated*)
		VelocityProfileLimits : MpMHeightVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpMHeightForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		UseEndSwitch : BOOL := FALSE; (*Option of using end switch for movement*)
		Delay : MpMHeightDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpMHeightDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*After movement delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpMHeightVelocityType : 	STRUCT  (*Velocity settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [%]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0.0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jot time [s]*)
	END_STRUCT;
	MpMHeightForceType : 	STRUCT  (*Force settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
END_TYPE

(*Parameter structure*)

TYPE
	MpMHeightBasicParType : 	STRUCT  (*mold heighthydraulic parameters*)
		SetupMode : MpMHeightSetupModeType; (*Setup mode parameters*)
	END_STRUCT;
	MpMHeightSetupModeType : 	STRUCT  (*Setup mode parameters*)
		PositiveProfile : MpMHeightSetupModeProfileType; (*Settings for setup mode Positive direction*)
		NegativeProfile : MpMHeightSetupModeProfileType; (*Settings for setup mode Negative direction*)
	END_STRUCT;
	MpMHeightSetupModeProfileType : 	STRUCT  (*Profile settings for setup mode for hydraulic injection unit*)
		Velocity : REAL := 20; (*Setup mode velocity [mm/s]*)
		Force : REAL := 10; (*Setup mode force [bar]*)
		Time : REAL := 0.0; (*Move time for time based movements[s]*)
		TimeOut : REAL := 0.0; (*Movement timeout[s]*)
	END_STRUCT;
END_TYPE

(*Additional Information structure*)

TYPE
	MpMHeightInfoType : 	STRUCT  (*mold heightinfo structure*)
		Diag : MpMHeightDiagType;
	END_STRUCT;
	MpMHeightBasicInfoType : 	STRUCT  (*mold heightinfo structure*)
		Velocity : REAL; (*Current velocity [mm/s]*)
		MinPosition : REAL; (*Minimum measured value[mm]*)
		MaxPosition : REAL; (*Maximum measured value[mm]*)
		State : MpMHeightStateEnum; (*mold heightstate information*)
		Diag : MpMHeightDiagType;
	END_STRUCT;
	MpMHeightDiagType : 	STRUCT  (*MpMHeight diagnosis information*)
		StatusID : MpMHeightStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpMHeightStatusIDType : 	STRUCT  (*MpMHeight status ID information*)
		ID : MpMHeightErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
