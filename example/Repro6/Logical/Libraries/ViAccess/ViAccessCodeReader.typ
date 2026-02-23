(*Params of VF Code reader*)

TYPE
	viVfCodeReaderParamsType : 	STRUCT  (*VF Code Reader Parameters*)
		Type : viVisionFunctionTypeEnum := viVF_CODE_READER;
		C2dContrastMin : {REDUND_UNREPLICABLE} USINT;
		C2dPolarity : {REDUND_UNREPLICABLE} viVfPCRC2dPolarityEnum;
		C2dSmallModulesRobustness : viVfPCRC2dSmallModulesRobusEnum;
		C2dStrictModel : viVfPCRC2dStrictModelEnum;
		C2dModuleSizeMin : USINT;
		C2dModuleSizeMax : USINT;
		C2dModuleGapMin : viVfPCRC2dModuleGapEnum;
		C2dModuleGapMax : viVfPCRC2dModuleGapEnum;
		C2dStrictQuietZone : viVfPCRC2dStrictQuietZoneEnum;
		EccSymbolSearch : viVfPCREccSymbolSearchEnum;
		EccSymbolShape : viVfPCREccSymbolShapeEnum;
		EccFinderPatternTolerance : viVfPCREccToleranceEnum;
		EccSymbolColsMin : USINT;
		EccSymbolColsMax : USINT;
		EccSymbolRowsMin : USINT;
		EccSymbolRowsMax : USINT;
		EccSlantMax : USINT;
		EccContrastTolerance : viVfPCREccToleranceEnum;
		EccModuleGrid : viVfPCREccModuleGridEnum;
		EccCandidateSelection : viVfPCREccCandidateSelEnum;
		PdfModuleAspectMin : REAL;
		PdfModuleAspectMax : REAL;
		PdfSymbolColsMin : USINT;
		PdfSymbolColsMax : USINT;
		PdfSymbolRowsMin : USINT;
		PdfSymbolRowsMax : USINT;
		AztecFormat : viVfPCRAztecFormatEnum;
		AztecAdditionalLevels : USINT;
		AztecFinderPatternTolerance : viVfPCRAztecFinderPatTolEnum;
		AztecSymbolSizeMin : USINT;
		AztecSymbolSizeMax : USINT;
		QrPositionPatternMin : USINT;
		QrVersionMin : USINT;
		QrVersionMax : USINT;
		C1dElementSizeMin : REAL;
		C1dElementSizeMax : USINT;
		C1dElementSizeVariable : BOOL;
		C1dBarcodeHeightMin : SINT;
		C1dBarcodeWidthMin : SINT;
		C1dNumScanlines : USINT;
		C1dMinIdenticalScanlines : USINT;
		C1dMajorityVoting : BOOL;
		C1dOrientation : REAL;
		C1dOrientationTol : USINT;
		C1dQuietZone : viVfPCRC1dQuietZoneEnum;
		C1dStartStopTolerance : viVfPCRC1dStartStopTolEnum;
		C1dMinCodeLength : USINT;
		C1dMergeScanlines : BOOL;
		C1dMeasThresh : REAL;
		C1dMeasThreshAbs : REAL;
		C1dCheckChar : viVfPCRC1dCheckCharEnum;
		C1dCompositeCode : viVfPCRC1dCompositeCodeEnum;
		C1dUpceEncodation : viVfPCRC1dUpceEncodationEnum;
		C1dContrastMin : USINT;
	END_STRUCT;
END_TYPE

(*Enum types*)

TYPE
	viVfPCREccToleranceEnum :
		( (*VF Code Reader Parameter EccFinderPatternTolerance or EccContrastTolerance*)
		viCR_ECC_TOLERANCE_LOW := 0,
		viCR_ECC_TOLERANCE_HIGH := 1,
		viCR_ECC_TOLERANCE_ANY
		);
	viVfPCREccSymbolShapeEnum :
		( (*VF Code Reader Parameter EccSymbolShape*)
		viCR_ECC_SYMBOL_SHAPE_RECTANGLE := 0,
		viCR_ECC_SYMBOL_SHAPE_SQUARE := 1,
		viCR_ECC_SYMBOL_SHAPE_ANY := 2
		);
	viVfPCREccSymbolSearchEnum :
		( (*VF Code Reader Parameter EccSymbolSearch*)
		viCR_ECC_SYMBOL_SEARCH_DEFAULT := 0,
		viCR_ECC_SYMBOL_SEARCH_RUDIMENT := 1
		);
	viVfPCREccModuleGridEnum :
		( (*VF Code Reader Parameter EccModuleGrid*)
		viCR_ECC_MODULE_GRID_FIXED := 0,
		viCR_ECC_MODULE_GRID_VARIABLE := 1,
		viCR_ECC_MODULE_GRID_ANY
		);
	viVfPCREccCandidateSelEnum :
		( (*VF Code Reader Parameter EccCandidateSelection*)
		viCR_ECC_CAND_SEL_DEFAULT := 0,
		viCR_ECC_CAND_SEL_EXTENSIVE := 1
		);
	viVfPCRC2dStrictQuietZoneEnum :
		( (*VF Code Reader Parameter C2dStrictQuietZone*)
		viCR_C2D_STRICT_QUIET_ZONE_NO := 0,
		viCR_C2D_STRICT_QUIET_ZONE_YES := 1
		);
	viVfPCRC2dStrictModelEnum :
		( (*VF Code Reader Parameter C2dStrictModel*)
		viCR_C2DSTRICT_MODEL_NO := 0,
		viCR_C2DSTRICT_MODEL_YES := 1
		);
	viVfPCRC2dSmallModulesRobusEnum :
		( (*VF Code Reader Parameter C2dSmallModulesRobustness*)
		viCR_C2DS_MODULES_ROBUST_LOW := 0,
		viCR_C2DS_MODULES_ROBUST_HIGH := 1
		);
	viVfPCRC2dPolarityEnum :
		( (*VF Code Reader Parameter C2dPolarity*)
		viCR_C2DPOLARITY_DARK_ON_LIGHT := 0,
		viCR_C2DPOLARITY_LIGHT_ON_DARK := 1
		);
	viVfPCRC2dModuleGapEnum :
		( (*VF Code Reader Parameter C2dModuleGapMin or C2dModuleGapMax*)
		viCR_C2D_MODULE_GAP_NO := 0,
		viCR_C2D_MODULE_GAP_SMALL := 1,
		viCR_C2D_MODULE_GAP_BIG
		);
	viVfPCRC1dUpceEncodationEnum :
		( (*VF Code Reader Parameter C1dUpceEncodation*)
		viCR_C1D_UPCE_ENC_UCC12 := 0,
		viCR_C1D_UPCE_ENC_ZERO_SUPPRESS := 1
		);
	viVfPCRC1dStartStopTolEnum :
		( (*VF Code Reader Parameter C1dStartStopTolerance*)
		viCR_C1D_START_STOP_TOL_HIGH := 0,
		viCR_C1D_START_STOP_TOL_LOW := 1
		);
	viVfPCRC1dQuietZoneEnum :
		( (*VF Code Reader Parameter C1dQuietZone*)
		viCR_C1D_QUIET_ZONE_TOLERANT := -1,
		viCR_C1D_QUIET_ZONE_OFF := 0,
		viCR_C1D_QUIET_ZONE_1,
		viCR_C1D_QUIET_ZONE_2,
		viCR_C1D_QUIET_ZONE_3,
		viCR_C1D_QUIET_ZONE_4,
		viCR_C1D_QUIET_ZONE_5
		);
	viVfPCRC1dCompositeCodeEnum :
		( (*VF Code Reader Parameter C1dCompositeCode*)
		viCR_C1D_COMPOSITE_CODE_NONE := 0,
		viCR_C1D_COMPOSITE_CODE_CC_A_B := 1
		);
	viVfPCRC1dCheckCharEnum :
		( (*VF Code Reader Parameter C1dCheckChar*)
		viCR_C1D_CHECK_CHAR_ABSENT := 0,
		viCR_C1D_CHECK_CHAR_PRESENT := 1,
		viCR_C1D_CHECK_CHAR_PRESERVED
		);
	viVfPCRAztecFormatEnum :
		( (*VF Code Reader Parameter AztecFormat*)
		viCR_AZTEC_FORMAT_COMPACT := 1, (*compact*)
		viCR_AZTEC_FORMAT_FULL_RANGE, (*full_range*)
		viCR_AZTEC_FORMAT_COMPACT_FULL, (*compact full_range*)
		viCR_AZTEC_FORMAT_RUNE, (*rune*)
		viCR_AZTEC_FORMAT_COMPACT_RUNE, (*compact rune*)
		viCR_AZTEC_FORMAT_FULL_RUNE, (*full_range rune*)
		viCR_AZTEC_FORMAT_COM_FULL_RUNE (*compact full_range rune*)
		);
	viVfPCRAztecFinderPatTolEnum :
		( (*VF Code Reader Parameter AztecFinderPatternTolerance*)
		viCR_AZTEC_TOLERANCE_LOW := 0,
		viCR_AZTEC_TOLERANCE_HIGH := 1
		);
END_TYPE
