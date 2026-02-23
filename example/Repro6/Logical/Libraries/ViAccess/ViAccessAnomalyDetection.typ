(*Params of VF Anomaly Detection*)

TYPE
	viVfAnomalyDetectionParamsType : 	STRUCT  (*VF Anomaly Detection parameters*)
		Type : viVisionFunctionTypeEnum := viVF_ANOMALY_DETECTION;
		SearchAngle : REAL;
		SelectedModel : USINT;
		AspectRatio : REAL;
		ScoreImageMax : REAL;
	END_STRUCT;
END_TYPE
