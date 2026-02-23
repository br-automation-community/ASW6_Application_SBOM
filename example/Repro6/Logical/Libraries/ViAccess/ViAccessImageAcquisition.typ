(*Params of VF Image Acquisition*)

TYPE

	viVfImageAcquisitionParamsType : 	STRUCT (*VF Image Aquisition parameters*)
		Type : viVisionFunctionTypeEnum := viVF_IMAGE_ACQUISITION;
		SearchFocusPositionX : UINT; (*R/W - not part of IA configuration, this means it is not available in AS and changes at runtime are not persisted in the VA*)
		SearchFocusPositionY : UINT; (*R/W - not part of IA configuration, this means it is not available in AS and changes at runtime are not persisted in the VA*)
		SearchFocusWidth : UINT; (*R/W - not part of IA configuration, this means it is not available in AS and changes at runtime are not persisted in the VA*)
		SearchFocusHeight : UINT; (*R/W - not part of IA configuration, this means it is not available in AS and changes at runtime are not persisted in the VA*)
		FocusScale : viVfPIAFocusScaleEnum; (*Read only*)
		VignettingCorrection : BOOL; (*R/W*)
		LEDTempDriftCorrection : BOOL; (*R/W*)
		AcquisitionCount : USINT; (*Read only*)
		CameraMode : USINT; (*Read only*)
		TriggerSource : viVfPIATriggerSourceEnum; (*Read only*)
		TriggerAxis : STRING[32]; (*Read only*)
		TriggerDelay : viVfPIATriggerDelayEnum; (*Read only*)
		TriggerEdge : viVfPIATriggerEdgeEnum; (*R/W - only applicable if the value of TriggerSource is viIA_TriggerSource_Hardware*)
		TriggerForwarding : viVfPIATriggerForwardingEnum; (*Read only*)
		PreTriggerTime : UINT; (*R/W - only applicable if the value of TriggerForwarding is viIA_TriggerForwarding_DO01*)
		FlipImageHorizontally : BOOL; (*R/W*)
		FlipImageVertically : BOOL; (*R/W*)
		PixelConfiguration : viVfPIAPixelConfigurationEnum; (*R/W*)
		Width : UINT; (*R/W - if Linesensor is enabled, it applies to a single line - if TwoAndAHalfDMode (2.5D Mode) is true Read only*)
		Height : UINT; (*R/W - if Linesensor is enabled, it applies to a single line - if TwoAndAHalfDMode (2.5D Mode) is true not applicable*)
		OffsetX : UINT; (*R/W - if Linesensor is enabled, it applies to a single line - if TwoAndAHalfDMode (2.5D Mode) is true Read only*)
		OffsetY : UINT; (*R/W - if Linesensor is enabled, it applies to a single line - if TwoAndAHalfDMode (2.5D Mode) is true not applicable*)
		Linesensor : viVfPIALinesensorEnum; (*Read only*)
		LinesensorContinuousMode: BOOL; (*Read only*)
		TwoAndAHalfDMode: BOOL; (*Read only - 2.5D Mode*)
		RoiHeightMode: viVfPIARoiHeightModeEnum ; (*R/W - only applicable if Linesensor is enabled and TwoAndAHalfDMode (2.5D Mode) is true*)
		LineOffsetY: SINT; (*R/W - only applicable if Linesensor is enabled and TwoAndAHalfDMode (2.5D Mode) is true*)
		LinesPerImage : UINT; (*R/W - only applicable if Linesensor is enabled*)
		InterpolationLines : USINT; (*R/W - only applicable if Linesensor is enabled and TwoAndAHalfDMode (2.5D Mode) is true*)
		Brightness : USINT; (*R/W - only applicable if Linesensor is enabled and TwoAndAHalfDMode (2.5D Mode) is true*)
		LineScanPeriod : UDINT; (*R/W - only applicable if Linesensor is enabled*)
		Preprocessing : viVfPIAPreprocessingEnum; (*R/W - If ShapeFromShading is enabled: Read only*)
		UserKernel01 : ARRAY[0..2,0..2] OF SINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1 or viIA_Preproc_UserFilter_1_2*)
		UserKernel01Offset : SINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1 or viIA_Preproc_UserFilter_1_2*)
		UserKernel01Gain : UINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1 or viIA_Preproc_UserFilter_1_2*)
		UserKernel02 : ARRAY[0..2,0..2]OF SINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1_2*)
		UserKernel02Offset : SINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1_2*)
		UserKernel02Gain : UINT; (*R/W - only applicable if Preprocessing is set to viIA_Preproc_UserFilter_1_2*)
		ShapeFromShading : BOOL; (*Read only*)
		ShapeFromShadingGain : USINT; (*R/W - only applicable if ShapeFromShading is enabled*)
		Subtraction : BOOL; (*Read only*)
	END_STRUCT;

END_TYPE


(*Enum types*)

TYPE


	viVfPIAFocusScaleEnum :
		( (*Image acquisition parameter FocusScale*)
		viIA_FOCUSSCALE_RAW,
		viIA_FOCUSSCALE_MILIMETERS,
		viIA_FOCUSSCALE_MICROMETERS
		);
	viVfPIAPixelConfigurationEnum:
		( (*Image acquisition parameter PixelConfiguration*)
		viIA_PIXELCONFIG_STANDARD,
		viIA_PIXELCONFIG_BINNING := 10,
		viIA_PIXELCONFIG_SUBSAMPLING := 20
		);
	viVfPIATriggerSourceEnum :
		( (*Image acquisition parameter TriggerSource*)
		viIA_TRIGGERSOURCE_SOFTWARE,
		viIA_TRIGGERSOURCE_HARDWARE,
		viIA_TRIGGERSOURCE_MAPPAXIS
		);
	viVfPIATriggerDelayEnum :
		( (*Image acquisition parameter TriggerDelay*)
		viIA_TRIGGERDELAY_TIMEDELAY,
		viIA_TRIGGERDELAY_NETTIME
		);
	viVfPIATriggerEdgeEnum :
		( (*Image acquisition parameter TriggerEdge*)
		viIA_TRIGGEREDGE_RISING,
		viIA_TRIGGEREDGE_FALLING
		);
	viVfPIATriggerForwardingEnum :
		( (*Image acquisition parameter TriggerForwarding*)
		viIA_TRIGGERFORWARDING_OFF,
		viIA_TRIGGERFORWARDING_DO01 := 2
		);
	viVfPIALinesensorEnum :
		( (*Image acquisition parameter Linesensor*)
		viIA_LINESENSOR_OFF,
		viIA_LINESENSOR_STATIC,
		viIA_LINESENSOR_DYNAMIC
		);
	viVfPIARoiHeightModeEnum :
		( (*Image acquisition parameter RoiHeightMode*)
		viIA_ROIHEIGHTMODE_SINGLE,
		viIA_ROIHEIGHTMODE_DOUBLE
		);
	viVfPIAPreprocessingEnum :
		( (*Image acquisition parameter Preprocessing*)
		viIA_PREPROC_NONE,
		viIA_PREPROC_SOBELFILTER := 6,
		viIA_PREPROC_USERFILTER_1 := 16,
		viIA_PREPROC_USERFILTER_1_2 := 18
		);

END_TYPE

