(********************************************************************
 * COPYRIGHT (C) BERNECKER + RAINER, AUSTRIA, A-5142 EGGELSBERG
 ********************************************************************
 * Library: ViAccess
 * File:	ViAccess.typ
 ********************************************************************
 * Declaration of data-types of library ViAccess
 ********************************************************************)

TYPE
	viVisionFunctionTypeEnum : 
		(
		viVF_NO_VF := 0,
		viVF_IMAGE_ACQUISITION := 1,
		viVF_CODE_READER := 2,
		viVF_MATCHING := 3,
		viVF_BLOB := 4,
		viVF_SUB_PIXEL_BLOB := 5,
		viVF_MEASUREMENT := 6,
		viVF_PIXEL_COUNTER := 7,
		viVF_OCR := 8,
		viVF_DOCR := 9,
		viVF_CLUTTER_MATCHING := 10,
		viVF_SIMPLE_MATCHING := 11,
		viVF_2p5D_BLOB := 12,
		viVF_ANOMALY_DETECTION := 13,
		viVF_CLASSIFICATION := 14,
		viVF_OBJECT_DETECTION := 15
		);
	viModelTypeEnum : 
		(
		viVF_UNSUPPORTED_MODEL_TYPE := -1, (*some models are not supported by ViAccess e.g. VF Measurement CenterPoint, Edge Model 0 or VF Clutter Matching: Alternative Model*)
		viVF_NO_MODEL := 0,
		viVF_M_SHAPE_MODEL := 16#00030001, (*VF 'Matching Shape model' *)
		viVF_M_DEFORMABLE_SHAPE_MODEL := 16#00030002, (*VF Matching 'Deformable shape model' *)
		viVF_M_NCC_MODEL := 16#00030003, (*VF Matching  'NCC model' *)
		viVF_B_BLOB_MODEL := 16#00040001, (*VF Blob 'blob model' *)
		viVF_SB_BLOB_MODEL := 16#00050001, (*VF SubPixel Blob 'blob model' *)
		viVF_MES_EDGE_MODEL_MODE_1 := 16#00060001, (*VF Measurement 'edge model mode 1'*)
		viVF_MES_CIRCLE_MODEL := 16#00060002, (*VF Measurement 'Circle model'*)
		viVF_MES_ELLIPSE_MODEL := 16#00060003, (*VF Measurement 'Ellipse model'*)
		viVF_MES_RECTANGLE_MODEL := 16#00060004, (*VF Measurement 'Rectangle model'*)
		viVF_PC_PIXEL_COUNTER_MODEL := 16#00070001, (*VF Pixel Counter 'pixel counter model'*)
		viVF_CM_BASE_MODEL := 16#000A0001, (*VF Clutter Matching 'clutter base model'*)
		viVF_CM_CONSTRAINT_MODEL := 16#000A0002, (*VF Clutter Matching 'clutter constraint model'*)
		viVF_2p5DB_BLOB_MODEL := 16#000C0001 (*VF 2.5D Blob '2.5D blob model' *)
		);
	viAccessVfListEntryType : 	STRUCT 
		InstanceName : STRING[255];
		InstanceType : viVisionFunctionTypeEnum;
		ExecutionNumber : USINT;
	END_STRUCT;
	
	viAccessRoiFormatTypeEnum : 
		(
		viROI_NO_TYPE := 0,
		viROI_RECTANGLE := 1,
		viROI_ELLIPSE := 2,
		viROI_REGION := 3,
		viROI_REGION_RLE := 4
		);
	viAccessRoiShapeBasedType : 	STRUCT 
		CenterX : REAL;
		CenterY : REAL;
		SemiWidth : REAL; (* Major Axis *)
		SemiHeight : REAL; (* Minor Axis *)
		RotationAngle : REAL; (* Orientation of the major axis*)
	END_STRUCT;
	viAccessRoiRegionType : 	STRUCT 
		X : REFERENCE TO UINT; (* x coordinates given as pointer to Array of UINT *)
		Y : REFERENCE TO UINT; (* y coordinates given as pointer to Array of UINT *)
		ListLen : UDINT; (* Length of memory area to read in bytes *)
	END_STRUCT;
	viAccessRoiRegionRLEType : 	STRUCT 
		X1 : REFERENCE TO UINT; (* Starting x coordinates given as pointer to Array of UINT *)
		X2 : REFERENCE TO UINT; (* Ending x coordinates given as pointer to Array of UINT *)
		Y : REFERENCE TO UINT; (* Corresponding y coordinates given as pointer to Array of UINT *)
		ListLen : UDINT; (* Length of memory area to read in bytes *)
	END_STRUCT;
	ViAccessImageTypeEnum :
		( (*	Enumeration of image types for ViAccess*)
		viACCESS_IMAGE_TYPE_BMP := 0, (*The image data is uncompressed in the Bitmap format*)
		viACCESS_IMAGE_TYPE_JPG := 1 (*The image data is lossy compressed in the JPG format*)
		);
END_TYPE
