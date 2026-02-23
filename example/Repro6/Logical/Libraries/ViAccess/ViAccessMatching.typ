(*Params of VF Matching*)

TYPE
	viVfMatchingParamsType : 	STRUCT  (*VF Matching parameters*)
		Type : viVisionFunctionTypeEnum := viVF_MATCHING;
		ShapeSearchBorderShapeModels : viVfPMSSBorderShapeModelsEnum;
		ShapeSearchGreediness : REAL;
	END_STRUCT;
END_TYPE

(*Models of VF Matching*)

TYPE
	viVfMDefShapeModelType : 	STRUCT  (*VF Matching deformable shape model*)
		Type : viModelTypeEnum := viVF_M_DEFORMABLE_SHAPE_MODEL;
		Enable : BOOL;
		SearchMaxDeformation : USINT;
		SearchNumLevels : USINT;
		SearchNumLevelsMin : USINT;
		SearchAngleStart : REAL;
		SearchAngleExtent : REAL;
		SearchSubPixelMode : viMPMSubPixelModeEnum;
		SearchMinContrast : INT;
		SearchScaleMin : REAL;
		SearchScaleMax : REAL;
		ReferencePositionY : REAL;
		ReferencePositionX : REAL;
	END_STRUCT;
	viVfMShapeModelType : 	STRUCT  (*VF Matching shape model*)
		Type : viModelTypeEnum := viVF_M_SHAPE_MODEL;
		Enable : BOOL;
		SearchNumLevels : USINT;
		SearchNumLevelsMin : USINT;
		SearchAngleStart : REAL;
		SearchAngleExtent : REAL;
		SearchSubPixelMode : viMPMSubPixelModeEnum;
		SearchMinContrast : INT;
		SearchScaleMin : REAL;
		SearchScaleMax : REAL;
		ReferencePositionY : REAL;
		ReferencePositionX : REAL;
	END_STRUCT;
	viVfMNccModelType : 	STRUCT  (*VF Matching  NCC model*)
		Type : viModelTypeEnum := viVF_M_NCC_MODEL;
		Enable : BOOL;
		SearchNumLevels : USINT;
		SearchNumLevelsMin : USINT;
		SearchAngleStart : REAL;
		SearchAngleExtent : REAL;
		SearchSubPixels : viMPMSearchSubPixelsEnum;
		ReferencePositionY : REAL;
		ReferencePositionX : REAL;
	END_STRUCT;
END_TYPE

(*Enum types*)

TYPE
	viVfPMSSBorderShapeModelsEnum :
		( (*VF Matching Parameter SapeSearchBorderShapeModels*)
		viMSSBSM_FALSE,
		viMSSBSM_TRUE,
		viMSSBSM_SYSTEM
		);
	viMPMSubPixelModeEnum :
		( (*VF Matching model parameter SearchSubPixelMode*)
		viMSPM_NONE,
		viMSPM_INTERPOLATION,
		viMSPM_LEAST_SQUARES,
		viMSPM_LEAST_SQUARES_HIGH,
		viMSPM_LEAST_SQUARES_VERY_HIGH
		);
	viMPMSearchSubPixelsEnum :
		( (*VF Matching model parameter SearchSubPixels*)
		viMSSP_FALSE := 0,
		viMSSP_TRUE := 1
		);
END_TYPE
