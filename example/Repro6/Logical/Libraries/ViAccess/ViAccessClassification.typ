(*Params of VF Classification*)

TYPE
	viVfClassificationParamsType : 	STRUCT  (*VF Classification parameters*)
		Type : viVisionFunctionTypeEnum := viVF_CLASSIFICATION;
		SearchAngle : REAL;
		SelectedModel : USINT;
		AspectRatio : REAL;
	END_STRUCT;
END_TYPE
