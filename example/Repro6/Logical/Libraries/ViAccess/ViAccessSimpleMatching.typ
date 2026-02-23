(*Params of VF Simple Matching*)

TYPE
	viVfSimpleMatchingParamsType : 	STRUCT  (*VF Simple Matching parameters*)
		Type : viVisionFunctionTypeEnum := viVF_SIMPLE_MATCHING;
		Mode : viVfPSMModeEnum;
		ShapeMinContourSize : UINT;
		AngleMin : REAL;
		AngleMax : REAL;
		ReferencePositionX : REAL;
		ReferencePositionY : REAL;
		ReferenceOrientation : REAL;
		ShapeMinContrast : USINT;
	END_STRUCT;
END_TYPE



(*Enum types*)

TYPE
	viVfPSMModeEnum :
		( (*VF Simple Matching Parameter Mode*)
		viSM_MODE_STANDARD,
		viSM_MODE_FAST
		);
	
END_TYPE