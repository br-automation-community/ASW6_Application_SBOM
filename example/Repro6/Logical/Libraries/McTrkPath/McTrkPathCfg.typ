TYPE
	McTPTypEnum :
		( (*Type selector setting*)
		mcTPT_LIN := 0 (*Linear - Linear TrackingPath*)
		);
	McTPLinMotSrcEnum :
		( (*Motion source selector setting*)
		mcTPTLMS_POS_PROC_VAR := 0, (*Position process variable - Position provided by process variable*)
		mcTPTLMS_AX := 1 (*Axis - Axis*)
		);
	McTPLinMotSrcPosPVMoveLimEnum :
		( (*Movement limits selector setting*)
		mcTPTLMSPPVML_INT := 0 (*Internal - Internal definition of limits*)
		);
	McTPLMSPPVMLIVelEnum :
		( (*Velocity selector setting*)
		mcTPTLMSPPVMLIV_BASIC := 0 (*Basic -*)
		);
	McTPLMSPPVMLIVelBasicType : STRUCT (*Type mcTPTLMSPPVMLIV_BASIC settings*)
		Velocity : REAL; (*Velocity limit in any movement direction [measurement units/s]*)
	END_STRUCT;
	McTPLMSPPVMLIVelType : STRUCT (*Limits for velocity*)
		Type : McTPLMSPPVMLIVelEnum; (*Velocity selector setting*)
		Basic : McTPLMSPPVMLIVelBasicType; (*Type mcTPTLMSPPVMLIV_BASIC settings*)
	END_STRUCT;
	McTPLMSPPVMLIAccEnum :
		( (*Acceleration selector setting*)
		mcTPTLMSPPVMLIA_BASIC := 0 (*Basic -*)
		);
	McTPLMSPPVMLIAccBasicType : STRUCT (*Type mcTPTLMSPPVMLIA_BASIC settings*)
		Acceleration : REAL; (*Acceleration limit in any movement direction [measurement units/s²]*)
	END_STRUCT;
	McTPLMSPPVMLIAccType : STRUCT (*Limits for acceleration*)
		Type : McTPLMSPPVMLIAccEnum; (*Acceleration selector setting*)
		Basic : McTPLMSPPVMLIAccBasicType; (*Type mcTPTLMSPPVMLIA_BASIC settings*)
	END_STRUCT;
	McTPLMSPPVMLIType : STRUCT (*Type mcTPTLMSPPVML_INT settings*)
		Velocity : McTPLMSPPVMLIVelType; (*Limits for velocity*)
		Acceleration : McTPLMSPPVMLIAccType; (*Limits for acceleration*)
	END_STRUCT;
	McTPLinMotSrcPosPVMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		Type : McTPLinMotSrcPosPVMoveLimEnum; (*Movement limits selector setting*)
		Internal : McTPLMSPPVMLIType; (*Type mcTPTLMSPPVML_INT settings*)
	END_STRUCT;
	McTPLinMotSrcPosPVPrepEnum :
		( (*Signal preparation selector setting*)
		mcTPTLMSPPVP_NO_PREP := 0, (*No preparation - Suitable for high quality input signals*)
		mcTPTLMSPPVP_LIN_REG := 1 (*Linear regression - Suitable for low quality input signals*)
		);
	McTPLinMotSrcPosPVPrepLinRegType : STRUCT (*Type mcTPTLMSPPVP_LIN_REG settings*)
		ConsideredSamples : DINT; (*Number of samples used for calculating the velocity [samples]*)
		PositionDisturbance : LREAL; (*Considered magnitude of position disturbance effects [measurement units]*)
	END_STRUCT;
	McTPLinMotSrcPosPVPrepType : STRUCT (*Preparation of the input signal*)
		Type : McTPLinMotSrcPosPVPrepEnum; (*Signal preparation selector setting*)
		LinearRegression : McTPLinMotSrcPosPVPrepLinRegType; (*Type mcTPTLMSPPVP_LIN_REG settings*)
	END_STRUCT;
	McTPLinMotSrcPosPVType : STRUCT (*Type mcTPTLMS_POS_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable name to get current position*)
		NegativeOverflow : LREAL; (*Position overflow in negative direction*)
		PositiveOverflow : LREAL; (*Position overflow in positive direction*)
		DelayTime : LREAL; (*Delay time of TrackingPath position signal for error compensation (filtering, delay of signals, ...) [s]*)
		MovementLimits : McTPLinMotSrcPosPVMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
		Preparation : McTPLinMotSrcPosPVPrepType; (*Preparation of the input signal*)
	END_STRUCT;
	McTPLinMotSrcAxAxUseEnum :
		( (*Axis usage selector setting*)
		mcTPTLMSAAU_ACT := 0, (*Active - The configured axis actively moves the transport system*)
		mcTPTLMSAAU_PASS := 1 (*Passive - The configured axis is used to filter the position input signal only*)
		);
	McTPLinCCEnum :
		( (*Command consideration selector setting*)
		mcTPLINCC_NOT_USE := 0, (*Not used - The internal motion planning does not consider motion commands sent to the configured axis. Automatic delay time compensation is available.*)
		mcTPLINCC_SPT_BASIC_CMD := 1 (*Support basic commands - The internal motion planning considers basic motion commands sent to the configured axis. Automatic delay time compensation is not available.*)
		);
	McTPLinCCType : STRUCT (*Defines how motion commands sent to the configured axis are used*)
		Type : McTPLinCCEnum; (*Command consideration selector setting*)
	END_STRUCT;
	McTPLinMotSrcAxAxUseActType : STRUCT (*Type mcTPTLMSAAU_ACT settings*)
		CommandConsideration : McTPLinCCType; (*Defines how motion commands sent to the configured axis are used*)
	END_STRUCT;
	McTPLinMotSrcAxAxUseType : STRUCT (*Defines how the axis is used*)
		Type : McTPLinMotSrcAxAxUseEnum; (*Axis usage selector setting*)
		Active : McTPLinMotSrcAxAxUseActType; (*Type mcTPTLMSAAU_ACT settings*)
	END_STRUCT;
	McTPLinMotSrcAxMoveLimEnum :
		( (*Movement limits selector setting*)
		mcTPTLMSAML_USE_AX_LIM := 0, (*Use axis limits - Internal definition of limits*)
		mcTPTLMSAML_INT := 1 (*Internal - Internal definition of limits*)
		);
	McTPLMSAMLIVelEnum :
		( (*Velocity selector setting*)
		mcTPTLMSAMLIV_BASIC := 0 (*Basic -*)
		);
	McTPLMSAMLIVelBasicType : STRUCT (*Type mcTPTLMSAMLIV_BASIC settings*)
		Velocity : REAL; (*Velocity limit in any movement direction [measurement units/s]*)
	END_STRUCT;
	McTPLMSAMLIVelType : STRUCT (*Limits for velocity*)
		Type : McTPLMSAMLIVelEnum; (*Velocity selector setting*)
		Basic : McTPLMSAMLIVelBasicType; (*Type mcTPTLMSAMLIV_BASIC settings*)
	END_STRUCT;
	McTPLMSAMLIAccEnum :
		( (*Acceleration selector setting*)
		mcTPTLMSAMLIA_BASIC := 0 (*Basic -*)
		);
	McTPLMSAMLIAccBasicType : STRUCT (*Type mcTPTLMSAMLIA_BASIC settings*)
		Acceleration : REAL; (*Acceleration limit in any movement direction [measurement units/s²]*)
	END_STRUCT;
	McTPLMSAMLIAccType : STRUCT (*Limits for acceleration*)
		Type : McTPLMSAMLIAccEnum; (*Acceleration selector setting*)
		Basic : McTPLMSAMLIAccBasicType; (*Type mcTPTLMSAMLIA_BASIC settings*)
	END_STRUCT;
	McTPLMSAMLIType : STRUCT (*Type mcTPTLMSAML_INT settings*)
		Velocity : McTPLMSAMLIVelType; (*Limits for velocity*)
		Acceleration : McTPLMSAMLIAccType; (*Limits for acceleration*)
	END_STRUCT;
	McTPLinMotSrcAxMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		Type : McTPLinMotSrcAxMoveLimEnum; (*Movement limits selector setting*)
		Internal : McTPLMSAMLIType; (*Type mcTPTLMSAML_INT settings*)
	END_STRUCT;
	McTPLinMotSrcAxPrepEnum :
		( (*Signal preparation selector setting*)
		mcTPTLMSAP_NO_PREP := 0, (*No preparation - Suitable for high quality input signals*)
		mcTPTLMSAP_LIN_REG := 1 (*Linear regression - Suitable for low quality input signals*)
		);
	McTPLinMotSrcAxPrepLinRegType : STRUCT (*Type mcTPTLMSAP_LIN_REG settings*)
		ConsideredSamples : DINT; (*Number of samples used for calculating the velocity [samples]*)
		PositionDisturbance : LREAL; (*Considered magnitude of position disturbance effects [measurement units]*)
	END_STRUCT;
	McTPLinMotSrcAxPrepType : STRUCT (*Preparation of the input signal*)
		Type : McTPLinMotSrcAxPrepEnum; (*Signal preparation selector setting*)
		LinearRegression : McTPLinMotSrcAxPrepLinRegType; (*Type mcTPTLMSAP_LIN_REG settings*)
	END_STRUCT;
	McTPLinMotSrcAxType : STRUCT (*Type mcTPTLMS_AX settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
		AxisUsage : McTPLinMotSrcAxAxUseType; (*Defines how the axis is used*)
		DelayTime : LREAL; (*Additional delay time of TrackingPath position signal for error compensation [s]*)
		MovementLimits : McTPLinMotSrcAxMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
		Preparation : McTPLinMotSrcAxPrepType; (*Preparation of the input signal*)
	END_STRUCT;
	McTPLinMotSrcType : STRUCT (*Source describing the TrackingPath movement*)
		Type : McTPLinMotSrcEnum; (*Motion source selector setting*)
		PositionProcessVariable : McTPLinMotSrcPosPVType; (*Type mcTPTLMS_POS_PROC_VAR settings*)
		Axis : McTPLinMotSrcAxType; (*Type mcTPTLMS_AX settings*)
	END_STRUCT;
	McTPLinAutCrtCondEnum :
		( (*Condition 1-10 selector setting*)
		mcTPLinAutCrtC_DIST_BASED := 0, (*Distance based - Generates a TrackingFrame when the TrackingPath travels the configured distance in the positive direction*)
		mcTPLinAutCrtC_TIME_BASED := 2, (*Time based - Periodically generates TrackingFrames based on the configured time interval*)
		mcTPLinAutCrtC_TRG_BASED := 1 (*Trigger based - Generates a TrackingFrame triggered by an external event (e.g., a light barrier)*)
		);
	McTPLinAutCrtDistActEnum :
		( (*Activation selector setting*)
		mcTPLinAutCrtDistA_ALW_ACT := 0, (*Always active - Automatic creation is permanently active. The first frame is generated once the TrackingPath moves the defined distance*)
		mcTPLinAutCrtDistA_PROC_VAR := 1 (*Process variable - Automatic creation activates only when the process variable is TRUE. The first frame is generated once the TrackingPath moves the defined distance*)
		);
	McTPLinAutCrtDistBasedActPVType : STRUCT (*Type mcTPLinAutCrtDistA_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable to activate the automatic creation*)
	END_STRUCT;
	McTPLinAutCrtDistActType : STRUCT (*Activation of automatic TrackingFrame generation*)
		Type : McTPLinAutCrtDistActEnum; (*Activation selector setting*)
		ProcessVariable : McTPLinAutCrtDistBasedActPVType; (*Type mcTPLinAutCrtDistA_PROC_VAR settings*)
	END_STRUCT;
	McTPLinAutCrtDistTrgEnum :
		( (*Trigger selector setting*)
		mcTPLinAutCrtDistT_NOT_USE := 0, (*Not used - No specific trigger required. The TrackingFrame will be created once the TrackingPath moved the defined distance*)
		mcTPLinAutCrtDistT_PROC_VAR := 1 (*Process variable - Triggers the creation of the first TrackingFrame and starts distance-based automatic creation*)
		);
	McTPLinAutCrtDistBasedTrgPVType : STRUCT (*Type mcTPLinAutCrtDistT_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable to trigger automatic creation. A positive edge will (re-)trigger the creation of the first TrackingFrame*)
	END_STRUCT;
	McTPLinAutCrtDistTrgType : STRUCT (*Optional trigger to synchronize the automatically created slots with physical slots on a conveyor*)
		Type : McTPLinAutCrtDistTrgEnum; (*Trigger selector setting*)
		ProcessVariable : McTPLinAutCrtDistBasedTrgPVType; (*Type mcTPLinAutCrtDistT_PROC_VAR settings*)
	END_STRUCT;
	McTPLinAutCrtDistPosType : STRUCT (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McTPAutCrtUsrDatEnum :
		( (*User data selector setting*)
		mcTPAutCrtUsrDat_NOT_USE := 0, (*Not used - No specific initialization required or no user data required*)
		mcTPAutCrtUsrDat_CPYPV := 1 (*CpyPV - The initial user data of each created frame will be copied from the specified PV*)
		);
	McTPAutCrtUsrDatCpyPVType : STRUCT (*Type mcTPAutCrtUsrDat_CPYPV settings*)
		ProcessVariableName : STRING[250]; (*Process variable containing initial TrackingFrame user data value. The type must match with the configured user data size under TrackingFrames.UserData*)
	END_STRUCT;
	McTPAutCrtUsrDatType : STRUCT (*User data assigned to a created TrackingFrame*)
		Type : McTPAutCrtUsrDatEnum; (*User data selector setting*)
		CpyPV : McTPAutCrtUsrDatCpyPVType; (*Type mcTPAutCrtUsrDat_CPYPV settings*)
	END_STRUCT;
	McTPLinAutCrtDistType : STRUCT (*Type mcTPLinAutCrtC_DIST_BASED settings*)
		Distance : LREAL; (*The distance the TrackingPath must move in positive direction so that a TrackingFrame will be created [measurement units]*)
		Activation : McTPLinAutCrtDistActType; (*Activation of automatic TrackingFrame generation*)
		Trigger : McTPLinAutCrtDistTrgType; (*Optional trigger to synchronize the automatically created slots with physical slots on a conveyor*)
		Position : McTPLinAutCrtDistPosType; (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Attribute : UDINT; (*Attribute assigned to a created TrackingFrame*)
		UserData : McTPAutCrtUsrDatType; (*User data assigned to a created TrackingFrame*)
	END_STRUCT;
	McTPLinAutCrtTimeActEnum :
		( (*Activation selector setting*)
		mcTPLinAutCrtTimeA_PROC_VAR := 1 (*Process variable - The automatic creation is only active when the process variable is set to TRUE*)
		);
	McTPLinAutCrtTimeBasedActPVType : STRUCT (*Type mcTPLinAutCrtTimeA_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable to activate the automatic creation*)
	END_STRUCT;
	McTPLinAutCrtTimeActType : STRUCT (*Activation of automatic TrackingFrame generation*)
		Type : McTPLinAutCrtTimeActEnum; (*Activation selector setting*)
		ProcessVariable : McTPLinAutCrtTimeBasedActPVType; (*Type mcTPLinAutCrtTimeA_PROC_VAR settings*)
	END_STRUCT;
	McTPLinAutCrtTimePosType : STRUCT (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McTPLinAutCrtTimeType : STRUCT (*Type mcTPLinAutCrtC_TIME_BASED settings*)
		Interval : LREAL; (*Time span between TrackingFrame creation [s]*)
		Activation : McTPLinAutCrtTimeActType; (*Activation of automatic TrackingFrame generation*)
		Position : McTPLinAutCrtTimePosType; (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Attribute : UDINT; (*Attribute assigned to a created TrackingFrame*)
		UserData : McTPAutCrtUsrDatType; (*User data assigned to a created TrackingFrame*)
	END_STRUCT;
	McTPLinAutCrtTrgTrgEnum :
		( (*Trigger selector setting*)
		mcTPLinAutCrtTrgT_PROC_VAR := 0 (*Process variable - A positive edge of the process variable triggers the creation of a TrackingFrame*)
		);
	McTPLinAutCrtTrgBasedTrgPVType : STRUCT (*Type mcTPLinAutCrtTrgT_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable to trigger TrackingFrame creation. The edge detection happens once per mapp Motion task class cycle time. On a positive edge the TrackingPath will create a TrackingFrame*)
	END_STRUCT;
	McTPLinAutCrtTrgTrgType : STRUCT (*Trigger to create a TrackingFrame*)
		Type : McTPLinAutCrtTrgTrgEnum; (*Trigger selector setting*)
		ProcessVariable : McTPLinAutCrtTrgBasedTrgPVType; (*Type mcTPLinAutCrtTrgT_PROC_VAR settings*)
	END_STRUCT;
	McTPLinAutCrtTrgPosType : STRUCT (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McTPLinAutCrtTrgType : STRUCT (*Type mcTPLinAutCrtC_TRG_BASED settings*)
		Trigger : McTPLinAutCrtTrgTrgType; (*Trigger to create a TrackingFrame*)
		Position : McTPLinAutCrtTrgPosType; (*Translation and orientation relative to the TrackingPath coordinate system on which the TrackingFrame will be created*)
		Attribute : UDINT; (*Attribute assigned to a created TrackingFrame*)
		UserData : McTPAutCrtUsrDatType; (*User data assigned to a created TrackingFrame*)
	END_STRUCT;
	McTPLinAutCrtCondType : STRUCT
		Type : McTPLinAutCrtCondEnum; (*Condition 1-10 selector setting*)
		DistanceBased : McTPLinAutCrtDistType; (*Type mcTPLinAutCrtC_DIST_BASED settings*)
		TimeBased : McTPLinAutCrtTimeType; (*Type mcTPLinAutCrtC_TIME_BASED settings*)
		TriggerBased : McTPLinAutCrtTrgType; (*Type mcTPLinAutCrtC_TRG_BASED settings*)
	END_STRUCT;
	McTPLinAutCrtType : STRUCT (*The TrackingPath component generates TrackingFrames automatically based on the configured conditions*)
		Condition : McCfgUnboundedArrayType; (*Connect array of type McTPLinAutCrtCondType*)
	END_STRUCT;
	McTPLinAutDelCondEnum :
		( (*Condition 1-N selector setting*)
		mcTPLinAutDelC_POS_BASED := 0, (*Position based - Automatically deletes a TrackingFrame when it leaves the configured position interval*)
		mcTPLinAutDelC_A_DESYN := 1 (*After desynchronization - Automatically deletes a TrackingFrame when the specified axesgroup finishes desynchronization*)
		);
	McTPLinAutDelPosType : STRUCT (*Type mcTPLinAutDelC_POS_BASED settings*)
		MinPosition : LREAL; (*TrackingFrames with an X position smaller than 'Min position' relative to the TrackingPath coordinate system are automatically deleted [measurement units]*)
		MaxPosition : LREAL; (*TrackingFrames with an X position greater than 'Max position' relative to the TrackingPath coordinate system are automatically deleted [measurement units]*)
	END_STRUCT;
	McTPLinAutDelAfterDesynType : STRUCT (*Type mcTPLinAutDelC_A_DESYN settings*)
		AxesgroupReference : McCfgReferenceType; (*Name of the axesgroup reference*)
	END_STRUCT;
	McTPLinAutDelCondType : STRUCT
		Type : McTPLinAutDelCondEnum; (*Condition 1-N selector setting*)
		PositionBased : McTPLinAutDelPosType; (*Type mcTPLinAutDelC_POS_BASED settings*)
		AfterDesynchronization : McTPLinAutDelAfterDesynType; (*Type mcTPLinAutDelC_A_DESYN settings*)
	END_STRUCT;
	McTPLinAutDelDelayedDelEnum :
		( (*Delayed deletion selector setting*)
		mcTPLinAutDelDD_NOT_USE := 0, (*Not used -*)
		mcTPLinAutDelDD_CFRM := 1 (*Confirmation - When this feature is enabled, the automatic frame deletion mechanism will wait for confirmation before proceeding. To confirm the deletion, the Process Variable ‘Blocked’ must be set to FALSE*)
		);
	McTPLinAutDelDelayedDelCfrmType : STRUCT (*Type mcTPLinAutDelDD_CFRM settings*)
		Blocked : STRING[250]; (*Process variable which is set to TRUE once a delete confirmation is requested by the TrackingPath component. Once the application allows the deletion (e.g, TrackingFrame user data was read), it can be set to FALSE to allow deletion*)
		TrackingFrameID : STRING[250]; (*Process variable set by the TrackingPath component showing the TrackingFrame to be deleted next. Valid when 'Blocked' was set to TRUE by the TrackingPath component*)
	END_STRUCT;
	McTPLinAutDelDelayedDelType : STRUCT
		Type : McTPLinAutDelDelayedDelEnum; (*Delayed deletion selector setting*)
		Confirmation : McTPLinAutDelDelayedDelCfrmType; (*Type mcTPLinAutDelDD_CFRM settings*)
	END_STRUCT;
	McTPLinAutDelType : STRUCT (*The TrackingPath component deletes TrackingFrames automatically based on the configured conditions*)
		Condition : McCfgUnboundedArrayType; (*Connect array of type McTPLinAutDelCondType*)
		DelayedDeletion : McTPLinAutDelDelayedDelType;
	END_STRUCT;
	McTPLinFrmDatSzEnum :
		( (*Size selector setting*)
		mcTPLinFrmDatS_DIR_IN := 0, (*Direct input - Manually entered user data size*)
		mcTPLinFrmDatS_PROC_VAR_REF := 1 (*Process variable reference - The size of the user data type is derived from a sample user data variable*)
		);
	McTPLinFrmDatSzDirInType : STRUCT (*Type mcTPLinFrmDatS_DIR_IN settings*)
		Value : UDINT; (*The size of the user data type for one TrackingFrame [B]*)
	END_STRUCT;
	McTPLinFrmDatSzProcVarRefType : STRUCT (*Type mcTPLinFrmDatS_PROC_VAR_REF settings*)
		ProcessVariableName : STRING[250]; (*Process variable of the desired TrackingFrame user data type*)
	END_STRUCT;
	McTPLinFrmDatSzType : STRUCT (*Defines how the size of the user data for one TrackingFrame is specified*)
		Type : McTPLinFrmDatSzEnum; (*Size selector setting*)
		DirectInput : McTPLinFrmDatSzDirInType; (*Type mcTPLinFrmDatS_DIR_IN settings*)
		ProcessVariableReference : McTPLinFrmDatSzProcVarRefType; (*Type mcTPLinFrmDatS_PROC_VAR_REF settings*)
	END_STRUCT;
	McTPLinFrmDatType : STRUCT (*TrackingFrame user data is automatically allocated and released by the TrackingPath component. During the lifetime of a TrackingFrame the allocated user data can be accessed (read/write) via the corresponding function block*)
		Size : McTPLinFrmDatSzType; (*Defines how the size of the user data for one TrackingFrame is specified*)
	END_STRUCT;
	McTPLinTrkFrmType : STRUCT
		AutomaticCreation : McTPLinAutCrtType; (*The TrackingPath component generates TrackingFrames automatically based on the configured conditions*)
		AutomaticDeletion : McTPLinAutDelType; (*The TrackingPath component deletes TrackingFrames automatically based on the configured conditions*)
		UserData : McTPLinFrmDatType; (*TrackingFrame user data is automatically allocated and released by the TrackingPath component. During the lifetime of a TrackingFrame the allocated user data can be accessed (read/write) via the corresponding function block*)
	END_STRUCT;
	McTPLinType : STRUCT (*Type mcTPT_LIN settings*)
		MaxTrackingFrames : UINT; (*Maximum number of TrackingFrames*)
		MaxPositionError : LREAL; (*Maximal deviation between TrackingFrames and motion source position when considering TrackingPath movement limits [measurement units]*)
		MotionSource : McTPLinMotSrcType; (*Source describing the TrackingPath movement*)
		TrackingFrames : McTPLinTrkFrmType;
	END_STRUCT;
	McTPTypType : STRUCT (*Geometry of TrackingPath*)
		Type : McTPTypEnum; (*Type selector setting*)
		Linear : McTPLinType; (*Type mcTPT_LIN settings*)
	END_STRUCT;
	McCfgTrkPathType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_TRK_PATH*)
		Type : McTPTypType; (*Geometry of TrackingPath*)
	END_STRUCT;
	McTPSVEnum :
		( (*Scene Viewer Object selector setting*)
		mcTPSSVO_USE := 0, (*Used - TrackingPath object is used*)
		mcTPSSVO_NOT_USE := 1 (*Not used -*)
		);
	McTPSVUseNameEnum :
		( (*Name selector setting*)
		mcTPSSVOUN_VIS := 0, (*Visible - Name is displayed*)
		mcTPSSVOUN_INVIS := 1 (*Invisible - Name is hidden*)
		);
	McTPSVUseNameType : STRUCT (*Defines if TrackingPath name is visible*)
		Type : McTPSVUseNameEnum; (*Name selector setting*)
	END_STRUCT;
	McTPSVUseFrmEnum :
		( (*Frame selector setting*)
		mcTPSSVOUF_VIS := 0, (*Visible - Frame is displayed*)
		mcTPSSVOUF_INVIS := 1 (*Invisible - Frame is hidden*)
		);
	McTPSVUseFrmType : STRUCT (*Defines if TrackingPath frame is be visible*)
		Type : McTPSVUseFrmEnum; (*Frame selector setting*)
	END_STRUCT;
	McTPSVUseVREnum :
		( (*Visual representation selector setting*)
		mcTPSSVOUVR_NOT_USE := 0, (*Not used - No additional representation*)
		mcTPSSVOUVR_CUBE := 1, (*Cuboid - Shows a cuboid under the TrackingPath*)
		mcTPSSVOUVR_CNVR_BELT := 2 (*Conveyor belt - Shows a conveyor belt under the TrackingPath*)
		);
	McTPSVUseVRCubeDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length of the cuboid [measurement units]*)
		Width : LREAL; (*Width of the cuboid [measurement units]*)
		Height : LREAL; (*Height of the cuboid [measurement units]*)
	END_STRUCT;
	McTPSVUseVRCubeType : STRUCT (*Type mcTPSSVOUVR_CUBE settings*)
		Dimensions : McTPSVUseVRCubeDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	McTPSVUseVRCnvrBeltDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length of the conveyor belt [measurement units]*)
		Width : LREAL; (*Width of the conveyor belt [measurement units]*)
		Height : LREAL; (*Height of the conveyor belt [measurement units]*)
	END_STRUCT;
	McTPSVUseVRCnvrBeltType : STRUCT (*Type mcTPSSVOUVR_CNVR_BELT settings*)
		Dimensions : McTPSVUseVRCnvrBeltDimType; (*Dimensions of the object*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Material : McScnSurfaceEnum; (*Material*)
	END_STRUCT;
	McTPSVUseVRType : STRUCT (*Defines a (physical) object representing the TrackingPath*)
		Type : McTPSVUseVREnum; (*Visual representation selector setting*)
		Cuboid : McTPSVUseVRCubeType; (*Type mcTPSSVOUVR_CUBE settings*)
		ConveyorBelt : McTPSVUseVRCnvrBeltType; (*Type mcTPSSVOUVR_CNVR_BELT settings*)
	END_STRUCT;
	McTPSVUseContEnum :
		( (*Content selector setting*)
		mcTPSSVOUC_NOT_USE := 0, (*Not used - TrackingFrames visualization is deactivated*)
		mcTPSSVOUC_VIS := 1 (*Visible - TrackingFrames visualization is activated*)
		);
	McTPSVUseContType : STRUCT (*Defines if the TrackingFrames in the TrackingPath are visualized*)
		Type : McTPSVUseContEnum; (*Content selector setting*)
	END_STRUCT;
	McTPSVUseType : STRUCT (*Type mcTPSSVO_USE settings*)
		Name : McTPSVUseNameType; (*Defines if TrackingPath name is visible*)
		Frame : McTPSVUseFrmType; (*Defines if TrackingPath frame is be visible*)
		VisualRepresentation : McTPSVUseVRType; (*Defines a (physical) object representing the TrackingPath*)
		Content : McTPSVUseContType; (*Defines if the TrackingFrames in the TrackingPath are visualized*)
	END_STRUCT;
	McTPSVType : STRUCT (*Defines if the TrackingPath is contained in the automatically generated scene*)
		Type : McTPSVEnum; (*Scene Viewer Object selector setting*)
		Used : McTPSVUseType; (*Type mcTPSSVO_USE settings*)
	END_STRUCT;
	McCfgTrkPathScnType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_TRK_PATH_SCN*)
		SceneViewerObject : McTPSVType; (*Defines if the TrackingPath is contained in the automatically generated scene*)
	END_STRUCT;
	McCfgTrkPathAutCrtCondType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_TRK_PATH_AUT_CRT_COND*)
		Condition : McTPLinAutCrtCondType;
	END_STRUCT;
END_TYPE