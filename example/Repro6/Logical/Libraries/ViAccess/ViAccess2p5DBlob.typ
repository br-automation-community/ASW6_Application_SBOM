(*Model of VF 2.5D Blob*)

TYPE
	viVf2p5DBBlobModelType : 	STRUCT  (*VF 2.5D Blob model*)
		Type : viModelTypeEnum := viVF_2p5DB_BLOB_MODEL;
		Enable : BOOL;
		MorphologyType : viMP2p5DBMorphologyTypeEnum;
		CircleMaskRadius : REAL;
		ThresholdMin : REAL;
		ThresholdMax : REAL;
		AreaMin : REAL;
		AreaMax : REAL;
		RectangularityMin : REAL;
		RectangularityMax : REAL;
		CircularityMin : REAL;
		CircularityMax : REAL;
		ThresholdOffset : REAL;
		AverageMaxPercentage : REAL;
		AnisometryMin : REAL;
		AnisometryMax : REAL;
	END_STRUCT;
END_TYPE

(*Enum type*)

TYPE
	viMP2p5DBMorphologyTypeEnum :
		( (*VF 2.5D Blob model parameter MorphologyType*)
		vi2p5DBMT_NONE,
		vi2p5DBMT_CLOSING,
		vi2p5DBMT_OPENING,
		vi2p5DBMT_CLOSING_NEARBY,
		vi2p5DBMT_OPENING_TOUCHING
		);
END_TYPE
