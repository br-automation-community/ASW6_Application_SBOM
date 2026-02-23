/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _VIACCESS_
#define _VIACCESS_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum viVisionFunctionTypeEnum
{	viVF_NO_VF = 0,
	viVF_IMAGE_ACQUISITION = 1,
	viVF_CODE_READER = 2,
	viVF_MATCHING = 3,
	viVF_BLOB = 4,
	viVF_SUB_PIXEL_BLOB = 5,
	viVF_MEASUREMENT = 6,
	viVF_PIXEL_COUNTER = 7,
	viVF_OCR = 8,
	viVF_DOCR = 9,
	viVF_CLUTTER_MATCHING = 10,
	viVF_SIMPLE_MATCHING = 11,
	viVF_2p5D_BLOB = 12,
	viVF_ANOMALY_DETECTION = 13,
	viVF_CLASSIFICATION = 14,
	viVF_OBJECT_DETECTION = 15
} viVisionFunctionTypeEnum;

typedef enum viModelTypeEnum
{	viVF_UNSUPPORTED_MODEL_TYPE = -1,
	viVF_NO_MODEL = 0,
	viVF_M_SHAPE_MODEL = 196609,
	viVF_M_DEFORMABLE_SHAPE_MODEL = 196610,
	viVF_M_NCC_MODEL = 196611,
	viVF_B_BLOB_MODEL = 262145,
	viVF_SB_BLOB_MODEL = 327681,
	viVF_MES_EDGE_MODEL_MODE_1 = 393217,
	viVF_MES_CIRCLE_MODEL = 393218,
	viVF_MES_ELLIPSE_MODEL = 393219,
	viVF_MES_RECTANGLE_MODEL = 393220,
	viVF_PC_PIXEL_COUNTER_MODEL = 458753,
	viVF_CM_BASE_MODEL = 655361,
	viVF_CM_CONSTRAINT_MODEL = 655362,
	viVF_2p5DB_BLOB_MODEL = 786433
} viModelTypeEnum;

typedef enum viAccessRoiFormatTypeEnum
{	viROI_NO_TYPE = 0,
	viROI_RECTANGLE = 1,
	viROI_ELLIPSE = 2,
	viROI_REGION = 3,
	viROI_REGION_RLE = 4
} viAccessRoiFormatTypeEnum;

typedef enum ViAccessImageTypeEnum
{	viACCESS_IMAGE_TYPE_BMP = 0,
	viACCESS_IMAGE_TYPE_JPG = 1
} ViAccessImageTypeEnum;

typedef enum viMP2p5DBMorphologyTypeEnum
{	vi2p5DBMT_NONE,
	vi2p5DBMT_CLOSING,
	vi2p5DBMT_OPENING,
	vi2p5DBMT_CLOSING_NEARBY,
	vi2p5DBMT_OPENING_TOUCHING
} viMP2p5DBMorphologyTypeEnum;

typedef enum viMPBMorphologyTypeEnum
{	viBMT_NONE,
	viBMT_CLOSING,
	viBMT_OPENING,
	viBMT_CLOSING_NEARBY,
	viBMT_OPENING_TOUCHING
} viMPBMorphologyTypeEnum;

typedef enum viVfPCMSSBorderShapeModelsEnum
{	viCMSSBSM_FALSE,
	viCMSSBSM_TRUE,
	viCMSSBSM_SYSTEM
} viVfPCMSSBorderShapeModelsEnum;

typedef enum viMPCMSubPixelModeEnum
{	viCMSPM_NONE,
	viCMSPM_INTERPOLATION,
	viCMSPM_LEAST_SQUARES,
	viCMSPM_LEAST_SQUARES_HIGH,
	viCMSPM_LEAST_SQUARES_VERY_HIGH
} viMPCMSubPixelModeEnum;

typedef enum viMPCMClutterBorderModeEnum
{	viCMCBM_AVERAGE,
	viCMCBM_EMPTY
} viMPCMClutterBorderModeEnum;

typedef enum viMPCMGrayInvertSelectionEnum
{	viCMGIS_FALSE,
	viCMGIS_TRUE
} viMPCMGrayInvertSelectionEnum;

typedef enum viVfPCREccToleranceEnum
{	viCR_ECC_TOLERANCE_LOW = 0,
	viCR_ECC_TOLERANCE_HIGH = 1,
	viCR_ECC_TOLERANCE_ANY
} viVfPCREccToleranceEnum;

typedef enum viVfPCREccSymbolShapeEnum
{	viCR_ECC_SYMBOL_SHAPE_RECTANGLE = 0,
	viCR_ECC_SYMBOL_SHAPE_SQUARE = 1,
	viCR_ECC_SYMBOL_SHAPE_ANY = 2
} viVfPCREccSymbolShapeEnum;

typedef enum viVfPCREccSymbolSearchEnum
{	viCR_ECC_SYMBOL_SEARCH_DEFAULT = 0,
	viCR_ECC_SYMBOL_SEARCH_RUDIMENT = 1
} viVfPCREccSymbolSearchEnum;

typedef enum viVfPCREccModuleGridEnum
{	viCR_ECC_MODULE_GRID_FIXED = 0,
	viCR_ECC_MODULE_GRID_VARIABLE = 1,
	viCR_ECC_MODULE_GRID_ANY
} viVfPCREccModuleGridEnum;

typedef enum viVfPCREccCandidateSelEnum
{	viCR_ECC_CAND_SEL_DEFAULT = 0,
	viCR_ECC_CAND_SEL_EXTENSIVE = 1
} viVfPCREccCandidateSelEnum;

typedef enum viVfPCRC2dStrictQuietZoneEnum
{	viCR_C2D_STRICT_QUIET_ZONE_NO = 0,
	viCR_C2D_STRICT_QUIET_ZONE_YES = 1
} viVfPCRC2dStrictQuietZoneEnum;

typedef enum viVfPCRC2dStrictModelEnum
{	viCR_C2DSTRICT_MODEL_NO = 0,
	viCR_C2DSTRICT_MODEL_YES = 1
} viVfPCRC2dStrictModelEnum;

typedef enum viVfPCRC2dSmallModulesRobusEnum
{	viCR_C2DS_MODULES_ROBUST_LOW = 0,
	viCR_C2DS_MODULES_ROBUST_HIGH = 1
} viVfPCRC2dSmallModulesRobusEnum;

typedef enum viVfPCRC2dPolarityEnum
{	viCR_C2DPOLARITY_DARK_ON_LIGHT = 0,
	viCR_C2DPOLARITY_LIGHT_ON_DARK = 1
} viVfPCRC2dPolarityEnum;

typedef enum viVfPCRC2dModuleGapEnum
{	viCR_C2D_MODULE_GAP_NO = 0,
	viCR_C2D_MODULE_GAP_SMALL = 1,
	viCR_C2D_MODULE_GAP_BIG
} viVfPCRC2dModuleGapEnum;

typedef enum viVfPCRC1dUpceEncodationEnum
{	viCR_C1D_UPCE_ENC_UCC12 = 0,
	viCR_C1D_UPCE_ENC_ZERO_SUPPRESS = 1
} viVfPCRC1dUpceEncodationEnum;

typedef enum viVfPCRC1dStartStopTolEnum
{	viCR_C1D_START_STOP_TOL_HIGH = 0,
	viCR_C1D_START_STOP_TOL_LOW = 1
} viVfPCRC1dStartStopTolEnum;

typedef enum viVfPCRC1dQuietZoneEnum
{	viCR_C1D_QUIET_ZONE_TOLERANT = -1,
	viCR_C1D_QUIET_ZONE_OFF = 0,
	viCR_C1D_QUIET_ZONE_1,
	viCR_C1D_QUIET_ZONE_2,
	viCR_C1D_QUIET_ZONE_3,
	viCR_C1D_QUIET_ZONE_4,
	viCR_C1D_QUIET_ZONE_5
} viVfPCRC1dQuietZoneEnum;

typedef enum viVfPCRC1dCompositeCodeEnum
{	viCR_C1D_COMPOSITE_CODE_NONE = 0,
	viCR_C1D_COMPOSITE_CODE_CC_A_B = 1
} viVfPCRC1dCompositeCodeEnum;

typedef enum viVfPCRC1dCheckCharEnum
{	viCR_C1D_CHECK_CHAR_ABSENT = 0,
	viCR_C1D_CHECK_CHAR_PRESENT = 1,
	viCR_C1D_CHECK_CHAR_PRESERVED
} viVfPCRC1dCheckCharEnum;

typedef enum viVfPCRAztecFormatEnum
{	viCR_AZTEC_FORMAT_COMPACT = 1,
	viCR_AZTEC_FORMAT_FULL_RANGE,
	viCR_AZTEC_FORMAT_COMPACT_FULL,
	viCR_AZTEC_FORMAT_RUNE,
	viCR_AZTEC_FORMAT_COMPACT_RUNE,
	viCR_AZTEC_FORMAT_FULL_RUNE,
	viCR_AZTEC_FORMAT_COM_FULL_RUNE
} viVfPCRAztecFormatEnum;

typedef enum viVfPCRAztecFinderPatTolEnum
{	viCR_AZTEC_TOLERANCE_LOW = 0,
	viCR_AZTEC_TOLERANCE_HIGH = 1
} viVfPCRAztecFinderPatTolEnum;

typedef enum viVfPIAFocusScaleEnum
{	viIA_FOCUSSCALE_RAW,
	viIA_FOCUSSCALE_MILIMETERS,
	viIA_FOCUSSCALE_MICROMETERS
} viVfPIAFocusScaleEnum;

typedef enum viVfPIAPixelConfigurationEnum
{	viIA_PIXELCONFIG_STANDARD,
	viIA_PIXELCONFIG_BINNING = 10,
	viIA_PIXELCONFIG_SUBSAMPLING = 20
} viVfPIAPixelConfigurationEnum;

typedef enum viVfPIATriggerSourceEnum
{	viIA_TRIGGERSOURCE_SOFTWARE,
	viIA_TRIGGERSOURCE_HARDWARE,
	viIA_TRIGGERSOURCE_MAPPAXIS
} viVfPIATriggerSourceEnum;

typedef enum viVfPIATriggerDelayEnum
{	viIA_TRIGGERDELAY_TIMEDELAY,
	viIA_TRIGGERDELAY_NETTIME
} viVfPIATriggerDelayEnum;

typedef enum viVfPIATriggerEdgeEnum
{	viIA_TRIGGEREDGE_RISING,
	viIA_TRIGGEREDGE_FALLING
} viVfPIATriggerEdgeEnum;

typedef enum viVfPIATriggerForwardingEnum
{	viIA_TRIGGERFORWARDING_OFF,
	viIA_TRIGGERFORWARDING_DO01 = 2
} viVfPIATriggerForwardingEnum;

typedef enum viVfPIALinesensorEnum
{	viIA_LINESENSOR_OFF,
	viIA_LINESENSOR_STATIC,
	viIA_LINESENSOR_DYNAMIC
} viVfPIALinesensorEnum;

typedef enum viVfPIARoiHeightModeEnum
{	viIA_ROIHEIGHTMODE_SINGLE,
	viIA_ROIHEIGHTMODE_DOUBLE
} viVfPIARoiHeightModeEnum;

typedef enum viVfPIAPreprocessingEnum
{	viIA_PREPROC_NONE,
	viIA_PREPROC_SOBELFILTER = 6,
	viIA_PREPROC_USERFILTER_1 = 16,
	viIA_PREPROC_USERFILTER_1_2 = 18
} viVfPIAPreprocessingEnum;

typedef enum viVfPMSSBorderShapeModelsEnum
{	viMSSBSM_FALSE,
	viMSSBSM_TRUE,
	viMSSBSM_SYSTEM
} viVfPMSSBorderShapeModelsEnum;

typedef enum viMPMSubPixelModeEnum
{	viMSPM_NONE,
	viMSPM_INTERPOLATION,
	viMSPM_LEAST_SQUARES,
	viMSPM_LEAST_SQUARES_HIGH,
	viMSPM_LEAST_SQUARES_VERY_HIGH
} viMPMSubPixelModeEnum;

typedef enum viMPMSearchSubPixelsEnum
{	viMSSP_FALSE = 0,
	viMSSP_TRUE = 1
} viMPMSearchSubPixelsEnum;

typedef enum viVfMMOperationTypeEnum
{	viVF_MES_OP_NO_OPERATION = 0,
	viVF_MES_OP_ORTHOGONAL_DISTANCE = 1,
	viVF_MES_OP_ANGLE = 2,
	viVF_MES_OP_DISTANCE_COG = 3,
	viVF_MES_OP_DISTANCE_MIN = 4,
	viVF_MES_OP_DISTANCE_MAX = 5,
	viVF_MES_OP_INTERSECTION_X = 6,
	viVF_MES_OP_INTERSECTION_Y = 7,
	viVF_MES_OP_LENGTH = 8,
	viVF_MES_OP_ORIENTATION = 9,
	viVF_MES_OP_POSITION_X = 10,
	viVF_MES_OP_POSITION_Y = 11,
	viVF_MES_OP_HALF_AXIS_MIN = 12,
	viVF_MES_OP_HALF_AXIS_MAX = 13
} viVfMMOperationTypeEnum;

typedef enum viVfPOCRPolarityEnum
{	viOCR_POLARITY_DARK_ON_LIGHT = 0,
	viOCR_POLARITY_LIGHT_ON_DARK = 1,
	viOCR_POLARITY_BOTH = 2
} viVfPOCRPolarityEnum;

typedef enum viVfPOCRClassifierEnum
{	viOCR_CLS_UNI_NO_REJ = 0,
	viOCR_CLS_UNI_REJ,
	viOCR_CLS_UNI_0_9_NO_REJ,
	viOCR_CLS_UNI_0_9_REJ,
	viOCR_CLS_UNI_0_9_EXT_NO_REJ,
	viOCR_CLS_UNI_0_9_EXT_REJ,
	viOCR_CLS_UNI_0_9_A_Z_NO_REJ,
	viOCR_CLS_UNI_0_9_A_Z_REJ,
	viOCR_CLS_UNI_0_9_A_Z_EXT_NO_REJ,
	viOCR_CLS_UNI_0_9_A_Z_EXT_REJ,
	viOCR_CLS_UNI_A_Z_EXT_NO_REJ,
	viOCR_CLS_UNI_A_Z_EXT_REJ,
	viOCR_CLS_DOT_0_9_NO_REJ,
	viOCR_CLS_DOT_0_9_REJ,
	viOCR_CLS_DOT_0_9_EXT_NO_REJ,
	viOCR_CLS_DOT_0_9_EXT_REJ,
	viOCR_CLS_DOT_0_9_A_Z_NO_REJ,
	viOCR_CLS_DOT_0_9_A_Z_REJ,
	viOCR_CLS_DOT_0_9_A_Z_EXT_NO_REJ,
	viOCR_CLS_DOT_0_9_A_Z_EXT_REJ,
	viOCR_CLS_DOT_NO_REJ,
	viOCR_CLS_DOT_REJ,
	viOCR_CLS_IND_0_9_NO_REJ,
	viOCR_CLS_IND_0_9_REJ,
	viOCR_CLS_IND_0_9_EXT_NO_REJ,
	viOCR_CLS_IND_0_9_EXT_REJ,
	viOCR_CLS_IND_0_9_A_Z_NO_REJ,
	viOCR_CLS_IND_0_9_A_Z_REJ,
	viOCR_CLS_IND_0_9_A_Z_EXT_NO_REJ,
	viOCR_CLS_IND_REJ,
	viOCR_CLS_IND_NO_REJ,
	viOCR_CLS_DOC_REJ,
	viOCR_CLS_DOC_NO_REJ,
	viOCR_CLS_DOC_A_Z_REJ,
	viOCR_CLS_DOC_A_Z_NO_REJ,
	viOCR_CLS_DOC_0_9_REJ,
	viOCR_CLS_DOC_0_9_NO_REJ,
	viOCR_CLS_DOC_0_9_A_Z_REJ,
	viOCR_CLS_DOC_0_9_A_Z_NO_REJ,
	viOCR_CLS_OCRA_REJ,
	viOCR_CLS_OCRA_NO_REJ,
	viOCR_CLS_OCRA_A_Z_REJ,
	viOCR_CLS_OCRA_A_Z_NO_REJ,
	viOCR_CLS_OCRA_0_9_REJ,
	viOCR_CLS_OCRA_0_9_NO_REJ,
	viOCR_CLS_OCRA_0_9_A_Z_REJ,
	viOCR_CLS_OCRA_0_9_A_Z_NO_REJ,
	viOCR_CLS_OCRB_REJ,
	viOCR_CLS_OCRB_NO_REJ,
	viOCR_CLS_OCRB_A_Z_REJ,
	viOCR_CLS_OCRB_A_Z_NO_REJ,
	viOCR_CLS_OCRB_0_9_REJ,
	viOCR_CLS_OCRB_0_9_NO_REJ,
	viOCR_CLS_OCRB_0_9_A_Z_REJ,
	viOCR_CLS_OCRB_0_9_A_Z_NO_REJ,
	viOCR_CLS_OCRB_PASSPORT_REJ,
	viOCR_CLS_OCRB_PASSPORT_NO_REJ,
	viOCR_CLS_PHAR_REJ,
	viOCR_CLS_PHAR_NO_REJ,
	viOCR_CLS_PHAR_0_9_REJ,
	viOCR_CLS_PHAR_0_9_NO_REJ,
	viOCR_CLS_PHAR_0_9_EXT_REJ,
	viOCR_CLS_PHAR_0_9_EXT_NO_REJ,
	viOCR_CLS_PHAR_0_9_A_Z_REJ,
	viOCR_CLS_PHAR_0_9_A_Z_NO_REJ,
	viOCR_CLS_SEMI_REJ,
	viOCR_CLS_SEMI_NO_REJ,
	viOCR_CLS_IND_A_Z_EXT_REJ
} viVfPOCRClassifierEnum;

typedef enum viVfPOCRSepTouchCharsEnum
{	viOCR_SEP_TOUCH_CHARS_FALSE = 0,
	viOCR_SEP_TOUCH_CHARS_STANDARD = 1,
	viOCR_SEP_TOUCH_CHARS_ENHANCED = 2
} viVfPOCRSepTouchCharsEnum;

typedef enum viMPPCInvertSelectionEnum
{	viPC_INVERT_FALSE = 0,
	viPC_INVERT_TRUE = 1
} viMPPCInvertSelectionEnum;

typedef enum viVfPSMModeEnum
{	viSM_MODE_STANDARD,
	viSM_MODE_FAST
} viVfPSMModeEnum;

typedef enum viMPSBMorphologyTypeEnum
{	viSBMT_NONE,
	viSBMT_CLOSING,
	viSBMT_OPENING,
	viSBMT_CLOSING_NEARBY,
	viSBMT_OPENING_TOUCHING
} viMPSBMorphologyTypeEnum;

typedef struct viAccessVfListEntryType
{	plcstring InstanceName[256];
	enum viVisionFunctionTypeEnum InstanceType;
	unsigned char ExecutionNumber;
} viAccessVfListEntryType;

typedef struct viAccessRoiShapeBasedType
{	float CenterX;
	float CenterY;
	float SemiWidth;
	float SemiHeight;
	float RotationAngle;
} viAccessRoiShapeBasedType;

typedef struct viAccessRoiRegionType
{	unsigned short* X;
	unsigned short* Y;
	unsigned long ListLen;
} viAccessRoiRegionType;

typedef struct viAccessRoiRegionRLEType
{	unsigned short* X1;
	unsigned short* X2;
	unsigned short* Y;
	unsigned long ListLen;
} viAccessRoiRegionRLEType;

typedef struct viVf2p5DBBlobModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	enum viMP2p5DBMorphologyTypeEnum MorphologyType;
	float CircleMaskRadius;
	float ThresholdMin;
	float ThresholdMax;
	float AreaMin;
	float AreaMax;
	float RectangularityMin;
	float RectangularityMax;
	float CircularityMin;
	float CircularityMax;
	float ThresholdOffset;
	float AverageMaxPercentage;
	float AnisometryMin;
	float AnisometryMax;
} viVf2p5DBBlobModelType;

typedef struct viVfAnomalyDetectionParamsType
{	enum viVisionFunctionTypeEnum Type;
	float SearchAngle;
	unsigned char SelectedModel;
	float AspectRatio;
	float ScoreImageMax;
} viVfAnomalyDetectionParamsType;

typedef struct viVfBBlobModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	enum viMPBMorphologyTypeEnum MorphologyType;
	float CircleMaskRadius;
	float ThresholdMin;
	float ThresholdMax;
	float AreaMin;
	float AreaMax;
	float RectangularityMin;
	float RectangularityMax;
	float CircularityMin;
	float CircularityMax;
	float AverageMaxPercentage;
	float AnisometryMin;
	float AnisometryMax;
} viVfBBlobModelType;

typedef struct viVfClassificationParamsType
{	enum viVisionFunctionTypeEnum Type;
	float SearchAngle;
	unsigned char SelectedModel;
	float AspectRatio;
} viVfClassificationParamsType;

typedef struct viVfClutterMatchingParamsType
{	enum viVisionFunctionTypeEnum Type;
	enum viVfPCMSSBorderShapeModelsEnum ShapeSearchBorderShapeModels;
	float ShapeSearchGreediness;
} viVfClutterMatchingParamsType;

typedef struct viVfCMBaseModelType
{	enum viModelTypeEnum Type;
	unsigned char SearchNumLevels;
	float SearchAngleStart;
	float SearchAngleExtent;
	enum viMPCMSubPixelModeEnum SearchSubPixelMode;
	signed short SearchMinContrast;
	float SearchScaleMin;
	float SearchScaleMax;
	float ReferencePositionY;
	float ReferencePositionX;
	enum viMPCMClutterBorderModeEnum ClutterBorderMode;
	unsigned char GrayMin;
	unsigned char GrayMax;
	enum viMPCMGrayInvertSelectionEnum GrayInvertSelection;
	float GrayClutterScoreMax;
	unsigned char EdgeClutterContrast;
	float EdgeClutterScoreMax;
} viVfCMBaseModelType;

typedef struct viVfCMConstraintModelType
{	enum viModelTypeEnum Type;
	unsigned char GrayMin;
	unsigned char GrayMax;
	enum viMPCMGrayInvertSelectionEnum GrayInvertSelection;
	float GrayClutterScoreMax;
} viVfCMConstraintModelType;

typedef struct viVfCodeReaderParamsType
{	enum viVisionFunctionTypeEnum Type;
	unsigned char C2dContrastMin;
	enum viVfPCRC2dPolarityEnum C2dPolarity;
	enum viVfPCRC2dSmallModulesRobusEnum C2dSmallModulesRobustness;
	enum viVfPCRC2dStrictModelEnum C2dStrictModel;
	unsigned char C2dModuleSizeMin;
	unsigned char C2dModuleSizeMax;
	enum viVfPCRC2dModuleGapEnum C2dModuleGapMin;
	enum viVfPCRC2dModuleGapEnum C2dModuleGapMax;
	enum viVfPCRC2dStrictQuietZoneEnum C2dStrictQuietZone;
	enum viVfPCREccSymbolSearchEnum EccSymbolSearch;
	enum viVfPCREccSymbolShapeEnum EccSymbolShape;
	enum viVfPCREccToleranceEnum EccFinderPatternTolerance;
	unsigned char EccSymbolColsMin;
	unsigned char EccSymbolColsMax;
	unsigned char EccSymbolRowsMin;
	unsigned char EccSymbolRowsMax;
	unsigned char EccSlantMax;
	enum viVfPCREccToleranceEnum EccContrastTolerance;
	enum viVfPCREccModuleGridEnum EccModuleGrid;
	enum viVfPCREccCandidateSelEnum EccCandidateSelection;
	float PdfModuleAspectMin;
	float PdfModuleAspectMax;
	unsigned char PdfSymbolColsMin;
	unsigned char PdfSymbolColsMax;
	unsigned char PdfSymbolRowsMin;
	unsigned char PdfSymbolRowsMax;
	enum viVfPCRAztecFormatEnum AztecFormat;
	unsigned char AztecAdditionalLevels;
	enum viVfPCRAztecFinderPatTolEnum AztecFinderPatternTolerance;
	unsigned char AztecSymbolSizeMin;
	unsigned char AztecSymbolSizeMax;
	unsigned char QrPositionPatternMin;
	unsigned char QrVersionMin;
	unsigned char QrVersionMax;
	float C1dElementSizeMin;
	unsigned char C1dElementSizeMax;
	plcbit C1dElementSizeVariable;
	signed char C1dBarcodeHeightMin;
	signed char C1dBarcodeWidthMin;
	unsigned char C1dNumScanlines;
	unsigned char C1dMinIdenticalScanlines;
	plcbit C1dMajorityVoting;
	float C1dOrientation;
	unsigned char C1dOrientationTol;
	enum viVfPCRC1dQuietZoneEnum C1dQuietZone;
	enum viVfPCRC1dStartStopTolEnum C1dStartStopTolerance;
	unsigned char C1dMinCodeLength;
	plcbit C1dMergeScanlines;
	float C1dMeasThresh;
	float C1dMeasThreshAbs;
	enum viVfPCRC1dCheckCharEnum C1dCheckChar;
	enum viVfPCRC1dCompositeCodeEnum C1dCompositeCode;
	enum viVfPCRC1dUpceEncodationEnum C1dUpceEncodation;
	unsigned char C1dContrastMin;
} viVfCodeReaderParamsType;

typedef struct viVfDOCRParamsType
{	enum viVisionFunctionTypeEnum Type;
	float SearchAngle;
} viVfDOCRParamsType;

typedef struct viVfImageAcquisitionParamsType
{	enum viVisionFunctionTypeEnum Type;
	unsigned short SearchFocusPositionX;
	unsigned short SearchFocusPositionY;
	unsigned short SearchFocusWidth;
	unsigned short SearchFocusHeight;
	enum viVfPIAFocusScaleEnum FocusScale;
	plcbit VignettingCorrection;
	plcbit LEDTempDriftCorrection;
	unsigned char AcquisitionCount;
	unsigned char CameraMode;
	enum viVfPIATriggerSourceEnum TriggerSource;
	plcstring TriggerAxis[33];
	enum viVfPIATriggerDelayEnum TriggerDelay;
	enum viVfPIATriggerEdgeEnum TriggerEdge;
	enum viVfPIATriggerForwardingEnum TriggerForwarding;
	unsigned short PreTriggerTime;
	plcbit FlipImageHorizontally;
	plcbit FlipImageVertically;
	enum viVfPIAPixelConfigurationEnum PixelConfiguration;
	unsigned short Width;
	unsigned short Height;
	unsigned short OffsetX;
	unsigned short OffsetY;
	enum viVfPIALinesensorEnum Linesensor;
	plcbit LinesensorContinuousMode;
	plcbit TwoAndAHalfDMode;
	enum viVfPIARoiHeightModeEnum RoiHeightMode;
	signed char LineOffsetY;
	unsigned short LinesPerImage;
	unsigned char InterpolationLines;
	unsigned char Brightness;
	unsigned long LineScanPeriod;
	enum viVfPIAPreprocessingEnum Preprocessing;
	signed char UserKernel01[3][3];
	signed char UserKernel01Offset;
	unsigned short UserKernel01Gain;
	signed char UserKernel02[3][3];
	signed char UserKernel02Offset;
	unsigned short UserKernel02Gain;
	plcbit ShapeFromShading;
	unsigned char ShapeFromShadingGain;
	plcbit Subtraction;
} viVfImageAcquisitionParamsType;

typedef struct viVfMatchingParamsType
{	enum viVisionFunctionTypeEnum Type;
	enum viVfPMSSBorderShapeModelsEnum ShapeSearchBorderShapeModels;
	float ShapeSearchGreediness;
} viVfMatchingParamsType;

typedef struct viVfMDefShapeModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	unsigned char SearchMaxDeformation;
	unsigned char SearchNumLevels;
	unsigned char SearchNumLevelsMin;
	float SearchAngleStart;
	float SearchAngleExtent;
	enum viMPMSubPixelModeEnum SearchSubPixelMode;
	signed short SearchMinContrast;
	float SearchScaleMin;
	float SearchScaleMax;
	float ReferencePositionY;
	float ReferencePositionX;
} viVfMDefShapeModelType;

typedef struct viVfMShapeModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	unsigned char SearchNumLevels;
	unsigned char SearchNumLevelsMin;
	float SearchAngleStart;
	float SearchAngleExtent;
	enum viMPMSubPixelModeEnum SearchSubPixelMode;
	signed short SearchMinContrast;
	float SearchScaleMin;
	float SearchScaleMax;
	float ReferencePositionY;
	float ReferencePositionX;
} viVfMShapeModelType;

typedef struct viVfMNccModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	unsigned char SearchNumLevels;
	unsigned char SearchNumLevelsMin;
	float SearchAngleStart;
	float SearchAngleExtent;
	enum viMPMSearchSubPixelsEnum SearchSubPixels;
	float ReferencePositionY;
	float ReferencePositionX;
} viVfMNccModelType;

typedef struct viVfMMCircleModelType
{	enum viModelTypeEnum Type;
	float Completeness;
} viVfMMCircleModelType;

typedef struct viVfMMEdgeMode1ModelType
{	enum viModelTypeEnum Type;
	float Completeness;
} viVfMMEdgeMode1ModelType;

typedef struct viVfMMEllipseModelType
{	enum viModelTypeEnum Type;
	float Completeness;
} viVfMMEllipseModelType;

typedef struct viVfMMRectangleModelType
{	enum viModelTypeEnum Type;
	float Completeness;
} viVfMMRectangleModelType;

typedef struct viVfMMOperationEntryType
{	enum viVfMMOperationTypeEnum OperationType;
	unsigned char Reference;
	unsigned char Target;
} viVfMMOperationEntryType;

typedef struct viVfObjectDetectionParamsType
{	enum viVisionFunctionTypeEnum Type;
	unsigned char SelectedModel;
} viVfObjectDetectionParamsType;

typedef struct viVfOCRParamsType
{	enum viVisionFunctionTypeEnum Type;
	unsigned char MinContrast;
	enum viVfPOCRPolarityEnum Polarity;
	unsigned char MinCharHeight;
	unsigned char MaxCharHeight;
	unsigned char MinCharWidth;
	unsigned char MaxCharWidth;
	plcbit DotPrint;
	enum viVfPOCRClassifierEnum OcrClassifier;
	enum viVfPOCRSepTouchCharsEnum SeparateTouchingChars;
	unsigned char MinStrokeWidth;
	unsigned char MaxStrokeWidth;
	unsigned char DotPrintMinCharGap;
	unsigned char DotPrintMaxDotGap;
	float SearchAngle;
	plcstring TextLineSeparators[17];
	plcstring TextLineStructure[256];
} viVfOCRParamsType;

typedef struct viVfPCPixelCounterModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	unsigned char ThresholdMin;
	unsigned char ThresholdMax;
	enum viMPPCInvertSelectionEnum InvertSelection;
} viVfPCPixelCounterModelType;

typedef struct viVfSimpleMatchingParamsType
{	enum viVisionFunctionTypeEnum Type;
	enum viVfPSMModeEnum Mode;
	unsigned short ShapeMinContourSize;
	float AngleMin;
	float AngleMax;
	float ReferencePositionX;
	float ReferencePositionY;
	float ReferenceOrientation;
	unsigned char ShapeMinContrast;
} viVfSimpleMatchingParamsType;

typedef struct viVfSBBlobModelType
{	enum viModelTypeEnum Type;
	plcbit Enable;
	enum viMPSBMorphologyTypeEnum MorphologyType;
	float CircleMaskRadius;
	float ThresholdMin;
	float ThresholdMax;
	float AreaMin;
	float AreaMax;
	float RectangularityMin;
	float RectangularityMax;
	float CircularityMin;
	float CircularityMax;
	float AnisometryMin;
	float AnisometryMax;
} viVfSBBlobModelType;

typedef struct ViAccessBasis
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit KeepImage;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit KeepImageActive;
} ViAccessBasis_typ;

typedef struct ViAccessGetVfList
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	struct viAccessVfListEntryType* List;
	unsigned long ListLen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short NrEntries;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetVfList_typ;

typedef struct ViAccessGetVfModelList
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned char NrEntries;
	unsigned char ModelIds[255];
	enum viModelTypeEnum ModelTypes[255];
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetVfModelList_typ;

typedef struct ViAccessGetVfParameters
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	unsigned long VfParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetVfParameters_typ;

typedef struct ViAccessSetVfParameters
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	unsigned long VfParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessSetVfParameters_typ;

typedef struct ViAccessGetVfModelParameters
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	unsigned char ModelId;
	unsigned long ModelParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetVfModelParameters_typ;

typedef struct ViAccessSetVfModelParameters
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	unsigned char ModelId;
	unsigned long ModelParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessSetVfModelParameters_typ;

typedef struct ViAccessGetVfOperations
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	struct viVfMMOperationEntryType* List;
	unsigned long ListLen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short NrEntries;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetVfOperations_typ;

typedef struct ViAccessSetVfOperations
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	struct viVfMMOperationEntryType* List;
	unsigned long ListLen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessSetVfOperations_typ;

typedef struct ViAccessSetVfExecutionRoi
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	enum viAccessRoiFormatTypeEnum Type;
	unsigned long Roi;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessSetVfExecutionRoi_typ;

typedef struct ViAccessGetPixelGrayValues
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	unsigned char ExecutionNumber;
	unsigned short* X;
	unsigned short* Y;
	unsigned char* GrayValues;
	unsigned long Number;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ViAccessGetPixelGrayValues_typ;

typedef struct ViAccessGetImage
{
	/* VAR_INPUT (analog) */
	struct ViComponentType* MpLink;
	enum ViAccessImageTypeEnum Type;
	unsigned char QualityLevel;
	unsigned short ExecutionNumber;
	plcstring (*ImageName);
	unsigned long Buffer;
	unsigned long BufferSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long BufferLen;
	signed long Nettime;
	/* VAR (analog) */
	struct ViBaseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} ViAccessGetImage_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ViAccessBasis(struct ViAccessBasis* inst);
_BUR_PUBLIC void ViAccessGetVfList(struct ViAccessGetVfList* inst);
_BUR_PUBLIC void ViAccessGetVfModelList(struct ViAccessGetVfModelList* inst);
_BUR_PUBLIC void ViAccessGetVfParameters(struct ViAccessGetVfParameters* inst);
_BUR_PUBLIC void ViAccessSetVfParameters(struct ViAccessSetVfParameters* inst);
_BUR_PUBLIC void ViAccessGetVfModelParameters(struct ViAccessGetVfModelParameters* inst);
_BUR_PUBLIC void ViAccessSetVfModelParameters(struct ViAccessSetVfModelParameters* inst);
_BUR_PUBLIC void ViAccessGetVfOperations(struct ViAccessGetVfOperations* inst);
_BUR_PUBLIC void ViAccessSetVfOperations(struct ViAccessSetVfOperations* inst);
_BUR_PUBLIC void ViAccessSetVfExecutionRoi(struct ViAccessSetVfExecutionRoi* inst);
_BUR_PUBLIC void ViAccessGetPixelGrayValues(struct ViAccessGetPixelGrayValues* inst);
_BUR_PUBLIC void ViAccessGetImage(struct ViAccessGetImage* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define viACCESS_INF_OP_LIST_INCOMPLETE 1102315784
 #define viACCESS_INF_EXECROI_CROPPED 1102315780
 #define viACCESS_ERR_EXECROI_INVALID (-1045167869)
 #define viACCESS_CAM_ERROR (-1045167873)
 #define viACCESS_ERR_VF_MODEL_NOT_EXIST (-1045167875)
 #define viACCESS_NO_DATA_CONNECTION (-1045167878)
 #define viACCESS_INF_VF_LIST_INCOMPLETE 1102315672
 #define viACCESS_ERR_INV_IMG_SELECTOR (-1044578293)
 #define viACCESS_ERR_NO_INPUT_IMG (-1044578294)
 #define viACCESS_ERR_UNSUPPORTED_FEATURE (-1044578295)
 #define viACCESS_ERR_MODEL_OPERATION (-1044578296)
 #define viACCESS_ERR_PIXEL_OUT_OF_RANGE (-1044578297)
 #define viACCESS_ERR_NO_EXECUTION_ROI (-1044578301)
#else
 _GLOBAL_CONST signed long viACCESS_INF_OP_LIST_INCOMPLETE;
 _GLOBAL_CONST signed long viACCESS_INF_EXECROI_CROPPED;
 _GLOBAL_CONST signed long viACCESS_ERR_EXECROI_INVALID;
 _GLOBAL_CONST signed long viACCESS_CAM_ERROR;
 _GLOBAL_CONST signed long viACCESS_ERR_VF_MODEL_NOT_EXIST;
 _GLOBAL_CONST signed long viACCESS_NO_DATA_CONNECTION;
 _GLOBAL_CONST signed long viACCESS_INF_VF_LIST_INCOMPLETE;
 _GLOBAL_CONST signed long viACCESS_ERR_INV_IMG_SELECTOR;
 _GLOBAL_CONST signed long viACCESS_ERR_NO_INPUT_IMG;
 _GLOBAL_CONST signed long viACCESS_ERR_UNSUPPORTED_FEATURE;
 _GLOBAL_CONST signed long viACCESS_ERR_MODEL_OPERATION;
 _GLOBAL_CONST signed long viACCESS_ERR_PIXEL_OUT_OF_RANGE;
 _GLOBAL_CONST signed long viACCESS_ERR_NO_EXECUTION_ROI;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _VIACCESS_ */

