TYPE
	McDAMEType : STRUCT (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
		Gearbox : McCfgGearBoxType; (*Specifies a gearbox by defining the ratio between a gearbox input and output*)
		RotaryToLinearTransformation : McCfgRotToLinTrfType; (*Specifies a transformation factor between the output of the gear and the actual load movement*)
	END_STRUCT;
	McDAESType : STRUCT (*Defines the encoder parameters*)
		IncrementsPerRevolution : DINT; (*Increments per revolution of used encoder*)
	END_STRUCT;
	McDAPAVREnum :
		( (*Position actual value range selector setting*)
		mcDAPAVR_DEF := 0, (*Default - Default range 2^32*)
		mcDAPAVR_SET_MAN := 1 (*Set manually - Limits of 0x6064_PositionActualValue*)
		);
	McDAPAVRSetManType : STRUCT (*Type mcDAPAVR_SET_MAN settings*)
		LowerLimit : DINT; (*Lower limit of 0x6064_PositionActualValue*)
		UpperLimit : DINT; (*Upper limit of 0x6064_PositionActualValue*)
	END_STRUCT;
	McDAPAVRType : STRUCT (*Defines the range of DS402 object 0x6064_Position_actual_value*)
		Type : McDAPAVREnum; (*Position actual value range selector setting*)
		SetManually : McDAPAVRSetManType; (*Type mcDAPAVR_SET_MAN settings*)
	END_STRUCT;
	McDACSVMCycPosModEnum :
		( (*Cyclic position mode on drive when using MC_BR_MoveCyclicPosition*)
		mcDACSVMCPM_INTRPL_POS := 0, (*Interpolated position - 0x6060_ModeOfOperation: 7*)
		mcDACSVMCPM_CYC_SYN_POS := 1 (*Cyclic synchronous position - 0x6060_ModeOfOperation: 8*)
		);
	McDACSVMCycVelModEnum :
		( (*Cyclic velocity mode on drive when using MC_BR_VelocityControl*)
		mcDACSVMCVM_PROF_VEL := 0, (*Profile velocity - 0x6060_ModeOfOperation: 3*)
		mcDACSVMCVM_CYC_SYN_VEL := 1 (*Cyclic synchronous velocity - 0x6060_ModeOfOperation: 9*)
		);
	McDACSVMType : STRUCT (*Modes which are used by the drive to process cyclic set values*)
		CyclicPositionMode : McDACSVMCycPosModEnum; (*Cyclic position mode on drive when using MC_BR_MoveCyclicPosition*)
		CyclicVelocityMode : McDACSVMCycVelModEnum; (*Cyclic velocity mode on drive when using MC_BR_VelocityControl*)
	END_STRUCT;
	McDAAFType : STRUCT (*Features for an axis*)
		FeatureReference : McCfgUnboundedArrayType; (*Name of the axis feature reference (Connect array of type McCfgReferenceType)*)
	END_STRUCT;
	McCfgDS402AxType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
		MechanicalElements : McDAMEType; (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
		EncoderSettings : McDAESType; (*Defines the encoder parameters*)
		PositionActualValueRange : McDAPAVRType; (*Defines the range of DS402 object 0x6064_Position_actual_value*)
		CyclicSetValueModes : McDACSVMType; (*Modes which are used by the drive to process cyclic set values*)
		AxisFeatures : McDAAFType; (*Features for an axis*)
	END_STRUCT;
	McCfgDS402InvAxType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_INV_AX*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
		MechanicalElements : McDAMEType; (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
	END_STRUCT;
	McCfgDS402AxRefType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_REF*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
	END_STRUCT;
	McCfgDS402AxMechElmType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_MECH_ELM*)
		MechanicalElements : McDAMEType; (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
	END_STRUCT;
	McCfgDS402AxEncSetType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_ENC_SET*)
		EncoderSettings : McDAESType; (*Defines the encoder parameters*)
	END_STRUCT;
	McCfgDS402AxPosActValRngType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_POS_ACT_VAL_RNG*)
		PositionActualValueRange : McDAPAVRType; (*Defines the range of DS402 object 0x6064_Position_actual_value*)
	END_STRUCT;
	McCfgDS402AxCycSetValModType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_CYC_SET_VAL_MOD*)
		CyclicSetValueModes : McDACSVMType; (*Modes which are used by the drive to process cyclic set values*)
	END_STRUCT;
	McCfgDS402AxFeatType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_DS402_AX_FEAT*)
		AxisFeatures : McDAAFType; (*Features for an axis*)
	END_STRUCT;
	McCfgAcpInvAxType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_ACP_INV_AX*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
		MechanicalElements : McDAMEType; (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
	END_STRUCT;
	McCfgAcpInvAxRefType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_ACP_INV_AX_REF*)
		AxisReference : McCfgReferenceType; (*Name of the referenced axis component*)
	END_STRUCT;
	McCfgAcpInvAxMechElmType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_ACP_INV_AX_MECH_ELM*)
		MechanicalElements : McDAMEType; (*Parameter of hardware elements situated between motor encoder and load which influence the scaling*)
	END_STRUCT;
END_TYPE