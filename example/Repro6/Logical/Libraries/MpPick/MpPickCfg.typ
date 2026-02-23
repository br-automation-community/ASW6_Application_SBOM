TYPE
	MpPCGripEnum :
		( (*Gripper selector setting*)
		mcPCG_STD := 0 (*Standard - Standard gripper to pick one or multiple objects at once*)
		);
	MpPCGripStdToolEnum :
		( (*Tool selector setting*)
		mcPCGST_AX_GRP := 0 (*Axes group - The Tool is considered in mechanical system or axes group configuration*)
		);
	MpPCGripStdToolType : STRUCT
		Type : MpPCGripStdToolEnum; (*Tool selector setting*)
	END_STRUCT;
	MpPCGripStdBxEnum :
		( (*Behavior selector setting*)
		mcPCGSB_BASIC := 0 (*Basic - Configuration of basic gripper control based on time*)
		);
	MpPCGripStdBxBasicPickType : STRUCT
		TriggerTime : REAL; (*Time delay between sending the signal to close the gripper and an actually closed gripper [s]*)
		SyncTime : REAL; (*Time the gripper stays synchronized with the object position [s]*)
	END_STRUCT;
	MpPCGripStdBxBasicPlType : STRUCT
		TriggerTime : REAL; (*Time delay between sending the signal to open the gripper and an actually opened gripper [s]*)
		SyncTime : REAL; (*Time the gripper stays synchronized with the object position [s]*)
	END_STRUCT;
	MpPCGripStdBxBasicType : STRUCT (*Type mcPCGSB_BASIC settings*)
		Pick : MpPCGripStdBxBasicPickType;
		Place : MpPCGripStdBxBasicPlType;
		ProcessVariableName : STRING[250]; (*Process variable for gripper open/close control. TRUE for close. FALSE for open*)
	END_STRUCT;
	MpPCGripStdBxType : STRUCT (*Open/close behavior of the gripper*)
		Type : MpPCGripStdBxEnum; (*Behavior selector setting*)
		Basic : MpPCGripStdBxBasicType; (*Type mcPCGSB_BASIC settings*)
	END_STRUCT;
	MpPCGripStdType : STRUCT (*Type mcPCG_STD settings*)
		Tool : MpPCGripStdToolType;
		Behavior : MpPCGripStdBxType; (*Open/close behavior of the gripper*)
	END_STRUCT;
	MpPCGripType : STRUCT
		Type : MpPCGripEnum; (*Gripper selector setting*)
		Standard : MpPCGripStdType; (*Type mcPCG_STD settings*)
	END_STRUCT;
	MpPCJobMoveEnum :
		( (*Movement selector setting*)
		mcPCJM_BASIC := 0 (*Basic -*)
		);
	MpPCJobMoveBasicType : STRUCT (*Type mcPCJM_BASIC settings*)
		PickOffsetZ : LREAL; (*Z-offset relative to coordinate system of pick-and-place object [measurement units]*)
		PickRounding : LREAL; (*Rounding of the movement for picking objects [measurement units]*)
		PlaceOffsetZ : LREAL; (*Z-offset relative to coordinate system of pick-and-place object [measurement units]*)
		PlaceRounding : LREAL; (*Rounding of the movement for picking objects [measurement units]*)
	END_STRUCT;
	MpPCJobMoveType : STRUCT
		Type : MpPCJobMoveEnum; (*Movement selector setting*)
		Basic : MpPCJobMoveBasicType; (*Type mcPCJM_BASIC settings*)
	END_STRUCT;
	MpPCJobLimEnum :
		( (*Limits selector setting*)
		mcPCJL_NOT_USE := 0, (*Not used -*)
		mcPCJL_BASIC := 1 (*Basic -*)
		);
	MpPCJobLimBasicLimType : STRUCT
		Velocity : LREAL; (*[measurement units/s]*)
		Acceleration : LREAL; (*[measurement units/s²]*)
		Deceleration : LREAL; (*[measurement units/s²]*)
	END_STRUCT;
	MpPCJobLimBasicType : STRUCT (*Type mcPCJL_BASIC settings*)
		WithObject : MpPCJobLimBasicLimType;
		WithoutObject : MpPCJobLimBasicLimType;
	END_STRUCT;
	MpPCJobLimType : STRUCT
		Type : MpPCJobLimEnum; (*Limits selector setting*)
		Basic : MpPCJobLimBasicType; (*Type mcPCJL_BASIC settings*)
	END_STRUCT;
	MpCfgPickJobType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_JOB*)
		Name : STRING[250]; (*Name of the pick-and-place job*)
		ObjectName : STRING[250]; (*Pick-and-place object name defined in pick-and-place object list*)
		InfeedRegisterReference : McCfgReferenceType; (*Register from which the objects have to be picked*)
		OutfeedRegisterReference : McCfgReferenceType; (*Register to which the objects have to be placed*)
		Movement : MpPCJobMoveType;
		Limits : MpPCJobLimType;
	END_STRUCT;
	MpPCOMAJProcEnum :
		( (*Processing selector setting*)
		mcPCOMAJP_FIFO := 0, (*FIFO - Prefer objects which have first entered the register queue*)
		mcPCOMAJP_INFEED_OUTFEED := 1 (*Infeed Outfeed - Choose combination of advanced infeed/outfeed processing strategies based on your process requirements*)
		);
	MpPCOMAJPInFirstRegisteredEnum :
		( (*First registered selector setting*)
		mcPCOMAJProcIPFR_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcIPFR_USE := 1 (*Used - Considered*)
		);
	MpPCOMAJPInFirstRegisteredType : STRUCT (*Prefer objects which were first entering the pick-and-place register*)
		Type : MpPCOMAJPInFirstRegisteredEnum; (*First registered selector setting*)
	END_STRUCT;
	MpPCOMAJPInFirstLeavingWsEnum :
		( (*First leaving workspace selector setting*)
		mcPCOMAJProcIPFLW_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcIPFLW_USE := 1 (*Used - Considered*)
		);
	MpPCOMAJPInFirstLeavingWsType : STRUCT (*Prefer objects which are leaving robot workspace first*)
		Type : MpPCOMAJPInFirstLeavingWsEnum; (*First leaving workspace selector setting*)
	END_STRUCT;
	MpPCOMAJPInSDEnum :
		( (*Shortest distance selector setting*)
		mcPCOMAJProcIPSD_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcIPSD_TO_FIX_PT := 1 (*To fixed point - Distance to a fixed user defined point*)
		);
	MpPCOMAJPInSDToFixPtType : STRUCT (*Type mcPCOMAJProcIPSD_TO_FIX_PT settings*)
		FrameName : STRING[250]; (*Name of Frame defined in object hierarchy or frame hierarchy of an axes group*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	MpPCOMAJPInSDType : STRUCT (*Prefer objects with the shortest distance to a user defined point*)
		Type : MpPCOMAJPInSDEnum; (*Shortest distance selector setting*)
		ToFixedPoint : MpPCOMAJPInSDToFixPtType; (*Type mcPCOMAJProcIPSD_TO_FIX_PT settings*)
	END_STRUCT;
	MpPCOMAJPInType : STRUCT (*Define processing strategy for the infeed Register of the assigned job*)
		FirstRegistered : MpPCOMAJPInFirstRegisteredType; (*Prefer objects which were first entering the pick-and-place register*)
		FirstLeavingWorkspace : MpPCOMAJPInFirstLeavingWsType; (*Prefer objects which are leaving robot workspace first*)
		ShortestDistance : MpPCOMAJPInSDType; (*Prefer objects with the shortest distance to a user defined point*)
	END_STRUCT;
	MpPCOMAJPOutFirstRegisteredEnum :
		( (*First registered selector setting*)
		mcPCOMAJProcOPFR_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcOPFR_USE := 1 (*Used - Considered*)
		);
	MpPCOMAJPOutFirstRegisteredType : STRUCT (*Prefer objects which were first entering the pick-and-place register*)
		Type : MpPCOMAJPOutFirstRegisteredEnum; (*First registered selector setting*)
	END_STRUCT;
	MpPCOMAJPOutFirstLeavingWsEnum :
		( (*First leaving workspace selector setting*)
		mcPCOMAJProcOPFLW_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcOPFLW_USE := 1 (*Used - Considered*)
		);
	MpPCOMAJPOutFirstLeavingWsType : STRUCT (*Prefer objects which are leaving robot workspace first*)
		Type : MpPCOMAJPOutFirstLeavingWsEnum; (*First leaving workspace selector setting*)
	END_STRUCT;
	MpPCOMAJPOutSDEnum :
		( (*Shortest distance selector setting*)
		mcPCOMAJProcOPSD_NOT_USE := 0, (*Not used - Not considered*)
		mcPCOMAJProcOPSD_TO_FIX_PT := 1 (*To fixed point - Distance to a fixed user defined point*)
		);
	MpPCOMAJPOutSDToFixPtType : STRUCT (*Type mcPCOMAJProcOPSD_TO_FIX_PT settings*)
		FrameName : STRING[250]; (*Name of Frame defined in object hierarchy or frame hierarchy of an axes group*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	MpPCOMAJPOutSDType : STRUCT (*Prefer objects with the shortest distance to a user defined point*)
		Type : MpPCOMAJPOutSDEnum; (*Shortest distance selector setting*)
		ToFixedPoint : MpPCOMAJPOutSDToFixPtType; (*Type mcPCOMAJProcOPSD_TO_FIX_PT settings*)
	END_STRUCT;
	MpPCOMAJPOutType : STRUCT (*Define processing strategy for the outfeed Register of the assigned job*)
		FirstRegistered : MpPCOMAJPOutFirstRegisteredType; (*Prefer objects which were first entering the pick-and-place register*)
		FirstLeavingWorkspace : MpPCOMAJPOutFirstLeavingWsType; (*Prefer objects which are leaving robot workspace first*)
		ShortestDistance : MpPCOMAJPOutSDType; (*Prefer objects with the shortest distance to a user defined point*)
	END_STRUCT;
	MpPCOMAJPInOutType : STRUCT (*Type mcPCOMAJP_INFEED_OUTFEED settings*)
		InfeedPreferences : MpPCOMAJPInType; (*Define processing strategy for the infeed Register of the assigned job*)
		OutfeedPreferences : MpPCOMAJPOutType; (*Define processing strategy for the outfeed Register of the assigned job*)
	END_STRUCT;
	MpPCOMAJProcType : STRUCT (*Define a processing strategy for the objects in the queue of the assigned registers*)
		Type : MpPCOMAJProcEnum; (*Processing selector setting*)
		InfeedOutfeed : MpPCOMAJPInOutType; (*Type mcPCOMAJP_INFEED_OUTFEED settings*)
	END_STRUCT;
	MpPCOMAJExeBxEnum :
		( (*Job execution behaviour selector setting*)
		mcPCOMAJJEB_WAIT_PLH := 0, (*Wait placeholder - Only picks the object when it can be placed immediately*)
		mcPCOMAJJEB_ALW_PICK := 1 (*Always pick - Always picks the object. When it cannot be placed immediately, the robot moves to a waiting position and waits for a placeholder*)
		);
	MpPCOMAJExeBxType : STRUCT (*Behavior of the robot when only a pick position but no place position is available*)
		Type : MpPCOMAJExeBxEnum; (*Job execution behaviour selector setting*)
	END_STRUCT;
	MpPCOpModAsgJobType : STRUCT
		Name : McCfgString250Type;
		Processing : MpPCOMAJProcType; (*Define a processing strategy for the objects in the queue of the assigned registers*)
		JobExecutionBehaviour : MpPCOMAJExeBxType; (*Behavior of the robot when only a pick position but no place position is available*)
	END_STRUCT;
	MpPCOpModIdleBxEnum :
		( (*Idle behavior selector setting*)
		mcPCOMIB_FIX_WAIT_POS := 0 (*Fixed waiting position -*)
		);
	MpPCOMIBSFWPEnum :
		( (*Position selector setting*)
		mcPCOMIBSFWP_STD := 0 (*Standard - Define a PickCore internal position relative to a standard frame in the object hierarchy*)
		);
	MpPCOMIBSFWPStdType : STRUCT (*Type mcPCOMIBSFWP_STD settings*)
		FrameName : STRING[250]; (*Name of Frame defined in object hierarchy or frame hierarchy of an axes group*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	MpPCOMIBSFWPType : STRUCT (*Type of position source*)
		Type : MpPCOMIBSFWPEnum; (*Position selector setting*)
		Standard : MpPCOMIBSFWPStdType; (*Type mcPCOMIBSFWP_STD settings*)
	END_STRUCT;
	MpPCOpModIdleBxFixWaitPosType : STRUCT (*Type mcPCOMIB_FIX_WAIT_POS settings*)
		Position : MpPCOMIBSFWPType; (*Type of position source*)
	END_STRUCT;
	MpPCOpModIdleBxType : STRUCT (*Behavior of robot when no pick-and-place objects available for performing one of the assigned jobs*)
		Type : MpPCOpModIdleBxEnum; (*Idle behavior selector setting*)
		FixedWaitingPosition : MpPCOpModIdleBxFixWaitPosType; (*Type mcPCOMIB_FIX_WAIT_POS settings*)
	END_STRUCT;
	MpCfgPickOpModType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_OP_MOD*)
		Name : STRING[250];
		AssignedJob : ARRAY[0..9] OF MpPCOpModAsgJobType;
		IdleBehavior : MpPCOpModIdleBxType; (*Behavior of robot when no pick-and-place objects available for performing one of the assigned jobs*)
	END_STRUCT;
	MpCfgPickCoreType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_CORE*)
		AxesgroupReference : McCfgReferenceType; (*Name of the axesgroup reference*)
		Gripper : MpPCGripType;
		Job : McCfgUnboundedArrayType; (*Connect array of type MpCfgPickJobType*)
		OperationMode : McCfgUnboundedArrayType; (*Connect array of type MpCfgPickOpModType*)
	END_STRUCT;
	MpPRTypEnum :
		( (*Type selector setting*)
		mcPRT_STAT_POS := 0, (*Static position -*)
		mcPRT_LIN_CNVR := 1 (*Linear conveyor -*)
		);
	MpPRStatType : STRUCT (*Type mcPRT_STAT_POS settings*)
		FrameName : STRING[250]; (*Name of standard frame defined in object hierarchy*)
	END_STRUCT;
	MpPRLinMotSrcEnum :
		( (*Motion source selector setting*)
		mcPRLinMotSrc_POS_PROC_VAR := 0, (*Position process variable - Position process variable*)
		mcPRLinMotSrc_AX := 1 (*Axis - Axis*)
		);
	MpPRLinMotSrcPosPVMoveLimEnum :
		( (*Movement limits selector setting*)
		mcPRLinMotSrcPPVML_INT := 0 (*Internal - Internal definition of limits*)
		);
	MpPRTLCMSPPVMLIVelEnum :
		( (*Velocity selector setting*)
		mcPRLinMotSrcPPVMLIV_BASIC := 0 (*Basic -*)
		);
	MpPRTLCMSPPVMLIVelBasicType : STRUCT (*Type mcPRLinMotSrcPPVMLIV_BASIC settings*)
		Velocity : REAL; (*Velocity limit in any movement direction [measurement units/s]*)
	END_STRUCT;
	MpPRTLCMSPPVMLIVelType : STRUCT (*Limits for velocity*)
		Type : MpPRTLCMSPPVMLIVelEnum; (*Velocity selector setting*)
		Basic : MpPRTLCMSPPVMLIVelBasicType; (*Type mcPRLinMotSrcPPVMLIV_BASIC settings*)
	END_STRUCT;
	MpPRTLCMSPPVMLIAccEnum :
		( (*Acceleration selector setting*)
		mcPRLinMotSrcPPVMLIA_BASIC := 0 (*Basic -*)
		);
	MpPRTLCMSPPVMLIAccBasicType : STRUCT (*Type mcPRLinMotSrcPPVMLIA_BASIC settings*)
		Acceleration : REAL; (*Acceleration limit in any movement direction [measurement units/s²]*)
	END_STRUCT;
	MpPRTLCMSPPVMLIAccType : STRUCT (*Limits for acceleration*)
		Type : MpPRTLCMSPPVMLIAccEnum; (*Acceleration selector setting*)
		Basic : MpPRTLCMSPPVMLIAccBasicType; (*Type mcPRLinMotSrcPPVMLIA_BASIC settings*)
	END_STRUCT;
	MpPRTLCMSPPVMLIDirEnum :
		( (*Direction selector setting*)
		mcPRLinMotSrcPPVMLID_BIDIR := 0, (*Bidir - Conveyor movements are permitted in both positive and negative x-direction*)
		mcPRLinMotSrcPPVMLID_POS_ONLY := 1 (*Positive Only - While the pick-and-place process has started, conveyor movements in the negative x-direction are not permitted*)
		);
	MpPRTLCMSPPVMLIDirType : STRUCT (*Permitted direction of movement during pick-and-place process*)
		Type : MpPRTLCMSPPVMLIDirEnum; (*Direction selector setting*)
	END_STRUCT;
	MpPRTLCMSPPVMLIType : STRUCT (*Type mcPRLinMotSrcPPVML_INT settings*)
		Velocity : MpPRTLCMSPPVMLIVelType; (*Limits for velocity*)
		Acceleration : MpPRTLCMSPPVMLIAccType; (*Limits for acceleration*)
		Direction : MpPRTLCMSPPVMLIDirType; (*Permitted direction of movement during pick-and-place process*)
	END_STRUCT;
	MpPRLinMotSrcPosPVMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		Type : MpPRLinMotSrcPosPVMoveLimEnum; (*Movement limits selector setting*)
		Internal : MpPRTLCMSPPVMLIType; (*Type mcPRLinMotSrcPPVML_INT settings*)
	END_STRUCT;
	MpPRLinMotSrcPosPVPrepEnum :
		( (*Signal preparation selector setting*)
		mcPRLinMotSrcPPVP_NO_PREP := 0, (*No preparation - Suitable for high quality input signals*)
		mcPRLinMotSrcPPVP_LIN_REG := 1 (*Linear regression - Suitable for low quality input signals*)
		);
	MpPRLinMotSrcPosPVPrepLinRegType : STRUCT (*Type mcPRLinMotSrcPPVP_LIN_REG settings*)
		ConsideredSamples : DINT; (*Number of samples used for calculating the velocity [samples]*)
		PositionDisturbance : LREAL; (*Considered magnitude of position disturbance effects [measurement units]*)
	END_STRUCT;
	MpPRLinMotSrcPosPVPrepType : STRUCT (*Preparation of the input signal from Motion source*)
		Type : MpPRLinMotSrcPosPVPrepEnum; (*Signal preparation selector setting*)
		LinearRegression : MpPRLinMotSrcPosPVPrepLinRegType; (*Type mcPRLinMotSrcPPVP_LIN_REG settings*)
	END_STRUCT;
	MpPRLinMotSrcPosPVType : STRUCT (*Type mcPRLinMotSrc_POS_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Input: Process variable for describing the current position of the conveyor axis cyclically*)
		NegativeOverflow : LREAL; (*Overflow of the position process variable in negative direction*)
		PositiveOverflow : LREAL; (*Overflow of the position process variable in positive direction*)
		DelayTime : LREAL; (*Delay time of position input signal used for error compensation (filtering, delay of signals, ...) [s]*)
		MovementLimits : MpPRLinMotSrcPosPVMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
		Preparation : MpPRLinMotSrcPosPVPrepType; (*Preparation of the input signal from Motion source*)
	END_STRUCT;
	MpPRLinMotSrcAxAxUseEnum :
		( (*Axis usage selector setting*)
		mcPRLinMotSrcAAU_ACT := 0, (*Active - The configured axis actively moves the transport system*)
		mcPRLinMotSrcAAU_PASS := 1 (*Passive - The configured axis is used to filter the position input signal only*)
		);
	MpPRLinMotSrcAxisCCEnum :
		( (*Command consideration selector setting*)
		mcPRLinMotSrcAxisCC_NOT_USE := 0, (*Not used - The internal motion planning does not consider motion commands sent to the configured axis. Automatic delay time compensation is available.*)
		mcPRLinMotSrcAxisCC_BASIC := 1 (*Basic - The internal motion planning considers basic motion commands sent to the configured axis. Automatic delay time compensation is not available.*)
		);
	MpPRLinMotSrcAxisCCType : STRUCT (*Defines how motion commands sent to the configured axis are used*)
		Type : MpPRLinMotSrcAxisCCEnum; (*Command consideration selector setting*)
	END_STRUCT;
	MpPRLinMotSrcAxAxUseActType : STRUCT (*Type mcPRLinMotSrcAAU_ACT settings*)
		CommandConsideration : MpPRLinMotSrcAxisCCType; (*Defines how motion commands sent to the configured axis are used*)
	END_STRUCT;
	MpPRLinMotSrcAxAxUseType : STRUCT (*Defines how the axis is used*)
		Type : MpPRLinMotSrcAxAxUseEnum; (*Axis usage selector setting*)
		Active : MpPRLinMotSrcAxAxUseActType; (*Type mcPRLinMotSrcAAU_ACT settings*)
	END_STRUCT;
	MpPRLinMotSrcAxMoveLimEnum :
		( (*Movement limits selector setting*)
		mcPRLinMotSrcAML_USE_AX_LIM := 0, (*Use axis limits - Internal definition of limits*)
		mcPRLinMotSrcAML_INT := 1 (*Internal - Internal definition of limits*)
		);
	MpPRTLCMSAMLUALDirEnum :
		( (*Direction selector setting*)
		mcPRLinMotSrcAMLUALD_BIDIR := 0, (*Bidir - Conveyor movements are permitted in both positive and negative x-direction*)
		mcPRLinMotSrcAMLUALD_POS_ONLY := 1 (*Positive Only - While the pick-and-place process has started, conveyor movements in the negative x-direction are not permitted*)
		);
	MpPRTLCMSAMLUALDirType : STRUCT (*Permitted direction of movement during pick-and-place process*)
		Type : MpPRTLCMSAMLUALDirEnum; (*Direction selector setting*)
	END_STRUCT;
	MpPRTLCMSAMLUALType : STRUCT (*Type mcPRLinMotSrcAML_USE_AX_LIM settings*)
		Direction : MpPRTLCMSAMLUALDirType; (*Permitted direction of movement during pick-and-place process*)
	END_STRUCT;
	MpPRTLCMSAMLIVelEnum :
		( (*Velocity selector setting*)
		mcPRLinMotSrcAMLIV_BASIC := 0 (*Basic -*)
		);
	MpPRTLCMSAMLIVelBasicType : STRUCT (*Type mcPRLinMotSrcAMLIV_BASIC settings*)
		Velocity : REAL; (*Velocity limit in any movement direction [measurement units/s]*)
	END_STRUCT;
	MpPRTLCMSAMLIVelType : STRUCT (*Limits for velocity*)
		Type : MpPRTLCMSAMLIVelEnum; (*Velocity selector setting*)
		Basic : MpPRTLCMSAMLIVelBasicType; (*Type mcPRLinMotSrcAMLIV_BASIC settings*)
	END_STRUCT;
	MpPRTLCMSAMLIAccEnum :
		( (*Acceleration selector setting*)
		mcPRLinMotSrcAMLIA_BASIC := 0 (*Basic -*)
		);
	MpPRTLCMSAMLIAccBasicType : STRUCT (*Type mcPRLinMotSrcAMLIA_BASIC settings*)
		Acceleration : REAL; (*Acceleration limit in any movement direction [measurement units/s²]*)
	END_STRUCT;
	MpPRTLCMSAMLIAccType : STRUCT (*Limits for acceleration*)
		Type : MpPRTLCMSAMLIAccEnum; (*Acceleration selector setting*)
		Basic : MpPRTLCMSAMLIAccBasicType; (*Type mcPRLinMotSrcAMLIA_BASIC settings*)
	END_STRUCT;
	MpPRTLCMSAMLIDirEnum :
		( (*Direction selector setting*)
		mcPRLinMotSrcAMLID_BIDIR := 0, (*Bidir - Conveyor movements are permitted in both positive and negative x-direction*)
		mcPRLinMotSrcAMLID_POS_ONLY := 1 (*Positive Only - While the pick-and-place process has started, conveyor movements in the negative x-direction are not permitted*)
		);
	MpPRTLCMSAMLIDirType : STRUCT (*Permitted direction of movement during pick-and-place process*)
		Type : MpPRTLCMSAMLIDirEnum; (*Direction selector setting*)
	END_STRUCT;
	MpPRTLCMSAMLIType : STRUCT (*Type mcPRLinMotSrcAML_INT settings*)
		Velocity : MpPRTLCMSAMLIVelType; (*Limits for velocity*)
		Acceleration : MpPRTLCMSAMLIAccType; (*Limits for acceleration*)
		Direction : MpPRTLCMSAMLIDirType; (*Permitted direction of movement during pick-and-place process*)
	END_STRUCT;
	MpPRLinMotSrcAxMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		Type : MpPRLinMotSrcAxMoveLimEnum; (*Movement limits selector setting*)
		UseAxisLimits : MpPRTLCMSAMLUALType; (*Type mcPRLinMotSrcAML_USE_AX_LIM settings*)
		Internal : MpPRTLCMSAMLIType; (*Type mcPRLinMotSrcAML_INT settings*)
	END_STRUCT;
	MpPRLinMotSrcAxPrepEnum :
		( (*Signal preparation selector setting*)
		mcPRLinMotSrcAP_NO_PREP := 0, (*No preparation - Suitable for high quality input signals*)
		mcPRLinMotSrcAP_LIN_REG := 1 (*Linear regression - Suitable for low quality input signals*)
		);
	MpPRLinMotSrcAxPrepLinRegType : STRUCT (*Type mcPRLinMotSrcAP_LIN_REG settings*)
		ConsideredSamples : DINT; (*Number of samples used for calculating the velocity [samples]*)
		PositionDisturbance : LREAL; (*Considered magnitude of position disturbance effects [measurement units]*)
	END_STRUCT;
	MpPRLinMotSrcAxPrepType : STRUCT (*Preparation of the input signal from Motion source*)
		Type : MpPRLinMotSrcAxPrepEnum; (*Signal preparation selector setting*)
		LinearRegression : MpPRLinMotSrcAxPrepLinRegType; (*Type mcPRLinMotSrcAP_LIN_REG settings*)
	END_STRUCT;
	MpPRLinMotSrcAxType : STRUCT (*Type mcPRLinMotSrc_AX settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
		AxisUsage : MpPRLinMotSrcAxAxUseType; (*Defines how the axis is used*)
		DelayTime : LREAL; (*Additional delay time of position input signal used for error compensation [s]*)
		MovementLimits : MpPRLinMotSrcAxMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
		Preparation : MpPRLinMotSrcAxPrepType; (*Preparation of the input signal from Motion source*)
	END_STRUCT;
	MpPRLinMotSrcType : STRUCT (*Source describing the conveyor movement (along the x-direction)*)
		Type : MpPRLinMotSrcEnum; (*Motion source selector setting*)
		PositionProcessVariable : MpPRLinMotSrcPosPVType; (*Type mcPRLinMotSrc_POS_PROC_VAR settings*)
		Axis : MpPRLinMotSrcAxType; (*Type mcPRLinMotSrc_AX settings*)
	END_STRUCT;
	MpPRLinType : STRUCT (*Type mcPRT_LIN_CNVR settings*)
		FrameName : STRING[250]; (*Name of standard frame defined in object hierarchy*)
		Length : LREAL; (*Length of the conveyor (Along the x-direction of the defined standard frame). At the end of the conveyor all created place holders will be deleted. [measurement units]*)
		Width : LREAL; (*Width of the conveyor (Along the y-direction of the defined standard frame) [measurement units]*)
		Height : LREAL; (*Height of the register (Along the z-direction of the defined standard frame). Defines the maximum offset in z-direction for objects to be created [measurement units]*)
		ObjectCount : UDINT; (*Maximum number of pick-and-place objects and pick-and-place object placeholders*)
		MaxPositionError : LREAL; (*Maximum deviation between register items and the position of the motion source when compensating the position input signal, taking into account configured movement limits [measurement units]*)
		MotionSource : MpPRLinMotSrcType; (*Source describing the conveyor movement (along the x-direction)*)
	END_STRUCT;
	MpPRTypType : STRUCT
		Type : MpPRTypEnum; (*Type selector setting*)
		StaticPosition : MpPRStatType; (*Type mcPRT_STAT_POS settings*)
		LinearConveyor : MpPRLinType; (*Type mcPRT_LIN_CNVR settings*)
	END_STRUCT;
	MpCfgPickRegType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_REG*)
		Type : MpPRTypType;
	END_STRUCT;
	MpPRSVEnum :
		( (*Scene Viewer Object selector setting*)
		mcPRSSVO_USE := 0, (*Used - Register object is used*)
		mcPRSSVO_NOT_USE := 1 (*Not used -*)
		);
	MpPRSVUseNameEnum :
		( (*Name selector setting*)
		mcPRSSVOUN_VIS := 0, (*Visible - Name is displayed*)
		mcPRSSVOUN_INVIS := 1 (*Invisible - Name is hidden*)
		);
	MpPRSVUseNameType : STRUCT (*Defines if PickRegister name is visible*)
		Type : MpPRSVUseNameEnum; (*Name selector setting*)
	END_STRUCT;
	MpPRSVUseFrmEnum :
		( (*Frame selector setting*)
		mcPRSSVOUF_VIS := 0, (*Visible - Frame is displayed*)
		mcPRSSVOUF_INVIS := 1 (*Invisible - Frame is hidden*)
		);
	MpPRSVUseFrmType : STRUCT (*Defines if PickRegister frame is be visible*)
		Type : MpPRSVUseFrmEnum; (*Frame selector setting*)
	END_STRUCT;
	MpPRSVUseDimEnum :
		( (*Dimensions selector setting*)
		mcPRSSVOUD_VIS := 0, (*Visible - Dimensions are displayed*)
		mcPRSSVOUD_INVIS := 1 (*Invisible - Dimensions are hidden*)
		);
	MpPRSVUseDimVisType : STRUCT (*Type mcPRSSVOUD_VIS settings*)
		Material : McScnSurfaceEnum; (*Material*)
		Opacitiy : REAL; (*Opacitiy*)
	END_STRUCT;
	MpPRSVUseDimInvisType : STRUCT (*Type mcPRSSVOUD_INVIS settings*)
		Material : McScnSurfaceEnum; (*Material*)
		Opacitiy : REAL; (*Opacitiy*)
	END_STRUCT;
	MpPRSVUseDimType : STRUCT (*Defines if dimensions are visible in order to show the actual PickRegister*)
		Type : MpPRSVUseDimEnum; (*Dimensions selector setting*)
		Visible : MpPRSVUseDimVisType; (*Type mcPRSSVOUD_VIS settings*)
		Invisible : MpPRSVUseDimInvisType; (*Type mcPRSSVOUD_INVIS settings*)
	END_STRUCT;
	MpPRSVUseVREnum :
		( (*Visual representation selector setting*)
		mcPRSSVOUVR_NOT_USE := 0, (*Not used - No additional representation*)
		mcPRSSVOUVR_CUBE := 1, (*Cuboid - Shows a cuboid under the PickRegister*)
		mcPRSSVOUVR_CNVR_BELT := 2 (*Conveyor belt - Shows a conveyor belt under the PickRegister*)
		);
	MpPRSVUseVRCubeDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length of the cuboid [measurement units]*)
		Width : LREAL; (*Width of the cuboid [measurement units]*)
		Height : LREAL; (*Height of the cuboid [measurement units]*)
	END_STRUCT;
	MpPRSVUseVRCubeType : STRUCT (*Type mcPRSSVOUVR_CUBE settings*)
		Dimensions : MpPRSVUseVRCubeDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVUseVRCnvrBeltDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length of the conveyor belt [measurement units]*)
		Width : LREAL; (*Width of the conveyor belt [measurement units]*)
		Height : LREAL; (*Height of the conveyor belt [measurement units]*)
	END_STRUCT;
	MpPRSVUseVRCnvrBeltType : STRUCT (*Type mcPRSSVOUVR_CNVR_BELT settings*)
		Dimensions : MpPRSVUseVRCnvrBeltDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVUseVRType : STRUCT (*Defines a (physical) object representing the PickRegister*)
		Type : MpPRSVUseVREnum; (*Visual representation selector setting*)
		Cuboid : MpPRSVUseVRCubeType; (*Type mcPRSSVOUVR_CUBE settings*)
		ConveyorBelt : MpPRSVUseVRCnvrBeltType; (*Type mcPRSSVOUVR_CNVR_BELT settings*)
	END_STRUCT;
	MpPRSVUseContEnum :
		( (*Content selector setting*)
		mcPRSSVOUC_NOT_USE := 0, (*Not used - PickRegister object visualization is deactivated*)
		mcPRSSVOUC_VIS := 1 (*Visible - PickRegister object visualization is activated*)
		);
	MpPRSVTmplVREnum :
		( (*Visual representation selector setting*)
		mcPRSSVOUCVTVR_NOT_USE := 0, (*Not used - Item is not dispalyed*)
		mcPRSSVOUCVTVR_FRM := 1, (*Frame - Item is displayed as a frame*)
		mcPRSSVOUCVTVR_SHP_2D := 2, (*Shape 2D - Item is displayed as a 2D shape*)
		mcPRSSVOUCVTVR_SHP_3D := 3, (*Shape 3D - Item is displayed as a 3D shape*)
		mcPRSSVOUCVTVR_MESH_3D := 4 (*Mesh 3D - Register item is displayed as a 3D mesh*)
		);
	MpPRSVContFrmType : STRUCT (*Type mcPRSSVOUCVTVR_FRM settings*)
		Size : LREAL; (*Size [measurement units]*)
	END_STRUCT;
	MpPRSVCont2DShpTypEnum :
		( (*Shape type selector setting*)
		mcPRSSVOUCVTVRS2ST_CIR := 0, (*Circle - Circle*)
		mcPRSSVOUCVTVRS2ST_RECT := 1, (*Rectangle - Rectangle*)
		mcPRSSVOUCVTVRS2ST_TRPZ := 2 (*Trapezoid - Trapezoid*)
		);
	MpPRSVCont2DShpTypCirDimType : STRUCT (*Dimensions of the object*)
		Radius : LREAL; (*Dimension in the x-direction [measurement units]*)
	END_STRUCT;
	MpPRSVCont2DShpTypCirStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS2STCS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS2STCS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont2DShpTypCirStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont2DShpTypCirStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont2DShpTypCirType : STRUCT (*Type mcPRSSVOUCVTVRS2ST_CIR settings*)
		Dimensions : MpPRSVCont2DShpTypCirDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont2DShpTypCirStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont2DShpTypRectDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length [measurement units]*)
		Width : LREAL; (*Width [measurement units]*)
	END_STRUCT;
	MpPRSVCont2DShpTypRectStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS2STRS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS2STRS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont2DShpTypRectStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont2DShpTypRectStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont2DShpTypRectType : STRUCT (*Type mcPRSSVOUCVTVRS2ST_RECT settings*)
		Dimensions : MpPRSVCont2DShpTypRectDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont2DShpTypRectStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont2DShpTypTrpzDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length [measurement units]*)
		Width : LREAL; (*Width [measurement units]*)
	END_STRUCT;
	MpPRSVCont2DShpTypTrpzStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS2STTS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS2STTS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont2DShpTypTrpzStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont2DShpTypTrpzStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont2DShpTypTrpzType : STRUCT (*Type mcPRSSVOUCVTVRS2ST_TRPZ settings*)
		Dimensions : MpPRSVCont2DShpTypTrpzDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont2DShpTypTrpzStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont2DShpTypType : STRUCT (*Shape type*)
		Type : MpPRSVCont2DShpTypEnum; (*Shape type selector setting*)
		Circle : MpPRSVCont2DShpTypCirType; (*Type mcPRSSVOUCVTVRS2ST_CIR settings*)
		Rectangle : MpPRSVCont2DShpTypRectType; (*Type mcPRSSVOUCVTVRS2ST_RECT settings*)
		Trapezoid : MpPRSVCont2DShpTypTrpzType; (*Type mcPRSSVOUCVTVRS2ST_TRPZ settings*)
	END_STRUCT;
	MpPRSVCont2DType : STRUCT (*Type mcPRSSVOUCVTVR_SHP_2D settings*)
		ShapeType : MpPRSVCont2DShpTypType; (*Shape type*)
	END_STRUCT;
	MpPRSVCont3DTypEnum :
		( (*Type selector setting*)
		mcPRSSVOUCVTVRS3T_CUBE := 0, (*Cuboid - Cuboid*)
		mcPRSSVOUCVTVRS3T_CYLINDER := 1, (*Cylinder - Cylinder*)
		mcPRSSVOUCVTVRS3T_TRPZ_PRSM := 2 (*Trapezoidal prism - Trapezoidal prism*)
		);
	MpPRSVCont3DTypCubeDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length [measurement units]*)
		Width : LREAL; (*Width [measurement units]*)
		Height : LREAL; (*Height [measurement units]*)
	END_STRUCT;
	MpPRSVCont3DTypCubeStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS3TCS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS3TCS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont3DTypCubeStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont3DTypCubeStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont3DTypCubeType : STRUCT (*Type mcPRSSVOUCVTVRS3T_CUBE settings*)
		Dimensions : MpPRSVCont3DTypCubeDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont3DTypCubeStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont3DTypCylinderDimType : STRUCT (*Dimensions of the object*)
		Radius : LREAL; (*Radius [measurement units]*)
		Height : LREAL; (*Height [measurement units]*)
	END_STRUCT;
	MpPRSVCont3DTypCylinderStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS3TCySS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS3TCySS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont3DTypCylinderStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont3DTypCylinderStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont3DTypCylinderType : STRUCT (*Type mcPRSSVOUCVTVRS3T_CYLINDER settings*)
		Dimensions : MpPRSVCont3DTypCylinderDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont3DTypCylinderStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont3DTypTrpzPrsmDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length [measurement units]*)
		Width : LREAL; (*Width [measurement units]*)
		Height : LREAL; (*Height [measurement units]*)
	END_STRUCT;
	MpPRSVCont3DTypTrpzPrsmStyleEnum :
		( (*Style selector setting*)
		mcPRSSVOUCVTVRS3TTPS_FILL := 0, (*Fill - Fill*)
		mcPRSSVOUCVTVRS3TTPS_BORDER := 1 (*Border - Border*)
		);
	MpPRSVCont3DTypTrpzPrsmStyleType : STRUCT (*Shape style*)
		Type : MpPRSVCont3DTypTrpzPrsmStyleEnum; (*Style selector setting*)
	END_STRUCT;
	MpPRSVCont3DTypTrpzPrsmType : STRUCT (*Type mcPRSSVOUCVTVRS3T_TRPZ_PRSM settings*)
		Dimensions : MpPRSVCont3DTypTrpzPrsmDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Style : MpPRSVCont3DTypTrpzPrsmStyleType; (*Shape style*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVCont3DTypType : STRUCT (*Shape type*)
		Type : MpPRSVCont3DTypEnum; (*Type selector setting*)
		Cuboid : MpPRSVCont3DTypCubeType; (*Type mcPRSSVOUCVTVRS3T_CUBE settings*)
		Cylinder : MpPRSVCont3DTypCylinderType; (*Type mcPRSSVOUCVTVRS3T_CYLINDER settings*)
		TrapezoidalPrism : MpPRSVCont3DTypTrpzPrsmType; (*Type mcPRSSVOUCVTVRS3T_TRPZ_PRSM settings*)
	END_STRUCT;
	MpPRSVCont3DType : STRUCT (*Type mcPRSSVOUCVTVR_SHP_3D settings*)
		Type : MpPRSVCont3DTypType; (*Shape type*)
	END_STRUCT;
	MpPRSVContMeshType : STRUCT (*Type mcPRSSVOUCVTVR_MESH_3D settings*)
		FileName : STRING[250]; (*File name of 3D mesh located at file device configured in object hierarchy. Supported format: *.stl*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	MpPRSVTmplVRType : STRUCT (*Visual representation of PickRegister item*)
		Type : MpPRSVTmplVREnum; (*Visual representation selector setting*)
		Frame : MpPRSVContFrmType; (*Type mcPRSSVOUCVTVR_FRM settings*)
		Shape2D : MpPRSVCont2DType; (*Type mcPRSSVOUCVTVR_SHP_2D settings*)
		Shape3D : MpPRSVCont3DType; (*Type mcPRSSVOUCVTVR_SHP_3D settings*)
		Mesh3D : MpPRSVContMeshType; (*Type mcPRSSVOUCVTVR_MESH_3D settings*)
	END_STRUCT;
	MpPRSVOBJSTStatEnum :
		( (*Object state*)
		mcPRSVOBJS_NOT_USE := 0, (*Not used - No filter*)
		mcPRSVOBJS_SNG_ITEM_OBJ := 1, (*Single item object - Representation of single item*)
		mcPRSVOBJS_SNG_ITEM_PLH := 2, (*Single item placeholder - Representation of single item placeholder*)
		mcPRSVOBJS_EMPTY_CNTR := 3, (*Empty container - Representation of empty container object*)
		mcPRSVOBJS_FULLY_FILL_CNTR := 4, (*Fully filled container - Representation of fully filled container object*)
		mcPRSVOBJS_PART_FILL_CNTR := 5, (*Partially filled container - Representation of partially filled container*)
		mcPRSVOBJS_CNTR_PLH := 6, (*Container placeholder - Representation of container placeholder*)
		mcPRSVOBJS_OBJ_IN_CNTR := 7, (*Object in container - Representation of single item object in a container*)
		mcPRSVOBJS_PLH_IN_CNTR := 8 (*Placeholder in container - Representation of single item placeholder in a container*)
		);
	MpPRSVOBJSTType : STRUCT (*Select object state*)
		State : McCfgUnboundedArrayType; (*Object state (Connect array of type MpPRSVOBJSTStatEnum)*)
	END_STRUCT;
	MpPRSVTmplFltrObjTypNameType : STRUCT (*Select object type*)
		Name : McCfgUnboundedArrayType; (*Name of object type defined in the PickObjectList configuration (Connect array of type STRING)*)
	END_STRUCT;
	MpPRSVTmplFltrType : STRUCT (*Filter to select specific objects to be represented with the defined shape*)
		ObjectState : MpPRSVOBJSTType; (*Select object state*)
		ObjectTypeName : MpPRSVTmplFltrObjTypNameType; (*Select object type*)
	END_STRUCT;
	MpPRSVTmplType : STRUCT (*Customized template to visualize PickRegister objects based on specific needs*)
		VisualRepresentation : MpPRSVTmplVRType; (*Visual representation of PickRegister item*)
		Filter : MpPRSVTmplFltrType; (*Filter to select specific objects to be represented with the defined shape*)
	END_STRUCT;
	MpPRSVUseContVisType : STRUCT (*Type mcPRSSVOUC_VIS settings*)
		Template : McCfgUnboundedArrayType; (*Customized template to visualize PickRegister objects based on specific needs (Connect array of type MpPRSVTmplType)*)
	END_STRUCT;
	MpPRSVUseContType : STRUCT (*Defines if and how the objects in the PickRegister are visualized*)
		Type : MpPRSVUseContEnum; (*Content selector setting*)
		Visible : MpPRSVUseContVisType; (*Type mcPRSSVOUC_VIS settings*)
	END_STRUCT;
	MpPRSVUseType : STRUCT (*Type mcPRSSVO_USE settings*)
		Name : MpPRSVUseNameType; (*Defines if PickRegister name is visible*)
		Frame : MpPRSVUseFrmType; (*Defines if PickRegister frame is be visible*)
		Dimensions : MpPRSVUseDimType; (*Defines if dimensions are visible in order to show the actual PickRegister*)
		VisualRepresentation : MpPRSVUseVRType; (*Defines a (physical) object representing the PickRegister*)
		Content : MpPRSVUseContType; (*Defines if and how the objects in the PickRegister are visualized*)
	END_STRUCT;
	MpPRSVType : STRUCT (*Defines if the PickRegister is contained in the automatically generated scene*)
		Type : MpPRSVEnum; (*Scene Viewer Object selector setting*)
		Used : MpPRSVUseType; (*Type mcPRSSVO_USE settings*)
	END_STRUCT;
	MpCfgPickRegScnType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_REG_SCN*)
		SceneViewerObject : MpPRSVType; (*Defines if the PickRegister is contained in the automatically generated scene*)
	END_STRUCT;
	MpPOLObjEnum :
		( (*Object '{/}' selector setting*)
		mcPOLO_SNG_ITEM := 0, (*Single item - Single pick-and-place item*)
		mcPOLO_CNTR := 1 (*Container - Physical or virtual container for pick-and-place objects. A container can be picked and placed as well. A container without a mass defines only the layout of pick-and-place objects*)
		);
	MpPOLObjSngItemLdEnum :
		( (*Load selector setting*)
		mcPOLOSIL_NOT_USE := 0, (*Not used -*)
		mcPOLOSIL_TBL := 1, (*Table - Product load parameters table reference*)
		mcPOLOSIL_BASIC := 2 (*Basic - Dynamic parameters representing object load*)
		);
	MpPOLObjSngItemLdTblType : STRUCT (*Type mcPOLOSIL_TBL settings*)
		ProductLoadTable : McCfgReferenceType; (*Dynamic parameters table of product load*)
	END_STRUCT;
	MpPOLObjSngItemLdType : STRUCT (*Selected object load definition for dynamics consideration*)
		Type : MpPOLObjSngItemLdEnum; (*Load selector setting*)
		Table : MpPOLObjSngItemLdTblType; (*Type mcPOLOSIL_TBL settings*)
	END_STRUCT;
	MpPOLObjSngItemType : STRUCT (*Type mcPOLO_SNG_ITEM settings*)
		Name : STRING[250]; (*Name of the pick-and-place object*)
		Load : MpPOLObjSngItemLdType; (*Selected object load definition for dynamics consideration*)
	END_STRUCT;
	MpPOLObjCntrLdEnum :
		( (*Load selector setting*)
		mcPOLOCL_NOT_USE := 0, (*Not used -*)
		mcPOLOCL_TBL := 1, (*Table - Product load parameters table reference*)
		mcPOLOCL_BASIC := 2 (*Basic - Dynamic parameters representing object load*)
		);
	MpPOLObjCntrLdTblType : STRUCT (*Type mcPOLOCL_TBL settings*)
		ProductLoadTable : McCfgReferenceType; (*Dynamic parameters table of product load*)
	END_STRUCT;
	MpPOLObjCntrLdType : STRUCT (*Selected object load definition for dynamics consideration*)
		Type : MpPOLObjCntrLdEnum; (*Load selector setting*)
		Table : MpPOLObjCntrLdTblType; (*Type mcPOLOCL_TBL settings*)
	END_STRUCT;
	MpPOLObjCntrLyrPosType : STRUCT
		Object : McCfgString250Type; (*Pick-and-place object assigned to this position*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	MpPOLObjCntrLyrType : STRUCT (*Fill the container: Layer n+1 is only available if layer n was already filled. Empty the container: Layer n is only available when n+1 was emptied*)
		Position : McCfgUnboundedArrayType; (*Connect array of type MpPOLObjCntrLyrPosType*)
	END_STRUCT;
	MpPOLObjCntrType : STRUCT (*Type mcPOLO_CNTR settings*)
		Name : STRING[250]; (*Name of the pick-and-place object*)
		Load : MpPOLObjCntrLdType; (*Selected object load definition for dynamics consideration*)
		Layer : McCfgUnboundedArrayType; (*Fill the container: Layer n+1 is only available if layer n was already filled. Empty the container: Layer n is only available when n+1 was emptied (Connect array of type MpPOLObjCntrLyrType)*)
	END_STRUCT;
	MpPOLObjType : STRUCT
		Type : MpPOLObjEnum; (*Object '{/}' selector setting*)
		SingleItem : MpPOLObjSngItemType; (*Type mcPOLO_SNG_ITEM settings*)
		Container : MpPOLObjCntrType; (*Type mcPOLO_CNTR settings*)
	END_STRUCT;
	MpCfgPickObjLstType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_OBJ_LST*)
		Object : McCfgUnboundedArrayType; (*Connect array of type MpPOLObjType*)
	END_STRUCT;
END_TYPE