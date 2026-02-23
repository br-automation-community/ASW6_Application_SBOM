(*Model of VF SubPixel Blob*)

TYPE
	viVfSBBlobModelType : 	STRUCT  (*VF Blob model*)
		Type : viModelTypeEnum := viVF_SB_BLOB_MODEL;
		Enable : BOOL;
		MorphologyType : viMPSBMorphologyTypeEnum;
		CircleMaskRadius : REAL;
		ThresholdMin : REAL;
		ThresholdMax : REAL;
		AreaMin : REAL;
		AreaMax : REAL;
		RectangularityMin : REAL;
		RectangularityMax : REAL;
		CircularityMin : REAL;
		CircularityMax : REAL;
		AnisometryMin : REAL;
		AnisometryMax : REAL;
	END_STRUCT;
END_TYPE

(*Enum types*)

TYPE
	viMPSBMorphologyTypeEnum :
		( (*VF Subpixel Blob model parameter MorphologyType*)
		viSBMT_NONE,
		viSBMT_CLOSING,
		viSBMT_OPENING,
		viSBMT_CLOSING_NEARBY,
		viSBMT_OPENING_TOUCHING
		);
END_TYPE
