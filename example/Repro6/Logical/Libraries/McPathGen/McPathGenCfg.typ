TYPE
	McAGPGSubtEnum :
		(
		mcAGPGS_GEN := 0, (*General*)
		mcAGPGS_ABB_ROB := 1 (*ABB robot*)
		);
	McAGPGLicEnum :
		( (*Defines whether to use single function licenses or a flat license for this axes group*)
		mcAGPGL_SNG := 0, (*Single - Single licenses*)
		mcAGPGL_FLT := 1 (*Flat - Flat license*)
		);
	McAGPGPAJntAxJntAxType : STRUCT
		Name : STRING[250]; (*Name of the axis used as joint (e.g. Q1, Q2, etc.)*)
		AxisReference : McCfgReferenceType;
	END_STRUCT;
	McAGPGPAJntAxType : STRUCT (*Single axes of AxesGroup for path planning*)
		JointAxis : McCfgUnboundedArrayType; (*Connect array of type McAGPGPAJntAxJntAxType*)
	END_STRUCT;
	McAGPGPASASAPADEnum :
		( (*Periodic axis direction selector setting*)
		mcAGPGPASASAPAD_DEF := 8, (*Default - Movement to target position (exceed period).*)
		mcAGPGPASASAPAD_SHORT_WAY := 3 (*Shortest way - Movement with the shortest distance to the target position, either in positive or negative direction.*)
		);
	McAGPGPASASAPADType : STRUCT (*Periodic axis direction*)
		Type : McAGPGPASASAPADEnum; (*Periodic axis direction selector setting*)
	END_STRUCT;
	McAGPGPASlAxSlAxType : STRUCT
		Name : STRING[250]; (*Name of the slave axis within AxesGroup (e.g. U, V, etc.)*)
		AxisReference : McCfgReferenceType; (*Name of the mapp axis configured in an axis configuration file (e.g. gAxis1)*)
		PeriodicAxisDirection : McAGPGPASASAPADType; (*Periodic axis direction*)
	END_STRUCT;
	McAGPGPASlAxType : STRUCT (*Axis included in path planning but not part of it*)
		SlaveAxis : McCfgUnboundedArrayType; (*Connect array of type McAGPGPASlAxSlAxType*)
	END_STRUCT;
	McAGPGPASngAxSngAxType : STRUCT
		AxisReference : McCfgReferenceType; (*Name of the mapp axis configured in an axis configuration file (e.g. gAxis1)*)
	END_STRUCT;
	McAGPGPASngAxType : STRUCT (*Axis inluded in AxesGroup but not part of path planning*)
		SingleAxis : McCfgUnboundedArrayType; (*Connect array of type McAGPGPASngAxSngAxType*)
	END_STRUCT;
	McAGPGPAType : STRUCT (*Specify joint, slave and single axis within AxesGroup*)
		JointAxes : McAGPGPAJntAxType; (*Single axes of AxesGroup for path planning*)
		SlaveAxes : McAGPGPASlAxType; (*Axis included in path planning but not part of it*)
		SingleAxes : McAGPGPASngAxType; (*Axis inluded in AxesGroup but not part of path planning*)
	END_STRUCT;
	McAGPGMSType : STRUCT (*Definition of mechanical dimensions and other relevant settings of CNC, robot, delta, etc.*)
		MechanicalSystemReference : McCfgReferenceType; (*Name of the mechanical system reference*)
	END_STRUCT;
	McAGPGModalDatBxEnum :
		( (*Modal data behaviour selector setting*)
		mcCAGPGMDB_RST_TO_DEF := 0, (*Reset to default - The values are reseted to the configured/default values at program end.*)
		mcCAGPGMDB_KEEP_CUR_VAL := 1 (*Keep current values - The values at program end are used for the next program too.*)
		);
	McAGPGModalDatBxType : STRUCT (*All modal data is reset to the default/configured value for the next program*)
		Type : McAGPGModalDatBxEnum; (*Modal data behaviour selector setting*)
	END_STRUCT;
	McAGPGGeoPlanTCPResType : STRUCT
		LengthResolution : LREAL; (*Resolution of linear TCP coordinates [measurement units]*)
		AngleResolution : LREAL; (*Resolution of rotary TCP coordinates [measurement units]*)
	END_STRUCT;
	McAGPGGeoPlanBlendingType : STRUCT (*Blending between two movement commands*)
		MaxBlendingRadius : LREAL; (*Defines the maximum path length of the first path that can be used for blending [measurement units]*)
	END_STRUCT;
	McAGPGGeoPlanRndSymRndEnum :
		( (*Rounding distance on both adjacent path sections is the same*)
		mcAGPGGPRSR_YES := 1, (*Yes - Yes*)
		mcAGPGGPRSR_NO := 0 (*No - No*)
		);
	McAGPGGeoPlanRndLatSegEnum :
		( (*Rounding distance on the last path sections*)
		mcAGPGGPRLS_WHOLE := 1, (*Whole - Whole length of geometry*)
		mcAGPGGPRLS_HALF := 0 (*Half - Half length of geometry*)
		);
	McAGPGGeoPlanRndFirstSegEnum :
		( (*Rounding distance on the first path sections*)
		mcAGPGGPRFS_WHOLE := 1, (*Whole - Whole length of geometry*)
		mcAGPGGPRFS_HALF := 0 (*Half - Half length of geometry*)
		);
	McAGPGGeoPlanRndAvoidZeroCrvEnum :
		( (*Avoid reducing curvature to zero between two rounded edges*)
		mcAGPGGPRAZC_YES := 1, (*Yes - Yes*)
		mcAGPGGPRAZC_NO := 0 (*No - No*)
		);
	McAGPGGeoPlanRndNonCartRndEnum :
		( (*Support rounding between blocks without cartesian movement*)
		mcAGPGGPRNCR_YES := 1, (*Yes - Yes*)
		mcAGPGGPRNCR_NO := 0 (*No - No*)
		);
	McAGPGGeoPlanRndType : STRUCT (*Rounding a transition between motion blocks*)
		PathDistance : LREAL; (*Defines the path length of the Cartesian axes for which rounding between two geometries is added. [measurement units]*)
		SymmetricRounding : McAGPGGeoPlanRndSymRndEnum; (*Rounding distance on both adjacent path sections is the same*)
		LastSegment : McAGPGGeoPlanRndLatSegEnum; (*Rounding distance on the last path sections*)
		FirstSegment : McAGPGGeoPlanRndFirstSegEnum; (*Rounding distance on the first path sections*)
		AvoidZeroCurvature : McAGPGGeoPlanRndAvoidZeroCrvEnum; (*Avoid reducing curvature to zero between two rounded edges*)
		NonCartesianRounding : McAGPGGeoPlanRndNonCartRndEnum; (*Support rounding between blocks without cartesian movement*)
	END_STRUCT;
	McAGPGGeoPlanRndModEnum :
		( (*Defines the used rounding mode*)
		mcAGPGGPRM_STD := 0, (*Standard - Standard calculation for rounding*)
		mcAGPGGPRM_ADV := 1, (*Advanced - Higher curvature but smoother run*)
		mcAGPGGPRM_BLENDED_RND := 2 (*Blended rounding - Use blending algorithm for all types of roundings*)
		);
	McAGPGGeoPlanWrkPlEnum :
		( (*Defines the initial active working plane*)
		mcAGPGGPWP_PL_XY := 0, (*Plane XY*)
		mcAGPGGPWP_PL_YZ := 1, (*Plane YZ*)
		mcAGPGGPWP_PL_ZX := 2 (*Plane ZX*)
		);
	McAGPGGeoPlanType : STRUCT
		TCPResolution : McAGPGGeoPlanTCPResType;
		Blending : McAGPGGeoPlanBlendingType; (*Blending between two movement commands*)
		Rounding : McAGPGGeoPlanRndType; (*Rounding a transition between motion blocks*)
		RoundingMode : McAGPGGeoPlanRndModEnum; (*Defines the used rounding mode*)
		MaxCornerDeviation : LREAL; (*Defines the maximum corner deviation for non tangential path transitions [measurement units]*)
		MaxTangentialTransitionDeviation : LREAL; (*Defines the maximum contour deviation for tangential path transitions [measurement units]*)
		MaxRadiusDeviation : LREAL; (*Defines the tolerance if circle interpolation is programmed with numeric inconsistencies [measurement units]*)
		WorkingPlane : McAGPGGeoPlanWrkPlEnum; (*Defines the initial active working plane*)
	END_STRUCT;
	McAGPGTrajPlanEnum :
		( (*Trajectory planning selector setting*)
		mcAGPGTP_BASIC := 0 (*Basic -*)
		);
	McAGPGTPBLimCkResEnum :
		( (*Limit check resolution selector setting*)
		mcAGPGTPBLCR_USR_DEF := 0, (*User defined -*)
		mcAGPGTPBLCR_AUT := 1 (*Automatic -*)
		);
	McAGPGTPBLimCkResUsrDefType : STRUCT (*Type mcAGPGTPBLCR_USR_DEF settings*)
		Time : REAL; (*[s]*)
	END_STRUCT;
	McAGPGTPBLimCkResType : STRUCT (*Time resolution of the trajectory planner in which the limits are checked*)
		Type : McAGPGTPBLimCkResEnum; (*Limit check resolution selector setting*)
		UserDefined : McAGPGTPBLimCkResUsrDefType; (*Type mcAGPGTPBLCR_USR_DEF settings*)
	END_STRUCT;
	McAGPGTPBBuffTimeEnum :
		( (*Buffer time selector setting*)
		mcAGPGTPBBT_USR_DEF := 0, (*User defined -*)
		mcAGPGTPBBT_AUT := 1 (*Automatic -*)
		);
	McAGPGTPBBuffTimeUsrDefType : STRUCT (*Type mcAGPGTPBBT_USR_DEF settings*)
		Time : REAL; (*[s]*)
	END_STRUCT;
	McAGPGTPBBuffTimeType : STRUCT (*Maximum buffered timespan which is precomputed*)
		Type : McAGPGTPBBuffTimeEnum; (*Buffer time selector setting*)
		UserDefined : McAGPGTPBBuffTimeUsrDefType; (*Type mcAGPGTPBBT_USR_DEF settings*)
	END_STRUCT;
	McAGPGTPBBarrParEnum :
		( (*Barrier parametrization selector setting*)
		mcAGPGTPBBP_JNT_COOR := 0, (*Joint coordinates - Parametrization over Joint coordinates*)
		mcAGPGTPBBP_TCP_COOR := 1 (*TCP coordinates - Parametrization over TCP coordinates*)
		);
	McAGPGTPBBarrParType : STRUCT (*Define the parameter over which the barrier should be scaled*)
		Type : McAGPGTPBBarrParEnum; (*Barrier parametrization selector setting*)
	END_STRUCT;
	McAGPGTPBTrqLimConsEnum :
		( (*Torque limit consideration selector setting*)
		mcAGPGTPBTLC_EX := 0, (*Exact -*)
		mcAGPGTPBTLC_APPX := 1 (*Approximation -*)
		);
	McAGPGTPBTrqLimConsAppxType : STRUCT (*Type mcAGPGTPBTLC_APPX settings*)
		StepSize : LREAL; (*Step size for approximation [factor]*)
	END_STRUCT;
	McAGPGTPBTrqLimConsType : STRUCT (*Defines the type of torque limit consideration*)
		Type : McAGPGTPBTrqLimConsEnum; (*Torque limit consideration selector setting*)
		Approximation : McAGPGTPBTrqLimConsAppxType; (*Type mcAGPGTPBTLC_APPX settings*)
	END_STRUCT;
	McAGPGTPBType : STRUCT (*Type mcAGPGTP_BASIC settings*)
		LimitCheckResolution : McAGPGTPBLimCkResType; (*Time resolution of the trajectory planner in which the limits are checked*)
		BufferTime : McAGPGTPBBuffTimeType; (*Maximum buffered timespan which is precomputed*)
		BarrierParametrization : McAGPGTPBBarrParType; (*Define the parameter over which the barrier should be scaled*)
		TorqueLimitConsideration : McAGPGTPBTrqLimConsType; (*Defines the type of torque limit consideration*)
	END_STRUCT;
	McAGPGTrajPlanType : STRUCT
		Type : McAGPGTrajPlanEnum; (*Trajectory planning selector setting*)
		Basic : McAGPGTPBType; (*Type mcAGPGTP_BASIC settings*)
	END_STRUCT;
	McAGPGMiscNonMoveLimEnum :
		( (*Non-movements limit selector setting*)
		mcAGPGMNML_NOT_USE := 0, (*Not Used -*)
		mcAGPGMNML_USE := 1 (*Used -*)
		);
	McAGPGMNMLUADEnum :
		( (*Action selector setting*)
		mcAGPGMNMLUAD_DELAYED_EXE := 0 (*Delayed execution - Execute only the allowed count and postpone the others to the next cycle*)
		);
	McAGPGMNMLUADType : STRUCT (*Action when the configured maximum count is exceeded*)
		Type : McAGPGMNMLUADEnum; (*Action selector setting*)
	END_STRUCT;
	McAGPGMiscNonMoveLimUseType : STRUCT (*Type mcAGPGMNML_USE settings*)
		Count : UDINT; (*Maximum count of non-movements executed in one cycle*)
		Action : McAGPGMNMLUADType; (*Action when the configured maximum count is exceeded*)
	END_STRUCT;
	McAGPGMiscNonMoveLimType : STRUCT (*Limit the count of non-movements executed in one cycle*)
		Type : McAGPGMiscNonMoveLimEnum; (*Non-movements limit selector setting*)
		Used : McAGPGMiscNonMoveLimUseType; (*Type mcAGPGMNML_USE settings*)
	END_STRUCT;
	McAGPGMTSOJerkSupEnum :
		( (*Jerk suppression selector setting*)
		mcAGPGMTSOJS_NOT_USE := 0, (*Not Used - Smoothing not used*)
		mcAGPGMTSOJS_BASIC := 1, (*Basic - Basic smoothing parameters*)
		mcAGPGMTSOJS_AUT := 2 (*Automatic - Automatic smoothing parameters*)
		);
	McAGPGMTSOJerkSupBasicType : STRUCT (*Type mcAGPGMTSOJS_BASIC settings*)
		AdaptationTime : REAL; (*Time for smooth change of override to minimize jerk [s]*)
	END_STRUCT;
	McAGPGMTSOJerkSupType : STRUCT (*Defines smoothing of time stretch override*)
		Type : McAGPGMTSOJerkSupEnum; (*Jerk suppression selector setting*)
		Basic : McAGPGMTSOJerkSupBasicType; (*Type mcAGPGMTSOJS_BASIC settings*)
	END_STRUCT;
	McAGPGMTSOType : STRUCT
		JerkSuppression : McAGPGMTSOJerkSupType; (*Defines smoothing of time stretch override*)
	END_STRUCT;
	McAGPGMAJFEnum :
		( (*Axis jerk filter selector setting*)
		mcAGPGMAJF_USE_AX_FLTR := 0, (*Use axis filters -*)
		mcAGPGMAJF_DEACT_FLTR := 1, (*Deactivate filters -*)
		mcAGPGMAJF_OVR_FLTR := 2 (*Override filters -*)
		);
	McAGPGMAJFType : STRUCT (*During axis group movement, the jerk filters defined at the axis level can be active, deactivated, or overridden*)
		Type : McAGPGMAJFEnum; (*Axis jerk filter selector setting*)
	END_STRUCT;
	McAGPGMiscType : STRUCT
		NonMovementsLimit : McAGPGMiscNonMoveLimType; (*Limit the count of non-movements executed in one cycle*)
		TimeStretchOverride : McAGPGMTSOType;
		AxisJerkFilter : McAGPGMAJFType; (*During axis group movement, the jerk filters defined at the axis level can be active, deactivated, or overridden*)
	END_STRUCT;
	McAGPGBSType : STRUCT
		ModalDataBehaviour : McAGPGModalDatBxType; (*All modal data is reset to the default/configured value for the next program*)
		GeometryPlanning : McAGPGGeoPlanType;
		TrajectoryPlanning : McAGPGTrajPlanType;
		Miscellaneous : McAGPGMiscType;
	END_STRUCT;
	McAGSRAEAREnum :
		( (*Axis reaction selector setting*)
		mcAGSRAEAR_STD := 0, (*Standard - Use standard stop parameter for stop ramp*)
		mcAGSRAEAR_DYN_STOP := 1 (*Dynamic stop - Use dynamic stop deceleration parameter for stop ramp*)
		);
	McAGSRAEARDynStopModEnum :
		( (*Defines if dynamic stop decelerations are only computed or computed and transmitted*)
		mcAGSRAEARDSM_COMP_AND_TRANS := 0, (*Compute and transmit - Compute dynamic stop decelerations and transmit to drives*)
		mcAGSRAEARDSM_COMP := 1 (*Compute - Compute dynamic stop decelerations*)
		);
	McAGSRAEARDynStopType : STRUCT (*Type mcAGSRAEAR_DYN_STOP settings*)
		Mode : McAGSRAEARDynStopModEnum; (*Defines if dynamic stop decelerations are only computed or computed and transmitted*)
	END_STRUCT;
	McAGSRAEARType : STRUCT (*Defines the stop reaction of an axis in case of an error*)
		Type : McAGSRAEAREnum; (*Axis reaction selector setting*)
		DynamicStop : McAGSRAEARDynStopType; (*Type mcAGSRAEAR_DYN_STOP settings*)
	END_STRUCT;
	McAGPGSRAEType : STRUCT (*Defines the stop reaction of the axis group in case of an axis error*)
		AxisReaction : McAGSRAEARType; (*Defines the stop reaction of an axis in case of an error*)
	END_STRUCT;
	McAGPGSRType : STRUCT (*Stop reaction definitions for the axis group*)
		AxisError : McAGPGSRAEType; (*Defines the stop reaction of the axis group in case of an axis error*)
		Quickstop : McAGSRQSType; (*Enables Quickstop functionality for the axis group*)
	END_STRUCT;
	McCfgAxGrpPathGenType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_PATHGEN*)
		Subtype : McAGPGSubtEnum;
		ProcessingTaskClass : McPTCEnum; (*Cyclic task class for command processing*)
		License : McAGPGLicEnum; (*Defines whether to use single function licenses or a flat license for this axes group*)
		PhysicalAxes : McAGPGPAType; (*Specify joint, slave and single axis within AxesGroup*)
		MechanicalSystem : McAGPGMSType; (*Definition of mechanical dimensions and other relevant settings of CNC, robot, delta, etc.*)
		BasicSettings : McAGPGBSType;
		StopReaction : McAGPGSRType; (*Stop reaction definitions for the axis group*)
		AxesGroupFeatures : McAGAGFType;
	END_STRUCT;
	McCfgAxGrpPathGenBaseSetType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_PATHGEN_BASE_SET*)
		BasicSettings : McAGPGBSType;
	END_STRUCT;
	McAGFPRGIPSIntrplTypEnum :
		( (*Interpolation type selector setting*)
		mcAGFPRGIPSIT_RPD_LIN := 0, (*Rapid linear - Rapid linear interpolation*)
		mcAGFPRGIPSIT_LIN := 1, (*Linear - Linear interpolation*)
		mcAGFPRGIPSIT_CIR_CW := 2, (*Circular clockwise - Circular clockwise interpolation*)
		mcAGFPRGIPSIT_CIR_CNTCW := 3, (*Circular counter-clockwise - Circular counter-clockwise interpolation*)
		mcAGFPRGIPSIT_CIR_IN_GEN_ORIENT := 4, (*Circular in general orientation - Circular interpolation in general orientation*)
		mcAGFPRGIPSIT_RPD_PTTOPT := 5, (*Rapid point-to-point - Rapid point-to-point movement*)
		mcAGFPRGIPSIT_PTTOPT := 6 (*Point-to-point - Point-to-point movement*)
		);
	McAGFPRGIPSIntrplTypType : STRUCT (*Defines the interpolation type of movement commands*)
		Type : McAGFPRGIPSIntrplTypEnum; (*Interpolation type selector setting*)
	END_STRUCT;
	McAGFPRGIPSAbsRelPosCoorEnum :
		( (*Absolute/relative position coordinates selector setting*)
		mcAGFPRGIPSARPC_ABS := 0, (*Absolute - Absolute position coordinates*)
		mcAGFPRGIPSARPC_REL := 1 (*Relative - Relative position coordinates*)
		);
	McAGFPRGIPSAbsRelPosCoorType : STRUCT (*Defines the absolute or relative target position coordinates*)
		Type : McAGFPRGIPSAbsRelPosCoorEnum; (*Absolute/relative position coordinates selector setting*)
	END_STRUCT;
	McAGFPRGIPSAbsRelCirCoorEnum :
		( (*Absolute/relative circle coordinates selector setting*)
		mcAGFPRGIPSARCC_ABS := 0, (*Absolute - Absolute position coordinates*)
		mcAGFPRGIPSARCC_REL := 1 (*Relative - Relative position coordinates*)
		);
	McAGFPRGIPSAbsRelCirCoorType : STRUCT (*Defines the absolute or relative circle coordinates*)
		Type : McAGFPRGIPSAbsRelCirCoorEnum; (*Absolute/relative circle coordinates selector setting*)
	END_STRUCT;
	McAGFPRGIPSJACSACSPrgEnum :
		( (*JACS/ACS programming selector setting*)
		mcAGFPRGIPSJAP_JACS := 0, (*JACS - Programming in joint axes coordinate system*)
		mcAGFPRGIPSJAP_ACS := 1 (*ACS - Programming in axis coordinate system*)
		);
	McAGFPRGIPSJACSACSPrgType : STRUCT (*Switches between programming in JACS and ACS*)
		Type : McAGFPRGIPSJACSACSPrgEnum; (*JACS/ACS programming selector setting*)
	END_STRUCT;
	McAGFPRGIPSCtrCxnEnum :
		( (*Contour connection selector setting*)
		mcAGFPRGIPSCC_INACT := 0, (*Inactive - No edge transition*)
		mcAGFPRGIPSCC_TAN_ARC := 1, (*Tangential arcs - Connect two contour elements via an arc*)
		mcAGFPRGIPSCC_CH := 2 (*Chamfers - Connect two contour elements via a straight line*)
		);
	McAGFPRGIPSCtrCxnTanArcType : STRUCT (*Type mcAGFPRGIPSCC_TAN_ARC settings*)
		Radius : LREAL; (*Radius of inserted arcs [measurement units]*)
	END_STRUCT;
	McAGFPRGIPSCtrCxnChChSpecEnum :
		( (*Chamfer specification selector setting*)
		mcAGFPRGIPSCCCCS_CH_LEN := 0, (*Chamfer length - Chamfer is specified by chamfer length*)
		mcAGFPRGIPSCCCCS_SHORT_PATH := 1 (*Shortened path - Chamfer is specified by shortened path*)
		);
	McAGFPRGIPSCtrCxnChChSpecType : STRUCT (*Defines how the chamfer is specified*)
		Type : McAGFPRGIPSCtrCxnChChSpecEnum; (*Chamfer specification selector setting*)
	END_STRUCT;
	McAGFPRGIPSCtrCxnChType : STRUCT (*Type mcAGFPRGIPSCC_CH settings*)
		ChamferSpecification : McAGFPRGIPSCtrCxnChChSpecType; (*Defines how the chamfer is specified*)
		Length : LREAL; (*Length of chamfer [measurement units]*)
	END_STRUCT;
	McAGFPRGIPSCtrCxnType : STRUCT (*Defines automatic insertion of connecting element between two contours*)
		Type : McAGFPRGIPSCtrCxnEnum; (*Contour connection selector setting*)
		TangentialArcs : McAGFPRGIPSCtrCxnTanArcType; (*Type mcAGFPRGIPSCC_TAN_ARC settings*)
		Chamfers : McAGFPRGIPSCtrCxnChType; (*Type mcAGFPRGIPSCC_CH settings*)
	END_STRUCT;
	McAGFPRGIPSAccHoldDlyEnum :
		( (*Accuracy Hold delay selector setting*)
		mcAGFPRGIPSAHD_NONE := 0, (*None - No delay at accuracy hold*)
		mcAGFPRGIPSAHD_AUT := 1, (*Automatic - Automatically compensate for axis jerk filters*)
		mcAGFPRGIPSAHD_USR_DEF := 2 (*User defined - User defined axis delay*)
		);
	McAGFPRGIPSAccHoldDlyAutType : STRUCT (*Type mcAGFPRGIPSAHD_AUT settings*)
		AdditionalUserDelay : LREAL; (*Additional user delay [s]*)
	END_STRUCT;
	McAGFPRGIPSAccHoldDlyUsrDefType : STRUCT (*Type mcAGFPRGIPSAHD_USR_DEF settings*)
		UserDefinedAxesDelay : LREAL; (*User defined axes delay [s]*)
		AdditionalUserDelay : LREAL; (*Additional user delay [s]*)
	END_STRUCT;
	McAGFPRGIPSAccHoldDlyType : STRUCT (*Defines the delays inserted at each accuracy hold*)
		Type : McAGFPRGIPSAccHoldDlyEnum; (*Accuracy Hold delay selector setting*)
		Automatic : McAGFPRGIPSAccHoldDlyAutType; (*Type mcAGFPRGIPSAHD_AUT settings*)
		UserDefined : McAGFPRGIPSAccHoldDlyUsrDefType; (*Type mcAGFPRGIPSAHD_USR_DEF settings*)
	END_STRUCT;
	McAGFPRGIPSPrgUnitEnum :
		( (*Programming units selector setting*)
		mcAGFPRGIPSPU_USE_AXESGROUP_SET := 0, (*Use AxesGroup settings - The measurement units from AxesGroup settings are used*)
		mcAGFPRGIPSPU_INCH := 1, (*Inches - Programming in inches*)
		mcAGFPRGIPSPU_MILL := 2 (*Millimeters - Programming in millimeters*)
		);
	McAGFPRGIPSPrgUnitType : STRUCT (*Specifies the units of programmed values*)
		Type : McAGFPRGIPSPrgUnitEnum; (*Programming units selector setting*)
	END_STRUCT;
	McAGFPRGIPSFSetFPathEnum :
		( (*Feed path selector setting*)
		mcAGFPRGIPSFSFP_STD := 0, (*Standard - Standard (first cartesian path)*)
		mcAGFPRGIPSFSFP_CUS_F_PATH := 1 (*Custom feed path - Selects the path by name*)
		);
	McAGFPRGIPSFSetFPathCusFPathType : STRUCT (*Type mcAGFPRGIPSFSFP_CUS_F_PATH settings*)
		PathName : McCfgString250Type; (*Name of the path on which the feedrate settings is applied*)
	END_STRUCT;
	McAGFPRGIPSFSetFPathType : STRUCT (*Defines the path to which the feedrate is applied*)
		Type : McAGFPRGIPSFSetFPathEnum; (*Feed path selector setting*)
		CustomFeedPath : McAGFPRGIPSFSetFPathCusFPathType; (*Type mcAGFPRGIPSFSFP_CUS_F_PATH settings*)
	END_STRUCT;
	McAGFPRGIPSFSetFChEnum :
		( (*Feed characteristic selector setting*)
		mcAGFPRGIPSFSFC_STD := 0, (*Standard - Standard feed characteristic*)
		mcAGFPRGIPSFSFC_LIN := 1 (*Linear - Linear feed characteristic*)
		);
	McAGFPRGIPSFSetFChType : STRUCT (*Defines the feed characteristic*)
		Type : McAGFPRGIPSFSetFChEnum; (*Feed characteristic selector setting*)
	END_STRUCT;
	McAGFPRGIPSFSetFTypEnum :
		( (*Feed type selector setting*)
		mcAGFPRGIPSFSFT_F_RATE := 0, (*Feed rate - Feed rate in units/minute*)
		mcAGFPRGIPSFSFT_INVTIME_F_RATE := 1, (*Inverse-time feed rate - Inverse-time feed rate*)
		mcAGFPRGIPSFSFT_F_RATE_PER_REV := 2 (*Feed rate per revolution - Feed rate per revolution in units/revolution*)
		);
	McAGFPRGIPSFSetFTypType : STRUCT (*Defines the feed rate programming type*)
		Type : McAGFPRGIPSFSetFTypEnum; (*Feed type selector setting*)
	END_STRUCT;
	McAGFPRGIPSFSetFRedEnum :
		( (*Feed reduction selector setting*)
		mcAGFPRGIPSFSFR_INACT := 0, (*Inactive - Deactivate feed reduction*)
		mcAGFPRGIPSFSFR_ACT := 1 (*Active - Activate feed reduction*)
		);
	McAGFPRGIPSFSetFRedActType : STRUCT (*Type mcAGFPRGIPSFSFR_ACT settings*)
		ReductionFactor : LREAL; (*Percent of the programmed feedrate [%]*)
		MinimumRadius : LREAL; (*Minimum radius, for this and smaller radii, the maximum reduced feedrate is used [measurement units]*)
		MaximumRadius : LREAL; (*Maximum radius, for this and greater radii, the programmed feedrate is used [measurement units]*)
	END_STRUCT;
	McAGFPRGIPSFSetFRedType : STRUCT (*Defines the feed rate programming type*)
		Type : McAGFPRGIPSFSetFRedEnum; (*Feed reduction selector setting*)
		Active : McAGFPRGIPSFSetFRedActType; (*Type mcAGFPRGIPSFSFR_ACT settings*)
	END_STRUCT;
	McAGFPRGIPSFSetType : STRUCT (*Defines initial settings of feeds*)
		FeedPath : McAGFPRGIPSFSetFPathType; (*Defines the path to which the feedrate is applied*)
		FeedCharacteristic : McAGFPRGIPSFSetFChType; (*Defines the feed characteristic*)
		FeedType : McAGFPRGIPSFSetFTypType; (*Defines the feed rate programming type*)
		FeedReduction : McAGFPRGIPSFSetFRedType; (*Defines the feed rate programming type*)
		FeedRate : LREAL; (*Value of feed rate in units/minute*)
		InverseTimeFeedRate : LREAL; (*Value of inverse-time feed rate*)
		FeedPerRevolution : LREAL; (*Value of feed rate per revolution in units/revolution*)
	END_STRUCT;
	McAGFPRGIPSType : STRUCT (*Defines initial values of modal data*)
		InterpolationType : McAGFPRGIPSIntrplTypType; (*Defines the interpolation type of movement commands*)
		AbsRelPositionCoordinates : McAGFPRGIPSAbsRelPosCoorType; (*Defines the absolute or relative target position coordinates*)
		AbsRelCircleCoordinates : McAGFPRGIPSAbsRelCirCoorType; (*Defines the absolute or relative circle coordinates*)
		JACSACSProgramming : McAGFPRGIPSJACSACSPrgType; (*Switches between programming in JACS and ACS*)
		ContourConnection : McAGFPRGIPSCtrCxnType; (*Defines automatic insertion of connecting element between two contours*)
		AccuracyHoldDelay : McAGFPRGIPSAccHoldDlyType; (*Defines the delays inserted at each accuracy hold*)
		ProgrammingUnits : McAGFPRGIPSPrgUnitType; (*Specifies the units of programmed values*)
		FeedSettings : McAGFPRGIPSFSetType; (*Defines initial settings of feeds*)
	END_STRUCT;
	McAGFPRGDLEnum :
		( (*Default language selector setting*)
		mcAGFPRGDL_GC_BR := 0, (*G-code B&R - G-code B&R language*)
		mcAGFPRGDL_GC_ALT1 := 1, (*G-code Alternative-1 - G-code Alternative-1 language*)
		mcAGFPRGDL_STRUC_TXT := 2, (*Structured text - Structured text language*)
		mcAGFPRGDL_MOT_PKT_LOG := 3, (*Motion packet log - Motion packet log language*)
		mcAGFPRGDL_CUS_LANG_1 := 4 (*Custom language 1 - First custom language defined*)
		);
	McAGFPRGDLType : STRUCT (*Language to use when no file extension is provided*)
		Type : McAGFPRGDLEnum; (*Default language selector setting*)
	END_STRUCT;
	McAGFPRGLEnum :
		( (*Location selector setting*)
		mcAGFPRGL_DEF := 0, (*Default - Default program location*)
		mcAGFPRGL_USR := 1 (*User - User program location*)
		);
	McAGFPRGLDefType : STRUCT (*Type mcAGFPRGL_DEF settings*)
		FileDevice : STRING[250]; (*Program file device*)
	END_STRUCT;
	McAGFPRGLUsrUsrPrgLocType : STRUCT
		FileDevice : STRING[250]; (*Program file device*)
	END_STRUCT;
	McAGFPRGLUsrType : STRUCT (*Type mcAGFPRGL_USR settings*)
		UserProgramLocation : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGLUsrUsrPrgLocType*)
	END_STRUCT;
	McAGFPRGLType : STRUCT (*Program location*)
		Type : McAGFPRGLEnum; (*Location selector setting*)
		Default : McAGFPRGLDefType; (*Type mcAGFPRGL_DEF settings*)
		User : McAGFPRGLUsrType; (*Type mcAGFPRGL_USR settings*)
	END_STRUCT;
	McAGFPRGPEPVAdvSynEnum :
		( (*Synchronization selector setting*)
		mcAGFPRGPEPVAS_IPSYN := 0, (*Interpreter-synchronous - Interpreter-synchronous*)
		mcAGFPRGPEPVAS_PATHSYN := 1 (*Path-synchronous - Path-synchronous*)
		);
	McAGFPRGPEPVAdvSynType : STRUCT (*Synchronization*)
		Type : McAGFPRGPEPVAdvSynEnum; (*Synchronization selector setting*)
	END_STRUCT;
	McAGFPRGPEPVAdvRefEnum :
		( (*Reference selector setting*)
		mcAGFPRGPEPVAR_NO := 0, (*No -*)
		mcAGFPRGPEPVAR_YES := 1 (*Yes -*)
		);
	McAGFPRGPEPVAdvRefType : STRUCT (*Variable is a reference*)
		Type : McAGFPRGPEPVAdvRefEnum; (*Reference selector setting*)
	END_STRUCT;
	McAGFPRGPEPVAdvType : STRUCT
		Alias : STRING[250]; (*Alternative name of process variable*)
		Synchronization : McAGFPRGPEPVAdvSynType; (*Synchronization*)
		Reference : McAGFPRGPEPVAdvRefType; (*Variable is a reference*)
	END_STRUCT;
	McAGFPRGPEPVType : STRUCT
		ProcessVariableName : STRING[250]; (*Name of the process variable*)
		Advanced : McAGFPRGPEPVAdvType;
	END_STRUCT;
	McAGFPRGPEPVSType : STRUCT (*Declaration of process variables*)
		ProcessVariable : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEPVType*)
	END_STRUCT;
	McAGFPRGPEIVAdvArrDimType : STRUCT (*Array dimensions*)
		SizeOfArrayDimemsion : McCfgUnboundedArrayType; (*Connect array of type UDINT*)
	END_STRUCT;
	McAGFPRGPEIVAdvSynEnum :
		( (*Synchronization selector setting*)
		mcAGFPRGPEIVAS_IPSYN := 0, (*Interpreter-synchronous - Interpreter-synchronous*)
		mcAGFPRGPEIVAS_PATHSYN := 1 (*Path-synchronous - Path-synchronous*)
		);
	McAGFPRGPEIVAdvSynType : STRUCT (*Synchronization*)
		Type : McAGFPRGPEIVAdvSynEnum; (*Synchronization selector setting*)
	END_STRUCT;
	McAGFPRGPEIVAdvConstEnum :
		( (*Constant selector setting*)
		mcAGFPRGPEIVAC_NO := 0, (*No -*)
		mcAGFPRGPEIVAC_YES := 1 (*Yes -*)
		);
	McAGFPRGPEIVAdvConstYesType : STRUCT (*Type mcAGFPRGPEIVAC_YES settings*)
		Value : STRING[250]; (*Value of the variable*)
	END_STRUCT;
	McAGFPRGPEIVAdvConstType : STRUCT (*Variable is a constant*)
		Type : McAGFPRGPEIVAdvConstEnum; (*Constant selector setting*)
		Yes : McAGFPRGPEIVAdvConstYesType; (*Type mcAGFPRGPEIVAC_YES settings*)
	END_STRUCT;
	McAGFPRGPEIVAdvType : STRUCT
		ArrayDimensions : McAGFPRGPEIVAdvArrDimType; (*Array dimensions*)
		Synchronization : McAGFPRGPEIVAdvSynType; (*Synchronization*)
		Constant : McAGFPRGPEIVAdvConstType; (*Variable is a constant*)
	END_STRUCT;
	McAGFPRGPEIVType : STRUCT
		VariableName : STRING[250]; (*Name of the variable*)
		DataType : McCfgVarDatTypType; (*Data type*)
		Advanced : McAGFPRGPEIVAdvType;
	END_STRUCT;
	McAGFPRGPEIVSType : STRUCT (*Declaration of variables*)
		InterpreterVariable : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEIVType*)
	END_STRUCT;
	McAGFPRGPEFUNAdvSynEnum :
		( (*Synchronization selector setting*)
		mcAGFPRGPEFUNAS_IPSYN := 0, (*Interpreter-synchronous - Interpreter-synchronous*)
		mcAGFPRGPEFUNAS_PATHSYN := 1 (*Path-synchronous - Path-synchronous*)
		);
	McAGFPRGPEFUNAdvSynType : STRUCT (*Synchronization*)
		Type : McAGFPRGPEFUNAdvSynEnum; (*Synchronization selector setting*)
	END_STRUCT;
	McAGFPRGPEFUNAdvExeInSimEnum :
		( (*Function is executed in simulation run of program restart*)
		mcAGFPRGPEFUNAEIS_NO := 0, (*No*)
		mcAGFPRGPEFUNAEIS_YES := 1 (*Yes*)
		);
	McAGFPRGPEFUNAdvReturnRefEnum :
		( (*Return type of function is a reference*)
		mcAGFPRGPEFUNARR_NO := 0, (*No*)
		mcAGFPRGPEFUNARR_YES := 1 (*Yes*)
		);
	McAGFPRGPEFUNAdvType : STRUCT
		Synchronization : McAGFPRGPEFUNAdvSynType; (*Synchronization*)
		ExecuteInSimulation : McAGFPRGPEFUNAdvExeInSimEnum; (*Function is executed in simulation run of program restart*)
		ReturnReference : McAGFPRGPEFUNAdvReturnRefEnum; (*Return type of function is a reference*)
	END_STRUCT;
	McAGFPRGPEFUNArgRefEnum :
		( (*Argument pass by reference*)
		mcAGFPRGPEFUNAR_NO := 0, (*No*)
		mcAGFPRGPEFUNAR_YES := 1 (*Yes*)
		);
	McAGFPRGPEFUNArgType : STRUCT
		Name : STRING[250]; (*Argument name*)
		DataType : McCfgVarDatTypType; (*Data type*)
		Reference : McAGFPRGPEFUNArgRefEnum; (*Argument pass by reference*)
	END_STRUCT;
	McAGFPRGPEFUNType : STRUCT
		FunctionName : STRING[250]; (*Name of function*)
		FunctionReturnType : McCfgFunDatTypType; (*Return data type of function*)
		Advanced : McAGFPRGPEFUNAdvType;
		Argument : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEFUNArgType*)
	END_STRUCT;
	McAGFPRGPEFUNSType : STRUCT (*Declaration of functions*)
		Function : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEFUNType*)
	END_STRUCT;
	McAGFPRGPEFBIAdvSynEnum :
		( (*Synchronization selector setting*)
		mcAGFPRGPEFBIAS_IPSYN := 0, (*Interpreter-synchronous - Interpreter-synchronous*)
		mcAGFPRGPEFBIAS_PATHSYN := 1 (*Path-synchronous - Path-synchronous*)
		);
	McAGFPRGPEFBIAdvSynType : STRUCT (*Synchronization*)
		Type : McAGFPRGPEFBIAdvSynEnum; (*Synchronization selector setting*)
	END_STRUCT;
	McAGFPRGPEFBIAdvBlkEnum :
		( (*Executing other code waiting for Function block to complete*)
		mcAGFPRGPEFBIAB_NO := 0, (*No*)
		mcAGFPRGPEFBIAB_YES := 1 (*Yes*)
		);
	McAGFPRGPEFBIAdvType : STRUCT
		Alias : STRING[250]; (*Alternative name of Function block instance*)
		Synchronization : McAGFPRGPEFBIAdvSynType; (*Synchronization*)
		Blocking : McAGFPRGPEFBIAdvBlkEnum; (*Executing other code waiting for Function block to complete*)
	END_STRUCT;
	McAGFPRGPEFBIType : STRUCT
		ProcessVariableName : STRING[250]; (*Name of process variable as Function block instance*)
		Advanced : McAGFPRGPEFBIAdvType;
	END_STRUCT;
	McAGFPRGPEFBISType : STRUCT (*Declaration of process variable as Function block instance*)
		FunctionBlockInstance : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEFBIType*)
	END_STRUCT;
	McAGFPRGPEPPSRIsPatEnum :
		( (*Is pattern selector setting*)
		mcAGFPRGPEPPSRIP_NO := 0, (*No -*)
		mcAGFPRGPEPPSRIP_YES := 1 (*Yes -*)
		);
	McAGFPRGPEPPSRIsPatType : STRUCT (*The search string is a regular expression instead of a plain text string*)
		Type : McAGFPRGPEPPSRIsPatEnum; (*Is pattern selector setting*)
	END_STRUCT;
	McAGFPRGPEPreProSubstRuleType : STRUCT
		SearchString : STRING[250]; (*The string to search for. The search is case sensitive.*)
		IsPattern : McAGFPRGPEPPSRIsPatType; (*The search string is a regular expression instead of a plain text string*)
		ReplaceString : STRING[250]; (*The replacement text string*)
	END_STRUCT;
	McAGFPRGPEPreProSubstType : STRUCT (*Substitutions rules are applied to the CNC program prior its parsing*)
		SubstitutionRule : McCfgUnboundedArrayType; (*Connect array of type McAGFPRGPEPreProSubstRuleType*)
	END_STRUCT;
	McAGFPRGPEAlsAxDefType : STRUCT
		AliasAxis : McCfgUnboundedArrayType; (*Name of the alias axis (Connect array of type STRING)*)
	END_STRUCT;
	McAGFPRGPEType : STRUCT (*Program elements*)
		ProcessVariables : McAGFPRGPEPVSType; (*Declaration of process variables*)
		InterpreterVariables : McAGFPRGPEIVSType; (*Declaration of variables*)
		Functions : McAGFPRGPEFUNSType; (*Declaration of functions*)
		FunctionBlockInstance : McAGFPRGPEFBISType; (*Declaration of process variable as Function block instance*)
		PreprocessorSubstitutions : McAGFPRGPEPreProSubstType; (*Substitutions rules are applied to the CNC program prior its parsing*)
		AliasAxesDefinitions : McAGFPRGPEAlsAxDefType;
	END_STRUCT;
	McCfgAxGrpFeatPrgType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PRG*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		InitialProgramSettings : McAGFPRGIPSType; (*Defines initial values of modal data*)
		DefaultLanguage : McAGFPRGDLType; (*Language to use when no file extension is provided*)
		Location : McAGFPRGLType; (*Program location*)
		ProgramElements : McAGFPRGPEType; (*Program elements*)
	END_STRUCT;
	McCfgAxGrpFeatCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_COMP*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		MaxCartesianDeviation : LREAL; (*Defines the maximum allowable deviation of Cartesian path [measurement units]*)
		MaxNonCartesianDeviation : LREAL; (*Defines the maximum allowable deviation of non-Cartesian axes [measurement units]*)
		MaxCartesianTransitionAngle : LREAL; (*Cartesian path transitions with greater angle than 'Max Cartesian Transition Angle' are not compressed [degree]*)
		MaxNonCartesianTransitionAngle : LREAL; (*Non-Cartesian path transitions with greater angle than 'Max Non-Cartesian Transition Angle' are not compressed [degree]*)
		MaxCartesianLength : LREAL; (*Points with greater distance than 'Max Cartesian Length' are not compressed [measurement units]*)
	END_STRUCT;
	McAGFCDCEntryExitModEnum :
		( (*Entry/Exit mode selector setting*)
		mcAGFCDCEEM_DIR := 0, (*Direct - The corrected contour is entered/exited directly.*)
		mcAGFCDCEEM_TRANS_LIN := 1, (*Transition line - A transition block perpendicular to the contour is added.*)
		mcAGFCDCEEM_CLST_PT := 2 (*Closest point - A transition movement to the closest positions after bottlenecks is added.*)
		);
	McAGFCDCEntryExitModType : STRUCT (*Defines how the corrected contour is entered/exited*)
		Type : McAGFCDCEntryExitModEnum; (*Entry/Exit mode selector setting*)
	END_STRUCT;
	McAGFCDCBnErrorEnum :
		( (*Bottleneck error selector setting*)
		mcAGFCDCBE_NOT_USE := 0, (*Not used - Bottleneck error not used*)
		mcAGFCDCBE_BLK_LIM := 1, (*Block limit - Maximum number of blocks allowed in bottleneck*)
		mcAGFCDCBE_DIST_LIM := 2 (*Distance limit - Maximum allowed distance from bottleneck intersection*)
		);
	McAGFCDCBnErrorBlkLimType : STRUCT (*Type mcAGFCDCBE_BLK_LIM settings*)
		BlockLimit : INT; (*Maximum number of blocks allowed in bottleneck [movement blocks]*)
	END_STRUCT;
	McAGFCDCBnErrorDistLimType : STRUCT (*Type mcAGFCDCBE_DIST_LIM settings*)
		DistanceLimit : LREAL; (*Maximum allowed distance from bottleneck intersection [measurement units]*)
	END_STRUCT;
	McAGFCDCBnErrorType : STRUCT (*Defines error behaviour when bottleneck is encoutered*)
		Type : McAGFCDCBnErrorEnum; (*Bottleneck error selector setting*)
		BlockLimit : McAGFCDCBnErrorBlkLimType; (*Type mcAGFCDCBE_BLK_LIM settings*)
		DistanceLimit : McAGFCDCBnErrorDistLimType; (*Type mcAGFCDCBE_DIST_LIM settings*)
	END_STRUCT;
	McCfgAxGrpFeatCdcType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_CDC*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		EntryExitMode : McAGFCDCEntryExitModType; (*Defines how the corrected contour is entered/exited*)
		Lookahead : UINT; (*Defines the size of the lookahead buffer [movement blocks]*)
		BottleneckError : McAGFCDCBnErrorType; (*Defines error behaviour when bottleneck is encoutered*)
	END_STRUCT;
	McAGFFFFwdModEnum :
		( (*Feed-forward mode selector setting*)
		mcAGFFFFM_COMP_AND_TRANS := 0, (*Compute and transmit - Compute feed-forward torques and transmit to drives*)
		mcAGFFFFM_DIS := 1, (*Disabled - Feed-forward feature is disabled*)
		mcAGFFFFM_COMP := 2 (*Compute - Compute feed-forward torques*)
		);
	McAGFFFFwdModType : STRUCT (*Defines if feed-forward is only computed or computed and transmitted*)
		Type : McAGFFFFwdModEnum; (*Feed-forward mode selector setting*)
	END_STRUCT;
	McAGFFExJntAxType : STRUCT
		JointAxisName : McCfgUnboundedArrayType; (*Connect array of type McCfgString250Type*)
	END_STRUCT;
	McAGFFParIdentEnum :
		( (*Parameter identification selector setting*)
		mcAGFFPI_NOT_USE := 0, (*Not used -*)
		mcAGFFPI_USE := 1 (*Used -*)
		);
	McAGFFParIdentUseInFType : STRUCT (*Defines names of the input files (from IdentTool)*)
		TesttrajectoryData : STRING[250]; (*File with data for testtrajectory*)
	END_STRUCT;
	McAGFFParIdentUseOutFType : STRUCT (*Defines names of the output files (for IdentTool)*)
		IdentificationResultData : STRING[250]; (*File with data for dynamic parameter calculation*)
	END_STRUCT;
	McAGFFParIdentUseType : STRUCT (*Type mcAGFFPI_USE settings*)
		FileDevice : STRING[250]; (*File device for file sharing*)
		InputFiles : McAGFFParIdentUseInFType; (*Defines names of the input files (from IdentTool)*)
		OutputFiles : McAGFFParIdentUseOutFType; (*Defines names of the output files (for IdentTool)*)
	END_STRUCT;
	McAGFFParIdentType : STRUCT (*Dynamic model parameter identification*)
		Type : McAGFFParIdentEnum; (*Parameter identification selector setting*)
		Used : McAGFFParIdentUseType; (*Type mcAGFFPI_USE settings*)
	END_STRUCT;
	McAGFFFFwdFltrEnum :
		( (*Feed-forward filter selector setting*)
		mcAGFFFFF_NOT_USE := 0, (*Not used - Feed-forward filter is not used*)
		mcAGFFFFF_USE_JERK_TIME := 1 (*Use jerk time - Use feed-forward filter with axis jerk time*)
		);
	McAGFFFFwdFltrType : STRUCT (*Defines feed-forward filtering*)
		Type : McAGFFFFwdFltrEnum; (*Feed-forward filter selector setting*)
	END_STRUCT;
	McCfgAxGrpFeatFfType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FF*)
		FeedForwardMode : McAGFFFFwdModType; (*Defines if feed-forward is only computed or computed and transmitted*)
		RiseTime : REAL; (*Rise time after successful homing [s]*)
		ExcludedJointAxes : McAGFFExJntAxType;
		ParameterIdentification : McAGFFParIdentType; (*Dynamic model parameter identification*)
		FeedForwardFilter : McAGFFFFwdFltrType; (*Defines feed-forward filtering*)
	END_STRUCT;
	McCfgAxGrpFeatFfModeType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FF_M*)
		FeedForwardMode : McAGFFFFwdModType; (*Defines if feed-forward is only computed or computed and transmitted*)
	END_STRUCT;
	McAGFFHSProdFrmType : STRUCT (*The product coordinate system is based on the last system coordinate system.*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHSSysFrm5Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		ProductFrame : McAGFFHSProdFrmType; (*The product coordinate system is based on the last system coordinate system.*)
	END_STRUCT;
	McAGFFHSSysFrm4Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame5 : McAGFFHSSysFrm5Type;
	END_STRUCT;
	McAGFFHSSysFrm3Type : STRUCT
		FrameTable : McCfgReferenceType; (*Defines the initial frame table*)
		FrameIndex : UINT; (*Defines the initial frame index in the initial frame table*)
		SystemFrame4 : McAGFFHSSysFrm4Type;
	END_STRUCT;
	McAGFFHSSysFrm2Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame3 : McAGFFHSSysFrm3Type;
	END_STRUCT;
	McAGFFHSSysFrm1Type : STRUCT (*System frames are based on the machine coordinate system and form a chain.*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame2 : McAGFFHSSysFrm2Type;
	END_STRUCT;
	McAGFFHSBaseFrmType : STRUCT (*Is the base for a kinematic transformation (robot).*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHSMachFrmType : STRUCT (*Base of all other coordinate systems of the axes group.*)
		SystemFrame1 : McAGFFHSSysFrm1Type; (*System frames are based on the machine coordinate system and form a chain.*)
		BaseFrame : McAGFFHSBaseFrmType; (*Is the base for a kinematic transformation (robot).*)
	END_STRUCT;
	McCfgAxGrpFeatFrmHierStdType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FRM_HIER_STD*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		MachineFrame : McAGFFHSMachFrmType; (*Base of all other coordinate systems of the axes group.*)
	END_STRUCT;
	McAGFFHCFrmPropMappType : STRUCT
		BCS : STRING[250]; (*Name of the frame that should be mapped to BCS (mandatory)*)
		PCS : STRING[250]; (*Name of the frame that should be mapped to PCS (mandatory)*)
		SCS1 : STRING[250]; (*Name of the frame that should be mapped to SCS1*)
		SCS2 : STRING[250]; (*Name of the frame that should be mapped to SCS2*)
		SCS3 : STRING[250]; (*Name of the frame that should be mapped to SCS3*)
		SCS4 : STRING[250]; (*Name of the frame that should be mapped to SCS4*)
		SCS5 : STRING[250]; (*Name of the frame that should be mapped to SCS5*)
	END_STRUCT;
	McAGFFHCFTypeEnum :
		( (*Type selector setting*)
		mcAGFFHCFT_STD_FRM := 0, (*Standard frame -*)
		mcAGFFHCFT_FRM_TBL_FRM := 1, (*Frame table frame -*)
		mcAGFFHCFT_PRG_MOVE_FRM := 2 (*Programmed moving frame -*)
		);
	McAGFFHCFTStdFrmType : STRUCT (*Type mcAGFFHCFT_STD_FRM settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHCFTFrmTblFrmType : STRUCT (*Type mcAGFFHCFT_FRM_TBL_FRM settings*)
		FrameTable : McCfgReferenceType; (*Defines the initial frame table*)
		FrameIndex : UINT; (*Defines the initial frame index in the initial frame table*)
	END_STRUCT;
	McAGFFHCFTPMFMoveTypEnum :
		( (*Movement type selector setting*)
		mcAGFFHCFTPMFMT_TRANS_X := 0, (*Translation X - Translation in X-direction*)
		mcAGFFHCFTPMFMT_TRANS_Y := 1, (*Translation Y - Translation in Y-direction*)
		mcAGFFHCFTPMFMT_TRANS_Z := 2, (*Translation Z - Translation in Z-direction*)
		mcAGFFHCFTPMFMT_ROT_X := 3, (*Rotation X - Rotation around X*)
		mcAGFFHCFTPMFMT_ROT_Y := 4, (*Rotation Y - Rotation around Y*)
		mcAGFFHCFTPMFMT_ROT_Z := 5 (*Rotation Z - Rotation around Z*)
		);
	McAGFFHCFTPMFMoveTypType : STRUCT (*Direction of the movement*)
		Type : McAGFFHCFTPMFMoveTypEnum; (*Movement type selector setting*)
	END_STRUCT;
	McAGFFHCFTPMFType : STRUCT (*Type mcAGFFHCFT_PRG_MOVE_FRM settings*)
		MovementType : McAGFFHCFTPMFMoveTypType; (*Direction of the movement*)
		SlaveAxisName : STRING[250]; (*Name of the slave axis that is mapped to the frame*)
	END_STRUCT;
	McAGFFHCFTypeType : STRUCT (*Frame type*)
		Type : McAGFFHCFTypeEnum; (*Type selector setting*)
		StandardFrame : McAGFFHCFTStdFrmType; (*Type mcAGFFHCFT_STD_FRM settings*)
		FrameTableFrame : McAGFFHCFTFrmTblFrmType; (*Type mcAGFFHCFT_FRM_TBL_FRM settings*)
		ProgrammedMovingFrame : McAGFFHCFTPMFType; (*Type mcAGFFHCFT_PRG_MOVE_FRM settings*)
	END_STRUCT;
	McAGFFHCFramesType : STRUCT
		ParentFrameName : STRING[250]; (*Parent frame name*)
		Name : STRING[250]; (*Frame name*)
		Type : McAGFFHCFTypeType; (*Frame type*)
	END_STRUCT;
	McAGFFHCMachFrmType : STRUCT (*Base of all other coordinate systems of the axes group*)
		Name : STRING[250]; (*Frame name*)
		Frame : McCfgUnboundedArrayType; (*Connect array of type McAGFFHCFramesType*)
	END_STRUCT;
	McAGFFHCType : STRUCT (*Custom frame-hierarchy of an axes group*)
		FramePropertyMapping : McAGFFHCFrmPropMappType;
		MachineFrame : McAGFFHCMachFrmType; (*Base of all other coordinate systems of the axes group*)
	END_STRUCT;
	McCfgAxGrpFeatFrmHierCusType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FRM_HIER_CUS*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		CustomFrameHierarchy : McAGFFHCType; (*Custom frame-hierarchy of an axes group*)
	END_STRUCT;
	McCfgAxGrpFeatJogType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_JOG*)
		Reserve : USINT;
	END_STRUCT;
	McAGFLCrossSlideType : STRUCT
		CoordinateName : STRING[250];
	END_STRUCT;
	McCfgAxGrpFeatLahType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_LAH*)
		CrossSlide : McAGFLCrossSlideType;
	END_STRUCT;
	McAGFMFunIdxTypEnum :
		( (*Index type selector setting*)
		mcAGFMFIT_SNG := 0, (*Single - Single M-Function*)
		mcAGFMFIT_RNG := 1 (*Range - Range of M-Functions*)
		);
	McAGFMFunIdxTypSngType : STRUCT (*Type mcAGFMFIT_SNG settings*)
		Index : UINT; (*Index of the M-Function*)
	END_STRUCT;
	McAGFMFunIdxTypRngType : STRUCT (*Type mcAGFMFIT_RNG settings*)
		IndexFrom : UINT; (*Start index of the M-Functions range*)
		IndexTo : UINT; (*End index of the M-Functions range*)
	END_STRUCT;
	McAGFMFunIdxTypType : STRUCT (*Single M-Function or Range of M-Functions*)
		Type : McAGFMFunIdxTypEnum; (*Index type selector setting*)
		Single : McAGFMFunIdxTypSngType; (*Type mcAGFMFIT_SNG settings*)
		Range : McAGFMFunIdxTypRngType; (*Type mcAGFMFIT_RNG settings*)
	END_STRUCT;
	McAGFMFunBlkEnum :
		( (*Blocking selector setting*)
		mcAGFMFB_EN := 0, (*Enabled - Blocking M-Function*)
		mcAGFMFB_DIS := 1 (*Disabled - Non-blocking M-Function*)
		);
	McAGFMFunBlkType : STRUCT (*M-Function blocking / non-blocking*)
		Type : McAGFMFunBlkEnum; (*Blocking selector setting*)
	END_STRUCT;
	McAGFMFunOutEnum :
		( (*Output selector setting*)
		mcAGFMFO_B4 := 0, (*Before - The M-Function will be set before the movement is executed*)
		mcAGFMFO_A := 1 (*After - The M-Function will be set after the movement is executed*)
		);
	McAGFMFunOutType : STRUCT (*Output position of the M-Function programmed with movement*)
		Type : McAGFMFunOutEnum; (*Output selector setting*)
	END_STRUCT;
	McAGFMFunInSimEnum :
		( (*In simulation selector setting*)
		mcAGFMFIS_NOT_USE := 0, (*Not used - The M-Function is not set*)
		mcAGFMFIS_SET := 1 (*Set - The M-Function is set*)
		);
	McAGFMFunInSimType : STRUCT (*Behaviour of M-Function during simulation run*)
		Type : McAGFMFunInSimEnum; (*In simulation selector setting*)
	END_STRUCT;
	McAGFMFunType : STRUCT
		IndexType : McAGFMFunIdxTypType; (*Single M-Function or Range of M-Functions*)
		Blocking : McAGFMFunBlkType; (*M-Function blocking / non-blocking*)
		Output : McAGFMFunOutType; (*Output position of the M-Function programmed with movement*)
		InSimulation : McAGFMFunInSimType; (*Behaviour of M-Function during simulation run*)
		PVMapping : STRING[250]; (*Name of the process variable representing M-Function*)
		Counter : STRING[250]; (*Name of the process variable representing M-Function occurrence counter*)
	END_STRUCT;
	McCfgAxGrpFeatMFunType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_MFUN*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		MFunction : McCfgUnboundedArrayType; (*Connect array of type McAGFMFunType*)
	END_STRUCT;
	McAGFMECmbElmType : STRUCT (*Defines the combined monitoring elements*)
		BasicMonitor : STRING[250]; (*Basic monitor*)
	END_STRUCT;
	McAGFMESngElmEnum :
		( (*Single element selector setting*)
		mcAGFMESE_CUS := 0, (*Custom - Custom monitoring element*)
		mcAGFMESE_PRG_IDENT := 1, (*Program identification - Program identification*)
		mcAGFMESE_LIN_IDENT := 2, (*Line identification - Line identification*)
		mcAGFMESE_PRG_RUNT := 3, (*Program runtime - Program runtime*)
		mcAGFMESE_SET_POS := 4, (*Set positions - Set positions*)
		mcAGFMESE_ONL_PATH_INFL := 5, (*Online path influence - Online path influence*)
		mcAGFMESE_TOOL := 7, (*Tool - Tool*)
		mcAGFMESE_IP := 8, (*Interpreter - Interpreter*)
		mcAGFMESE_LIM := 9, (*Limits - Limits*)
		mcAGFMESE_TORQ := 10, (*Torques - Torques*)
		mcAGFMESE_F_SET := 11, (*Feed settings - FeedSettings*)
		mcAGFMESE_PATH_INFO := 12, (*Path information - PathInformation*)
		mcAGFMESE_GB_TORQ := 13, (*Gearbox torques - Gearbox torques*)
		mcAGFMESE_CROSS_SEC_LOADS := 14, (*Cross section loads - Cross section loads*)
		mcAGFMESE_DYN_DEC := 15, (*Dynamic decelerations - Dynamic decelerations*)
		mcAGFMESE_ORIENT_COMP := 16, (*Orientation compliance - Orientation compliance*)
		mcAGFMESE_SKIP_BLK := 17, (*Skip block - Skip block*)
		mcAGFMESE_WS_MON := 18 (*Workspace monitoring - Workspace monitoring*)
		);
	McAGFMESngElmCusType : STRUCT (*Type mcAGFMESE_CUS settings*)
		ConnectionPoint : STRING[250]; (*Connection point to a custom monitoring element*)
	END_STRUCT;
	McAGFMESngElmPrgIdentType : STRUCT (*Type mcAGFMESE_PRG_IDENT settings*)
		MainProgram : STRING[250]; (*Information about the current main routine*)
		InitProgram : STRING[250]; (*Information about the current init program*)
		CurrentProgram : STRING[250]; (*Information about the current core subroutine*)
		ProgramSequence : STRING[250]; (*Full sequence of routines/subroutines, from the main routine to the current core subroutine*)
	END_STRUCT;
	McAGFMESngElmLinIdentType : STRUCT (*Type mcAGFMESE_LIN_IDENT settings*)
		LineNumber : STRING[250]; (*Current line number*)
		BlockNumber : STRING[250]; (*Current block number*)
		BlockMonitor : STRING[250]; (*Block monitor (current NC block, last 2 NC blocks and next 2 NC blocks)*)
		ByteOffset : STRING[250]; (*Current byte offset*)
		JointAxesRemainingDistance : STRING[250]; (*Joint axes remaining distance until the block end*)
		TCPRemainingDistanceInMCS : STRING[250]; (*TCP remaining distance until the block end (MCS)*)
		SlaveAxesRemainingDistance : STRING[250]; (*Slave axes remaining distance until the block end*)
	END_STRUCT;
	McAGFMESngElmPrgRunTType : STRUCT (*Type mcAGFMESE_PRG_RUNT settings*)
		OverallRuntime : STRING[250]; (*Time elapsed since the current program started*)
		MovementRuntime : STRING[250]; (*Movement time in the current program*)
		OverallDwellTime : STRING[250]; (*Dwell time since the current program started*)
		DwellTime : STRING[250]; (*Current dwell time*)
		DwellTimeRemaining : STRING[250]; (*Current dwell time left*)
	END_STRUCT;
	McAGFMESngElmSetPosType : STRUCT (*Type mcAGFMESE_SET_POS settings*)
		JointAxesSetPositions : STRING[250]; (*Position setpoints for joint axes*)
		AxesSetPositions : STRING[250]; (*Position setpoints for axes*)
		TCPSetPositionsInMCS : STRING[250]; (*TCP position setpoints in the machine coordinate system*)
		TCPSetPositionsInPCS : STRING[250]; (*TCP position setpoints in the product coordinate system*)
		SlaveAxesSetPositions : STRING[250]; (*Position setpoints for slave axes*)
	END_STRUCT;
	McAGFMESngElmOPIPrgSetPosType : STRUCT (*Programmed position setpoints*)
		JointAxesSetPositions : STRING[250]; (*Programmed position setpoints for joint axes*)
		AxesSetPositions : STRING[250]; (*Programmed position setpoints for axes*)
		TCPSetPositionsInMCS : STRING[250]; (*Programmed TCP position setpoints in the machine coordinate system*)
		TCPSetPositionsInPCS : STRING[250]; (*Programmed TCP position setpoints in the product coordinate system*)
		SlaveAxesSetPositions : STRING[250]; (*Programmed position setpoints for slave axes*)
	END_STRUCT;
	McAGFMESngElmOPIInflSetPosType : STRUCT (*Influenced position setpoints (programmed set positions with configured online path influences)*)
		JointAxesSetPositions : STRING[250]; (*Influenced position setpoints for joint axes*)
		AxesSetPositions : STRING[250]; (*Influenced position setpoints for axes*)
		TCPSetPositionsInMCS : STRING[250]; (*Influenced TCP position setpoints in the machine coordinate system*)
		TCPSetPositionsInPCS : STRING[250]; (*Influenced TCP position setpoints in the product coordinate system*)
		SlaveAxesSetPositions : STRING[250]; (*Influenced position setpoints for slave axes*)
	END_STRUCT;
	McAGFMESngElmOPIType : STRUCT (*Type mcAGFMESE_ONL_PATH_INFL settings*)
		ProgrammedSetPositions : McAGFMESngElmOPIPrgSetPosType; (*Programmed position setpoints*)
		InfluencedSetPositions : McAGFMESngElmOPIInflSetPosType; (*Influenced position setpoints (programmed set positions with configured online path influences)*)
	END_STRUCT;
	McAGFMESngElmToolType : STRUCT (*Type mcAGFMESE_TOOL settings*)
		ToolIndex : STRING[250]; (*Current tool index*)
		ToolIdentifier : STRING[250]; (*Current tool identifier*)
		ToolDescription : STRING[250]; (*Current tool data*)
	END_STRUCT;
	McAGFMESngElmIpType : STRUCT (*Type mcAGFMESE_IP settings*)
		IPMonitor : STRING[250]; (*Interpreter monitor*)
		FileMonitor : STRING[250]; (*File monitor*)
	END_STRUCT;
	McAGFMESngElmLimType : STRUCT (*Type mcAGFMESE_LIM settings*)
		ACSAxisIndex : DINT; (*Index of the axis*)
		ACSAxisLimits : STRING[250]; (*Limit values for the axis*)
	END_STRUCT;
	McAGFMESngElmTorqType : STRUCT (*Type mcAGFMESE_TORQ settings*)
		Computed : STRING[250]; (*Calculated feed-forward torque*)
		Transmitted : STRING[250]; (*Transmitted feed-forward torque*)
		Unfiltered : STRING[250]; (*Calculated, unfiltered feed-forward torque*)
	END_STRUCT;
	McAGFMESngElmFSetType : STRUCT (*Type mcAGFMESE_F_SET settings*)
		CurrentSettings : STRING[250]; (*Currently active feed settings*)
	END_STRUCT;
	McAGFMESngElmPathInfoType : STRUCT (*Type mcAGFMESE_PATH_INFO settings*)
		PathName : STRING[250]; (*Name of the path in a NC program*)
		SelectedPathInfo : STRING[250]; (*Shows info about path specified by name*)
	END_STRUCT;
	McAGFMESngElmGBTorqType : STRUCT (*Type mcAGFMESE_GB_TORQ settings*)
		Torques : STRING[250]; (*Gearbox torques*)
		Unfiltered : STRING[250]; (*Unfiltered gearbox torques*)
	END_STRUCT;
	McAGFMESngElmCrossSecLoadsType : STRUCT (*Type mcAGFMESE_CROSS_SEC_LOADS settings*)
		Loads : STRING[250]; (*Cross section loads*)
		Unfiltered : STRING[250]; (*Unfiltered cross section loads*)
	END_STRUCT;
	McAGFMESngElmDynDecType : STRUCT (*Type mcAGFMESE_DYN_DEC settings*)
		Decelerations : STRING[250]; (*Dynamic decelerations*)
	END_STRUCT;
	McAGFMESngElmOrientCompType : STRUCT (*Type mcAGFMESE_ORIENT_COMP settings*)
		ProgrammedTCPSetPositionsInMCS : STRING[250]; (*Programmed TCP position setpoints in the machine coordinate system*)
		ProgrammedTCPSetPositionsInPCS : STRING[250]; (*Programmed TCP position setpoints in the product coordinate system*)
		OrientationError : STRING[250]; (*Orientation error*)
	END_STRUCT;
	McAGFMESngElmSkipBlkType : STRUCT (*Type mcAGFMESE_SKIP_BLK settings*)
		SkipLevels : STRING[250]; (*Current states of skip block levels*)
	END_STRUCT;
	McAGFMESngElmWsMonType : STRUCT (*Type mcAGFMESE_WS_MON settings*)
		Workspace : STRING[250]; (*Current workspace monitoring status*)
	END_STRUCT;
	McAGFMESngElmType : STRUCT (*Defines the single monitoring element*)
		Type : McAGFMESngElmEnum; (*Single element selector setting*)
		Custom : McAGFMESngElmCusType; (*Type mcAGFMESE_CUS settings*)
		ProgramIdentification : McAGFMESngElmPrgIdentType; (*Type mcAGFMESE_PRG_IDENT settings*)
		LineIdentification : McAGFMESngElmLinIdentType; (*Type mcAGFMESE_LIN_IDENT settings*)
		ProgramRuntime : McAGFMESngElmPrgRunTType; (*Type mcAGFMESE_PRG_RUNT settings*)
		SetPositions : McAGFMESngElmSetPosType; (*Type mcAGFMESE_SET_POS settings*)
		OnlinePathInfluence : McAGFMESngElmOPIType; (*Type mcAGFMESE_ONL_PATH_INFL settings*)
		Tool : McAGFMESngElmToolType; (*Type mcAGFMESE_TOOL settings*)
		Interpreter : McAGFMESngElmIpType; (*Type mcAGFMESE_IP settings*)
		Limits : McAGFMESngElmLimType; (*Type mcAGFMESE_LIM settings*)
		Torques : McAGFMESngElmTorqType; (*Type mcAGFMESE_TORQ settings*)
		FeedSettings : McAGFMESngElmFSetType; (*Type mcAGFMESE_F_SET settings*)
		PathInformation : McAGFMESngElmPathInfoType; (*Type mcAGFMESE_PATH_INFO settings*)
		GearboxTorques : McAGFMESngElmGBTorqType; (*Type mcAGFMESE_GB_TORQ settings*)
		CrossSectionLoads : McAGFMESngElmCrossSecLoadsType; (*Type mcAGFMESE_CROSS_SEC_LOADS settings*)
		DynamicDecelerations : McAGFMESngElmDynDecType; (*Type mcAGFMESE_DYN_DEC settings*)
		OrientationCompliance : McAGFMESngElmOrientCompType; (*Type mcAGFMESE_ORIENT_COMP settings*)
		SkipBlock : McAGFMESngElmSkipBlkType; (*Type mcAGFMESE_SKIP_BLK settings*)
		WorkspaceMonitoring : McAGFMESngElmWsMonType; (*Type mcAGFMESE_WS_MON settings*)
	END_STRUCT;
	McAGFMESngElmsType : STRUCT (*Defines the single monitoring elements*)
		SingleElement : McCfgUnboundedArrayType; (*Defines the single monitoring element (Connect array of type McAGFMESngElmType)*)
	END_STRUCT;
	McCfgAxGrpFeatMonElemType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_MON_ELEM*)
		CombinedElements : McAGFMECmbElmType; (*Defines the combined monitoring elements*)
		SingleElements : McAGFMESngElmsType; (*Defines the single monitoring elements*)
	END_STRUCT;
	McAGFMLLocEnum :
		( (*Location selector setting*)
		mcAGFMLL_DEF := 0, (*Default - Default location*)
		mcAGFMLL_USR := 1 (*User - User location*)
		);
	McAGFMLLocDefType : STRUCT (*Type mcAGFMLL_DEF settings*)
		FileDevice : STRING[250]; (*Motion packet log file device*)
	END_STRUCT;
	McAGFMLLocUsrType : STRUCT (*Type mcAGFMLL_USR settings*)
		FileDevice : STRING[250]; (*Motion packet log file device*)
	END_STRUCT;
	McAGFMLLocType : STRUCT (*Location of motion packet log files*)
		Type : McAGFMLLocEnum; (*Location selector setting*)
		Default : McAGFMLLocDefType; (*Type mcAGFMLL_DEF settings*)
		User : McAGFMLLocUsrType; (*Type mcAGFMLL_USR settings*)
	END_STRUCT;
	McAGFMLAdvParEnum :
		( (*Advanced parameters selector setting*)
		mcAGFMLAP_NOT_USE := 0, (*Not used -*)
		mcAGFMLAP_USE := 1 (*Used -*)
		);
	McAGFMLAdvParUseType : STRUCT (*Type mcAGFMLAP_USE settings*)
		FileSize : DINT; (*Motion packet log file size [B]*)
		FilesCount : DINT; (*Number of kept motion packet log files*)
	END_STRUCT;
	McAGFMLAdvParType : STRUCT (*Advanced parameters of motion packet log*)
		Type : McAGFMLAdvParEnum; (*Advanced parameters selector setting*)
		Used : McAGFMLAdvParUseType; (*Type mcAGFMLAP_USE settings*)
	END_STRUCT;
	McCfgAxGrpFeatMpLogType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_MP_LOG*)
		Location : McAGFMLLocType; (*Location of motion packet log files*)
		AdvancedParameters : McAGFMLAdvParType; (*Advanced parameters of motion packet log*)
	END_STRUCT;
	McAGFPDPathTypEnum :
		( (*Type selector setting*)
		mcAGFPDPT_CART_PATH := 0, (*Cartesian path - The path is calculated from all Cartesian coordinates*)
		mcAGFPDPT_ORIENT_PATH := 1, (*Orientation path - The path is calculated from the orientation coordinates. Only available for mechanical systems with orientation axis.*)
		mcAGFPDPT_PHS_AX_PATH := 2, (*Physical axes path - Path definition containing all path controlled physical axes*)
		mcAGFPDPT_CUS_PHS_AX_PATH := 3, (*Custom physical axes path - Path definition containing all selected path controlled physical axes*)
		mcAGFPDPT_CUS_TCP_COOR_PATH := 4 (*Custom TCP coordinates path - Path definition containing all selected TCP coordinates*)
		);
	McAGFPDCalcInEnum :
		( (*Calculated in selector setting*)
		mcAGFPDCI_MCS := 0, (*MCS - Machine coordinate system*)
		mcAGFPDCI_PCS := 1, (*PCS - Product coordinate system*)
		mcAGFPDCI_SEL_BY_NAME := 2 (*Selected by name - Select the frame by name.*)
		);
	McAGFPDCalcInSelByNameType : STRUCT (*Type mcAGFPDCI_SEL_BY_NAME settings*)
		FrameName : STRING[250]; (*Name of the frame in which the path is calculated.*)
	END_STRUCT;
	McAGFPDCalcInType : STRUCT (*In this frame the path is calculated.*)
		Type : McAGFPDCalcInEnum; (*Calculated in selector setting*)
		SelectedByName : McAGFPDCalcInSelByNameType; (*Type mcAGFPDCI_SEL_BY_NAME settings*)
	END_STRUCT;
	McAGFPDPathTypCartPathType : STRUCT (*Type mcAGFPDPT_CART_PATH settings*)
		CalculatedIn : McAGFPDCalcInType; (*In this frame the path is calculated.*)
	END_STRUCT;
	McAGFPDPathTypOrientPathType : STRUCT (*Type mcAGFPDPT_ORIENT_PATH settings*)
		CalculatedIn : McAGFPDCalcInType; (*In this frame the path is calculated.*)
	END_STRUCT;
	McAGFPDPathTypCusPhsAxPathType : STRUCT (*Type mcAGFPDPT_CUS_PHS_AX_PATH settings*)
		AxisName : McCfgUnboundedArrayType; (*Name of the axis which is included in limiting the physical axes path (Connect array of type McCfgString250Type)*)
	END_STRUCT;
	McAGFPDPathTypCusTCPCoorPathType : STRUCT (*Type mcAGFPDPT_CUS_TCP_COOR_PATH settings*)
		CalculatedIn : McAGFPDCalcInType; (*In this frame the path is calculated.*)
		CoordinateName : McCfgUnboundedArrayType; (*Name of the coordinate which is included in the path (Connect array of type McCfgString250Type)*)
	END_STRUCT;
	McAGFPDPathTypType : STRUCT (*Type of the path*)
		Type : McAGFPDPathTypEnum; (*Type selector setting*)
		CartesianPath : McAGFPDPathTypCartPathType; (*Type mcAGFPDPT_CART_PATH settings*)
		OrientationPath : McAGFPDPathTypOrientPathType; (*Type mcAGFPDPT_ORIENT_PATH settings*)
		CustomPhysicalAxesPath : McAGFPDPathTypCusPhsAxPathType; (*Type mcAGFPDPT_CUS_PHS_AX_PATH settings*)
		CustomTCPCoordinatesPath : McAGFPDPathTypCusTCPCoorPathType; (*Type mcAGFPDPT_CUS_TCP_COOR_PATH settings*)
	END_STRUCT;
	McAGFPDPathLimEnum :
		( (*Path limits selector setting*)
		mcAGFPDPL_INT := 0, (*Internal - Internal definition of path limits*)
		mcAGFPDPL_EXT := 1 (*External - External definition of path limits*)
		);
	McAGFPDPathLimIntVelEnum :
		( (*Velocity selector setting*)
		mcAGFPDPLIV_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIV_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntVelType : STRUCT (*Velocity limit*)
		Type : McAGFPDPathLimIntVelEnum; (*Velocity selector setting*)
		Basic : McCfgLimVelBaseType; (*Type mcAGFPDPLIV_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntAccEnum :
		( (*Acceleration selector setting*)
		mcAGFPDPLIA_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIA_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntAccType : STRUCT (*Acceleration limit*)
		Type : McAGFPDPathLimIntAccEnum; (*Acceleration selector setting*)
		Basic : McCfgLimAccBaseType; (*Type mcAGFPDPLIA_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntDecEnum :
		( (*Deceleration selector setting*)
		mcAGFPDPLID_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLID_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntDecType : STRUCT (*Deceleration limit*)
		Type : McAGFPDPathLimIntDecEnum; (*Deceleration selector setting*)
		Basic : McCfgLimDecBaseType; (*Type mcAGFPDPLID_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntJerkEnum :
		( (*Jerk selector setting*)
		mcAGFPDPLIJ_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIJ_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntJerkType : STRUCT (*Jerk limit*)
		Type : McAGFPDPathLimIntJerkEnum; (*Jerk selector setting*)
		Basic : McCfgLimJerkBaseType; (*Type mcAGFPDPLIJ_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntType : STRUCT (*Type mcAGFPDPL_INT settings*)
		Velocity : McAGFPDPathLimIntVelType; (*Velocity limit*)
		Acceleration : McAGFPDPathLimIntAccType; (*Acceleration limit*)
		Deceleration : McAGFPDPathLimIntDecType; (*Deceleration limit*)
		Jerk : McAGFPDPathLimIntJerkType; (*Jerk limit*)
	END_STRUCT;
	McAGFPDPathLimType : STRUCT (*Defines the path limits*)
		Type : McAGFPDPathLimEnum; (*Path limits selector setting*)
		Internal : McAGFPDPathLimIntType; (*Type mcAGFPDPL_INT settings*)
		External : McCfgExtLimRefType; (*Type mcAGFPDPL_EXT settings*)
	END_STRUCT;
	McAGFPDPathType : STRUCT (*Predefined path definitions can be used*)
		Name : STRING[250]; (*Name of the path in a NC program*)
		Type : McAGFPDPathTypType; (*Type of the path*)
		PathLimits : McAGFPDPathLimType; (*Defines the path limits*)
	END_STRUCT;
	McCfgAxGrpFeatPathDefType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PATH_DEF*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Path : McCfgUnboundedArrayType; (*Predefined path definitions can be used (Connect array of type McAGFPDPathType)*)
	END_STRUCT;
	McAGFPSCondStopEnum :
		( (*Conditional stop selector setting*)
		mcAGFPSCS_NOT_USE := 0, (*Not used - No stop during simulation run*)
		mcAGFPSCS_STOP := 1 (*Stop - Stop on active conditional stop during simulation run*)
		);
	McAGFPSCondStopType : STRUCT (*Behaviour of conditional stops during simulation run*)
		Type : McAGFPSCondStopEnum; (*Conditional stop selector setting*)
	END_STRUCT;
	McAGFPSAdvParEnum :
		( (*Advanced parameters selector setting*)
		mcAGFPSAP_NOT_USE := 0, (*Not used -*)
		mcAGFPSAP_USE := 1 (*Used -*)
		);
	McAGFPSAdvParUseType : STRUCT (*Type mcAGFPSAP_USE settings*)
		PathDistRestartBufferSize : UINT; (*Number of blocks saved before the program abort [blocks]*)
		ProgIntRestartBufferInitSize : UDINT; (*Initial size of Interpreter restart buffers (separately for path and Interpreter synchronous jobs) [B]*)
	END_STRUCT;
	McAGFPSAdvParType : STRUCT (*Advanced parameters*)
		Type : McAGFPSAdvParEnum; (*Advanced parameters selector setting*)
		Used : McAGFPSAdvParUseType; (*Type mcAGFPSAP_USE settings*)
	END_STRUCT;
	McCfgAxGrpFeatPrgSimType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PRG_SIM*)
		ConditionalStop : McAGFPSCondStopType; (*Behaviour of conditional stops during simulation run*)
		AdvancedParameters : McAGFPSAdvParType; (*Advanced parameters*)
		RestartDataLocation : STRING[250]; (*File device to save or load restart data*)
	END_STRUCT;
	McAGFSSpdlType : STRUCT
		SlaveAxisName : STRING[250]; (*Name of the slave axis coordinate defined inside the AxesGroup (e.g. U, V, etc.)*)
	END_STRUCT;
	McCfgAxGrpFeatSpindlesType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_SPINDLES*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Spindle : McCfgUnboundedArrayType; (*Connect array of type McAGFSSpdlType*)
	END_STRUCT;
	McAGFTToolEnum :
		( (*Tools selector setting*)
		mcAGFTT_TOOL_TBL := 0, (*Tool table -*)
		mcAGFTT_SNG_TOOL := 1 (*Single tool -*)
		);
	McAGFTToolToolTblType : STRUCT (*Type mcAGFTT_TOOL_TBL settings*)
		ToolTable : McCfgReferenceType; (*Name of the initial tool table*)
		ToolIdentifier : STRING[250]; (*Defines the initial tool identifier in the tool table*)
	END_STRUCT;
	McAGFTToolSngToolType : STRUCT (*Type mcAGFTT_SNG_TOOL settings*)
		Tool : McCfgReferenceType; (*Name of the tool*)
		DynamicParameter : McCfgReferenceType; (*Name of the dynamic parameter*)
	END_STRUCT;
	McAGFTToolType : STRUCT (*Defines the initial tool settings*)
		Type : McAGFTToolEnum; (*Tools selector setting*)
		ToolTable : McAGFTToolToolTblType; (*Type mcAGFTT_TOOL_TBL settings*)
		SingleTool : McAGFTToolSngToolType; (*Type mcAGFTT_SNG_TOOL settings*)
	END_STRUCT;
	McCfgAxGrpFeatToolType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TOOL*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Tools : McAGFTToolType; (*Defines the initial tool settings*)
	END_STRUCT;
	McAGFWSelfColDetectEnum :
		( (*Self-collision detection selector setting*)
		mcAGFWSCD_NOT_USE := 0, (*Not used - Self-collision detection is not used*)
		mcAGFWSCD_EN := 1 (*Enabled - Self-collision detection is enabled*)
		);
	McAGFWSelfColDetectType : STRUCT (*Self-collision detection*)
		Type : McAGFWSelfColDetectEnum; (*Self-collision detection selector setting*)
	END_STRUCT;
	McAGFWFlgWsEnum :
		( (*Flange workspace selector setting*)
		mcAGFWFW_NOT_USE := 0, (*Not used - Workspace monitoring of flange is not used*)
		mcAGFWFW_EN := 1 (*Enabled - Workspace monitoring of flange is enabled*)
		);
	McAGFWFlgWsEnType : STRUCT (*Type mcAGFWFW_EN settings*)
		WorkspaceReference : McCfgReferenceType; (*Name of the workspace reference*)
	END_STRUCT;
	McAGFWFlgWsType : STRUCT (*Additional workspace monitoring of flange*)
		Type : McAGFWFlgWsEnum; (*Flange workspace selector setting*)
		Enabled : McAGFWFlgWsEnType; (*Type mcAGFWFW_EN settings*)
	END_STRUCT;
	McCfgAxGrpFeatWsmType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_WSM*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		WorkspaceReference : McCfgReferenceType; (*Name of the workspace reference*)
		SelfCollisionDetection : McAGFWSelfColDetectType; (*Self-collision detection*)
		FlangeWorkspace : McAGFWFlgWsType; (*Additional workspace monitoring of flange*)
	END_STRUCT;
	McAGFEPCAGrpIntrplExType : STRUCT
		AxisName : McCfgUnboundedArrayType; (*Name of the axis in axes group (Connect array of type McCfgString250Type)*)
	END_STRUCT;
	McAGFEPCAGrpStopExType : STRUCT (*Group stop command will have no effect on the axes referenced in this list if they are excluded from interpolation*)
		AxisReference : McCfgUnboundedArrayType; (*Name of the axis reference (Connect array of type McCfgReferenceType)*)
	END_STRUCT;
	McAGFEPCAGrpOvrExType : STRUCT (*Group axis override will have no effect on the axes referenced in this list if they are excluded from interpolation*)
		AxisReference : McCfgUnboundedArrayType; (*Name of the axis reference (Connect array of type McCfgReferenceType)*)
	END_STRUCT;
	McAGFEPCAGrpErrStopExType : STRUCT (*Group error stop command will have no effect on the axes referenced in this list if they are excluded from interpolation*)
		AxisReference : McCfgUnboundedArrayType; (*Name of the axis reference (Connect array of type McCfgReferenceType)*)
	END_STRUCT;
	McCfgAxGrpFeatExPathAxType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_EX_PATH_AX*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		GroupInterpolationExclusion : McAGFEPCAGrpIntrplExType;
		GroupStopExclusion : McAGFEPCAGrpStopExType; (*Group stop command will have no effect on the axes referenced in this list if they are excluded from interpolation*)
		GroupOverrideExclusion : McAGFEPCAGrpOvrExType; (*Group axis override will have no effect on the axes referenced in this list if they are excluded from interpolation*)
		GroupErrorStopExclusion : McAGFEPCAGrpErrStopExType; (*Group error stop command will have no effect on the axes referenced in this list if they are excluded from interpolation*)
	END_STRUCT;
	McAGFPTrgTypEnum :
		( (*Type selector setting*)
		mcAGFPTT_ACP := 0, (*ACOPOS - Trigger source ACOPOS*)
		mcAGFPTT_VAR := 1 (*Variable - Trigger source Variable*)
		);
	McAGFPTrgTypAcpDigInEnum :
		( (*Digital input selector setting*)
		mcAGFPTTADI_TRG_1 := 0, (*Trigger 1 - Hardware trigger input 1*)
		mcAGFPTTADI_TRG_2 := 1 (*Trigger 2 - Hardware trigger input 2*)
		);
	McAGFPTrgTypAcpDigInType : STRUCT (*Hardware trigger input*)
		Type : McAGFPTrgTypAcpDigInEnum; (*Digital input selector setting*)
	END_STRUCT;
	McAGFPTrgTypAcpEdgEnum :
		( (*Edge selector setting*)
		mcAGFPTTAE_POS := 0, (*Positive - Positive edge*)
		mcAGFPTTAE_NEG := 1 (*Negative - Negative edge*)
		);
	McAGFPTrgTypAcpEdgType : STRUCT (*Trigger edge*)
		Type : McAGFPTrgTypAcpEdgEnum; (*Edge selector setting*)
	END_STRUCT;
	McAGFPTrgTypAcpType : STRUCT (*Type mcAGFPTT_ACP settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
		DigitalInput : McAGFPTrgTypAcpDigInType; (*Hardware trigger input*)
		Edge : McAGFPTrgTypAcpEdgType; (*Trigger edge*)
	END_STRUCT;
	McAGFPTrgTypVarEdgEnum :
		( (*Edge selector setting*)
		mcAGFPTTVE_POS := 0, (*Positive - Positive edge*)
		mcAGFPTTVE_NEG := 1 (*Negative - Negative edge*)
		);
	McAGFPTrgTypVarEdgType : STRUCT (*Trigger edge*)
		Type : McAGFPTrgTypVarEdgEnum; (*Edge selector setting*)
	END_STRUCT;
	McAGFPTrgTypVarTimeStampEnum :
		( (*Time stamp selector setting*)
		mcAGFPTTVTS_NOT_USE := 0, (*Not used - Not used*)
		mcAGFPTTVTS_USE := 1 (*Used - Used*)
		);
	McAGFPTrgTypVarTimeStampUseType : STRUCT (*Type mcAGFPTTVTS_USE settings*)
		PVMapping : STRING[250]; (*Name of the process variable (DINT) representing trigger time stamp*)
	END_STRUCT;
	McAGFPTrgTypVarTimeStampType : STRUCT (*Trigger time stamp*)
		Type : McAGFPTrgTypVarTimeStampEnum; (*Time stamp selector setting*)
		Used : McAGFPTrgTypVarTimeStampUseType; (*Type mcAGFPTTVTS_USE settings*)
	END_STRUCT;
	McAGFPTrgTypVarType : STRUCT (*Type mcAGFPTT_VAR settings*)
		PVMapping : STRING[250]; (*Name of the process variable (BOOL) representing trigger*)
		Edge : McAGFPTrgTypVarEdgType; (*Trigger edge*)
		TimeStamp : McAGFPTrgTypVarTimeStampType; (*Trigger time stamp*)
	END_STRUCT;
	McAGFPTrgTypType : STRUCT (*Type of the trigger source*)
		Type : McAGFPTrgTypEnum; (*Type selector setting*)
		ACOPOS : McAGFPTrgTypAcpType; (*Type mcAGFPTT_ACP settings*)
		Variable : McAGFPTrgTypVarType; (*Type mcAGFPTT_VAR settings*)
	END_STRUCT;
	McAGFPTrgType : STRUCT
		Name : STRING[250]; (*Name of the trigger in a NC program*)
		Type : McAGFPTrgTypType; (*Type of the trigger source*)
	END_STRUCT;
	McAGFPTrgsType : STRUCT
		Trigger : McCfgUnboundedArrayType; (*Connect array of type McAGFPTrgType*)
	END_STRUCT;
	McCfgAxGrpFeatProbeType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PROBE*)
		Triggers : McAGFPTrgsType;
	END_STRUCT;
	McAGFSIGPredDistEnum :
		( (*Distance selector setting*)
		mcAGFSIGPD_NOT_USE := 0, (*Not used -*)
		mcAGFSIGPD_USE := 1 (*Used -*)
		);
	McAGFSIGPredDistUseType : STRUCT (*Type mcAGFSIGPD_USE settings*)
		Distance : LREAL; (*Maximal prediction distance for signals [measurement units]*)
	END_STRUCT;
	McAGFSIGPredDistType : STRUCT
		Type : McAGFSIGPredDistEnum; (*Distance selector setting*)
		Used : McAGFSIGPredDistUseType; (*Type mcAGFSIGPD_USE settings*)
	END_STRUCT;
	McAGFSIGPredTimeEnum :
		( (*Time selector setting*)
		mcAGFSIGPT_NOT_USE := 0, (*Not used -*)
		mcAGFSIGPT_USE := 1 (*Used -*)
		);
	McAGFSIGPredTimeUseType : STRUCT (*Type mcAGFSIGPT_USE settings*)
		Time : LREAL; (*Maximal prediction time for signals [s]*)
	END_STRUCT;
	McAGFSIGPredTimeType : STRUCT
		Type : McAGFSIGPredTimeEnum; (*Time selector setting*)
		Used : McAGFSIGPredTimeUseType; (*Type mcAGFSIGPT_USE settings*)
	END_STRUCT;
	McAGFSIGPredType : STRUCT
		Distance : McAGFSIGPredDistType;
		Time : McAGFSIGPredTimeType;
	END_STRUCT;
	McAGFSIGAxDlyEnum :
		( (*Axes delay selector setting*)
		mcAGFSIGAD_AUT := 0, (*Automatic -*)
		mcAGFSIGAD_USR_DEF_TIME := 1 (*User defined time -*)
		);
	McAGFSIGAxDlyUsrDefTimeType : STRUCT (*Type mcAGFSIGAD_USR_DEF_TIME settings*)
		Time : LREAL; (*[s]*)
	END_STRUCT;
	McAGFSIGAxDlyType : STRUCT (*The delay from the PLC set value generation to the value of the drive*)
		Type : McAGFSIGAxDlyEnum; (*Axes delay selector setting*)
		UserDefinedTime : McAGFSIGAxDlyUsrDefTimeType; (*Type mcAGFSIGAD_USR_DEF_TIME settings*)
	END_STRUCT;
	McAGFSIGSigMissedSigBxEnum :
		( (*Missed signal behaviour selector setting*)
		mcAGFSIGSMSB_NO_OUT_ERR := 0, (*No output error - The missed signal is not output and the program is terminated with an error*)
		mcAGFSIGSMSB_DELAYED_OUT_WAR := 1, (*Delayed output warning - The missed signal is output as quickly as possible and a warning is entered in the logger*)
		mcAGFSIGSMSB_DELAYED_OUT_NO_WAR := 2 (*Delayed output no warning - The missed signal is output as quickly as possible and no warning is entered in the logger*)
		);
	McAGFSIGSigMissedSigBxType : STRUCT (*Behaviour of signal in case it can not be output on intended position*)
		Type : McAGFSIGSigMissedSigBxEnum; (*Missed signal behaviour selector setting*)
	END_STRUCT;
	McAGFSIGSigsUnCfgSigType : STRUCT (*Behaviour of signals which are declared direct in a program (non blocking M-Function or path synchronous statements)*)
		MissedSignalBehaviour : McAGFSIGSigMissedSigBxType; (*Behaviour of signal in case it can not be output on intended position*)
	END_STRUCT;
	McAGFSIGSigActEnum :
		( (*Action selector setting*)
		mcAGFSIGSA_MFUN := 0 (*M-Function -*)
		);
	McAGFSIGSigActMFunType : STRUCT (*Type mcAGFSIGSA_MFUN settings*)
		Index : UINT; (*Index of the M-Function*)
	END_STRUCT;
	McAGFSIGSigActType : STRUCT (*Action of the signal*)
		Type : McAGFSIGSigActEnum; (*Action selector setting*)
		MFunction : McAGFSIGSigActMFunType; (*Type mcAGFSIGSA_MFUN settings*)
	END_STRUCT;
	McAGFSIGSigReacTimeEnum :
		( (*Reaction time selector setting*)
		mcAGFSIGSRT_NOT_USE := 0, (*Not used -*)
		mcAGFSIGSRT_USE := 1 (*Used -*)
		);
	McAGFSIGSigReacTimeUseType : STRUCT (*Type mcAGFSIGSRT_USE settings*)
		Time : LREAL; (*Reaction time [s]*)
	END_STRUCT;
	McAGFSIGSigReacTimeType : STRUCT (*Reaction time of the corresponding device*)
		Type : McAGFSIGSigReacTimeEnum; (*Reaction time selector setting*)
		Used : McAGFSIGSigReacTimeUseType; (*Type mcAGFSIGSRT_USE settings*)
	END_STRUCT;
	McAGFSIGSigMsPrcEnum :
		( (*Microsecond precision selector setting*)
		mcAGFSIGSMP_NOT_USE := 0, (*Not used -*)
		mcAGFSIGSMP_VAR := 1 (*Variable -*)
		);
	McAGFSIGSigMsPrcVarType : STRUCT (*Type mcAGFSIGSMP_VAR settings*)
		TimeStamp : STRING[250]; (*Name of the process variable (DINT) for the output of the signal time stamp*)
		TimeStampCounter : STRING[250]; (*Name of the process variable (SINT) which increments with every change of the signal time stamp*)
	END_STRUCT;
	McAGFSIGSigMsPrcType : STRUCT (*Microsecond precision of the signal*)
		Type : McAGFSIGSigMsPrcEnum; (*Microsecond precision selector setting*)
		Variable : McAGFSIGSigMsPrcVarType; (*Type mcAGFSIGSMP_VAR settings*)
	END_STRUCT;
	McAGFSIGSigType : STRUCT
		Name : STRING[250]; (*Name of the signal in an NC program*)
		Action : McAGFSIGSigActType; (*Action of the signal*)
		ReactionTime : McAGFSIGSigReacTimeType; (*Reaction time of the corresponding device*)
		MicrosecondPrecision : McAGFSIGSigMsPrcType; (*Microsecond precision of the signal*)
		OutputShift : UINT; (*The signal is output a defined number of cycles earlier [cycles]*)
		MissedSignalBehaviour : McAGFSIGSigMissedSigBxType; (*Behaviour of signal in case it can not be output on intended position*)
	END_STRUCT;
	McAGFSIGSigsType : STRUCT
		UnConfiguredSignals : McAGFSIGSigsUnCfgSigType; (*Behaviour of signals which are declared direct in a program (non blocking M-Function or path synchronous statements)*)
		Signal : McCfgUnboundedArrayType; (*Connect array of type McAGFSIGSigType*)
	END_STRUCT;
	McCfgAxGrpFeatSigType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_SIG*)
		Prediction : McAGFSIGPredType;
		AxesDelay : McAGFSIGAxDlyType; (*The delay from the PLC set value generation to the value of the drive*)
		Signals : McAGFSIGSigsType;
	END_STRUCT;
	McAGF2DCCompTypEnum :
		( (*Type selector setting*)
		mcAGF2DCCT_JNT_AX := 0 (*Joint Axis - Joint axis compensation*)
		);
	McAGF2DCCompTypJntAxType : STRUCT (*Type mcAGF2DCCT_JNT_AX settings*)
		Source : McCfgReferenceType; (*Source axis*)
		Compensated : McCfgReferenceType; (*Compensated axis*)
	END_STRUCT;
	McAGF2DCCompTypType : STRUCT (*Type of compensation*)
		Type : McAGF2DCCompTypEnum; (*Type selector setting*)
		JointAxis : McAGF2DCCompTypJntAxType; (*Type mcAGF2DCCT_JNT_AX settings*)
	END_STRUCT;
	McAGF2DCCompDatEnum :
		( (*Compensation data selector setting*)
		mcAGF2DCCD_PT_LST := 0, (*Points list - Compensation data specified using list of points*)
		mcAGF2DCCD_CSV_F := 1 (*CSV file - Reference to CSV file with compensation data*)
		);
	McAGF2DCCompDatPtLstPtType : STRUCT
		Source : LREAL; (*Position of source*)
		Compensation : LREAL; (*Compensation value*)
	END_STRUCT;
	McAGF2DCCompDatPtLstType : STRUCT (*Type mcAGF2DCCD_PT_LST settings*)
		Point : McCfgUnboundedArrayType; (*Connect array of type McAGF2DCCompDatPtLstPtType*)
	END_STRUCT;
	McAGF2DCCompDatCSVFType : STRUCT (*Type mcAGF2DCCD_CSV_F settings*)
		FileDevice : STRING[250]; (*File device*)
		FileName : STRING[250]; (*File name*)
	END_STRUCT;
	McAGF2DCCompDatType : STRUCT (*Compensation data*)
		Type : McAGF2DCCompDatEnum; (*Compensation data selector setting*)
		PointsList : McAGF2DCCompDatPtLstType; (*Type mcAGF2DCCD_PT_LST settings*)
		CSVFile : McAGF2DCCompDatCSVFType; (*Type mcAGF2DCCD_CSV_F settings*)
	END_STRUCT;
	McAGF2DCCompType : STRUCT
		ID : UINT; (*Compensation ID*)
		Type : McAGF2DCCompTypType; (*Type of compensation*)
		Data : McAGF2DCCompDatType; (*Compensation data*)
	END_STRUCT;
	McCfgAxGrpFeat2DCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_2D_COMP*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Compensation : McCfgUnboundedArrayType; (*Connect array of type McAGF2DCCompType*)
	END_STRUCT;
	McAGF3DCCompTypEnum :
		( (*Type selector setting*)
		mcAGF3DCCT_JNT_AX := 0 (*Joint Axis - Joint axis compensation*)
		);
	McAGF3DCCompTypJntAxType : STRUCT (*Type mcAGF3DCCT_JNT_AX settings*)
		Source1 : McCfgReferenceType; (*First source axis*)
		Source2 : McCfgReferenceType; (*Second source axis*)
		Compensated : McCfgReferenceType; (*Compensated axis*)
	END_STRUCT;
	McAGF3DCCompTypType : STRUCT (*Type of compensation*)
		Type : McAGF3DCCompTypEnum; (*Type selector setting*)
		JointAxis : McAGF3DCCompTypJntAxType; (*Type mcAGF3DCCT_JNT_AX settings*)
	END_STRUCT;
	McAGF3DCCompDatEnum :
		( (*Compensation data selector setting*)
		mcAGF3DCCD_PT_LST := 0, (*Points list - Compensation data specified using list of points*)
		mcAGF3DCCD_CSV_F := 1 (*CSV file - Reference to CSV file with compensation data*)
		);
	McAGF3DCCompDatPtLstPtType : STRUCT
		Source1 : LREAL; (*Position of source 1*)
		Source2 : LREAL; (*Position of source 2*)
		Compensation : LREAL; (*Compensation value*)
	END_STRUCT;
	McAGF3DCCompDatPtLstType : STRUCT (*Type mcAGF3DCCD_PT_LST settings*)
		Point : McCfgUnboundedArrayType; (*Connect array of type McAGF3DCCompDatPtLstPtType*)
	END_STRUCT;
	McAGF3DCCompDatCSVFType : STRUCT (*Type mcAGF3DCCD_CSV_F settings*)
		FileDevice : STRING[250]; (*File device*)
		FileName : STRING[250]; (*File name*)
	END_STRUCT;
	McAGF3DCCompDatType : STRUCT (*Compensation data*)
		Type : McAGF3DCCompDatEnum; (*Compensation data selector setting*)
		PointsList : McAGF3DCCompDatPtLstType; (*Type mcAGF3DCCD_PT_LST settings*)
		CSVFile : McAGF3DCCompDatCSVFType; (*Type mcAGF3DCCD_CSV_F settings*)
	END_STRUCT;
	McAGF3DCCompType : STRUCT
		ID : UINT; (*Compensation ID*)
		Type : McAGF3DCCompTypType; (*Type of compensation*)
		Data : McAGF3DCCompDatType; (*Compensation data*)
	END_STRUCT;
	McCfgAxGrpFeat3DCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_3D_COMP*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Compensation : McCfgUnboundedArrayType; (*Connect array of type McAGF3DCCompType*)
	END_STRUCT;
	McAGFPPOutEnum :
		( (*Output 1-N selector setting*)
		mcAGFPPO_F := 0, (*File - File output*)
		mcAGFPPO_STREAM := 1 (*Stream - Stream output*)
		);
	McAGFPPOFFmtEnum :
		( (*Format selector setting*)
		mcAGFPPOFF_SVG := 0 (*SVG - SVG format*)
		);
	McAGFPPOFFmtSVGTrfEnum :
		( (*Transformation selector setting*)
		mcAGFPPOFFST_AUT := 0, (*Automatic - Automatic scale and translation*)
		mcAGFPPOFFST_WRK_AREA := 1 (*Working area - Settings of working area*)
		);
	McAGFPPLDCnrType : STRUCT (*Left down corner of working area*)
		X : LREAL; (*X coordinate [measurement unit]*)
		Y : LREAL; (*Y coordinate [measurement unit]*)
	END_STRUCT;
	McAGFPPRTCnrType : STRUCT (*Right top corner of working area*)
		X : LREAL; (*X coordinate [measurement unit]*)
		Y : LREAL; (*Y coordinate [measurement unit]*)
	END_STRUCT;
	McAGFPPOFFmtSVGTrfWrkAreaType : STRUCT (*Type mcAGFPPOFFST_WRK_AREA settings*)
		LeftDownCorner : McAGFPPLDCnrType; (*Left down corner of working area*)
		RightTopConner : McAGFPPRTCnrType; (*Right top corner of working area*)
	END_STRUCT;
	McAGFPPOFFmtSVGTrfType : STRUCT (*Transformation of working area to SVG output*)
		Type : McAGFPPOFFmtSVGTrfEnum; (*Transformation selector setting*)
		WorkingArea : McAGFPPOFFmtSVGTrfWrkAreaType; (*Type mcAGFPPOFFST_WRK_AREA settings*)
	END_STRUCT;
	McAGFPPOFFmtSVGViewEnum :
		( (*View*)
		mcAGFPPOFFSV_XY := 0, (*XY - Plane XY*)
		mcAGFPPOFFSV_YZ := 1, (*YZ - Plane YZ*)
		mcAGFPPOFFSV_XZ := 2, (*XZ - Plane XZ*)
		mcAGFPPOFFSV_TOP_FRT_RIGHT := 3, (*Top front right - Isometric projection with top-front-right view over XY plane*)
		mcAGFPPOFFSV_TOP_FRT_LFT := 4, (*Top front left - Isometric projection with top-front-left view over XY plane*)
		mcAGFPPOFFSV_TOP_BCK_LFT := 5, (*Top back left - Isometric projection with top-back-left view over XY plane*)
		mcAGFPPOFFSV_TOP_BCK_RIGHT := 6 (*Top back right - Isometric projection with top-back-right view over XY plane*)
		);
	McAGFPPOFFmtSVGContEnum :
		( (*Content 1-N selector setting*)
		mcAGFPPOFFSC_MCS_PATH := 0 (*MCS path - Path of Machine coordinate system*)
		);
	McAGFPPContSvgSupEnum :
		( (*Suppression selector setting*)
		mcAGFPPCSS_INACT := 0, (*Inactive - Suppression is inactive*)
		mcAGFPPCSS_MFUN := 1 (*Mfunction - Suppression is enabled and disabled by M-functions*)
		);
	McAGFPPContSvgSupMfunType : STRUCT (*Type mcAGFPPCSS_MFUN settings*)
		Enable : UDINT; (*M-function number to enable output suppression*)
		Disable : UDINT; (*M-function number to disable output suppression*)
	END_STRUCT;
	McAGFPPContSvgSupType : STRUCT (*Suppression of SVG output*)
		Type : McAGFPPContSvgSupEnum; (*Suppression selector setting*)
		Mfunction : McAGFPPContSvgSupMfunType; (*Type mcAGFPPCSS_MFUN settings*)
	END_STRUCT;
	McAGFPPOFFmtSVGContMCSPathType : STRUCT (*Type mcAGFPPOFFSC_MCS_PATH settings*)
		Color : STRING[250]; (*Color*)
		Width : UDINT; (*Width [pixel]*)
		GroupId : STRING[250]; (*SVG group id to control property of content*)
		Suppression : McAGFPPContSvgSupType; (*Suppression of SVG output*)
	END_STRUCT;
	McAGFPPOFFmtSVGContType : STRUCT
		Type : McAGFPPOFFmtSVGContEnum; (*Content 1-N selector setting*)
		MCSPath : McAGFPPOFFmtSVGContMCSPathType; (*Type mcAGFPPOFFSC_MCS_PATH settings*)
	END_STRUCT;
	McAGFPPOFFmtSVGType : STRUCT (*Type mcAGFPPOFF_SVG settings*)
		Width : UDINT; (*Width of SVG output [pixel]*)
		Height : UDINT; (*Height of SVG output [pixel]*)
		Margin : UDINT; (*Margin of SVG output [pixel]*)
		Transformation : McAGFPPOFFmtSVGTrfType; (*Transformation of working area to SVG output*)
		View : McAGFPPOFFmtSVGViewEnum; (*View*)
		Content : McCfgUnboundedArrayType; (*Connect array of type McAGFPPOFFmtSVGContType*)
	END_STRUCT;
	McAGFPPOFFmtType : STRUCT (*Format of the output*)
		Type : McAGFPPOFFmtEnum; (*Format selector setting*)
		SVG : McAGFPPOFFmtSVGType; (*Type mcAGFPPOFF_SVG settings*)
	END_STRUCT;
	McAGFPPOFType : STRUCT (*Type AGFPPO_FILE settings*)
		FileDevice : STRING[250]; (*File device*)
		FileName : STRING[250]; (*File name*)
		FileStatus : STRING[250]; (*PV mapping of file status*)
		Start : STRING[250]; (*PV mapping of command to path preview start*)
		Stop : STRING[250]; (*PV mapping of command to path preview stop*)
		FileSize : UDINT; (*Maximum size of file [kB]*)
		Format : McAGFPPOFFmtType; (*Format of the output*)
	END_STRUCT;
	McAGFPPOSFmtEnum :
		( (*Format selector setting*)
		mcAGFPPOSF_SVG := 0 (*SVG - SVG format*)
		);
	McAGFPPOSFmtSVGPropEnum :
		( (*Properties selector setting*)
		mcAGFPPOSFSP_AUT := 0, (*Automatic - Properties are derived from File output.*)
		mcAGFPPOSFSP_USR := 1 (*User - User properties*)
		);
	McAGFPPOSFmtSVGPropAutType : STRUCT (*Type mcAGFPPOSFSP_AUT settings*)
		OutputIndex : UINT; (*Index of File Output from configuration*)
	END_STRUCT;
	McAGFPPOSFmtSVGPropUsrTrfEnum :
		( (*Transformation selector setting*)
		mcAGFPPOSFSPUT_WRK_AREA := 0 (*Working area - Settings of working area*)
		);
	McAGFPPOSFSVGPUTrfWrkAreaType : STRUCT (*Type mcAGFPPOSFSPUT_WRK_AREA settings*)
		LeftDownCorner : McAGFPPLDCnrType; (*Left down corner of working area*)
		RightTopConner : McAGFPPRTCnrType; (*Right top conner of working area*)
	END_STRUCT;
	McAGFPPOSFmtSVGPropUsrTrfType : STRUCT (*Transformation of working area to SVG output*)
		Type : McAGFPPOSFmtSVGPropUsrTrfEnum; (*Transformation selector setting*)
		WorkingArea : McAGFPPOSFSVGPUTrfWrkAreaType; (*Type mcAGFPPOSFSPUT_WRK_AREA settings*)
	END_STRUCT;
	McAGFPPOSFmtSVGPropUsrType : STRUCT (*Type mcAGFPPOSFSP_USR settings*)
		Width : UDINT; (*Width of SVG output [pixel]*)
		Height : UDINT; (*Height of SVG output [pixel]*)
		Margin : UDINT; (*Margin of SVG output [pixel]*)
		Transformation : McAGFPPOSFmtSVGPropUsrTrfType; (*Transformation of working area to SVG output*)
	END_STRUCT;
	McAGFPPOSFmtSVGPropType : STRUCT (*Properties of SVG output*)
		Type : McAGFPPOSFmtSVGPropEnum; (*Properties selector setting*)
		Automatic : McAGFPPOSFmtSVGPropAutType; (*Type mcAGFPPOSFSP_AUT settings*)
		User : McAGFPPOSFmtSVGPropUsrType; (*Type mcAGFPPOSFSP_USR settings*)
	END_STRUCT;
	McAGFPPOSFmtSVGViewEnum :
		( (*View*)
		mcAGFPPOSFSV_XY := 0, (*XY - Plane XY*)
		mcAGFPPOSFSV_YZ := 1, (*YZ - Plane YZ*)
		mcAGFPPOSFSV_XZ := 2 (*XZ - Plane XZ*)
		);
	McAGFPPOSFmtSVGContEnum :
		( (*Content 1-N selector setting*)
		mcAGFPPOSFSC_MCS_PATH := 0, (*MCS path - Path*)
		mcAGFPPOSFSC_ACT_POS := 1 (*Actual position - Actual position*)
		);
	McAGFPPOSFmtSVGContMCSPathType : STRUCT (*Type mcAGFPPOSFSC_MCS_PATH settings*)
		Color : STRING[250]; (*Color*)
		Width : UDINT; (*Width [pixel]*)
		GroupId : STRING[250]; (*SVG group id to control property of content*)
		Suppression : McAGFPPContSvgSupType; (*Suppression of SVG output*)
	END_STRUCT;
	McAGFPPShapeEnum :
		( (*Shape selector setting*)
		mcAGFPPS_CIR := 0, (*Circle -*)
		mcAGFPPS_SQUARE := 1 (*Square -*)
		);
	McAGFPPShapeCirType : STRUCT (*Type mcAGFPPS_CIR settings*)
		Radius : UDINT; (*Radius of circle [pixel]*)
	END_STRUCT;
	McAGFPPShapeSquareType : STRUCT (*Type mcAGFPPS_SQUARE settings*)
		Width : UDINT; (*Width of square [pixel]*)
	END_STRUCT;
	McAGFPPShapeType : STRUCT
		Type : McAGFPPShapeEnum; (*Shape selector setting*)
		Circle : McAGFPPShapeCirType; (*Type mcAGFPPS_CIR settings*)
		Square : McAGFPPShapeSquareType; (*Type mcAGFPPS_SQUARE settings*)
	END_STRUCT;
	McAGFPPOSFmtSVGContActPosType : STRUCT (*Type mcAGFPPOSFSC_ACT_POS settings*)
		Color : STRING[250]; (*Color*)
		GroupId : STRING[250]; (*SVG group id to control property of content*)
		Shape : McAGFPPShapeType;
	END_STRUCT;
	McAGFPPOSFmtSVGContType : STRUCT
		Type : McAGFPPOSFmtSVGContEnum; (*Content 1-N selector setting*)
		MCSPath : McAGFPPOSFmtSVGContMCSPathType; (*Type mcAGFPPOSFSC_MCS_PATH settings*)
		ActualPosition : McAGFPPOSFmtSVGContActPosType; (*Type mcAGFPPOSFSC_ACT_POS settings*)
	END_STRUCT;
	McAGFPPOSFmtSVGType : STRUCT (*Type mcAGFPPOSF_SVG settings*)
		Properties : McAGFPPOSFmtSVGPropType; (*Properties of SVG output*)
		View : McAGFPPOSFmtSVGViewEnum; (*View*)
		Content : McCfgUnboundedArrayType; (*Connect array of type McAGFPPOSFmtSVGContType*)
	END_STRUCT;
	McAGFPPOSFmtType : STRUCT (*Format of the output*)
		Type : McAGFPPOSFmtEnum; (*Format selector setting*)
		SVG : McAGFPPOSFmtSVGType; (*Type mcAGFPPOSF_SVG settings*)
	END_STRUCT;
	McAGFPPOSType : STRUCT (*Type mcAGFPPO_STREAM settings*)
		StreamOutput : STRING[250]; (*PV mapping of stream output*)
		StreamReady : STRING[250]; (*PV mapping of status of stream is ready to use*)
		ClearStream : STRING[250]; (*PV mapping of command to clear stream*)
		Format : McAGFPPOSFmtType; (*Format of the output*)
	END_STRUCT;
	McAGFPPOutType : STRUCT
		Type : McAGFPPOutEnum; (*Output 1-N selector setting*)
		File : McAGFPPOFType; (*Type AGFPPO_FILE settings*)
		Stream : McAGFPPOSType; (*Type mcAGFPPO_STREAM settings*)
	END_STRUCT;
	McCfgAxGrpFeatPathPreviewType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PATH_PREVIEW*)
		Output : McCfgUnboundedArrayType; (*Connect array of type McAGFPPOutType*)
	END_STRUCT;
	McAGFTTAlignNonRpdMoveEnum :
		( (*Orientation alignment for non-rapid movements*)
		mcAGFTTANRM_ALIGN_TO_PATH := 0, (*Aligned to path - Orientation is aligned to the desired orientation from beginning of current block*)
		mcAGFTTANRM_ALIGN_TO_NXT_MOVE := 1 (*Aligned to next movement - Orientation is aligned continuously to reach desired orientation at beginning of the next block*)
		);
	McAGFTTAlignRpdMoveEnum :
		( (*Orientation alignment for rapid movements*)
		mcAGFTTARM_ALIGN_TO_PATH := 0, (*Aligned to path - Orientation is aligned to the desired orientation from beginning of current block*)
		mcAGFTTARM_ALIGN_TO_NXT_MOVE := 1 (*Aligned to next movement - Orientation is aligned continuously to reach desired orientation at beginning of the next block*)
		);
	McAGFTTAlignType : STRUCT (*Alignment of tool orientation*)
		NonRapidMovements : McAGFTTAlignNonRpdMoveEnum; (*Orientation alignment for non-rapid movements*)
		RapidMovements : McAGFTTAlignRpdMoveEnum; (*Orientation alignment for rapid movements*)
	END_STRUCT;
	McAGFTTFrmEnum :
		( (*Frame selector setting*)
		mcAGFTTF_PCS := 0, (*PCS - Product coordinat system*)
		mcAGFTTF_SEL_BY_NAME := 1 (*Selected by name - Select the frame by name*)
		);
	McAGFTTFrmPCSPlEnum :
		( (*Tangential plane*)
		mcAGFTTFPP_WRK_PL := 0, (*Working plane - Active working plane selected by G17/G18/G19*)
		mcAGFTTFPP_XY := 1, (*XY - XY plane*)
		mcAGFTTFPP_XZ := 2, (*XZ - XZ plane*)
		mcAGFTTFPP_YZ := 3 (*YZ - YZ plane*)
		);
	McAGFTTFrmPCSType : STRUCT (*Type mcAGFTTF_PCS settings*)
		Plane : McAGFTTFrmPCSPlEnum; (*Tangential plane*)
	END_STRUCT;
	McAGFTTFrmSelByNamePlEnum :
		( (*Tangential plane*)
		mcAGFTTFSBNP_XY := 0, (*XY - XY plane*)
		mcAGFTTFSBNP_XZ := 1, (*XZ - XZ plane*)
		mcAGFTTFSBNP_YZ := 2 (*YZ - YZ plane*)
		);
	McAGFTTFrmSelByNameType : STRUCT (*Type mcAGFTTF_SEL_BY_NAME settings*)
		FrameName : STRING[250]; (*Name of the frame*)
		Plane : McAGFTTFrmSelByNamePlEnum; (*Tangential plane*)
	END_STRUCT;
	McAGFTTFrmType : STRUCT (*Frame where the tangential plane is defined*)
		Type : McAGFTTFrmEnum; (*Frame selector setting*)
		PCS : McAGFTTFrmPCSType; (*Type mcAGFTTF_PCS settings*)
		SelectedByName : McAGFTTFrmSelByNameType; (*Type mcAGFTTF_SEL_BY_NAME settings*)
	END_STRUCT;
	McAGFTTTPTanToolOnOffEnum :
		( (*Tangential tool On/Off selector setting*)
		mcAGFTTTPTTOO_NOT_USE := 0, (*Not used - This event is not used*)
		mcAGFTTTPTTOO_EN := 1 (*Enabled - This event is enabled*)
		);
	McAGFTTTPTTOOEReacEnum :
		( (*Reaction selector setting*)
		mcAGFTTTPTTOOER_MFUN := 0, (*M-Function - M-Functions to lift and lower the tool*)
		mcAGFTTTPTTOOER_TOOL_LIFT := 1 (*Tool lift - Automatic tool lower and lift*)
		);
	McAGFTTTPTTOOEReacMFunType : STRUCT (*Type mcAGFTTTPTTOOER_MFUN settings*)
		Index1 : UINT; (*Index of the M-Function to lift the tool*)
		Index2 : UINT; (*Index of the M-Function to lower the tool*)
	END_STRUCT;
	McAGFTTTPTTOOEReacToolLiftType : STRUCT (*Type mcAGFTTTPTTOOER_TOOL_LIFT settings*)
		FeedRate : LREAL; (*Feed rate to lower and lift the tool [measurement units / minute]*)
		LoweringDistance : LREAL; (*Relative distance to lower and lift the tool in a direction orthogonal to the tangential plane [measurement units]*)
	END_STRUCT;
	McAGFTTTPTTOOEReacType : STRUCT (*Reaction to protect the tool*)
		Type : McAGFTTTPTTOOEReacEnum; (*Reaction selector setting*)
		MFunction : McAGFTTTPTTOOEReacMFunType; (*Type mcAGFTTTPTTOOER_MFUN settings*)
		ToolLift : McAGFTTTPTTOOEReacToolLiftType; (*Type mcAGFTTTPTTOOER_TOOL_LIFT settings*)
	END_STRUCT;
	McAGFTTTPTanToolOnOffEnType : STRUCT (*Type mcAGFTTTPTTOO_EN settings*)
		Reaction : McAGFTTTPTTOOEReacType; (*Reaction to protect the tool*)
	END_STRUCT;
	McAGFTTTPTanToolOnOffType : STRUCT (*Tangential tool activation and deactivation*)
		Type : McAGFTTTPTanToolOnOffEnum; (*Tangential tool On/Off selector setting*)
		Enabled : McAGFTTTPTanToolOnOffEnType; (*Type mcAGFTTTPTTOO_EN settings*)
	END_STRUCT;
	McAGFTTTPCnrTransEnum :
		( (*Corner transition selector setting*)
		mcAGFTTTPCT_NOT_USE := 0, (*Not used - This event is not used*)
		mcAGFTTTPCT_EN := 1 (*Enabled - This event is enabled*)
		);
	McAGFTTTPCTEReacEnum :
		( (*Reaction selector setting*)
		mcAGFTTTPCTER_MFUN := 0, (*M-Function - M-Functions to lift and lower the tool*)
		mcAGFTTTPCTER_TOOL_LIFT := 1 (*Tool lift - Automatic tool lift and lower*)
		);
	McAGFTTTPCTEReacMFunType : STRUCT (*Type mcAGFTTTPCTER_MFUN settings*)
		Index1 : UINT; (*Index of the M-Function to lift the tool*)
		Index2 : UINT; (*Index of the M-Function to lower the tool*)
	END_STRUCT;
	McAGFTTTPCTEReacToolLiftType : STRUCT (*Type mcAGFTTTPCTER_TOOL_LIFT settings*)
		FeedRate : LREAL; (*Feed rate to lift and lower the tool [measurement units / minute]*)
		LiftingDistance : LREAL; (*Relative distance to lift and lower the tool in a direction orthogonal to the tangential plane [measurement units]*)
	END_STRUCT;
	McAGFTTTPCTEReacType : STRUCT (*Reaction to protect the tool*)
		Type : McAGFTTTPCTEReacEnum; (*Reaction selector setting*)
		MFunction : McAGFTTTPCTEReacMFunType; (*Type mcAGFTTTPCTER_MFUN settings*)
		ToolLift : McAGFTTTPCTEReacToolLiftType; (*Type mcAGFTTTPCTER_TOOL_LIFT settings*)
	END_STRUCT;
	McAGFTTTPCnrTransEnType : STRUCT (*Type mcAGFTTTPCT_EN settings*)
		Angle : LREAL; (*Angle [degree]*)
		Reaction : McAGFTTTPCTEReacType; (*Reaction to protect the tool*)
	END_STRUCT;
	McAGFTTTPCnrTransType : STRUCT (*The transition from one block to another exceeds defined angle*)
		Type : McAGFTTTPCnrTransEnum; (*Corner transition selector setting*)
		Enabled : McAGFTTTPCnrTransEnType; (*Type mcAGFTTTPCT_EN settings*)
	END_STRUCT;
	McAGFTTTPType : STRUCT (*Events that trigger the protection of the tool*)
		TangentialToolOnOff : McAGFTTTPTanToolOnOffType; (*Tangential tool activation and deactivation*)
		CornerTransition : McAGFTTTPCnrTransType; (*The transition from one block to another exceeds defined angle*)
	END_STRUCT;
	McCfgAxGrpFeatTanToolType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TAN_TOOL*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		Alignment : McAGFTTAlignType; (*Alignment of tool orientation*)
		Frame : McAGFTTFrmType; (*Frame where the tangential plane is defined*)
		Offset : LREAL; (*Angular offset between the path tangent and the tool orientation [degree]*)
		ToolProtection : McAGFTTTPType; (*Events that trigger the protection of the tool*)
	END_STRUCT;
	McCfgAxGrpFeatRevMoveType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_REV_MOVE*)
		Distance : LREAL; (*Guaranteed minimum distance available for reverse movement [measurement units]*)
	END_STRUCT;
	McAGFTrkSyncGeomEnum :
		( (*Synchronisation geometry selector setting*)
		mcAGFTRKSG_BASIC := 0 (*Basic -*)
		);
	McAGFTrkSyncGeomBasicType : STRUCT (*Type mcAGFTRKSG_BASIC settings*)
		CartesianRadius : LREAL; (*Desired radius of curvature for synchronisation geometries [measurement units]*)
	END_STRUCT;
	McAGFTrkSyncGeomType : STRUCT (*Defines the shape of the synchronisation geometries*)
		Type : McAGFTrkSyncGeomEnum; (*Synchronisation geometry selector setting*)
		Basic : McAGFTrkSyncGeomBasicType; (*Type mcAGFTRKSG_BASIC settings*)
	END_STRUCT;
	McAGFTrkOoWEnum :
		( (*Out-of-workspace synchronisation selector setting*)
		mcAGFTRKOOW_PRG_VEL := 0, (*Programmed velocity - The system synchronizes with the velocities defined in the motion program*)
		mcAGFTRKOOW_PRG_VEL_W_CK := 1, (*Programmed velocity with check - The system synchronizes with the velocities defined in the motion program. The target position is checked for validity. If it will be out-of-workspace, an error is generated.*)
		mcAGFTRKOOW_ADJ_VEL := 2 (*Adjusted velocity - The system adapts the velocities defined in the motion program, if the target is out-of-workspace.*)
		);
	McAGFTrkOoWAdjVelType : STRUCT (*Type mcAGFTRKOOW_ADJ_VEL settings*)
		Clearance : LREAL; (*Position shift of the target in direction of the tracking path [measurement units]*)
	END_STRUCT;
	McAGFTrkOoWType : STRUCT (*Defines how to react while track on objects out of workspace*)
		Type : McAGFTrkOoWEnum; (*Out-of-workspace synchronisation selector setting*)
		AdjustedVelocity : McAGFTrkOoWAdjVelType; (*Type mcAGFTRKOOW_ADJ_VEL settings*)
	END_STRUCT;
	McAGFTrkOoWSEnum :
		( (*Out-of-workspace synchronized selector setting*)
		mcAGFTRKOOWS_PRG_VEL := 0, (*Programmed velocity - The system moves with the velocities defined in the motion program*)
		mcAGFTRKOOWS_PRG_VEL_W_CK := 1, (*Programmed velocity with check - The system moves with the velocities defined in the motion program. The target position is checked for validity. If it is out-of-workspace, an error is generated.*)
		mcAGFTRKOOWS_ADJ_VEL := 2 (*Adjusted velocity - The system adapts the velocities defined in the motion program, if the target is out-of-workspace.*)
		);
	McAGFTrkOoWSAdjVelType : STRUCT (*Type mcAGFTRKOOWS_ADJ_VEL settings*)
		Clearance : LREAL; (*Position shift of the target in direction of the tracking path [measurement units]*)
	END_STRUCT;
	McAGFTrkOoWSType : STRUCT (*Defines how to react in synchronous phase if a command would move out of workspace*)
		Type : McAGFTrkOoWSEnum; (*Out-of-workspace synchronized selector setting*)
		AdjustedVelocity : McAGFTrkOoWSAdjVelType; (*Type mcAGFTRKOOWS_ADJ_VEL settings*)
	END_STRUCT;
	McAGFTRMotBxType : STRUCT (*Defines behaviour of movements while tracking on objects is active*)
		OutOfWorkspaceSynchronisation : McAGFTrkOoWType; (*Defines how to react while track on objects out of workspace*)
		OutOfWorkspaceSynchronized : McAGFTrkOoWSType; (*Defines how to react in synchronous phase if a command would move out of workspace*)
	END_STRUCT;
	McCfgAxGrpFeatTrkType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TRK*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		SynchronisationGeometry : McAGFTrkSyncGeomType; (*Defines the shape of the synchronisation geometries*)
		MotionBehaviour : McAGFTRMotBxType; (*Defines behaviour of movements while tracking on objects is active*)
	END_STRUCT;
	McAGFPCXCoorEnum :
		( (*X coordinate selector setting*)
		mcAGFPCXC_NOT_USE := 0, (*Not used - Pipe cutting X coordinate is not used*)
		mcAGFPCXC_USE := 1 (*Used - Pipe cutting X coordinate is used*)
		);
	McAGFPCXCoorUseDirEnum :
		( (*Direction selector setting*)
		mcAGFPCXCUD_STD := 0, (*Standard - Positive X translates to positive slave movement*)
		mcAGFPCXCUD_INV := 1 (*Inverse - Positive X translates to negative slave movement*)
		);
	McAGFPCXCoorUseDirType : STRUCT (*Pipe cutting direction*)
		Type : McAGFPCXCoorUseDirEnum; (*Direction selector setting*)
	END_STRUCT;
	McAGFPCXCoorUseType : STRUCT (*Type mcAGFPCXC_USE settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
		Direction : McAGFPCXCoorUseDirType; (*Pipe cutting direction*)
	END_STRUCT;
	McAGFPCXCoorType : STRUCT (*Pipe cutting X coordinate*)
		Type : McAGFPCXCoorEnum; (*X coordinate selector setting*)
		Used : McAGFPCXCoorUseType; (*Type mcAGFPCXC_USE settings*)
	END_STRUCT;
	McAGFPCYCoorEnum :
		( (*Y coordinate selector setting*)
		mcAGFPCYC_NOT_USE := 0, (*Not used - Pipe cutting Y coordinate is not used*)
		mcAGFPCYC_USE := 1 (*Used - Pipe cutting Y coordinate is used*)
		);
	McAGFPCYCoorUseDirEnum :
		( (*Direction selector setting*)
		mcAGFPCYCUD_STD := 0, (*Standard - Positive Y translates to positive slave movement*)
		mcAGFPCYCUD_INV := 1 (*Inverse - Positive Y translates to negative slave movement*)
		);
	McAGFPCYCoorUseDirType : STRUCT (*Pipe cutting direction*)
		Type : McAGFPCYCoorUseDirEnum; (*Direction selector setting*)
	END_STRUCT;
	McAGFPCYCoorUseType : STRUCT (*Type mcAGFPCYC_USE settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
		Direction : McAGFPCYCoorUseDirType; (*Pipe cutting direction*)
	END_STRUCT;
	McAGFPCYCoorType : STRUCT (*Pipe cutting Y coordinate*)
		Type : McAGFPCYCoorEnum; (*Y coordinate selector setting*)
		Used : McAGFPCYCoorUseType; (*Type mcAGFPCYC_USE settings*)
	END_STRUCT;
	McCfgAxGrpPipeCutType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PIPE_CUT*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature*)
		XCoordinate : McAGFPCXCoorType; (*Pipe cutting X coordinate*)
		YCoordinate : McAGFPCYCoorType; (*Pipe cutting Y coordinate*)
	END_STRUCT;
	McAGFTFSSelSelEnum :
		( (*Selector '{/}' selector setting*)
		mcAGFTFSSS_SNG_FRM := 0, (*Single frames - Selects a single TrackingFrame at a time*)
		mcAGFTFSSS_MUL_FRM := 1, (*Multiple frames - Selects a defined number of TrackingFrame at a time*)
		mcAGFTFSSS_FRM_PAIRS := 2 (*Frame pairs - Selects a pair of frames. E.g.: Select pick and place position based on a combined criterion.*)
		);
	McAGFTFSSFStratEnum :
		( (*Strategy selector setting*)
		mcAGFTFSSFS_FIFO := 0, (*FIFO - First in, first out: Selects the oldest TrackingFrame*)
		mcAGFTFSSFS_LIFO := 1, (*LIFO - Last in, first out: Selects the newest TrackingFrame*)
		mcAGFTFSSFS_MIN_X_VAL_ON_TRKPATH := 2, (*Minimum X value on TrackingPath - Selects the TrackingFrame with the minimum x-value on the TrackingPath.*)
		mcAGFTFSSFS_MAX_X_VAL_ON_TRKPATH := 3, (*Maximum X value on TrackingPath - Selects the TrackingFrame with the maximum x-value on the TrackingPath*)
		mcAGFTFSSFS_MIN_DIST_TO_PT := 4, (*Minimum distance to point - Selects the TrackingFrame which is closest to the specified point at selection time*)
		mcAGFTFSSFS_MAX_DIST_TO_PT := 5, (*Maximum distance to point - Selects the TrackingFrame which is furthest from the specified point at selection time*)
		mcAGFTFSSFS_MUL_CRIT := 6 (*Multiple criteria - Selects TrackingFrames based on multiple criteria*)
		);
	McAGFTFSSFSMinDstPtOgnEnum :
		( (*Origin selector setting*)
		mcAGFTFSSFSMinDstPtO_BCS := 0, (*BCS - Robot base coordinate system*)
		mcAGFTFSSFSMinDstPtO_MCS := 1, (*MCS - Robot machine coordinate system*)
		mcAGFTFSSFSMinDstPtO_FRM := 2 (*Frame - Standard frame from object hierarchy*)
		);
	McAGFTFSSFSMinDstPtOgnBCSType : STRUCT (*Type mcAGFTFSSFSMinDstPtO_BCS settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMinDstPtOgnMCSType : STRUCT (*Type mcAGFTFSSFSMinDstPtO_MCS settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMinDstPtOgnFrmType : STRUCT (*Type mcAGFTFSSFSMinDstPtO_FRM settings*)
		FrameName : STRING[250]; (*Name of the standard frame defined in the object hierarchy*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMinDstPtOgnType : STRUCT (*Coordinate system in which the point is formulated*)
		Type : McAGFTFSSFSMinDstPtOgnEnum; (*Origin selector setting*)
		BCS : McAGFTFSSFSMinDstPtOgnBCSType; (*Type mcAGFTFSSFSMinDstPtO_BCS settings*)
		MCS : McAGFTFSSFSMinDstPtOgnMCSType; (*Type mcAGFTFSSFSMinDstPtO_MCS settings*)
		Frame : McAGFTFSSFSMinDstPtOgnFrmType; (*Type mcAGFTFSSFSMinDstPtO_FRM settings*)
	END_STRUCT;
	McAGFTFSSFSMinDstPtType : STRUCT (*Type mcAGFTFSSFS_MIN_DIST_TO_PT settings*)
		Origin : McAGFTFSSFSMinDstPtOgnType; (*Coordinate system in which the point is formulated*)
	END_STRUCT;
	McAGFTFSSFSMaxDstPtOgnEnum :
		( (*Origin selector setting*)
		mcAGFTFSSFSMaxDstPtO_BCS := 0, (*BCS - Robot base coordinate system*)
		mcAGFTFSSFSMaxDstPtO_MCS := 1, (*MCS - Robot machine coordinate system*)
		mcAGFTFSSFSMaxDstPtO_FRM := 2 (*Frame - Standard frame from object hierarchy*)
		);
	McAGFTFSSFSMaxDstPtOgnBCSType : STRUCT (*Type mcAGFTFSSFSMaxDstPtO_BCS settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMaxDstPtOgnMCSType : STRUCT (*Type mcAGFTFSSFSMaxDstPtO_MCS settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMaxDstPtOgnFrmType : STRUCT (*Type mcAGFTFSSFSMaxDstPtO_FRM settings*)
		FrameName : STRING[250]; (*Name of the standard frame defined in the object hierarchy*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
	END_STRUCT;
	McAGFTFSSFSMaxDstPtOgnType : STRUCT (*Coordinate system in which the point is formulated*)
		Type : McAGFTFSSFSMaxDstPtOgnEnum; (*Origin selector setting*)
		BCS : McAGFTFSSFSMaxDstPtOgnBCSType; (*Type mcAGFTFSSFSMaxDstPtO_BCS settings*)
		MCS : McAGFTFSSFSMaxDstPtOgnMCSType; (*Type mcAGFTFSSFSMaxDstPtO_MCS settings*)
		Frame : McAGFTFSSFSMaxDstPtOgnFrmType; (*Type mcAGFTFSSFSMaxDstPtO_FRM settings*)
	END_STRUCT;
	McAGFTFSSFSMaxDstPtType : STRUCT (*Type mcAGFTFSSFS_MAX_DIST_TO_PT settings*)
		Origin : McAGFTFSSFSMaxDstPtOgnType; (*Coordinate system in which the point is formulated*)
	END_STRUCT;
	McAGFTFSSFStratType : STRUCT (*Defines the strategy according to which the objects are selected*)
		Type : McAGFTFSSFStratEnum; (*Strategy selector setting*)
		MinimumDistanceToPoint : McAGFTFSSFSMinDstPtType; (*Type mcAGFTFSSFS_MIN_DIST_TO_PT settings*)
		MaximumDistanceToPoint : McAGFTFSSFSMaxDstPtType; (*Type mcAGFTFSSFS_MAX_DIST_TO_PT settings*)
	END_STRUCT;
	McAGFTFSSFFltrFltrEnum :
		( (*Filter 1-N selector setting*)
		mcAGFTFSSFFF_TRKPATHS := 0, (*TrackingPaths - Selects a TrackingFrame only if it belongs to one of the specified TrackingPaths*)
		mcAGFTFSSFFF_SEL_AREA := 1, (*Selection area - Selects a TrackingFrame only if it lies inside at least one of the specified selection areas*)
		mcAGFTFSSFFF_ATTR_MASK := 2 (*Attribute mask - Selects a TrackingFrame only if its attribute value matches the specified bitmask*)
		);
	McAGFTFSSFSFTPType : STRUCT (*Type mcAGFTFSSFFF_TRKPATHS settings*)
		TrackingPathReference : McCfgUnboundedArrayType; (*Connect array of type McCfgReferenceType*)
	END_STRUCT;
	McAGFTFSSFSFSAAreaEnum :
		( (*Area 1-N selector setting*)
		mcAGFTFSSFSFSAA_CUBE := 0, (*Cuboid - Defines a cuboid in which the TrackingFrames must be located to be selected*)
		mcAGFTFSSFSFSAA_CYLINDER := 1 (*Cylinder - Defines a cylinder in which the TrackingFrames must be located to be selected*)
		);
	McAGFTFSSFSFSAACubOgnEnum :
		( (*Origin selector setting*)
		mcAGFTFSSFSFSAACubO_BCS := 0, (*BCS - Robot base coordinate system*)
		mcAGFTFSSFSFSAACubO_MCS := 1, (*MCS - Robot machine coordinate system*)
		mcAGFTFSSFSFSAACubO_FRM := 2 (*Frame - Standard frame from object hierarchy*)
		);
	McAGFTFSSFSFSAACubOgnFrmType : STRUCT (*Type mcAGFTFSSFSFSAACubO_FRM settings*)
		StandardFrameName : STRING[250]; (*Name of the standard frame defined in the object hierarchy*)
	END_STRUCT;
	McAGFTFSSFSFSAACubOgnType : STRUCT (*Origin of the cuboid*)
		Type : McAGFTFSSFSFSAACubOgnEnum; (*Origin selector setting*)
		Frame : McAGFTFSSFSFSAACubOgnFrmType; (*Type mcAGFTFSSFSFSAACubO_FRM settings*)
	END_STRUCT;
	McAGFTFSSFSFSAACubDimType : STRUCT (*Dimensions of the object*)
		Length : LREAL; (*Length of the cuboid [measurement units]*)
		Width : LREAL; (*Width of the cuboid [measurement units]*)
		Height : LREAL; (*Height of the cuboid [measurement units]*)
	END_STRUCT;
	McAGFTFSSFSFSAACubType : STRUCT (*Type mcAGFTFSSFSFSAA_CUBE settings*)
		Origin : McAGFTFSSFSFSAACubOgnType; (*Origin of the cuboid*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Dimensions : McAGFTFSSFSFSAACubDimType; (*Dimensions of the object*)
	END_STRUCT;
	McAGFTFSSFSFSAACylOgnEnum :
		( (*Origin selector setting*)
		mcAGFTFSSFSFSAACylO_BCS := 0, (*BCS - Robot base coordinate system*)
		mcAGFTFSSFSFSAACylO_MCS := 1, (*MCS - Robot machine coordinate system*)
		mcAGFTFSSFSFSAACylO_FRM := 2 (*Frame - Standard frame from object hierarchy*)
		);
	McAGFTFSSFSFSAACylOgnFrmType : STRUCT (*Type mcAGFTFSSFSFSAACylO_FRM settings*)
		StandardFrameName : STRING[250]; (*Name of the standard frame defined in the object hierarchy*)
	END_STRUCT;
	McAGFTFSSFSFSAACylOgnType : STRUCT (*Origin of the cylinder*)
		Type : McAGFTFSSFSFSAACylOgnEnum; (*Origin selector setting*)
		Frame : McAGFTFSSFSFSAACylOgnFrmType; (*Type mcAGFTFSSFSFSAACylO_FRM settings*)
	END_STRUCT;
	McAGFTFSSFSFSAACylDimType : STRUCT (*Dimensions of the object*)
		Radius : LREAL; (*Radius of the cuboid [measurement units]*)
		Height : LREAL; (*Height of the cuboid [measurement units]*)
	END_STRUCT;
	McAGFTFSSFSFSAACylType : STRUCT (*Type mcAGFTFSSFSFSAA_CYLINDER settings*)
		Origin : McAGFTFSSFSFSAACylOgnType; (*Origin of the cylinder*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		Dimensions : McAGFTFSSFSFSAACylDimType; (*Dimensions of the object*)
	END_STRUCT;
	McAGFTFSSFSFSAAreaType : STRUCT (*Type of the selection area*)
		Type : McAGFTFSSFSFSAAreaEnum; (*Area 1-N selector setting*)
		Cuboid : McAGFTFSSFSFSAACubType; (*Type mcAGFTFSSFSFSAA_CUBE settings*)
		Cylinder : McAGFTFSSFSFSAACylType; (*Type mcAGFTFSSFSFSAA_CYLINDER settings*)
	END_STRUCT;
	McAGFTFSSFSFSAType : STRUCT (*Type mcAGFTFSSFFF_SEL_AREA settings*)
		Area : McCfgUnboundedArrayType; (*Type of the selection area (Connect array of type McAGFTFSSFSFSAAreaType)*)
	END_STRUCT;
	McAGFTFSSFSFAMType : STRUCT (*Type mcAGFTFSSFFF_ATTR_MASK settings*)
		Mask : UDINT; (*Specifies the bits that must be set to TRUE in a TrackingFrame’s attribute for it to be selected*)
	END_STRUCT;
	McAGFTFSSFFltrFltrType : STRUCT (*Type of filter*)
		Type : McAGFTFSSFFltrFltrEnum; (*Filter 1-N selector setting*)
		TrackingPaths : McAGFTFSSFSFTPType; (*Type mcAGFTFSSFFF_TRKPATHS settings*)
		SelectionArea : McAGFTFSSFSFSAType; (*Type mcAGFTFSSFFF_SEL_AREA settings*)
		AttributeMask : McAGFTFSSFSFAMType; (*Type mcAGFTFSSFFF_ATTR_MASK settings*)
	END_STRUCT;
	McAGFTFSSFFltrType : STRUCT (*Defines a set of conditions that must be met to include a TrackingFrame in the selection*)
		Filter : McCfgUnboundedArrayType; (*Type of filter (Connect array of type McAGFTFSSFFltrFltrType)*)
	END_STRUCT;
	McAGFTFSSFLckASelEnum :
		( (*Locking after selection selector setting*)
		mcAGFTFSSFLAS_CUR_SEL_ONLY := 0, (*Current selector only - After selection, the TrackingFrame cannot be selected again by this selector*)
		mcAGFTFSSFLAS_ALL_SEL := 1, (*All selectors - After selection, the TrackingFrame cannot be selected again by any of the selectors*)
		mcAGFTFSSFLAS_NO_LCK := 2 (*No locking - After selection, the TrackingFrame can be selected again*)
		);
	McAGFTFSSFLckASelType : STRUCT (*Defines how the TrackingFrame should be prevented from being selected again*)
		Type : McAGFTFSSFLckASelEnum; (*Locking after selection selector setting*)
	END_STRUCT;
	McAGFTFSSFType : STRUCT (*Type mcAGFTFSSS_SNG_FRM settings*)
		Name : STRING[250]; (*Unique name of selector, used in motion program*)
		Strategy : McAGFTFSSFStratType; (*Defines the strategy according to which the objects are selected*)
		Filters : McAGFTFSSFFltrType; (*Defines a set of conditions that must be met to include a TrackingFrame in the selection*)
		LockingAfterSelection : McAGFTFSSFLckASelType; (*Defines how the TrackingFrame should be prevented from being selected again*)
	END_STRUCT;
	McAGFTFSSelSelType : STRUCT (*Type of TrackingFrame selector*)
		Type : McAGFTFSSelSelEnum; (*Selector '{/}' selector setting*)
		SingleFrames : McAGFTFSSFType; (*Type mcAGFTFSSS_SNG_FRM settings*)
	END_STRUCT;
	McAGFTFSSelType : STRUCT
		Selector : McCfgUnboundedArrayType; (*Type of TrackingFrame selector (Connect array of type McAGFTFSSelSelType)*)
	END_STRUCT;
	McCfgAxGrpFeatTrkFrmSelType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TRKFRM_SEL*)
		Selectors : McAGFTFSSelType;
	END_STRUCT;
	McAGFTFSAAreaFltrType : STRUCT (*Defines the filters from type selection area that are defined within the specified TrackingFrame selector*)
		Area : McCfgUnboundedArrayType; (*Type of the selection area (Connect array of type McAGFTFSSFSFSAAreaType)*)
	END_STRUCT;
	McCfgAxGrpFeatTrkFrmSelAreaType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TRKFRM_SEL_AREA*)
		AreaFilter : McCfgUnboundedArrayType; (*Defines the filters from type selection area that are defined within the specified TrackingFrame selector (Connect array of type McAGFTFSAAreaFltrType)*)
	END_STRUCT;
	McMSCSDescEnum :
		( (*Description selector setting*)
		mcMSCSD_STD := 0 (*Standard - Standard description*)
		);
	McMSCSDSType : STRUCT (*Type mcMSCSD_STD settings*)
		Dimensions : STRING[250]; (*Name of the process variable for the dimensions of the mechanical system*)
	END_STRUCT;
	McMSCSDescType : STRUCT (*Description of the mechanical system*)
		Type : McMSCSDescEnum; (*Description selector setting*)
		Standard : McMSCSDSType; (*Type mcMSCSD_STD settings*)
	END_STRUCT;
	McMSCSJntAxType : STRUCT (*Joint axes*)
		JointAxesCount : UINT; (*Number of joint axes of the mechanical system*)
	END_STRUCT;
	McMSCSCNCCEnum :
		( (*Cartesian coordinates selector setting*)
		mcMSCSCNCC_XYZ := 0, (*XYZ - Cartesian coordinates X,Y and Z*)
		mcMSCSCNCC_XY := 1, (*XY - Cartesian coordinates X and Y*)
		mcMSCSCNCC_XZ := 2, (*XZ - Cartesian coordinates X and Z*)
		mcMSCSCNCC_YZ := 3 (*YZ - Cartesian coordinates Y and Z*)
		);
	McMSCSCNCCXYZType : STRUCT (*Type mcMSCSCNCC_XYZ settings*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMSCSCNCCXYType : STRUCT (*Type mcMSCSCNCC_XY settings*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
	END_STRUCT;
	McMSCSCNCCXZType : STRUCT (*Type mcMSCSCNCC_XZ settings*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMSCSCNCCYZType : STRUCT (*Type mcMSCSCNCC_YZ settings*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMSCSCNCCType : STRUCT (*Cartesian coordinates*)
		Type : McMSCSCNCCEnum; (*Cartesian coordinates selector setting*)
		XYZ : McMSCSCNCCXYZType; (*Type mcMSCSCNCC_XYZ settings*)
		XY : McMSCSCNCCXYType; (*Type mcMSCSCNCC_XY settings*)
		XZ : McMSCSCNCCXZType; (*Type mcMSCSCNCC_XZ settings*)
		YZ : McMSCSCNCCYZType; (*Type mcMSCSCNCC_YZ settings*)
	END_STRUCT;
	McMSCSCNOCEnum :
		( (*Orientation coordinates selector setting*)
		mcMSCSCNOC_NOT_USE := 0, (*Not used - Not used*)
		mcMSCSCNOC_ANGLES := 1 (*Angles - Angles*)
		);
	McMSCSCNOCAnglesCoorType : STRUCT
		Name : STRING[250]; (*Name of coordinate*)
	END_STRUCT;
	McMSCSCNOCAnglesType : STRUCT (*Type mcMSCSCNOC_ANGLES settings*)
		Coordinate : McCfgUnboundedArrayType; (*Connect array of type McMSCSCNOCAnglesCoorType*)
	END_STRUCT;
	McMSCSCNOCType : STRUCT (*Orientation coordinates*)
		Type : McMSCSCNOCEnum; (*Orientation coordinates selector setting*)
		Angles : McMSCSCNOCAnglesType; (*Type mcMSCSCNOC_ANGLES settings*)
	END_STRUCT;
	McMSCSCoorNameType : STRUCT (*Coordinate names*)
		CartesianCoordinates : McMSCSCNCCType; (*Cartesian coordinates*)
		OrientationCoordinates : McMSCSCNOCType; (*Orientation coordinates*)
	END_STRUCT;
	McMSCSWFrmMdlType : STRUCT (*Wire frame model*)
		Description : STRING[250]; (*Name of the process variable for the description of the wire frame model*)
	END_STRUCT;
	McMSCSFunTrfEnum :
		( (*Transformations selector setting*)
		mcMSCSFT_STD := 0 (*Standard - Standard transformation functions*)
		);
	McMSCSFunTrfStdDerType : STRUCT (*Functions for derivatives*)
		DirectDerivative : STRING[250]; (*Direct transformation for the first derivatives*)
		InverseDerivative : STRING[250]; (*Inverse transformation for the first derivatives*)
	END_STRUCT;
	McMSCSFunTrfStdType : STRUCT (*Type mcMSCSFT_STD settings*)
		Direct : STRING[250]; (*Direct transformation*)
		Inverse : STRING[250]; (*Inverse transformation*)
		Derivatives : McMSCSFunTrfStdDerType; (*Functions for derivatives*)
	END_STRUCT;
	McMSCSFunTrfType : STRUCT (*Transformation functions*)
		Type : McMSCSFunTrfEnum; (*Transformations selector setting*)
		Standard : McMSCSFunTrfStdType; (*Type mcMSCSFT_STD settings*)
	END_STRUCT;
	McMSCSFunWsMonType : STRUCT (*Functions for workspace monitoring*)
		WireFrameModel : STRING[250]; (*Name of the function for wire frame model calculation*)
	END_STRUCT;
	McMSCSFunType : STRUCT (*Functions*)
		Transformations : McMSCSFunTrfType; (*Transformation functions*)
		WorkspaceMonitoring : McMSCSFunWsMonType; (*Functions for workspace monitoring*)
	END_STRUCT;
	McMSCplgCLinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : UINT; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : UINT; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMSCSCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplgCLinCplgType)*)
	END_STRUCT;
	McMSJntAxPosLimEnum :
		( (*Joint axis 1-15 selector setting*)
		mcMSJAPL_USE_AX_LIM := 0, (*Use axis limits - Use position limits already configured for the single axes*)
		mcMSJAPL_CFG_JNT_AX_LIM := 1 (*Configure joint axes limits - Configure position limits*)
		);
	McMSJntAxPosLimCfgJntAxLimType : STRUCT (*Type mcMSJAPL_CFG_JNT_AX_LIM settings*)
		LowerLimit : LREAL; (*Lower position limit [measurement units]*)
		UpperLimit : LREAL; (*Upper position limit [measurement units]*)
	END_STRUCT;
	McMSJntAxPosLimType : STRUCT (*Limits for joint axis*)
		Type : McMSJntAxPosLimEnum; (*Joint axis 1-15 selector setting*)
		ConfigureJointAxesLimits : McMSJntAxPosLimCfgJntAxLimType; (*Type mcMSJAPL_CFG_JNT_AX_LIM settings*)
	END_STRUCT;
	McMSJnt15AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..14] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMSCusStdType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_CUS_STD*)
		Description : McMSCSDescType; (*Description of the mechanical system*)
		JointAxes : McMSCSJntAxType; (*Joint axes*)
		CoordinateNames : McMSCSCoorNameType; (*Coordinate names*)
		WireFrameModel : McMSCSWFrmMdlType; (*Wire frame model*)
		Functions : McMSCSFunType; (*Functions*)
		Couplings : McMSCSCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt15AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMSCNEnum :
		( (*Coordinates names selector setting*)
		mcMSCN_DEF := 0, (*Default*)
		mcMSCN_USR := 1 (*User*)
		);
	McMS2ACXYCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
	END_STRUCT;
	McMS2ACXYCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACXYCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACXYWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACXYWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMSFrmMdlStdEdgeEnum :
		( (*Flange to TCP selector setting*)
		mcMSFMSE_CXN_LIN := 0, (*Connection line - Edge is considered as a whole connection line*)
		mcMSFMSE_PT := 1, (*Point - Only the end point of the edge is considered*)
		mcMSFMSE_NOT_USE := 2 (*Not used - Edge is not considered*)
		);
	McMSFrmMdlStdEdgeCxnLinType : STRUCT (*Type mcMSFMSE_CXN_LIN settings*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMSFrmMdlStdEdgePtType : STRUCT (*Type mcMSFMSE_PT settings*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMSFrmMdlStdEdgeType : STRUCT (*Wire frame model edge*)
		Type : McMSFrmMdlStdEdgeEnum; (*Flange to TCP selector setting*)
		ConnectionLine : McMSFrmMdlStdEdgeCxnLinType; (*Type mcMSFMSE_CXN_LIN settings*)
		Point : McMSFrmMdlStdEdgePtType; (*Type mcMSFMSE_PT settings*)
	END_STRUCT;
	McMS2ACXYWFrmMdlStdType : STRUCT (*Type mcMS2ACXYWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACXYWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACXYWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACXYWFrmMdlStdType; (*Type mcMS2ACXYWFM_STD settings*)
	END_STRUCT;
	McMSCplg2LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC2LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC2LCSA_AX_2 := 1 (*Axis 2 - Axis 2*)
		);
	McMSCplg2LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC2LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC2LCTJA_JNT_AX_2 := 1 (*Joint axis 2 - Joint axis 2*)
		);
	McMSCplg2LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg2LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg2LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS2ACXYCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg2LinCplgType)*)
	END_STRUCT;
	McMSJnt2AxRelLimEnum :
		( (*Relative limits selector setting*)
		mcMSJ2ARL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ2ARL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ2ARLSJALLEnum :
		( (*Lower limit selector setting*)
		mcMSJ2ARLSJALL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ2ARLSJALL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ2ARLSJALLStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ2ARLSJALLSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ2ARLSJALLSSJA_AX_2 := 1 (*Axis 2 - Axis 2*)
		);
	McMSJ2ARLSJALLStdType : STRUCT (*Type mcMSJ2ARLSJALL_STD settings*)
		SourceJointAxis : McMSJ2ARLSJALLStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ2ARLSJALLType : STRUCT (*Lower limit*)
		Type : McMSJ2ARLSJALLEnum; (*Lower limit selector setting*)
		Standard : McMSJ2ARLSJALLStdType; (*Type mcMSJ2ARLSJALL_STD settings*)
	END_STRUCT;
	McMSJ2ARLSJAULEnum :
		( (*Upper limit selector setting*)
		mcMSJ2ARLSJAUL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ2ARLSJAUL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ2ARLSJAULStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ2ARLSJAULSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ2ARLSJAULSSJA_AX_2 := 1 (*Axis 2 - Axis 2*)
		);
	McMSJ2ARLSJAULStdType : STRUCT (*Type mcMSJ2ARLSJAUL_STD settings*)
		SourceJointAxis : McMSJ2ARLSJAULStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ2ARLSJAULType : STRUCT (*Upper limit*)
		Type : McMSJ2ARLSJAULEnum; (*Upper limit selector setting*)
		Standard : McMSJ2ARLSJAULStdType; (*Type mcMSJ2ARLSJAUL_STD settings*)
	END_STRUCT;
	McMSJnt2AxRelLimStdJntAxType : STRUCT (*Relative limits for joint axis*)
		LowerLimit : McMSJ2ARLSJALLType; (*Lower limit*)
		UpperLimit : McMSJ2ARLSJAULType; (*Upper limit*)
	END_STRUCT;
	McMSJnt2AxRelLimStdType : STRUCT (*Type mcMSJ2ARL_STD settings*)
		JointAxis : ARRAY[0..1] OF McMSJnt2AxRelLimStdJntAxType; (*Relative limits for joint axis*)
	END_STRUCT;
	McMSJnt2AxRelLimType : STRUCT (*Relative limits*)
		Type : McMSJnt2AxRelLimEnum; (*Relative limits selector setting*)
		Standard : McMSJnt2AxRelLimStdType; (*Type mcMSJ2ARL_STD settings*)
	END_STRUCT;
	McMSJnt2AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..1] OF McMSJntAxPosLimType; (*Limits for joint axis*)
		RelativeLimits : McMSJnt2AxRelLimType; (*Relative limits*)
	END_STRUCT;
	McCfgMS2AxCncXYType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_XY*)
		CoordinatesNames : McMS2ACXYCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACXYWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACXYCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ACXZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ACXZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACXZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACXZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACXZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ACXZWFrmMdlStdType : STRUCT (*Type mcMS2ACXZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACXZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACXZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACXZWFrmMdlStdType; (*Type mcMS2ACXZWFM_STD settings*)
	END_STRUCT;
	McMS2ACXZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg2LinCplgType)*)
	END_STRUCT;
	McCfgMS2AxCncXZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_XZ*)
		CoordinatesNames : McMS2ACXZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACXZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACXZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ACYZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ACYZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACYZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACYZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACYZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ACYZWFrmMdlStdType : STRUCT (*Type mcMS2ACYZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACYZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACYZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACYZWFrmMdlStdType; (*Type mcMS2ACYZWFM_STD settings*)
	END_STRUCT;
	McMS2ACYZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg2LinCplgType)*)
	END_STRUCT;
	McCfgMS2AxCncYZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_YZ*)
		CoordinatesNames : McMS2ACYZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACYZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACYZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ACXYZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ACXYZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ACXYZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ACXYZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ACXYZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ACXYZWFrmMdlStdType : STRUCT (*Type mcMS3ACXYZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ACXYZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ACXYZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ACXYZWFrmMdlStdType; (*Type mcMS3ACXYZWFM_STD settings*)
	END_STRUCT;
	McMSCplg3LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC3LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC3LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC3LCSA_AX_3 := 2 (*Axis 3 - Axis 3*)
		);
	McMSCplg3LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC3LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC3LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC3LCTJA_JNT_AX_3 := 2 (*Joint axis 3 - Joint axis 3*)
		);
	McMSCplg3LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg3LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg3LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS3ACXYZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McMSJnt3AxRelLimEnum :
		( (*Relative limits selector setting*)
		mcMSJ3ARL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ3ARL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ3ARLSJALLEnum :
		( (*Lower limit selector setting*)
		mcMSJ3ARLSJALL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ3ARLSJALL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ3ARLSJALLStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ3ARLSJALLSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ3ARLSJALLSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ3ARLSJALLSSJA_AX_3 := 2 (*Axis 3 - Axis 3*)
		);
	McMSJ3ARLSJALLStdType : STRUCT (*Type mcMSJ3ARLSJALL_STD settings*)
		SourceJointAxis : McMSJ3ARLSJALLStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ3ARLSJALLType : STRUCT (*Lower limit*)
		Type : McMSJ3ARLSJALLEnum; (*Lower limit selector setting*)
		Standard : McMSJ3ARLSJALLStdType; (*Type mcMSJ3ARLSJALL_STD settings*)
	END_STRUCT;
	McMSJ3ARLSJAULEnum :
		( (*Upper limit selector setting*)
		mcMSJ3ARLSJAUL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ3ARLSJAUL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ3ARLSJAULStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ3ARLSJAULSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ3ARLSJAULSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ3ARLSJAULSSJA_AX_3 := 2 (*Axis 3 - Axis 3*)
		);
	McMSJ3ARLSJAULStdType : STRUCT (*Type mcMSJ3ARLSJAUL_STD settings*)
		SourceJointAxis : McMSJ3ARLSJAULStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ3ARLSJAULType : STRUCT (*Upper limit*)
		Type : McMSJ3ARLSJAULEnum; (*Upper limit selector setting*)
		Standard : McMSJ3ARLSJAULStdType; (*Type mcMSJ3ARLSJAUL_STD settings*)
	END_STRUCT;
	McMSJnt3AxRelLimStdJntAxType : STRUCT (*Relative limits for joint axis*)
		LowerLimit : McMSJ3ARLSJALLType; (*Lower limit*)
		UpperLimit : McMSJ3ARLSJAULType; (*Upper limit*)
	END_STRUCT;
	McMSJnt3AxRelLimStdType : STRUCT (*Type mcMSJ3ARL_STD settings*)
		JointAxis : ARRAY[0..2] OF McMSJnt3AxRelLimStdJntAxType; (*Relative limits for joint axis*)
	END_STRUCT;
	McMSJnt3AxRelLimType : STRUCT (*Relative limits*)
		Type : McMSJnt3AxRelLimEnum; (*Relative limits selector setting*)
		Standard : McMSJnt3AxRelLimStdType; (*Type mcMSJ3ARL_STD settings*)
	END_STRUCT;
	McMSJnt3AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..2] OF McMSJntAxPosLimType; (*Limits for joint axis*)
		RelativeLimits : McMSJnt3AxRelLimType; (*Relative limits*)
	END_STRUCT;
	McCfgMS3AxCncXYZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_CNC_XYZ*)
		CoordinatesNames : McMS3ACXYZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ACXYZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS3ACXYZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ACXZCDescEnum :
		( (*Description selector setting*)
		mcMS3ACXZCD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ACXZCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base to QX*)
		TranslationFromQXToQZ : McCfgTransZType; (*Translation from QX to QZ*)
		TranslationFromQZToQC : McCfgTransXYZType; (*Translation from QZ to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMSMdl3ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..2] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl3CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM3CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM3CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl3CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..2] OF McMSMdl3CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS3ACXZCDSType : STRUCT (*Type mcMS3ACXZCD_STD settings*)
		Dimensions : McMS3ACXZCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ACXZCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ACXZCDescEnum; (*Description selector setting*)
		Standard : McMS3ACXZCDSType; (*Type mcMS3ACXZCD_STD settings*)
	END_STRUCT;
	McMS3ACXZCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ACXZCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ACXZCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ACXZCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ACXZCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ACXZCWFrmMdlStdType : STRUCT (*Type mcMS3ACXZCWFM_STD settings*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ACXZCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ACXZCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ACXZCWFrmMdlStdType; (*Type mcMS3ACXZCWFM_STD settings*)
	END_STRUCT;
	McMS3ACXZCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McCfgMS3AxCncXZCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_CNC_XZC*)
		Description : McMS3ACXZCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ACXZCCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ACXZCWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS3ACXZCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ACXZBDescEnum :
		( (*Description selector setting*)
		mcMS3ACXZBD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ACXZBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base to QX*)
		TranslationFromQXToQZ : McCfgTransZType; (*Translation from QX to QZ*)
		TranslationFromQZToQB : McCfgTransXZType; (*Translation from QZ to QB*)
		TranslationFromQBToFlange : McCfgTransXZType; (*Translation from QB to flange*)
	END_STRUCT;
	McMS3ACXZBDSType : STRUCT (*Type mcMS3ACXZBD_STD settings*)
		Dimensions : McMS3ACXZBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ACXZBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ACXZBDescEnum; (*Description selector setting*)
		Standard : McMS3ACXZBDSType; (*Type mcMS3ACXZBD_STD settings*)
	END_STRUCT;
	McMS3ACXZBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
	END_STRUCT;
	McMS3ACXZBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ACXZBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMSTCPOFrmEnum :
		( (*Frames selector setting*)
		mcMSTCPOF_USE := 0, (*Used - Orientation of frames influences TCP orientation coordinates*)
		mcMSTCPOF_NOT_USE := 1 (*Not used - Orientation of frames does not have influence on TCP orientation coordinates*)
		);
	McMSTCPOFrmType : STRUCT (*Influence of frames on TCP orientation coordinates*)
		Type : McMSTCPOFrmEnum; (*Frames selector setting*)
	END_STRUCT;
	McMSTCPOType : STRUCT (*Handling of TCP orientation coordinates*)
		Frames : McMSTCPOFrmType; (*Influence of frames on TCP orientation coordinates*)
	END_STRUCT;
	McMS3ACXZBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ACXZBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ACXZBWFrmMdlStdType : STRUCT (*Type mcMS3ACXZBWFM_STD settings*)
		QZToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ACXZBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ACXZBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ACXZBWFrmMdlStdType; (*Type mcMS3ACXZBWFM_STD settings*)
	END_STRUCT;
	McMS3ACXZBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McCfgMS3AxCncXZBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_CNC_XZB*)
		Description : McMS3ACXZBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ACXZBCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS3ACXZBWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS3ACXZBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ACXYZADescEnum :
		( (*Description selector setting*)
		mcMS4ACXYZAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ACXYZADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQA : McCfgTransXYZType; (*Translation from QZ to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMSMdl4ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..3] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl4CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM4CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM4CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl4CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..3] OF McMSMdl4CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS4ACXYZADSType : STRUCT (*Type mcMS4ACXYZAD_STD settings*)
		Dimensions : McMS4ACXYZADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ACXYZADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ACXYZADescEnum; (*Description selector setting*)
		Standard : McMS4ACXYZADSType; (*Type mcMS4ACXYZAD_STD settings*)
	END_STRUCT;
	McMS4ACXYZACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS4ACXYZACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ACXYZACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ACXYZAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ACXYZAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ACXYZAWFrmMdlStdType : STRUCT (*Type mcMS4ACXYZAWFM_STD settings*)
		QZToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ACXYZAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ACXYZAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ACXYZAWFrmMdlStdType; (*Type mcMS4ACXYZAWFM_STD settings*)
	END_STRUCT;
	McMSCplg4LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC4LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC4LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC4LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC4LCSA_AX_4 := 3 (*Axis 4 - Axis 4*)
		);
	McMSCplg4LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC4LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC4LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC4LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC4LCTJA_JNT_AX_4 := 3 (*Joint axis 4 - Joint axis 4*)
		);
	McMSCplg4LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg4LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg4LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS4ACXYZACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McMSJnt4AxRelLimEnum :
		( (*Relative limits selector setting*)
		mcMSJ4ARL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ4ARL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ4ARLSJALLEnum :
		( (*Lower limit selector setting*)
		mcMSJ4ARLSJALL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ4ARLSJALL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ4ARLSJALLStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ4ARLSJALLSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ4ARLSJALLSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ4ARLSJALLSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ4ARLSJALLSSJA_AX_4 := 3 (*Axis 4 - Axis 4*)
		);
	McMSJ4ARLSJALLStdType : STRUCT (*Type mcMSJ4ARLSJALL_STD settings*)
		SourceJointAxis : McMSJ4ARLSJALLStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ4ARLSJALLType : STRUCT (*Lower limit*)
		Type : McMSJ4ARLSJALLEnum; (*Lower limit selector setting*)
		Standard : McMSJ4ARLSJALLStdType; (*Type mcMSJ4ARLSJALL_STD settings*)
	END_STRUCT;
	McMSJ4ARLSJAULEnum :
		( (*Upper limit selector setting*)
		mcMSJ4ARLSJAUL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ4ARLSJAUL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ4ARLSJAULStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ4ARLSJAULSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ4ARLSJAULSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ4ARLSJAULSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ4ARLSJAULSSJA_AX_4 := 3 (*Axis 4 - Axis 4*)
		);
	McMSJ4ARLSJAULStdType : STRUCT (*Type mcMSJ4ARLSJAUL_STD settings*)
		SourceJointAxis : McMSJ4ARLSJAULStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ4ARLSJAULType : STRUCT (*Upper limit*)
		Type : McMSJ4ARLSJAULEnum; (*Upper limit selector setting*)
		Standard : McMSJ4ARLSJAULStdType; (*Type mcMSJ4ARLSJAUL_STD settings*)
	END_STRUCT;
	McMSJnt4AxRelLimStdJntAxType : STRUCT (*Relative limits for joint axis*)
		LowerLimit : McMSJ4ARLSJALLType; (*Lower limit*)
		UpperLimit : McMSJ4ARLSJAULType; (*Upper limit*)
	END_STRUCT;
	McMSJnt4AxRelLimStdType : STRUCT (*Type mcMSJ4ARL_STD settings*)
		JointAxis : ARRAY[0..3] OF McMSJnt4AxRelLimStdJntAxType; (*Relative limits for joint axis*)
	END_STRUCT;
	McMSJnt4AxRelLimType : STRUCT (*Relative limits*)
		Type : McMSJnt4AxRelLimEnum; (*Relative limits selector setting*)
		Standard : McMSJnt4AxRelLimStdType; (*Type mcMSJ4ARL_STD settings*)
	END_STRUCT;
	McMSJnt4AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..3] OF McMSJntAxPosLimType; (*Limits for joint axis*)
		RelativeLimits : McMSJnt4AxRelLimType; (*Relative limits*)
	END_STRUCT;
	McCfgMS4AxCncXYZAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_CNC_XYZA*)
		Description : McMS4ACXYZADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ACXYZACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ACXYZAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS4ACXYZACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ACXYZBDescEnum :
		( (*Description selector setting*)
		mcMS4ACXYZBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ACXYZBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQB : McCfgTransXYZType; (*Translation from QZ to QB*)
		TranslationFromQBToFlange : McCfgTransXYZType; (*Translation from QB to flange*)
	END_STRUCT;
	McMS4ACXYZBDSType : STRUCT (*Type mcMS4ACXYZBD_STD settings*)
		Dimensions : McMS4ACXYZBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ACXYZBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ACXYZBDescEnum; (*Description selector setting*)
		Standard : McMS4ACXYZBDSType; (*Type mcMS4ACXYZBD_STD settings*)
	END_STRUCT;
	McMS4ACXYZBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
	END_STRUCT;
	McMS4ACXYZBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ACXYZBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ACXYZBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ACXYZBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ACXYZBWFrmMdlStdType : STRUCT (*Type mcMS4ACXYZBWFM_STD settings*)
		QZToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ACXYZBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ACXYZBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ACXYZBWFrmMdlStdType; (*Type mcMS4ACXYZBWFM_STD settings*)
	END_STRUCT;
	McMS4ACXYZBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McCfgMS4AxCncXYZBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_CNC_XYZB*)
		Description : McMS4ACXYZBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ACXYZBCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ACXYZBWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS4ACXYZBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ACXYZCDescEnum :
		( (*Description selector setting*)
		mcMS4ACXYZCD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ACXYZCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQC : McCfgTransXYZType; (*Translation from QZ to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMS4ACXYZCDSType : STRUCT (*Type mcMS4ACXYZCD_STD settings*)
		Dimensions : McMS4ACXYZCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ACXYZCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ACXYZCDescEnum; (*Description selector setting*)
		Standard : McMS4ACXYZCDSType; (*Type mcMS4ACXYZCD_STD settings*)
	END_STRUCT;
	McMS4ACXYZCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ACXYZCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ACXYZCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ACXYZCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ACXYZCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ACXYZCWFrmMdlStdType : STRUCT (*Type mcMS4ACXYZCWFM_STD settings*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ACXYZCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ACXYZCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ACXYZCWFrmMdlStdType; (*Type mcMS4ACXYZCWFM_STD settings*)
	END_STRUCT;
	McMS4ACXYZCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McCfgMS4AxCncXYZCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_CNC_XYZC*)
		Description : McMS4ACXYZCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ACXYZCCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ACXYZCWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS4ACXYZCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ACXYZBADescEnum :
		( (*Description selector setting*)
		mcMS5ACXYZBAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ACXYZBADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQB : McCfgTransXYZType; (*Translation from QZ to QB*)
		TranslationFromQBToQA : McCfgTransXYZType; (*Translation from QB to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMSMdl5ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..4] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl5CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM5CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM5CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl5CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..4] OF McMSMdl5CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS5ACXYZBADSType : STRUCT (*Type mcMS5ACXYZBAD_STD settings*)
		Dimensions : McMS5ACXYZBADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ACXYZBADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ACXYZBADescEnum; (*Description selector setting*)
		Standard : McMS5ACXYZBADSType; (*Type mcMS5ACXYZBAD_STD settings*)
	END_STRUCT;
	McMS5ACXYZBACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS5ACXYZBACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ACXYZBACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ACXYZBAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ACXYZBAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ACXYZBAWFrmMdlStdType : STRUCT (*Type mcMS5ACXYZBAWFM_STD settings*)
		QZToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ACXYZBAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ACXYZBAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ACXYZBAWFrmMdlStdType; (*Type mcMS5ACXYZBAWFM_STD settings*)
	END_STRUCT;
	McMSCplg5LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC5LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC5LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC5LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC5LCSA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSC5LCSA_AX_5 := 4 (*Axis 5 - Axis 5*)
		);
	McMSCplg5LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC5LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC5LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC5LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC5LCTJA_JNT_AX_4 := 3, (*Joint axis 4 - Joint axis 4*)
		mcMSC5LCTJA_JNT_AX_5 := 4 (*Joint axis 5 - Joint axis 5*)
		);
	McMSCplg5LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg5LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg5LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS5ACXYZBACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McMSJnt5AxRelLimEnum :
		( (*Relative limits selector setting*)
		mcMSJ5ARL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ5ARL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ5ARLSJALLEnum :
		( (*Lower limit selector setting*)
		mcMSJ5ARLSJALL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ5ARLSJALL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ5ARLSJALLStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ5ARLSJALLSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ5ARLSJALLSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ5ARLSJALLSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ5ARLSJALLSSJA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSJ5ARLSJALLSSJA_AX_5 := 4 (*Axis 5 - Axis 5*)
		);
	McMSJ5ARLSJALLStdType : STRUCT (*Type mcMSJ5ARLSJALL_STD settings*)
		SourceJointAxis : McMSJ5ARLSJALLStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ5ARLSJALLType : STRUCT (*Lower limit*)
		Type : McMSJ5ARLSJALLEnum; (*Lower limit selector setting*)
		Standard : McMSJ5ARLSJALLStdType; (*Type mcMSJ5ARLSJALL_STD settings*)
	END_STRUCT;
	McMSJ5ARLSJAULEnum :
		( (*Upper limit selector setting*)
		mcMSJ5ARLSJAUL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ5ARLSJAUL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ5ARLSJAULStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ5ARLSJAULSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ5ARLSJAULSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ5ARLSJAULSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ5ARLSJAULSSJA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSJ5ARLSJAULSSJA_AX_5 := 4 (*Axis 5 - Axis 5*)
		);
	McMSJ5ARLSJAULStdType : STRUCT (*Type mcMSJ5ARLSJAUL_STD settings*)
		SourceJointAxis : McMSJ5ARLSJAULStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ5ARLSJAULType : STRUCT (*Upper limit*)
		Type : McMSJ5ARLSJAULEnum; (*Upper limit selector setting*)
		Standard : McMSJ5ARLSJAULStdType; (*Type mcMSJ5ARLSJAUL_STD settings*)
	END_STRUCT;
	McMSJnt5AxRelLimStdJntAxType : STRUCT (*Relative limits for joint axis*)
		LowerLimit : McMSJ5ARLSJALLType; (*Lower limit*)
		UpperLimit : McMSJ5ARLSJAULType; (*Upper limit*)
	END_STRUCT;
	McMSJnt5AxRelLimStdType : STRUCT (*Type mcMSJ5ARL_STD settings*)
		JointAxis : ARRAY[0..4] OF McMSJnt5AxRelLimStdJntAxType; (*Relative limits for joint axis*)
	END_STRUCT;
	McMSJnt5AxRelLimType : STRUCT (*Relative limits*)
		Type : McMSJnt5AxRelLimEnum; (*Relative limits selector setting*)
		Standard : McMSJnt5AxRelLimStdType; (*Type mcMSJ5ARL_STD settings*)
	END_STRUCT;
	McMSJnt5AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..4] OF McMSJntAxPosLimType; (*Limits for joint axis*)
		RelativeLimits : McMSJnt5AxRelLimType; (*Relative limits*)
	END_STRUCT;
	McCfgMS5AxCncXYZBAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_CNC_XYZBA*)
		Description : McMS5ACXYZBADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ACXYZBACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS5ACXYZBAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS5ACXYZBACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ACXYZBCDescEnum :
		( (*Description selector setting*)
		mcMS5ACXYZBCD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ACXYZBCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQB : McCfgTransXYZType; (*Translation from QZ to QB*)
		TranslationFromQBToQC : McCfgTransXYZType; (*Translation from QB to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMS5ACXYZBCDSType : STRUCT (*Type mcMS5ACXYZBCD_STD settings*)
		Dimensions : McMS5ACXYZBCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ACXYZBCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ACXYZBCDescEnum; (*Description selector setting*)
		Standard : McMS5ACXYZBCDSType; (*Type mcMS5ACXYZBCD_STD settings*)
	END_STRUCT;
	McMS5ACXYZBCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS5ACXYZBCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ACXYZBCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ACXYZBCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ACXYZBCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ACXYZBCWFrmMdlStdType : STRUCT (*Type mcMS5ACXYZBCWFM_STD settings*)
		QZToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ACXYZBCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ACXYZBCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ACXYZBCWFrmMdlStdType; (*Type mcMS5ACXYZBCWFM_STD settings*)
	END_STRUCT;
	McMS5ACXYZBCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McCfgMS5AxCncXYZBCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_CNC_XYZBC*)
		Description : McMS5ACXYZBCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ACXYZBCCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ACXYZBCWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS5ACXYZBCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ACXYZCADescEnum :
		( (*Description selector setting*)
		mcMS5ACXYZCAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ACXYZCADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQC : McCfgTransXYZType; (*Translation from QZ to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMS5ACXYZCADSType : STRUCT (*Type mcMS5ACXYZCAD_STD settings*)
		Dimensions : McMS5ACXYZCADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ACXYZCADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ACXYZCADescEnum; (*Description selector setting*)
		Standard : McMS5ACXYZCADSType; (*Type mcMS5ACXYZCAD_STD settings*)
	END_STRUCT;
	McMS5ACXYZCACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS5ACXYZCACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ACXYZCACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ACXYZCAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ACXYZCAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ACXYZCAWFrmMdlStdType : STRUCT (*Type mcMS5ACXYZCAWFM_STD settings*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ACXYZCAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ACXYZCAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ACXYZCAWFrmMdlStdType; (*Type mcMS5ACXYZCAWFM_STD settings*)
	END_STRUCT;
	McMS5ACXYZCACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McCfgMS5AxCncXYZCAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_CNC_XYZCA*)
		Description : McMS5ACXYZCADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ACXYZCACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ACXYZCAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS5ACXYZCACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS6ACZXYBCADescEnum :
		( (*Description selector setting*)
		mcMS6ACZXYBCAD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ACZXYBCADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQZ : McCfgTransZType; (*Translation from base of the mechanical system to QZ*)
		TranslationFromQZToQX : McCfgTransXType; (*Translation from QZ to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQB : McCfgTransXYZType; (*Translation from QY to QB*)
		TranslationFromQBToQC : McCfgTransXYZType; (*Translation from QB to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMSMdl6ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..5] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl6CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM6CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM6CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl6CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..5] OF McMSMdl6CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS6ACZXYBCADSType : STRUCT (*Type mcMS6ACZXYBCAD_STD settings*)
		Dimensions : McMS6ACZXYBCADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ACZXYBCADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ACZXYBCADescEnum; (*Description selector setting*)
		Standard : McMS6ACZXYBCADSType; (*Type mcMS6ACZXYBCAD_STD settings*)
	END_STRUCT;
	McMS6ACZXYBCACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ACZXYBCACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ACZXYBCACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ACZXYBCAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ACZXYBCAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ACZXYBCAWFrmMdlStdType : STRUCT (*Type mcMS6ACZXYBCAWFM_STD settings*)
		QYToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ACZXYBCAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ACZXYBCAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ACZXYBCAWFrmMdlStdType; (*Type mcMS6ACZXYBCAWFM_STD settings*)
	END_STRUCT;
	McMSCplg6LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC6LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC6LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC6LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC6LCSA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSC6LCSA_AX_5 := 4, (*Axis 5 - Axis 5*)
		mcMSC6LCSA_AX_6 := 5 (*Axis 6 - Axis 6*)
		);
	McMSCplg6LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC6LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC6LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC6LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC6LCTJA_JNT_AX_4 := 3, (*Joint axis 4 - Joint axis 4*)
		mcMSC6LCTJA_JNT_AX_5 := 4, (*Joint axis 5 - Joint axis 5*)
		mcMSC6LCTJA_JNT_AX_6 := 5 (*Joint axis 6 - Joint axis 6*)
		);
	McMSCplg6LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg6LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg6LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS6ACZXYBCACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg6LinCplgType)*)
	END_STRUCT;
	McMSJnt6AxRelLimEnum :
		( (*Relative limits selector setting*)
		mcMSJ6ARL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ6ARL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ6ARLSJALLEnum :
		( (*Lower limit selector setting*)
		mcMSJ6ARLSJALL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ6ARLSJALL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ6ARLSJALLStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ6ARLSJALLSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ6ARLSJALLSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ6ARLSJALLSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ6ARLSJALLSSJA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSJ6ARLSJALLSSJA_AX_5 := 4, (*Axis 5 - Axis 5*)
		mcMSJ6ARLSJALLSSJA_AX_6 := 5 (*Axis 6 - Axis 6*)
		);
	McMSJ6ARLSJALLStdType : STRUCT (*Type mcMSJ6ARLSJALL_STD settings*)
		SourceJointAxis : McMSJ6ARLSJALLStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ6ARLSJALLType : STRUCT (*Lower limit*)
		Type : McMSJ6ARLSJALLEnum; (*Lower limit selector setting*)
		Standard : McMSJ6ARLSJALLStdType; (*Type mcMSJ6ARLSJALL_STD settings*)
	END_STRUCT;
	McMSJ6ARLSJAULEnum :
		( (*Upper limit selector setting*)
		mcMSJ6ARLSJAUL_NOT_USE := 0, (*Not used - Relative limits not used*)
		mcMSJ6ARLSJAUL_STD := 1 (*Standard - Standard relative limit*)
		);
	McMSJ6ARLSJAULStdSrcJntAxEnum :
		( (*Index of the source joint axis for the relative limit*)
		mcMSJ6ARLSJAULSSJA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSJ6ARLSJAULSSJA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSJ6ARLSJAULSSJA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSJ6ARLSJAULSSJA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSJ6ARLSJAULSSJA_AX_5 := 4, (*Axis 5 - Axis 5*)
		mcMSJ6ARLSJAULSSJA_AX_6 := 5 (*Axis 6 - Axis 6*)
		);
	McMSJ6ARLSJAULStdType : STRUCT (*Type mcMSJ6ARLSJAUL_STD settings*)
		SourceJointAxis : McMSJ6ARLSJAULStdSrcJntAxEnum; (*Index of the source joint axis for the relative limit*)
		Coefficient : LREAL; (*Coefficient [measurement units]*)
	END_STRUCT;
	McMSJ6ARLSJAULType : STRUCT (*Upper limit*)
		Type : McMSJ6ARLSJAULEnum; (*Upper limit selector setting*)
		Standard : McMSJ6ARLSJAULStdType; (*Type mcMSJ6ARLSJAUL_STD settings*)
	END_STRUCT;
	McMSJnt6AxRelLimStdJntAxType : STRUCT (*Relative limits for joint axis*)
		LowerLimit : McMSJ6ARLSJALLType; (*Lower limit*)
		UpperLimit : McMSJ6ARLSJAULType; (*Upper limit*)
	END_STRUCT;
	McMSJnt6AxRelLimStdType : STRUCT (*Type mcMSJ6ARL_STD settings*)
		JointAxis : ARRAY[0..5] OF McMSJnt6AxRelLimStdJntAxType; (*Relative limits for joint axis*)
	END_STRUCT;
	McMSJnt6AxRelLimType : STRUCT (*Relative limits*)
		Type : McMSJnt6AxRelLimEnum; (*Relative limits selector setting*)
		Standard : McMSJnt6AxRelLimStdType; (*Type mcMSJ6ARL_STD settings*)
	END_STRUCT;
	McMSJnt6AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..5] OF McMSJntAxPosLimType; (*Limits for joint axis*)
		RelativeLimits : McMSJnt6AxRelLimType; (*Relative limits*)
	END_STRUCT;
	McCfgMS6AxCncZXYBCAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_CNC_ZXYBCA*)
		Description : McMS6ACZXYBCADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ACZXYBCACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ACZXYBCAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS6ACZXYBCACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMSSVOEnum :
		( (*Scene Viewer Object selector setting*)
		mcMSSVO_NOT_USE := 0, (*Not used -*)
		mcMSSVO_GEN := 1, (*Generic -*)
		mcMSSVO_OBJ_ID := 2 (*Object Id -*)
		);
	McMSSVOObjIdType : STRUCT (*Type mcMSSVO_OBJ_ID settings*)
		ID : UDINT; (*Scene viewer object ID*)
	END_STRUCT;
	McMSSVOType : STRUCT (*Defines if and which Scene Viewer Object should be used*)
		Type : McMSSVOEnum; (*Scene Viewer Object selector setting*)
		ObjectId : McMSSVOObjIdType; (*Type mcMSSVO_OBJ_ID settings*)
	END_STRUCT;
	McMS4ASADescEnum :
		( (*Description selector setting*)
		mcMS4ASAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ASADSDimTransFromQ1ToQ2Type : STRUCT (*Translation from Q1 to Q2*)
		XY : LREAL; (*Distance in the plane XY [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ASADSDimTransFromQ2ToQZType : STRUCT (*Translation from Q2 to QZ*)
		XY : LREAL; (*Distance in the plane XY [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ASADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McMS4ASADSDimTransFromQ1ToQ2Type; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQZ : McMS4ASADSDimTransFromQ2ToQZType; (*Translation from Q2 to QZ*)
		TranslationFromQZToQC : McCfgTransZType; (*Translation from QZ to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMS4ASADSType : STRUCT (*Type mcMS4ASAD_STD settings*)
		Dimensions : McMS4ASADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ASADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ASADescEnum; (*Description selector setting*)
		Standard : McMS4ASADSType; (*Type mcMS4ASAD_STD settings*)
	END_STRUCT;
	McMS4ASACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ASACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ASACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ASAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ASAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ASAWFrmMdlStdType : STRUCT (*Type mcMS4ASAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQZ : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ASAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ASAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ASAWFrmMdlStdType; (*Type mcMS4ASAWFM_STD settings*)
	END_STRUCT;
	McMSDynMdlEnum :
		( (*Dynamic model selector setting*)
		mcMSDM_DYNPARTABLE := 0 (*DynParTable - Table definition of dynamic model parameters*)
		);
	McMSDynMdlDynParTableType : STRUCT (*Type mcMSDM_DYNPARTABLE settings*)
		TableReference : McCfgReferenceType; (*Name of the table reference*)
	END_STRUCT;
	McMSDynMdlType : STRUCT (*Dynamic model of the mechanical system*)
		Type : McMSDynMdlEnum; (*Dynamic model selector setting*)
		DynParTable : McMSDynMdlDynParTableType; (*Type mcMSDM_DYNPARTABLE settings*)
	END_STRUCT;
	McMSIDMEnum :
		( (*Dynamic model selector setting*)
		mcMSIDM_DYNPARTABLE := 0, (*DynParTable -*)
		mcMSIDM_INT := 1 (*Internal -*)
		);
	McMSIDMIntRowType : STRUCT
		Index : UINT;
		Value : LREAL;
		Unit : STRING[250];
		Description : STRING[250];
	END_STRUCT;
	McMSIDMIntType : STRUCT (*Type mcMSIDM_INT settings*)
		Type : STRING[250]; (*Type of dynamic model*)
		Row : McCfgUnboundedArrayType; (*Connect array of type McMSIDMIntRowType*)
	END_STRUCT;
	McMSIDMType : STRUCT
		Type : McMSIDMEnum; (*Dynamic model selector setting*)
		Internal : McMSIDMIntType; (*Type mcMSIDM_INT settings*)
	END_STRUCT;
	McMSDynLimEnum :
		( (*Dynamic limits selector setting*)
		mcMSDL_DYNPARTABLES := 0 (*DynParTables - Table definition of dynamic model parameters*)
		);
	McMSDynLimDynParTablesType : STRUCT (*Type mcMSDL_DYNPARTABLES settings*)
		GearboxLimitsTableReference : McCfgReferenceType; (*Name of the table reference*)
		CrossSecLimTableReference : McCfgReferenceType; (*Name of the table reference*)
	END_STRUCT;
	McMSDynLimType : STRUCT (*Dynamic limits of the mechanical system*)
		Type : McMSDynLimEnum; (*Dynamic limits selector setting*)
		DynParTables : McMSDynLimDynParTablesType; (*Type mcMSDL_DYNPARTABLES settings*)
	END_STRUCT;
	McMSIDLEnum :
		( (*Dynamic limits selector setting*)
		mcMSIDL_DYNPARTABLES := 0, (*DynParTables -*)
		mcMSIDL_INT := 1 (*Internal -*)
		);
	McMSIDLIntGBLimRowType : STRUCT
		Index : UINT;
		Value : LREAL;
		Unit : STRING[250];
		Description : STRING[250];
	END_STRUCT;
	McMSIDLIntGBLimType : STRUCT
		Row : McCfgUnboundedArrayType; (*Connect array of type McMSIDLIntGBLimRowType*)
	END_STRUCT;
	McMSIDLIntCrossSecLimRowType : STRUCT
		Index : UINT;
		Value : LREAL;
		Unit : STRING[250];
		Description : STRING[250];
	END_STRUCT;
	McMSIDLIntCrossSecLimType : STRUCT
		Row : McCfgUnboundedArrayType; (*Connect array of type McMSIDLIntCrossSecLimRowType*)
	END_STRUCT;
	McMSIDLIntType : STRUCT (*Type mcMSIDL_INT settings*)
		Type : STRING[250]; (*Type of dynamic model*)
		GearboxLimits : McMSIDLIntGBLimType;
		CrossSectionLimits : McMSIDLIntCrossSecLimType;
	END_STRUCT;
	McMSIDLType : STRUCT
		Type : McMSIDLEnum; (*Dynamic limits selector setting*)
		Internal : McMSIDLIntType; (*Type mcMSIDL_INT settings*)
	END_STRUCT;
	McMS4AxConLimRedEnum :
		( (*Conditional limit reduction selector setting*)
		mcMS4CLR_NOT_USE := 0, (*Not used - Conditiona limit reduction not used*)
		mcMS4CLR_USE := 1 (*Used - Conditional limit reduction used*)
		);
	McMS4CLRULEnum :
		( (*Condition 1-5 selector setting*)
		mcMS4CLRUL_NOT_USE := 0, (*Not Used - NotUsed*)
		mcMS4CLRUL_USE := 1 (*Used - Used*)
		);
	McMSCLRULSEnum :
		( (*Source selector setting*)
		mcMSCLRULS_MASS := 0, (*Mass - Mass of tool and product*)
		mcMSCLRULS_MOM_OF_INERTIA_ARD_Z := 1 (*Moment of inertia around Z - Moment of inertia around Z*)
		);
	McMSCLRULSType : STRUCT (*Source of reduction*)
		Type : McMSCLRULSEnum; (*Source selector setting*)
	END_STRUCT;
	McMSCLRULTEnum :
		( (*Target selector setting*)
		mcMSCLRULT_JERK := 0 (*Jerk - Jerk*)
		);
	McMSCLRULTType : STRUCT (*Target of reduction*)
		Type : McMSCLRULTEnum; (*Target selector setting*)
	END_STRUCT;
	McMS4CLRULIEnum :
		( (*Influence on selector setting*)
		mcMS4CLRULI_AX := 0 (*Axes - Influence on axes*)
		);
	McMS4CLRULIAxAxEnum :
		( (*Activation of limit reduction*)
		mcMS4CLRULIAA_NO := 0, (*No - No*)
		mcMS4CLRULIAA_YES := 1 (*Yes - Yes*)
		);
	McMS4CLRULIAxType : STRUCT (*Type mcMS4CLRULI_AX settings*)
		Axis : ARRAY[0..3] OF McMS4CLRULIAxAxEnum; (*Activation of limit reduction*)
	END_STRUCT;
	McMS4CLRULIType : STRUCT (*Reduction of axes limits*)
		Type : McMS4CLRULIEnum; (*Influence on selector setting*)
		Axes : McMS4CLRULIAxType; (*Type mcMS4CLRULI_AX settings*)
	END_STRUCT;
	McMSCLRULPType : STRUCT (*Limit reduction point*)
		Value : LREAL; (*Mass in kg / Moment of inertia in kgm2 [measurement units]*)
		Reduction : LREAL; (*Limit reduction in percent [%]*)
	END_STRUCT;
	McMS4CLRULUseType : STRUCT (*Type mcMS4CLRUL_USE settings*)
		Source : McMSCLRULSType; (*Source of reduction*)
		Target : McMSCLRULTType; (*Target of reduction*)
		InfluenceOn : McMS4CLRULIType; (*Reduction of axes limits*)
		LimitReductionPoint : ARRAY[0..9] OF McMSCLRULPType; (*Limit reduction point*)
	END_STRUCT;
	McMS4CLRULType : STRUCT (*Condition*)
		Type : McMS4CLRULEnum; (*Condition 1-5 selector setting*)
		Used : McMS4CLRULUseType; (*Type mcMS4CLRUL_USE settings*)
	END_STRUCT;
	McMS4CLRUType : STRUCT (*Type mcMS4CLR_USE settings*)
		Condition : ARRAY[0..4] OF McMS4CLRULType; (*Condition*)
	END_STRUCT;
	McMS4AxConLimRedType : STRUCT (*Conditional limit reduction*)
		Type : McMS4AxConLimRedEnum; (*Conditional limit reduction selector setting*)
		Used : McMS4CLRUType; (*Type mcMS4CLR_USE settings*)
	END_STRUCT;
	McMS4ASACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McMS4ASAMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS4ASAMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS4ASAMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS4ASAMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS4ASAMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS4AxScaraAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_SCARA_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS4ASADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ASACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ASAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		ConditionalLimitReduction : McMS4AxConLimRedType; (*Conditional limit reduction*)
		Couplings : McMS4ASACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS4ASAMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS2ADADescEnum :
		( (*Description selector setting*)
		mcMS2ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS2ADADSDBPltArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		X : LREAL; (*X-offset from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS2ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS2ADADSDBPltArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMSDeltaDSDArmType : STRUCT (*Serial kinematic chain connecting base platform and end-effector platform*)
		UpperArmLength : LREAL; (*Length of the upper arm [measurement units]*)
		LowerArmLength : LREAL; (*Length of the lower arm [measurement units]*)
	END_STRUCT;
	McMS2ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..1] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS2ADADSDEEPltArmLinkPtType : STRUCT (*Point where the arm is linked to the end-effector platform*)
		X : LREAL; (*X-offset from the center of the end-effector platform [measurement units]*)
		Z : LREAL; (*Z-offset from the center of the end-effector platform [measurement units]*)
	END_STRUCT;
	McMS2ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS2ADADSDEEPltArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS2ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS2ADADSDBPltType; (*Fixed platform*)
		Arms : McMS2ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS2ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMSMdl2ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..1] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl2CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM2CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM2CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl2CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..1] OF McMSMdl2CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS2ADADSType : STRUCT (*Type mcMS2ADAD_STD settings*)
		Dimensions : McMS2ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl2ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl2CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS2ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS2ADADescEnum; (*Description selector setting*)
		Standard : McMS2ADADSType; (*Type mcMS2ADAD_STD settings*)
	END_STRUCT;
	McMS2ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ADAWFrmMdlStdType : STRUCT (*Type mcMS2ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ADAWFrmMdlStdType; (*Type mcMS2ADAWFM_STD settings*)
	END_STRUCT;
	McMS2ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg2LinCplgType)*)
	END_STRUCT;
	McCfgMS2AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_DELTA_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS2ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS2ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS2ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ADBDescEnum :
		( (*Description selector setting*)
		mcMS2ADBD_STD := 0 (*Standard - Standard description*)
		);
	McMS2ADBDSDimReacShtMntType : STRUCT (*Reaction shaft mounts dimensions*)
		PrimaryAngle : LREAL; (*Angle of the primary reaction shaft mount [measurement units]*)
		PrimaryLength : LREAL; (*Length of the primary reaction shaft mount [measurement units]*)
		SecondaryAngle : LREAL; (*Angle of the secondary reaction shaft mount [measurement units]*)
		SecondaryLength : LREAL; (*Length of the secondary reaction shaft mount [measurement units]*)
	END_STRUCT;
	McMS2ADBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatformCenter : McCfgTransXZType; (*Center of the base platform*)
		MotorMountRadius : LREAL; (*Radius at which the motors are placed [measurement units]*)
		ToolConnectionPlatformRadius : LREAL; (*Tool connection platform radius [measurement units]*)
		PrimaryArmLength : LREAL; (*Length of the primary arm [measurement units]*)
		SecondaryArmLength : LREAL; (*Length of the secondary arm [measurement units]*)
		ReactionShaftMounts : McMS2ADBDSDimReacShtMntType; (*Reaction shaft mounts dimensions*)
		TranslationToFlange : McCfgTransXZType; (*Translation to flange*)
	END_STRUCT;
	McMS2ADBDSType : STRUCT (*Type mcMS2ADBD_STD settings*)
		Dimensions : McMS2ADBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl2ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl2CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS2ADBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS2ADBDescEnum; (*Description selector setting*)
		Standard : McMS2ADBDSType; (*Type mcMS2ADBD_STD settings*)
	END_STRUCT;
	McMS2ADBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ADBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ADBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ADBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ADBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ADBWFrmMdlStdType : STRUCT (*Type mcMS2ADBWFM_STD settings*)
		PrimaryArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		SecondaryArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		ToolConnectionPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ADBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ADBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ADBWFrmMdlStdType; (*Type mcMS2ADBWFM_STD settings*)
	END_STRUCT;
	McMSLoadDepJerkLimEnum :
		( (*Load dependent jerk limits selector setting*)
		mcMSLDJL_NOT_USE := 0, (*Not used -*)
		mcMSLDJL_PAYLOAD_DEP_JERK_RED := 1 (*Payload dependent jerk reduction -*)
		);
	McMSLDJLPDJRJerkRedType : STRUCT
		Payloadkg : LREAL; (*Payload in kg*)
		JerkLimitReduction : LREAL; (*Jerk limit reduction in percent*)
	END_STRUCT;
	McMSLDJLPDJRType : STRUCT (*Type mcMSLDJL_PAYLOAD_DEP_JERK_RED settings*)
		JerkReduction : McCfgUnboundedArrayType; (*Connect array of type McMSLDJLPDJRJerkRedType*)
	END_STRUCT;
	McMSLoadDepJerkLimType : STRUCT
		Type : McMSLoadDepJerkLimEnum; (*Load dependent jerk limits selector setting*)
		PayloadDependentJerkReduction : McMSLDJLPDJRType; (*Type mcMSLDJL_PAYLOAD_DEP_JERK_RED settings*)
	END_STRUCT;
	McMS2ADBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg2LinCplgType)*)
	END_STRUCT;
	McMSDelta2DWrkRngEnum :
		( (*Working range selector setting*)
		mcMSD2DWR_NOT_USE := 0, (*Not used -*)
		mcMSD2DWR_STD := 1, (*Standard -*)
		mcMSD2DWR_EXT := 3, (*Extended -*)
		mcMSD2DWR_MAIN_AREA_W_EX_ZONES := 2 (*Main area with exclusion zones -*)
		);
	McMSDelta2DWrkRngStdType : STRUCT (*Type mcMSD2DWR_STD settings*)
		BaseToTop : LREAL; (*Distance from base platform center point to the top of the working range area [measurement units]*)
		TopHeight : LREAL; (*Height of the top truncated cone [measurement units]*)
		MiddleHeight : LREAL; (*Height of the middle cylindrical part [measurement units]*)
		BottomHeight : LREAL; (*Height of the bottom truncated cone [measurement units]*)
		TopRadius : LREAL; (*Radius of top truncated cone upperside [measurement units]*)
		MiddleRadius : LREAL; (*Radius of middle cylindrical part [measurement units]*)
		BottomRadius : LREAL; (*Radius of bottom truncated cone underside [measurement units]*)
	END_STRUCT;
	McMSDelta2DWrkRngExtType : STRUCT (*Type mcMSD2DWR_EXT settings*)
		MainCylinderDiameter : LREAL; (*A: Diameter of the main cylinder [measurement units]*)
		BaseToTopCone : LREAL; (*B: Distance from base platform center point to the top of the working range area [measurement units]*)
		MainCylinderOffset : LREAL; (*C: Distance from the top of the working range to the bottom of the main cylinder [measurement units]*)
		MainConeOffset : LREAL; (*D: Distance from the top of the working range to the bottom of the main cone [measurement units]*)
		BottomConeOffset : LREAL; (*E: Distance from the top of the working range to the bottom of the bottom cone [measurement units]*)
		MainConeDiameter : LREAL; (*F: Lower diameter of the main cone [measurement units]*)
		BottomConeDiameter : LREAL; (*G: Lower diameter of the bottom cone [measurement units]*)
		TopConeOffset : LREAL; (*H: Distance from the top of the working range to the bottom of the top cone [measurement units]*)
		TopConeDiameter : LREAL; (*I: Upper diameter of the top cone [measurement units]*)
	END_STRUCT;
	McMSD2DWRMAWEZZone1Enum :
		( (*Exclusion zone 1 selector setting*)
		mcMSD2DWRMAWEZZ1_NOT_USE := 0, (*Not used -*)
		mcMSD2DWRMAWEZZ1_USE := 1 (*Used -*)
		);
	McMSD2DWRMAWEZZone1UseType : STRUCT (*Type mcMSD2DWRMAWEZZ1_USE settings*)
		Z1 : LREAL; (*Top height limitation [measurement units]*)
	END_STRUCT;
	McMSD2DWRMAWEZZone1Type : STRUCT (*Zone excluded from the main working range*)
		Type : McMSD2DWRMAWEZZone1Enum; (*Exclusion zone 1 selector setting*)
		Used : McMSD2DWRMAWEZZone1UseType; (*Type mcMSD2DWRMAWEZZ1_USE settings*)
	END_STRUCT;
	McMSD2DWRMAWEZZone2Enum :
		( (*Exclusion zone 2 selector setting*)
		mcMSD2DWRMAWEZZ2_NOT_USE := 0, (*Not used -*)
		mcMSD2DWRMAWEZZ2_USE := 1 (*Used -*)
		);
	McMSD2DWRMAWEZZone2UseType : STRUCT (*Type mcMSD2DWRMAWEZZ2_USE settings*)
		X2 : LREAL; (*Internal collisions avoidance [measurement units]*)
	END_STRUCT;
	McMSD2DWRMAWEZZone2Type : STRUCT (*Zone excluded from the main working range*)
		Type : McMSD2DWRMAWEZZone2Enum; (*Exclusion zone 2 selector setting*)
		Used : McMSD2DWRMAWEZZone2UseType; (*Type mcMSD2DWRMAWEZZ2_USE settings*)
	END_STRUCT;
	McMSD2DWRMAWEZZone3Enum :
		( (*Exclusion zone 3 selector setting*)
		mcMSD2DWRMAWEZZ3_NOT_USE := 0, (*Not used -*)
		mcMSD2DWRMAWEZZ3_USE := 1 (*Used -*)
		);
	McMSD2DWRMAWEZZone3UseType : STRUCT (*Type mcMSD2DWRMAWEZZ3_USE settings*)
		Z3 : LREAL; (*Arc center offset [measurement units]*)
		R3 : LREAL; (*Arc radius [measurement units]*)
	END_STRUCT;
	McMSD2DWRMAWEZZone3Type : STRUCT (*Zone excluded from the main working range*)
		Type : McMSD2DWRMAWEZZone3Enum; (*Exclusion zone 3 selector setting*)
		Used : McMSD2DWRMAWEZZone3UseType; (*Type mcMSD2DWRMAWEZZ3_USE settings*)
	END_STRUCT;
	McMSD2DWRMainAreaWExZonesType : STRUCT (*Type mcMSD2DWR_MAIN_AREA_W_EX_ZONES settings*)
		MinimumAnglePrimaryArm : LREAL; (*Minimum angle of primary arms [measurement units]*)
		MaximumAnglePrimaryArm : LREAL; (*Maximum angle of primary arms [measurement units]*)
		ExclusionZone1 : McMSD2DWRMAWEZZone1Type; (*Zone excluded from the main working range*)
		ExclusionZone2 : McMSD2DWRMAWEZZone2Type; (*Zone excluded from the main working range*)
		ExclusionZone3 : McMSD2DWRMAWEZZone3Type; (*Zone excluded from the main working range*)
	END_STRUCT;
	McMSDelta2DWrkRngType : STRUCT (*Working range description related to end-effector platform center point*)
		Type : McMSDelta2DWrkRngEnum; (*Working range selector setting*)
		Standard : McMSDelta2DWrkRngStdType; (*Type mcMSD2DWR_STD settings*)
		Extended : McMSDelta2DWrkRngExtType; (*Type mcMSD2DWR_EXT settings*)
		MainAreaWithExclusionZones : McMSD2DWRMainAreaWExZonesType; (*Type mcMSD2DWR_MAIN_AREA_W_EX_ZONES settings*)
	END_STRUCT;
	McMS2ADBMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS2ADBMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS2ADBMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS2ADBMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS2ADBMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS2AxDeltaBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_DELTA_B*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS2ADBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS2ADBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ADBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		LoadDependentJerkLimits : McMSLoadDepJerkLimType;
		Couplings : McMS2ADBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDelta2DWrkRngType; (*Working range description related to end-effector platform center point*)
		MonitoringPoints : McMS2ADBMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS3ADADescEnum :
		( (*Description selector setting*)
		mcMS3ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMSDeltaDSDBPArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		Angle : LREAL; (*Angular distance from the center (starting from zero) [measurement units]*)
		Radius : LREAL; (*Distance from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS3ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS3ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
		LowerArmPairDistance : LREAL; (*Distance between the paired bars of the lower arm*)
	END_STRUCT;
	McMSDeltaDSDEEPArmLinkPtType : STRUCT (*Point where the arm is linked to the end-effector platform*)
		Radius : LREAL; (*Distance from the center of the end-effector platform [measurement units]*)
		Z : LREAL; (*Z-offset from the center of the end-effector platform [measurement units]*)
	END_STRUCT;
	McMS3ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS3ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS3ADADSDBPltType; (*Fixed platform*)
		Arms : McMS3ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS3ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS3ADADSType : STRUCT (*Type mcMS3ADAD_STD settings*)
		Dimensions : McMS3ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADADescEnum; (*Description selector setting*)
		Standard : McMS3ADADSType; (*Type mcMS3ADAD_STD settings*)
	END_STRUCT;
	McMS3ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADAWFrmMdlStdType : STRUCT (*Type mcMS3ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADAWFrmMdlStdType; (*Type mcMS3ADAWFM_STD settings*)
	END_STRUCT;
	McMS3ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McMSDeltaWrkRngEnum :
		( (*Working range selector setting*)
		mcMSDWR_NOT_USE := 0, (*Not used -*)
		mcMSDWR_STD := 1, (*Standard -*)
		mcMSDWR_EXT := 2 (*Extended -*)
		);
	McWRScnObjEnum :
		( (*Scene Viewer Object selector setting*)
		mcWRSO_NOT_USE := 0, (*Not used -*)
		mcWRSO_USE := 1 (*Used - Working range is added*)
		);
	McWRScnObjType : STRUCT (*Working range settings*)
		Type : McWRScnObjEnum; (*Scene Viewer Object selector setting*)
	END_STRUCT;
	McMSDeltaWrkRngStdType : STRUCT (*Type mcMSDWR_STD settings*)
		SceneViewerObject : McWRScnObjType; (*Working range settings*)
		BaseToTop : LREAL; (*Distance from base platform center point to the top of the working range area [measurement units]*)
		TopHeight : LREAL; (*Height of the top truncated cone [measurement units]*)
		MiddleHeight : LREAL; (*Height of the middle cylindrical part [measurement units]*)
		BottomHeight : LREAL; (*Height of the bottom truncated cone [measurement units]*)
		TopRadius : LREAL; (*Radius of top truncated cone upperside [measurement units]*)
		MiddleRadius : LREAL; (*Radius of middle cylindrical part [measurement units]*)
		BottomRadius : LREAL; (*Radius of bottom truncated cone underside [measurement units]*)
	END_STRUCT;
	McWRScnObjExtEnum :
		( (*Scene Viewer Object selector setting*)
		mcWRSOE_NOT_USE := 0, (*Not used -*)
		mcWRSOE_USE := 1 (*Used - Working range is added*)
		);
	McWRScnObjExtType : STRUCT (*Working range extended settings*)
		Type : McWRScnObjExtEnum; (*Scene Viewer Object selector setting*)
	END_STRUCT;
	McMSDeltaWrkRngExtType : STRUCT (*Type mcMSDWR_EXT settings*)
		SceneViewerObject : McWRScnObjExtType; (*Working range extended settings*)
		MainCylinderDiameter : LREAL; (*A: Diameter of the main cylinder [measurement units]*)
		BaseToTopCone : LREAL; (*B: Distance from base platform center point to the top of the working range area [measurement units]*)
		MainCylinderOffset : LREAL; (*C: Distance from the top of the working range to the bottom of the main cylinder [measurement units]*)
		MainConeOffset : LREAL; (*D: Distance from the top of the working range to the bottom of the main cone [measurement units]*)
		BottomConeOffset : LREAL; (*E: Distance from the top of the working range to the bottom of the bottom cone [measurement units]*)
		MainConeDiameter : LREAL; (*F: Lower diameter of the main cone [measurement units]*)
		BottomConeDiameter : LREAL; (*G: Lower diameter of the bottom cone [measurement units]*)
		TopConeOffset : LREAL; (*H: Distance from the top of the working range to the bottom of the top cone [measurement units]*)
		TopConeDiameter : LREAL; (*I: Upper diameter of the top cone [measurement units]*)
	END_STRUCT;
	McMSDeltaWrkRngType : STRUCT (*Working range description related to end-effector platform center point*)
		Type : McMSDeltaWrkRngEnum; (*Working range selector setting*)
		Standard : McMSDeltaWrkRngStdType; (*Type mcMSDWR_STD settings*)
		Extended : McMSDeltaWrkRngExtType; (*Type mcMSDWR_EXT settings*)
	END_STRUCT;
	McCfgMS3AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS3ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		LoadDependentJerkLimits : McMSLoadDepJerkLimType;
		Couplings : McMS3ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDeltaWrkRngType; (*Working range description related to end-effector platform center point*)
	END_STRUCT;
	McMS3ADXZBDescEnum :
		( (*Description selector setting*)
		mcMS3ADXZBD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ADXZBDSDBPltArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		X : LREAL; (*X-offset from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS3ADXZBDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS3ADXZBDSDBPltArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS3ADXZBDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..1] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS3ADXZBDSDEEPltType : STRUCT (*Moving platform*)
		TranslationToFlange : McCfgTransXZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS3ADXZBDSDPPMBrktMntArmEnum :
		( (*Specifies which arm is the passive parallel mechanism mounted to*)
		mcMS3ADXZBDSDPPMBMA_ARM_1 := 0, (*Arm 1*)
		mcMS3ADXZBDSDPPMBMA_ARM_2 := 1 (*Arm 2*)
		);
	McMS3ADXZBDSDPPMQ3ZeroPosEnum :
		( (*Q3 zero position property*)
		mcMS3ADXZBDSDPPMQZP_INNER := 0, (*Inner*)
		mcMS3ADXZBDSDPPMQZP_OUTER := 1 (*Outer*)
		);
	McMS3ADXZBDSDPPMType : STRUCT (*Description of the passive parallel mechanism between Q3 and B*)
		TranslationFromBaseToQ3 : McCfgTransXZType; (*Translation from base to Q3*)
		Q3Radius : LREAL; (*Radius of Q3 [measurement units]*)
		BracketLength : LREAL; (*Length of the upper part of the bracket [measurement units]*)
		BracketMountingArm : McMS3ADXZBDSDPPMBrktMntArmEnum; (*Specifies which arm is the passive parallel mechanism mounted to*)
		Q3ZeroPosition : McMS3ADXZBDSDPPMQ3ZeroPosEnum; (*Q3 zero position property*)
	END_STRUCT;
	McMS3ADXZBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS3ADXZBDSDBPltType; (*Fixed platform*)
		Arms : McMS3ADXZBDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS3ADXZBDSDEEPltType; (*Moving platform*)
		PassiveParallelMechanism : McMS3ADXZBDSDPPMType; (*Description of the passive parallel mechanism between Q3 and B*)
	END_STRUCT;
	McMS3ADXZBDSType : STRUCT (*Type mcMS3ADXZBD_STD settings*)
		Dimensions : McMS3ADXZBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADXZBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADXZBDescEnum; (*Description selector setting*)
		Standard : McMS3ADXZBDSType; (*Type mcMS3ADXZBD_STD settings*)
	END_STRUCT;
	McMS3ADXZBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
	END_STRUCT;
	McMS3ADXZBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADXZBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADXZBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADXZBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADXZBWFrmMdlStdType : STRUCT (*Type mcMS3ADXZBWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToBracket : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		BracketToArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADXZBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADXZBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADXZBWFrmMdlStdType; (*Type mcMS3ADXZBWFM_STD settings*)
	END_STRUCT;
	McMS3ADXZBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McMS3ADXZBMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS3ADXZBMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS3ADXZBMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS3ADXZBMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS3ADXZBMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS3AxDeltaXZBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_XZB*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS3ADXZBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADXZBCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS3ADXZBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		Couplings : McMS3ADXZBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS3ADXZBMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS3ADBDescEnum :
		( (*Description selector setting*)
		mcMS3ADBD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ADBDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS3ADBDSDAArmType : STRUCT (*Serial kinematic chain connecting base platform and end-effector platform*)
		ArmLength : LREAL; (*Length of the arm [measurement units]*)
		ArmOffset : LREAL; (*Offset from the arm link point [measurement units]*)
		ArmAngle : LREAL; (*Angle from the perpendicular direction (starting from zero) [measurement units]*)
	END_STRUCT;
	McMS3ADBDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMS3ADBDSDAArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS3ADBDSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS3ADBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS3ADBDSDBPltType; (*Fixed platform*)
		Arms : McMS3ADBDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS3ADBDSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS3ADBDSType : STRUCT (*Type mcMS3ADBD_STD settings*)
		Dimensions : McMS3ADBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADBDescEnum; (*Description selector setting*)
		Standard : McMS3ADBDSType; (*Type mcMS3ADBD_STD settings*)
	END_STRUCT;
	McMS3ADBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ADBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADBWFrmMdlStdType : STRUCT (*Type mcMS3ADBWFM_STD settings*)
		LinkPointToArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADBWFrmMdlStdType; (*Type mcMS3ADBWFM_STD settings*)
	END_STRUCT;
	McMS3ADBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McCfgMS3AxDeltaBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_B*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS3ADBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ADBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS3ADBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ADXZCDescEnum :
		( (*Description selector setting*)
		mcMS3ADXZCD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ADXZCDSDimReacShtMntType : STRUCT (*Reaction shaft mounts dimensions*)
		PrimaryAngle : LREAL; (*Angle of the primary reaction shaft mount [measurement units]*)
		PrimaryLength : LREAL; (*Length of the primary reaction shaft mount [measurement units]*)
		SecondaryAngle : LREAL; (*Angle of the secondary reaction shaft mount [measurement units]*)
		SecondaryLength : LREAL; (*Length of the secondary reaction shaft mount [measurement units]*)
	END_STRUCT;
	McMS3ADXZCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatformCenter : McCfgTransXZType; (*Center of the base platform*)
		MotorMountRadius : LREAL; (*Radius at which the motors are placed [measurement units]*)
		ToolConnectionPlatformRadius : LREAL; (*Tool connection platform radius [measurement units]*)
		PrimaryArmLength : LREAL; (*Length of the primary arm [measurement units]*)
		SecondaryArmLength : LREAL; (*Length of the secondary arm [measurement units]*)
		ReactionShaftMounts : McMS3ADXZCDSDimReacShtMntType; (*Reaction shaft mounts dimensions*)
		TranslationToFlange : McCfgTransXZType; (*Translation to flange*)
	END_STRUCT;
	McMS3ADXZCDSType : STRUCT (*Type mcMS3ADXZCD_STD settings*)
		Dimensions : McMS3ADXZCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADXZCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADXZCDescEnum; (*Description selector setting*)
		Standard : McMS3ADXZCDSType; (*Type mcMS3ADXZCD_STD settings*)
	END_STRUCT;
	McMS3ADXZCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS3ADXZCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADXZCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADXZCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADXZCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADXZCWFrmMdlStdType : STRUCT (*Type mcMS3ADXZCWFM_STD settings*)
		PrimaryArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		SecondaryArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		ToolConnectionPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADXZCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADXZCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADXZCWFrmMdlStdType; (*Type mcMS3ADXZCWFM_STD settings*)
	END_STRUCT;
	McMS3ADXZCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McMS3ADXZCMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS3ADXZCMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS3ADXZCMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS3ADXZCMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS3ADXZCMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS3AxDeltaXZCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_XZC*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS3ADXZCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADXZCCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ADXZCWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		LoadDependentJerkLimits : McMSLoadDepJerkLimType;
		Couplings : McMS3ADXZCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDelta2DWrkRngType; (*Working range description related to end-effector platform center point*)
		MonitoringPoints : McMS3ADXZCMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS4ADADescEnum :
		( (*Description selector setting*)
		mcMS4ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS4ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
		LowerArmPairDistance : LREAL; (*Distance between the paired bars of the lower arm*)
	END_STRUCT;
	McMS4ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS4ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS4ADADSDBPltType; (*Fixed platform*)
		Arms : McMS4ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS4ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS4ADADSType : STRUCT (*Type mcMS4ADAD_STD settings*)
		Dimensions : McMS4ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ADADescEnum; (*Description selector setting*)
		Standard : McMS4ADADSType; (*Type mcMS4ADAD_STD settings*)
	END_STRUCT;
	McMS4ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ADAWFrmMdlStdType : STRUCT (*Type mcMS4ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ADAWFrmMdlStdType; (*Type mcMS4ADAWFM_STD settings*)
	END_STRUCT;
	McMS4ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McCfgMS4AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_DELTA_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS4ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ADACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		LoadDependentJerkLimits : McMSLoadDepJerkLimType;
		Couplings : McMS4ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDeltaWrkRngType; (*Working range description related to end-effector platform center point*)
	END_STRUCT;
	McMS4ADBDescEnum :
		( (*Description selector setting*)
		mcMS4ADBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ADBDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMSDeltaDSDArmLinType : STRUCT (*Serial kinematic chain connecting base platform and end-effector platform*)
		ArmLength : LREAL; (*Length of the arm [measurement units]*)
		Z : LREAL; (*Z-offset from the arm link point [measurement units]*)
	END_STRUCT;
	McMS4ADBDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmLinType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS4ADBDSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS4ADBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS4ADBDSDBPltType; (*Fixed platform*)
		Arms : McMS4ADBDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS4ADBDSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS4ADBDSType : STRUCT (*Type mcMS4ADBD_STD settings*)
		Dimensions : McMS4ADBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ADBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ADBDescEnum; (*Description selector setting*)
		Standard : McMS4ADBDSType; (*Type mcMS4ADBD_STD settings*)
	END_STRUCT;
	McMS4ADBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ADBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ADBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ADBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ADBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ADBWFrmMdlStdType : STRUCT (*Type mcMS4ADBWFM_STD settings*)
		LinkPointToArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ADBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ADBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ADBWFrmMdlStdType; (*Type mcMS4ADBWFM_STD settings*)
	END_STRUCT;
	McMS4ADBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McCfgMS4AxDeltaBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_DELTA_B*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS4ADBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ADBCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ADBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS4ADBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDeltaWrkRngType; (*Working range description related to end-effector platform center point*)
	END_STRUCT;
	McMS4ADCDescEnum :
		( (*Description selector setting*)
		mcMS4ADCD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ADCDSDBPArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		Angle : LREAL; (*Angular distance from the center (starting from zero) [measurement units]*)
		X : LREAL; (*X-offset from the center in the coordinate system rotated by Angle [measurement units]*)
		Y : LREAL; (*Y-offset from the center in the coordinate system rotated by Angle [measurement units]*)
		Z : LREAL; (*Z-offset from the center in the coordinate system rotated by Angle [measurement units]*)
	END_STRUCT;
	McMS4ADCDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMS4ADCDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS4ADCDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS4ADCDSDEEPArmLinkPtType : STRUCT (*Point where the arm is linked to the end-effector platform*)
		X : LREAL; (*X-offset from the center of lower platform (in coordinate system rotated by the corresponding angle of upper platform) [measurement units]*)
		Z : LREAL; (*Z-offset from the center of lower platform (in coordinate system rotated by the corresponding angle of upper platform) [measurement units]*)
	END_STRUCT;
	McMS4ADCDSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMS4ADCDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS4ADCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS4ADCDSDBPltType; (*Fixed platform*)
		Arms : McMS4ADCDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS4ADCDSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS4ADCDSType : STRUCT (*Type mcMS4ADCD_STD settings*)
		Dimensions : McMS4ADCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ADCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ADCDescEnum; (*Description selector setting*)
		Standard : McMS4ADCDSType; (*Type mcMS4ADCD_STD settings*)
	END_STRUCT;
	McMS4ADCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ADCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ADCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ADCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ADCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ADCWFrmMdlStdType : STRUCT (*Type mcMS4ADCWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ADCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ADCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ADCWFrmMdlStdType; (*Type mcMS4ADCWFM_STD settings*)
	END_STRUCT;
	McMS4ADCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McCfgMS4AxDeltaCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_DELTA_C*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS4ADCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ADCCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ADCWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS4ADCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDeltaWrkRngType; (*Working range description related to end-effector platform center point*)
	END_STRUCT;
	McMS5ADADescEnum :
		( (*Description selector setting*)
		mcMS5ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ADADSDimBasePltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS5ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
		LowerArmPairDistance : LREAL; (*Distance between the paired bars of the lower arm*)
	END_STRUCT;
	McMS5ADADSDimEndEffPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToQC : McCfgTransXYZType; (*Translation from the center of the end-effector platform to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMS5ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS5ADADSDimBasePltType; (*Fixed platform*)
		Arms : McMS5ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS5ADADSDimEndEffPltType; (*Moving platform*)
	END_STRUCT;
	McMS5ADADSType : STRUCT (*Type mcMS5ADAD_STD settings*)
		Dimensions : McMS5ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ADADescEnum; (*Description selector setting*)
		Standard : McMS5ADADSType; (*Type mcMS5ADAD_STD settings*)
	END_STRUCT;
	McMS5ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS5ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ADAWFrmMdlStdType : STRUCT (*Type mcMS5ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ADAWFrmMdlStdType; (*Type mcMS5ADAWFM_STD settings*)
	END_STRUCT;
	McMS5ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McCfgMS5AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_DELTA_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS5ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ADACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS5ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		LoadDependentJerkLimits : McMSLoadDepJerkLimType;
		Couplings : McMS5ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
		WorkingRange : McMSDeltaWrkRngType; (*Working range description related to end-effector platform center point*)
	END_STRUCT;
	McMS3ARADescEnum :
		( (*Description selector setting*)
		mcMS3ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToFlange : McCfgTransXYZType; (*Translation from Q3 to flange*)
	END_STRUCT;
	McMS3ARADSType : STRUCT (*Type mcMS3ARAD_STD settings*)
		Dimensions : McMS3ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ARADescEnum; (*Description selector setting*)
		Standard : McMS3ARADSType; (*Type mcMS3ARAD_STD settings*)
	END_STRUCT;
	McMS3ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ARAWFrmMdlStdType : STRUCT (*Type mcMS3ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ARAWFrmMdlStdType; (*Type mcMS3ARAWFM_STD settings*)
	END_STRUCT;
	McMS3ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg3LinCplgType)*)
	END_STRUCT;
	McCfgMS3AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_ROB_A*)
		Description : McMS3ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS3ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ARADescEnum :
		( (*Description selector setting*)
		mcMS4ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToPQ1 : McCfgTransXYZType; (*Translation from Q3 to PQ1*)
		TranslationFromPQ1ToQ4 : McCfgTransXYZType; (*Translation from PQ1 to Q4*)
		TranslationFromQ4ToFlange : McCfgTransXYZType; (*Translation from Q4 to flange*)
	END_STRUCT;
	McMS4ARADSType : STRUCT (*Type mcMS4ARAD_STD settings*)
		Dimensions : McMS4ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ARADescEnum; (*Description selector setting*)
		Standard : McMS4ARADSType; (*Type mcMS4ARAD_STD settings*)
	END_STRUCT;
	McMS4ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ARAWFrmMdlStdCusEdgTypEnum :
		( (*Type selector setting*)
		mcMS4ARAWFMSCET_CXN_LIN := 0, (*Connection line - Edge is considered as a whole connection line*)
		mcMS4ARAWFMSCET_PT := 1, (*Point - Only the end point of the edge is considered*)
		mcMS4ARAWFMSCET_NOT_USE := 2 (*Not used - Edge is not considered*)
		);
	McMS4ARAFMSCETParentPtEnum :
		( (*Parent point selector setting*)
		mcMS4ARAFMSCETPP_Q1 := 0, (*Q1 - Point Q1*)
		mcMS4ARAFMSCETPP_Q2 := 1, (*Q2 - Point Q2*)
		mcMS4ARAFMSCETPP_Q3 := 2, (*Q3 - Point Q3*)
		mcMS4ARAFMSCETPP_PQ1 := 3, (*PQ1 - Point PQ1*)
		mcMS4ARAFMSCETPP_Q4 := 4, (*Q4 - Point Q4*)
		mcMS4ARAFMSCETPP_FLG := 5, (*Flange - Point Flange*)
		mcMS4ARAFMSCETPP_TCP := 6 (*TCP - Point TCP*)
		);
	McMS4ARAFMSCETParentPtType : STRUCT (*Parent point*)
		Type : McMS4ARAFMSCETParentPtEnum; (*Parent point selector setting*)
	END_STRUCT;
	McMS4ARAFMSCETCxnLinOffType : STRUCT (*Offset in the coordinate system of the parent point*)
		X : LREAL; (*Translation in X direction [measurement units]*)
		Y : LREAL; (*Translation in Y direction [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ARAFMSCETCxnLinType : STRUCT (*Type mcMS4ARAWFMSCET_CXN_LIN settings*)
		ParentPoint : McMS4ARAFMSCETParentPtType; (*Parent point*)
		Offset : McMS4ARAFMSCETCxnLinOffType; (*Offset in the coordinate system of the parent point*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMS4ARAFMSCETPtOffType : STRUCT (*Offset in the coordinate system of the parent point*)
		X : LREAL; (*Translation in X direction [measurement units]*)
		Y : LREAL; (*Translation in Y direction [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ARAFMSCETPtType : STRUCT (*Type mcMS4ARAWFMSCET_PT settings*)
		ParentPoint : McMS4ARAFMSCETParentPtType; (*Parent point*)
		Offset : McMS4ARAFMSCETPtOffType; (*Offset in the coordinate system of the parent point*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMS4ARAWFrmMdlStdCusEdgTypType : STRUCT (*Type of the custom edge of the wire frame model*)
		Type : McMS4ARAWFrmMdlStdCusEdgTypEnum; (*Type selector setting*)
		ConnectionLine : McMS4ARAFMSCETCxnLinType; (*Type mcMS4ARAWFMSCET_CXN_LIN settings*)
		Point : McMS4ARAFMSCETPtType; (*Type mcMS4ARAWFMSCET_PT settings*)
	END_STRUCT;
	McMS4ARAWFrmMdlStdCusEdgType : STRUCT (*Custom edges of the wire frame model*)
		Type : McMS4ARAWFrmMdlStdCusEdgTypType; (*Type of the custom edge of the wire frame model*)
	END_STRUCT;
	McMS4ARAWFrmMdlStdCusType : STRUCT (*Custom edges of the wire frame model*)
		Edge : McCfgUnboundedArrayType; (*Custom edges of the wire frame model (Connect array of type McMS4ARAWFrmMdlStdCusEdgType)*)
	END_STRUCT;
	McMS4ARAWFrmMdlStdType : STRUCT (*Type mcMS4ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToPQ1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		PQ1ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Custom : McMS4ARAWFrmMdlStdCusType; (*Custom edges of the wire frame model*)
	END_STRUCT;
	McMS4ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ARAWFrmMdlStdType; (*Type mcMS4ARAWFM_STD settings*)
	END_STRUCT;
	McMS4ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg4LinCplgType)*)
	END_STRUCT;
	McMS4ARAMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS4ARAMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS4ARAMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS4ARAMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS4ARAMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS4AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_ROB_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS4ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ARACoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		Couplings : McMS4ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS4ARAMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS4ARBDescEnum :
		( (*Description selector setting*)
		mcMS4ARBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ARBDSDimQ2CylinderType : STRUCT (*Q2 cylinder*)
		TranslationFromQ1ToAnchor : McCfgTransXYZType; (*Translation from Q1 to anchor*)
		TranslationFromQ2ToActuator : McCfgTransXYZType; (*Translation from Q2 to actuator*)
	END_STRUCT;
	McMS4ARBDSDimQ3CylinderType : STRUCT (*Q3 cylinder*)
		TranslationFromQ2ToAnchor : McCfgTransXYZType; (*Translation from Q2 to anchor*)
		TranslationFromQ3ToActuator : McCfgTransXYZType; (*Translation from Q3 to actuator*)
	END_STRUCT;
	McMS4ARBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToPQ1 : McCfgTransXYZType; (*Translation from Q3 to PQ1*)
		TranslationFromPQ1ToQ4 : McCfgTransXYZType; (*Translation from PQ1 to Q4*)
		TranslationFromQ4ToFlange : McCfgTransXYZType; (*Translation from Q4 to flange*)
		Q2Cylinder : McMS4ARBDSDimQ2CylinderType; (*Q2 cylinder*)
		Q3Cylinder : McMS4ARBDSDimQ3CylinderType; (*Q3 cylinder*)
	END_STRUCT;
	McMS4ARBDSType : STRUCT (*Type mcMS4ARBD_STD settings*)
		Dimensions : McMS4ARBDSDimType; (*Dimensions of the mechanical system*)
	END_STRUCT;
	McMS4ARBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ARBDescEnum; (*Description selector setting*)
		Standard : McMS4ARBDSType; (*Type mcMS4ARBD_STD settings*)
	END_STRUCT;
	McMS4ARBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ARBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ARBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ARBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ARBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ARBWFrmMdlStdType : STRUCT (*Type mcMS4ARBWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToPQ1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		PQ1ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2AnchorToQ2Actuator : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3AnchorToQ3Actuator : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ARBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ARBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ARBWFrmMdlStdType; (*Type mcMS4ARBWFM_STD settings*)
	END_STRUCT;
	McCfgMS4AxRobBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_ROB_B*)
		Description : McMS4ARBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ARBCoorNameType; (*Coordinates names*)
		TCPOrientation : McMSTCPOType; (*Handling of TCP orientation coordinates*)
		WireFrameModel : McMS4ARBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ARADescEnum :
		( (*Description selector setting*)
		mcMS5ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransXYZType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToFlange : McCfgTransXYZType; (*Translation from Q5 to flange*)
	END_STRUCT;
	McMS5ARADSType : STRUCT (*Type mcMS5ARAD_STD settings*)
		Dimensions : McMS5ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ARADescEnum; (*Description selector setting*)
		Standard : McMS5ARADSType; (*Type mcMS5ARAD_STD settings*)
	END_STRUCT;
	McMS5ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS5ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ARAWFrmMdlStdType : STRUCT (*Type mcMS5ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ARAWFrmMdlStdType; (*Type mcMS5ARAWFM_STD settings*)
	END_STRUCT;
	McMS5ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McCfgMS5AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_ROB_A*)
		Description : McMS5ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS5ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ARBDescEnum :
		( (*Description selector setting*)
		mcMS5ARBD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ARBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base of the mechanical system to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransXYZType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToFlange : McCfgTransXYZType; (*Translation from Q5 to flange*)
	END_STRUCT;
	McMS5ARBDSType : STRUCT (*Type mcMS5ARBD_STD settings*)
		Dimensions : McMS5ARBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ARBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ARBDescEnum; (*Description selector setting*)
		Standard : McMS5ARBDSType; (*Type mcMS5ARBD_STD settings*)
	END_STRUCT;
	McMS5ARBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS5ARBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ARBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ARBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ARBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ARBWFrmMdlStdType : STRUCT (*Type mcMS5ARBWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ARBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ARBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ARBWFrmMdlStdType; (*Type mcMS5ARBWFM_STD settings*)
	END_STRUCT;
	McMS5ARBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg5LinCplgType)*)
	END_STRUCT;
	McMS5ARBMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS5ARBMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS5ARBMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS5ARBMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS5ARBMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS5AxRobBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_ROB_B*)
		Description : McMS5ARBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ARBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ARBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS5ARBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS5ARBMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS6ARADescEnum :
		( (*Description selector setting*)
		mcMS6ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransXType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToQ6 : McCfgTransXType; (*Translation from Q5 to Q6*)
		TranslationFromQ6ToFlange : McCfgTransXYZType; (*Translation from Q6 to flange*)
	END_STRUCT;
	McMS6ARADSType : STRUCT (*Type mcMS6ARAD_STD settings*)
		Dimensions : McMS6ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ARADescEnum; (*Description selector setting*)
		Standard : McMS6ARADSType; (*Type mcMS6ARAD_STD settings*)
	END_STRUCT;
	McMS6ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ARAWFrmMdlStdType : STRUCT (*Type mcMS6ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToQ6 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q6ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ARAWFrmMdlStdType; (*Type mcMS6ARAWFM_STD settings*)
	END_STRUCT;
	McMS6ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg6LinCplgType)*)
	END_STRUCT;
	McMS6ARAMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS6ARAMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS6ARAMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS6ARAMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS6ARAMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McCfgMS6AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_ROB_A*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS6ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		DynamicLimits : McMSDynLimType; (*Dynamic limits of the mechanical system*)
		InternalDynamicLimits : McMSIDLType;
		Couplings : McMS6ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS6ARAMonPtType; (*Enable robot monitoring points*)
	END_STRUCT;
	McMS6ARBDescEnum :
		( (*Description selector setting*)
		mcMS6ARBD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ARBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransZType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToQ6 : McCfgTransZType; (*Translation from Q5 to Q6*)
		TranslationFromQ6ToFlange : McCfgTransXYZType; (*Translation from Q6 to flange*)
	END_STRUCT;
	McMS6ARBDSType : STRUCT (*Type mcMS6ARBD_STD settings*)
		Dimensions : McMS6ARBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ARBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ARBDescEnum; (*Description selector setting*)
		Standard : McMS6ARBDSType; (*Type mcMS6ARBD_STD settings*)
	END_STRUCT;
	McMS6ARBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ARBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ARBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ARBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ARBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ARBWFrmMdlStdType : STRUCT (*Type mcMS6ARBWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToQ6 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q6ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ARBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ARBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ARBWFrmMdlStdType; (*Type mcMS6ARBWFM_STD settings*)
	END_STRUCT;
	McMS6ARBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg6LinCplgType)*)
	END_STRUCT;
	McCfgMS6AxRobBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_ROB_B*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS6ARBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ARBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ARBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS6ARBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS6ARCDescEnum :
		( (*Description selector setting*)
		mcMS6ARCD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ARCDSDTFQ4ToQ5Type : STRUCT (*Translation from Q4 to Q5*)
		YZ : LREAL; (*Length of the link between Q4 and Q5 [measurement units]*)
		Angle : LREAL; (*Angle of the link between Q4 and Q5 [measurement units]*)
	END_STRUCT;
	McMS6ARCDSDTFQ5ToPQ1Type : STRUCT (*Translation from Q5 to PQ1*)
		YZ : LREAL; (*Length of the link between Q5 and PQ1 [measurement units]*)
		Angle : LREAL; (*Angle of the link between Q5 and PQ1 [measurement units]*)
	END_STRUCT;
	McMS6ARCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McMS6ARCDSDTFQ4ToQ5Type; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToPQ1 : McMS6ARCDSDTFQ5ToPQ1Type; (*Translation from Q5 to PQ1*)
		TranslationFromPQ1ToQ6 : McCfgTransYType; (*Translation from PQ1 to Q6*)
		TranslationFromQ6ToFlange : McCfgTransXYZType; (*Translation from Q6 to flange*)
	END_STRUCT;
	McMS6ARCDSType : STRUCT (*Type mcMS6ARCD_STD settings*)
		Dimensions : McMS6ARCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ARCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ARCDescEnum; (*Description selector setting*)
		Standard : McMS6ARCDSType; (*Type mcMS6ARCD_STD settings*)
	END_STRUCT;
	McMS6ARCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ARCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ARCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ARCSingHndlgEnum :
		( (*Singularity handling selector setting*)
		mcMS6ARCSH_STD := 0, (*Standard - Move through singularity with high TCP precision*)
		mcMS6ARCSH_ORIENT_COMP := 1 (*Orientation compliance - TCP orientation is modified near and inside singularities*)
		);
	McMS6ARCSingHndlgOrientCompType : STRUCT (*Type mcMS6ARCSH_ORIENT_COMP settings*)
		AngleTolerance : LREAL; (*Angle tolerance for TCP orientation modifications [measurement units]*)
		OrientationStiffness : LREAL; (*The bigger the stiffness is the smaller is the difference to programmed orientation*)
	END_STRUCT;
	McMS6ARCSingHndlgType : STRUCT (*Behaviour near and inside mechanical singularities*)
		Type : McMS6ARCSingHndlgEnum; (*Singularity handling selector setting*)
		OrientationCompliance : McMS6ARCSingHndlgOrientCompType; (*Type mcMS6ARCSH_ORIENT_COMP settings*)
	END_STRUCT;
	McMS6ARCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ARCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ARCWFrmMdlStdType : STRUCT (*Type mcMS6ARCWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToP1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		P1ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToPQ1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		PQ1ToQ6 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q6ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ARCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ARCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ARCWFrmMdlStdType; (*Type mcMS6ARCWFM_STD settings*)
	END_STRUCT;
	McMS6ARCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling (Connect array of type McMSCplg6LinCplgType)*)
	END_STRUCT;
	McMS6ARCMonPtEnum :
		( (*Monitoring points selector setting*)
		mcMS6ARCMP_NOT_USE := 0, (*Not used - Monitoring points not used*)
		mcMS6ARCMP_STD := 1 (*Standard - Monitoring points used*)
		);
	McMS6ARCMonPtType : STRUCT (*Enable robot monitoring points*)
		Type : McMS6ARCMonPtEnum; (*Monitoring points selector setting*)
	END_STRUCT;
	McMS6ARCPrgToolOffEnum :
		( (*Programmed tool offset selector setting*)
		mcMS6ARCPTO_NOT_USE := 0, (*Not used -*)
		mcMS6ARCPTO_STD := 1 (*Standard - Standard programmed tool offset settings*)
		);
	McMS6ARCPrgToolOffStdDirEnum :
		( (*Direction selector setting*)
		mcMS6ARCPTOSD_X := 0, (*X - X-direction of the tool coordinate system*)
		mcMS6ARCPTOSD_Y := 1, (*Y - Y-direction of the tool coordinate system*)
		mcMS6ARCPTOSD_Z := 2 (*Z - Z-direction of the tool coordinate system*)
		);
	McMS6ARCPrgToolOffStdDirType : STRUCT (*Direction of the offset*)
		Type : McMS6ARCPrgToolOffStdDirEnum; (*Direction selector setting*)
	END_STRUCT;
	McMS6ARCPrgToolOffStdType : STRUCT (*Type mcMS6ARCPTO_STD settings*)
		AxisReference : McCfgReferenceType; (*Reference to the slave axis representing the offset value*)
		Direction : McMS6ARCPrgToolOffStdDirType; (*Direction of the offset*)
	END_STRUCT;
	McMS6ARCPrgToolOffType : STRUCT (*Programmed tool offset*)
		Type : McMS6ARCPrgToolOffEnum; (*Programmed tool offset selector setting*)
		Standard : McMS6ARCPrgToolOffStdType; (*Type mcMS6ARCPTO_STD settings*)
	END_STRUCT;
	McCfgMS6AxRobCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_ROB_C*)
		SceneViewerObject : McMSSVOType; (*Defines if and which Scene Viewer Object should be used*)
		Description : McMS6ARCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ARCCoorNameType; (*Coordinates names*)
		SingularityHandling : McMS6ARCSingHndlgType; (*Behaviour near and inside mechanical singularities*)
		WireFrameModel : McMS6ARCWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		InternalDynamicModel : McMSIDMType;
		Couplings : McMS6ARCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
		MonitoringPoints : McMS6ARCMonPtType; (*Enable robot monitoring points*)
		ProgrammedToolOffset : McMS6ARCPrgToolOffType; (*Programmed tool offset*)
	END_STRUCT;
END_TYPE