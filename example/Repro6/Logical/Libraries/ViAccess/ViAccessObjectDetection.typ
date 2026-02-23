(*Params of VF Object Detection*)

TYPE
	viVfObjectDetectionParamsType : 	STRUCT  (*VF ObjectDetection parameters*)
		Type : viVisionFunctionTypeEnum := viVF_OBJECT_DETECTION;
		SelectedModel : USINT;
	END_STRUCT;
END_TYPE