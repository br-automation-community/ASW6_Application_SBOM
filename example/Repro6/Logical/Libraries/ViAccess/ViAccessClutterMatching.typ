(*Params of VF Clutter Matching*)
TYPE
	viVfClutterMatchingParamsType : 	STRUCT
		Type : viVisionFunctionTypeEnum := viVF_CLUTTER_MATCHING;
		ShapeSearchBorderShapeModels : viVfPCMSSBorderShapeModelsEnum;
		ShapeSearchGreediness : REAL;
	END_STRUCT;
END_TYPE

(*Models of VF Clutter Matching*)
TYPE
	viVfCMBaseModelType : STRUCT (*VF Clutter Matching clutter base model*)
		Type : viModelTypeEnum := viVF_CM_BASE_MODEL;
		SearchNumLevels : USINT;
		SearchAngleStart : REAL;
		SearchAngleExtent : REAL;
		SearchSubPixelMode : viMPCMSubPixelModeEnum;
		SearchMinContrast : INT;
		SearchScaleMin : REAL;
		SearchScaleMax : REAL;
		ReferencePositionY : REAL;
		ReferencePositionX : REAL;
		ClutterBorderMode : viMPCMClutterBorderModeEnum;
		GrayMin : USINT;
		GrayMax : USINT;
		GrayInvertSelection : viMPCMGrayInvertSelectionEnum;
		GrayClutterScoreMax : REAL;
		EdgeClutterContrast : USINT;
		EdgeClutterScoreMax : REAL;
	END_STRUCT;

	viVfCMConstraintModelType : 	STRUCT (*VF Clutter Matching clutter constraint model*)
		Type : viModelTypeEnum := viVF_CM_CONSTRAINT_MODEL;
		GrayMin : USINT;
		GrayMax : USINT;
		GrayInvertSelection : viMPCMGrayInvertSelectionEnum;
		GrayClutterScoreMax : REAL;
	END_STRUCT;
END_TYPE

(*Enum types*)
TYPE
	viVfPCMSSBorderShapeModelsEnum :
		( (*VF Clutter Matching parameter ShapeSearchBorderShapeModels*)
		viCMSSBSM_FALSE,
		viCMSSBSM_TRUE,
		viCMSSBSM_SYSTEM
		);

	viMPCMSubPixelModeEnum :
		( (*VF Clutter Matching model parameter SearchSubPixelMode*)
		viCMSPM_NONE,
		viCMSPM_INTERPOLATION,
		viCMSPM_LEAST_SQUARES,
		viCMSPM_LEAST_SQUARES_HIGH,
		viCMSPM_LEAST_SQUARES_VERY_HIGH
		);
	viMPCMClutterBorderModeEnum :
		( (*VF Clutter Matching model pparameter ClutterBorderMode*)
		viCMCBM_AVERAGE,
		viCMCBM_EMPTY
		);
	viMPCMGrayInvertSelectionEnum :
		( (*VF Clutter Matching model parameter GrayInvertSelection*)
		viCMGIS_FALSE,
		viCMGIS_TRUE
		);
END_TYPE
