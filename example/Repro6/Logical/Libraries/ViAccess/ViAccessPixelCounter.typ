(*Models of VF Pixel Counter*)

TYPE
	viVfPCPixelCounterModelType : 	STRUCT  (*VF pixel counter model*)
		Type : viModelTypeEnum := viVF_PC_PIXEL_COUNTER_MODEL;
		Enable : BOOL;
		ThresholdMin : USINT;
		ThresholdMax : USINT;
		InvertSelection : viMPPCInvertSelectionEnum;
	END_STRUCT;
END_TYPE

(*Enum types*)

TYPE
	viMPPCInvertSelectionEnum :
		( (*VF PixelCounter model parameter InvertSelection*)
		viPC_INVERT_FALSE := 0,
		viPC_INVERT_TRUE := 1
		);
END_TYPE