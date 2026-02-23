(*Model of VF Blob*)

TYPE
	viVfBBlobModelType : 	STRUCT  (*VF Blob model*)
		Type : viModelTypeEnum := viVF_B_BLOB_MODEL;
		Enable : BOOL;
		MorphologyType : viMPBMorphologyTypeEnum;
		CircleMaskRadius : REAL;
		ThresholdMin : REAL;
		ThresholdMax : REAL;
		AreaMin : REAL;
		AreaMax : REAL;
		RectangularityMin : REAL;
		RectangularityMax : REAL;
		CircularityMin : REAL;
		CircularityMax : REAL;
		AverageMaxPercentage : REAL;
		AnisometryMin : REAL;
		AnisometryMax : REAL;
	END_STRUCT;
END_TYPE

(*Enum type*)

TYPE
	viMPBMorphologyTypeEnum :
		( (*VF Blob model parameter MorphologyType*)
		viBMT_NONE,
		viBMT_CLOSING,
		viBMT_OPENING,
		viBMT_CLOSING_NEARBY,
		viBMT_OPENING_TOUCHING
		);
END_TYPE
