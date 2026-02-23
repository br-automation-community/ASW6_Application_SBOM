(*Params of VF OCR*)

TYPE
	viVfOCRParamsType : 	STRUCT  (*VF OCR parameters*)
		Type : viVisionFunctionTypeEnum := viVF_OCR;
		MinContrast : USINT := 15;
		Polarity : viVfPOCRPolarityEnum;
		MinCharHeight : USINT;
		MaxCharHeight : USINT;
		MinCharWidth : USINT;
		MaxCharWidth : USINT;
		DotPrint : BOOL;
		OcrClassifier : viVfPOCRClassifierEnum := 1;
		SeparateTouchingChars : viVfPOCRSepTouchCharsEnum;
		MinStrokeWidth : USINT;
		MaxStrokeWidth : USINT;
		DotPrintMinCharGap : USINT;
		DotPrintMaxDotGap : USINT;
		SearchAngle : REAL;
		TextLineSeparators : STRING[16];
		TextLineStructure : STRING[255];
	END_STRUCT;
END_TYPE

(*Enum types*)

TYPE
	viVfPOCRPolarityEnum : 
		( (*VF OCR parameter Polarity*)
		viOCR_POLARITY_DARK_ON_LIGHT := 0,
		viOCR_POLARITY_LIGHT_ON_DARK := 1,
		viOCR_POLARITY_BOTH := 2
		);
	viVfPOCRClassifierEnum : 
		( (*VF OCR parameter OcrClassifier*)
		viOCR_CLS_UNI_NO_REJ := 0, (*Font type Universal_NoRej*)
		viOCR_CLS_UNI_REJ, (*Font type Universal_Rej.occ*)
		viOCR_CLS_UNI_0_9_NO_REJ, (*Font type Universal_0-9_NoRej.occ*)
		viOCR_CLS_UNI_0_9_REJ, (*Font type Universal_0-9_Rej.occ*)
		viOCR_CLS_UNI_0_9_EXT_NO_REJ, (*Font type Universal_0-9+_NoRej.occ*)
		viOCR_CLS_UNI_0_9_EXT_REJ, (*Font type Universal_0-9+_Rej.occ*)
		viOCR_CLS_UNI_0_9_A_Z_NO_REJ, (*Font type Universal_0-9A-Z_NoRej.occ*)
		viOCR_CLS_UNI_0_9_A_Z_REJ, (*Font type Universal_0-9A-Z_Rej.occ*)
		viOCR_CLS_UNI_0_9_A_Z_EXT_NO_REJ, (*Font type Universal_0-9A-Z+_NoRej.occ*)
		viOCR_CLS_UNI_0_9_A_Z_EXT_REJ,(*Font type Universal_0-9A-Z+_Rej.occ*)
		viOCR_CLS_UNI_A_Z_EXT_NO_REJ, (*Font type Universal_A-Z+_NoRej.occ*)
		viOCR_CLS_UNI_A_Z_EXT_REJ, (*Font type Universal_A-Z+_Rej.occ*)
		viOCR_CLS_DOT_0_9_NO_REJ, (*Font type DotPrint_0-9_NoRej.omc*)
		viOCR_CLS_DOT_0_9_REJ, (*Font type DotPrint_0-9_Rej.omc*)
		viOCR_CLS_DOT_0_9_EXT_NO_REJ, (*Font type DotPrint_0-9+_NoRej.omc*)
		viOCR_CLS_DOT_0_9_EXT_REJ, (*Font type DotPrint_0-9+_Rej.omc*)
		viOCR_CLS_DOT_0_9_A_Z_NO_REJ, (*Font type DotPrint_0-9A-Z_NoRej.omc*)
		viOCR_CLS_DOT_0_9_A_Z_REJ, (*Font type DotPrint_0-9A-Z_Rej.omc*)
		viOCR_CLS_DOT_0_9_A_Z_EXT_NO_REJ, (*Font type DotPrint_A-Z+_NoRej.omc*)
		viOCR_CLS_DOT_0_9_A_Z_EXT_REJ, (*Font type DotPrint_A-Z+_Rej.omc*)
		viOCR_CLS_DOT_NO_REJ, (*Font type DotPrint_A-Z+_Rej.omc*)
		viOCR_CLS_DOT_REJ, (*Font type DotPrint_NoRej.omc*)
		viOCR_CLS_IND_0_9_NO_REJ, (*Font type Industrial_0-9_NoRej.omc*)
		viOCR_CLS_IND_0_9_REJ, (*Font type Industrial_0-9_Rej.omc*)
		viOCR_CLS_IND_0_9_EXT_NO_REJ, (*Font type Industrial_0-9+_NoRej.omc*)
		viOCR_CLS_IND_0_9_EXT_REJ, (*Font type Industrial_0-9+_Rej.omc*)
		viOCR_CLS_IND_0_9_A_Z_NO_REJ, (*Font type Industrial_0-9A-Z_NoRej.omc*)
		viOCR_CLS_IND_0_9_A_Z_REJ, (*Font type Industrial_0-9A-Z_Rej.omc*)
		viOCR_CLS_IND_0_9_A_Z_EXT_NO_REJ, (*Font type Industrial_A-Z+_NoRej.omc*)
		viOCR_CLS_IND_REJ, (*Font type Industrial_Rej.omc*)
		viOCR_CLS_IND_NO_REJ, (*Font type Industrial_NoRej.omc*)	
		viOCR_CLS_DOC_REJ, (*Font type Document_Rej.omc*)
		viOCR_CLS_DOC_NO_REJ, (*Font type Document_NoRej.omc*)
		viOCR_CLS_DOC_A_Z_REJ, (*Font type Document_A-Z+_Rej.omc*)
		viOCR_CLS_DOC_A_Z_NO_REJ, (*Font type Document_A-Z+_NoRej.omc*)
		viOCR_CLS_DOC_0_9_REJ, (*Font type Document_0-9_Rej.omc*)
		viOCR_CLS_DOC_0_9_NO_REJ, (*Font type Document_0-9_NoRej.omc*)
		viOCR_CLS_DOC_0_9_A_Z_REJ, (*Font type Document_0-9A-Z_Rej.omc*)
		viOCR_CLS_DOC_0_9_A_Z_NO_REJ, (*Font type Document_0-9A-Z_NoRej.omc*)
		viOCR_CLS_OCRA_REJ, (*Font type OCRA_Rej.omc*)
		viOCR_CLS_OCRA_NO_REJ, (*Font type OCRA_NoRej.omc*)
		viOCR_CLS_OCRA_A_Z_REJ, (*Font type OCRA_A-Z+_Rej.omc*)
		viOCR_CLS_OCRA_A_Z_NO_REJ, (*Font type OCRA_A-Z+_NoRej.omc*)
		viOCR_CLS_OCRA_0_9_REJ, (*Font type OCRA_0-9_Rej.omc*)
		viOCR_CLS_OCRA_0_9_NO_REJ, (*Font type OCRA_0-9_NoRej.omc*)
		viOCR_CLS_OCRA_0_9_A_Z_REJ, (*Font type OCRA_0-9A-Z_Rej.omc*)
		viOCR_CLS_OCRA_0_9_A_Z_NO_REJ, (*Font type OCRA_0-9A-Z_NoRej.omc*)
		viOCR_CLS_OCRB_REJ, (*Font type OCRB_Rej.omc*)
		viOCR_CLS_OCRB_NO_REJ, (*Font type OCRB_NoRej.omc*)
		viOCR_CLS_OCRB_A_Z_REJ, (*Font type OCRB_A-Z+_Rej.omc*)
		viOCR_CLS_OCRB_A_Z_NO_REJ, (*Font type OCRB_A-Z+_NoRej.omc*)
		viOCR_CLS_OCRB_0_9_REJ, (*Font type OCRB_0-9_Rej.omc*)
		viOCR_CLS_OCRB_0_9_NO_REJ, (*Font type OCRB_0-9_NoRej.omc*)
		viOCR_CLS_OCRB_0_9_A_Z_REJ, (*Font type OCRB_0-9A-Z_Rej.omc*)
		viOCR_CLS_OCRB_0_9_A_Z_NO_REJ, (*Font type OCRB_0-9A-Z_NoRej.omc*)
		viOCR_CLS_OCRB_PASSPORT_REJ, (*Font type OCRB_passport_Rej.omc*)
		viOCR_CLS_OCRB_PASSPORT_NO_REJ, (*Font type OCRB_passport_NoRej.omc*)
		viOCR_CLS_PHAR_REJ, (*Font type Pharma_Rej.omc*)
		viOCR_CLS_PHAR_NO_REJ, (*Font type Pharma_NoRej.omc*)
		viOCR_CLS_PHAR_0_9_REJ, (*Font type Pharma_0-9_Rej.omc*)
		viOCR_CLS_PHAR_0_9_NO_REJ, (*Font type Pharma_0-9_NoRej.omc*)
		viOCR_CLS_PHAR_0_9_EXT_REJ, (*Font type Pharma_0-9+_Rej.omc*)
		viOCR_CLS_PHAR_0_9_EXT_NO_REJ, (*Font type Pharma_0-9+_NoRej.omc*)
		viOCR_CLS_PHAR_0_9_A_Z_REJ, (*Font type Pharma_0-9A-Z_Rej.omc*)
		viOCR_CLS_PHAR_0_9_A_Z_NO_REJ, (*Font type Pharma_0-9A-Z_NoRej.omc*)
		viOCR_CLS_SEMI_REJ, (*Font type SEMI_Rej.omc*)
		viOCR_CLS_SEMI_NO_REJ, (*Font type SEMI_NoRej.omc*)
		viOCR_CLS_IND_A_Z_EXT_REJ (*Font type Industrial_A-Z+_Rej.omc*)
		);
	viVfPOCRSepTouchCharsEnum : 
		( (*VF OCR parameter SeparateTouchingChars*)
		viOCR_SEP_TOUCH_CHARS_FALSE := 0,
		viOCR_SEP_TOUCH_CHARS_STANDARD := 1,
		viOCR_SEP_TOUCH_CHARS_ENHANCED := 2
		);
END_TYPE
