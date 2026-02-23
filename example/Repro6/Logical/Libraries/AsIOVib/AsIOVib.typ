
TYPE
	vbioIoMapping_t : 	STRUCT 
		RequestBufferLock01 : BOOL; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferLockValid01 : BOOL; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferInputSequence01 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferRxByte01 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferRxByte02 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferRxByte03 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferRxByte04 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferRxByte05 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferOutputSequence01 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferTxByte01 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferTxByte02 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferTxByte03 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
		BufferTxByte04 : USINT; (*Has to be connented to module I/O mapping. Not to be used in application code!*)
	END_STRUCT;
	vbioParamMain_t : 	STRUCT 
		pModulePath : UDINT; (*Path to the  module, as in the function block AsIOAcc() of libraray AsIOAcc.*)
		sensitivitySensor01 : REAL; (*Sensor sensitivity in [mV/g].*)
		sensitivitySensor02 : REAL; (*Sensor sensitivity in [mV/g].*)
		sensitivitySensor03 : REAL; (*Sensor sensitivity in [mV/g].*)
		sensitivitySensor04 : REAL; (*Sensor sensitivity in [mV/g].*)
	END_STRUCT;
	vbioParamBufferUpload_t : 	STRUCT 
		moduleBuffer : UINT; (*Determines the buffer that is transfered from the module to the plc.*)
		nrArrayElements : UDINT; (*Number of array elements of pArrayXaxis and pArrayYaxis.*)
		pArrayXaxis : REFERENCE TO REAL; (*This array is used to store the values of the x-axis. Pointer to an array of data type REAL. *)
		pArrayYaxis : REFERENCE TO REAL; (*This array is used to store the values of the x-axis. Pointer to an array of data type REAL.*)
	END_STRUCT;
	vbioModuleCfg_t : 	STRUCT 
		highFrequencyConfig : REAL; (*High frequency lower cut-off frequency (for HF parameters and envelope) in [Hz].*)
		channel01 : vbioChannelCfg_t;
		channel02 : vbioChannelCfg_t;
		channel03 : vbioChannelCfg_t;
		channel04 : vbioChannelCfg_t;
		frequencyBand01 : vbioFrequencyBandCfg_t;
		frequencyBand02 : vbioFrequencyBandCfg_t;
		frequencyBand03 : vbioFrequencyBandCfg_t;
		frequencyBand04 : vbioFrequencyBandCfg_t;
		frequencyBand05 : vbioFrequencyBandCfg_t;
		frequencyBand06 : vbioFrequencyBandCfg_t;
		frequencyBand07 : vbioFrequencyBandCfg_t;
		frequencyBand08 : vbioFrequencyBandCfg_t;
		frequencyBand09 : vbioFrequencyBandCfg_t;
		frequencyBand10 : vbioFrequencyBandCfg_t;
		frequencyBand11 : vbioFrequencyBandCfg_t;
		frequencyBand12 : vbioFrequencyBandCfg_t;
		frequencyBand13 : vbioFrequencyBandCfg_t;
		frequencyBand14 : vbioFrequencyBandCfg_t;
		frequencyBand15 : vbioFrequencyBandCfg_t;
		frequencyBand16 : vbioFrequencyBandCfg_t;
		frequencyBand17 : vbioFrequencyBandCfg_t;
		frequencyBand18 : vbioFrequencyBandCfg_t;
		frequencyBand19 : vbioFrequencyBandCfg_t;
		frequencyBand20 : vbioFrequencyBandCfg_t;
		frequencyBand21 : vbioFrequencyBandCfg_t;
		frequencyBand22 : vbioFrequencyBandCfg_t;
		frequencyBand23 : vbioFrequencyBandCfg_t;
		frequencyBand24 : vbioFrequencyBandCfg_t;
		frequencyBand25 : vbioFrequencyBandCfg_t;
		frequencyBand26 : vbioFrequencyBandCfg_t;
		frequencyBand27 : vbioFrequencyBandCfg_t;
		frequencyBand28 : vbioFrequencyBandCfg_t;
		frequencyBand29 : vbioFrequencyBandCfg_t;
		frequencyBand30 : vbioFrequencyBandCfg_t;
		frequencyBand31 : vbioFrequencyBandCfg_t;
		frequencyBand32 : vbioFrequencyBandCfg_t;
	END_STRUCT;
	vbioModuleCfgEx_t : 	STRUCT 
		highFrequencyConfig : REAL; (*High frequency lower cut-off frequency (for HF parameters and envelope) in [Hz].*)
		is64kUploadBuffer : BOOL; (*Buffer upload length (only for raw- and envelope time signal)*)
		channel01 : vbioChannelCfg_t;
		channel02 : vbioChannelCfg_t;
		channel03 : vbioChannelCfg_t;
		channel04 : vbioChannelCfg_t;
		frequencyBand01 : vbioFrequencyBandCfg_t;
		frequencyBand02 : vbioFrequencyBandCfg_t;
		frequencyBand03 : vbioFrequencyBandCfg_t;
		frequencyBand04 : vbioFrequencyBandCfg_t;
		frequencyBand05 : vbioFrequencyBandCfg_t;
		frequencyBand06 : vbioFrequencyBandCfg_t;
		frequencyBand07 : vbioFrequencyBandCfg_t;
		frequencyBand08 : vbioFrequencyBandCfg_t;
		frequencyBand09 : vbioFrequencyBandCfg_t;
		frequencyBand10 : vbioFrequencyBandCfg_t;
		frequencyBand11 : vbioFrequencyBandCfg_t;
		frequencyBand12 : vbioFrequencyBandCfg_t;
		frequencyBand13 : vbioFrequencyBandCfg_t;
		frequencyBand14 : vbioFrequencyBandCfg_t;
		frequencyBand15 : vbioFrequencyBandCfg_t;
		frequencyBand16 : vbioFrequencyBandCfg_t;
		frequencyBand17 : vbioFrequencyBandCfg_t;
		frequencyBand18 : vbioFrequencyBandCfg_t;
		frequencyBand19 : vbioFrequencyBandCfg_t;
		frequencyBand20 : vbioFrequencyBandCfg_t;
		frequencyBand21 : vbioFrequencyBandCfg_t;
		frequencyBand22 : vbioFrequencyBandCfg_t;
		frequencyBand23 : vbioFrequencyBandCfg_t;
		frequencyBand24 : vbioFrequencyBandCfg_t;
		frequencyBand25 : vbioFrequencyBandCfg_t;
		frequencyBand26 : vbioFrequencyBandCfg_t;
		frequencyBand27 : vbioFrequencyBandCfg_t;
		frequencyBand28 : vbioFrequencyBandCfg_t;
		frequencyBand29 : vbioFrequencyBandCfg_t;
		frequencyBand30 : vbioFrequencyBandCfg_t;
		frequencyBand31 : vbioFrequencyBandCfg_t;
		frequencyBand32 : vbioFrequencyBandCfg_t;
	END_STRUCT;
	vbioModuleCfgEx1_t : 	STRUCT 
		highFrequencyConfig : REAL; (*High frequency lower cut-off frequency (for HF parameters and envelope) in [Hz].*)
		is64kUploadBuffer : BOOL; (*Buffer upload length (only for raw- and envelope time signal)*)
		channel01 : vbioChannelCfgEx1_t;
		channel02 : vbioChannelCfgEx1_t;
		channel03 : vbioChannelCfgEx1_t;
		channel04 : vbioChannelCfgEx1_t;
		frequencyBand01 : vbioFrequencyBandCfg_t;
		frequencyBand02 : vbioFrequencyBandCfg_t;
		frequencyBand03 : vbioFrequencyBandCfg_t;
		frequencyBand04 : vbioFrequencyBandCfg_t;
		frequencyBand05 : vbioFrequencyBandCfg_t;
		frequencyBand06 : vbioFrequencyBandCfg_t;
		frequencyBand07 : vbioFrequencyBandCfg_t;
		frequencyBand08 : vbioFrequencyBandCfg_t;
		frequencyBand09 : vbioFrequencyBandCfg_t;
		frequencyBand10 : vbioFrequencyBandCfg_t;
		frequencyBand11 : vbioFrequencyBandCfg_t;
		frequencyBand12 : vbioFrequencyBandCfg_t;
		frequencyBand13 : vbioFrequencyBandCfg_t;
		frequencyBand14 : vbioFrequencyBandCfg_t;
		frequencyBand15 : vbioFrequencyBandCfg_t;
		frequencyBand16 : vbioFrequencyBandCfg_t;
		frequencyBand17 : vbioFrequencyBandCfg_t;
		frequencyBand18 : vbioFrequencyBandCfg_t;
		frequencyBand19 : vbioFrequencyBandCfg_t;
		frequencyBand20 : vbioFrequencyBandCfg_t;
		frequencyBand21 : vbioFrequencyBandCfg_t;
		frequencyBand22 : vbioFrequencyBandCfg_t;
		frequencyBand23 : vbioFrequencyBandCfg_t;
		frequencyBand24 : vbioFrequencyBandCfg_t;
		frequencyBand25 : vbioFrequencyBandCfg_t;
		frequencyBand26 : vbioFrequencyBandCfg_t;
		frequencyBand27 : vbioFrequencyBandCfg_t;
		frequencyBand28 : vbioFrequencyBandCfg_t;
		frequencyBand29 : vbioFrequencyBandCfg_t;
		frequencyBand30 : vbioFrequencyBandCfg_t;
		frequencyBand31 : vbioFrequencyBandCfg_t;
		frequencyBand32 : vbioFrequencyBandCfg_t;
	END_STRUCT;
	vbioChannelCfg_t : 	STRUCT 
		analogInputScaling : REAL; (*Maximum value in both directions.*)
		analogInputCalculationEnabled : BOOL; (*Is true if the parameter calculation is enabled.*)
		analogInputMode : USINT; (*Calculation mode: 0..mean value; 1..peak value; 2..RMSvalue; 3..CREST factor*)
		analogInputSignalSource : USINT; (*Determines the maximum frequency of the analog input signal.*)
		analogInputSamples : UINT; (*Number of samples used to calculate the analog input parameter.*)
		analogInputTriggered : BOOL; (*Is true if the input value is triggered.*)
		isVelocitySignalEnabled : BOOL; (*Is true if the calculation of the velocity signal is enabled.*)
		maxFrequencyRaw : REAL; (*Upper cut-off frequency raw signal in [Hz].*)
		minFrequencyRaw : REAL; (*Lower cut-off frequency raw signal in [Hz].*)
		frequencyResolutionSpectrumRaw : REAL; (*Frequency resolution in the raw spectrum in [Hz].*)
		totalBufferTimeRaw : REAL; (*Time span of the total raw value buffer in [sec].*)
		sampleTimeRaw : REAL; (*Sample time of the raw time signal in [sec].*)
		maxFrequencyEnv : REAL; (*Upper cut-off frequency envelope signal in [Hz].*)
		minFrequencyEnv : REAL; (*Lower cut-off frequency envelope signal in [Hz].*)
		frequencyResolutionSpectrumEnv : REAL; (*Frequency resolution in the envelope spectrum in [Hz].*)
		totalBufferTimeEnv : REAL; (*Time span of the total envelope value buffer in [sec].*)
		sampleTimeEnv : REAL; (*Sample time of the envelope time signal in [sec].*)
		isCurrentSupplyActive : BOOL; (*Is TRUE if the IEPE current supply is switched on.*)
	END_STRUCT;
	vbioChannelCfgEx1_t : 	STRUCT 
		analogInputScaling : REAL; (*Maximum value in both directions.*)
		analogInputMode : USINT; (*Calculation mode: 0..mean value; 1..peak value; 2..RMSvalue; 3..CREST factor*)
		analogInputSignalSource : USINT; (*Determines the maximum frequency of the analog input signal.*)
		analogInputSampleSource : USINT; (*Displays the analog input sample source (vbioSAMPLE_SOURCE_DEACTIVATED, vbioSAMPLE_SOURCE_CONFIGURATION or vbioSAMPLE_SOURCE_CYCLIC).*)
		analogInputSamples : UINT; (*Number of samples used to calculate the analog input parameter (only valid if "analogInputSampleSource" = vbioSAMPLE_SOURCE_CONFIGURATION).*)
		analogInputTriggered : BOOL; (*Is true if the input value is triggered.*)
		isVelocitySignalEnabled : BOOL; (*Is true if the calculation of the velocity signal is enabled.*)
		maxFrequencyRaw : REAL; (*Upper cut-off frequency raw signal in [Hz].*)
		minFrequencyRaw : REAL; (*Lower cut-off frequency raw signal in [Hz].*)
		frequencyResolutionSpectrumRaw : REAL; (*Frequency resolution in the raw spectrum in [Hz].*)
		totalBufferTimeRaw : REAL; (*Time span of the total raw value buffer in [sec].*)
		sampleTimeRaw : REAL; (*Sample time of the raw time signal in [sec].*)
		maxFrequencyEnv : REAL; (*Upper cut-off frequency envelope signal in [Hz].*)
		minFrequencyEnv : REAL; (*Lower cut-off frequency envelope signal in [Hz].*)
		frequencyResolutionSpectrumEnv : REAL; (*Frequency resolution in the envelope spectrum in [Hz].*)
		totalBufferTimeEnv : REAL; (*Time span of the total envelope value buffer in [sec].*)
		sampleTimeEnv : REAL; (*Sample time of the envelope time signal in [sec].*)
		isCurrentSupplyActive : BOOL; (*Is TRUE if the IEPE current supply is switched on.*)
	END_STRUCT;
	vbioFrequencyBandCfg_t : 	STRUCT 
		isRmsValue : BOOL; (*Is true if the frequency band is enabled.*)
		isNoise : BOOL; (*Is true if the frequency band is used to get a noise value.*)
		noiseQuadrantNr : USINT; (*Selected quadrant of the frequency spectrum.*)
		channelNr : USINT; (*Channel number.*)
		isCoupled : BOOL; (*Is true if the frequency band is coupled to an actual speed.*)
		actSpeedNr : USINT; (*Determines the number of the linked actual speed.*)
		useHarmonics : BOOL; (*Is true if the harmonic frequency bands are included in the calculation.*)
		isEnvelope : BOOL; (*Is true if the frequency band is calculated in the envelope spectrum.*)
		isVelocity : BOOL; (*Is true if the frequency band is calculated in the velocity spectrum.*)
		normalizedDamageFrequency : REAL; (*Normalized damage frequency (actual speed = 1Hz] in [Hz].*)
		toleranceBand : REAL; (*Width of the tolerance band in [Hz].*)
		minFrequency : REAL; (*Lower cut-off frequency in [Hz].*)
		maxFrequency : REAL; (*Higher cut-off frequency in [Hz].*)
	END_STRUCT;
	vbioInternalParamMain_t : 	STRUCT 
		scalingCorrSensor : ARRAY[0..5]OF REAL; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalFltBuf_t : 	STRUCT 
		state : INT; (*Data for internal use.*)
		fubFltRead : fltRead; (*Data for internal use.*)
		fubFltWrite : fltWrite; (*Data for internal use.*)
		scalingYaxis : REAL; (*Data for internal use.*)
		scalingXaxis : REAL; (*Data for internal use.*)
		sendBufferRequest : ARRAY[0..2]OF USINT; (*Data for internal use.*)
		receiveQueue : vbioInternalFltReceiveQueue_t; (*Data for internal use.*)
		sendBufferEmpty : ARRAY[0..0]OF USINT; (*Data for internal use.*)
		uploadBufferOld : BOOL; (*Data for internal use.*)
		moduleBuffer : UINT; (*Data for internal use.*)
		completeInSaveMode : BOOL; (*Data for internal use.*)
		nrArrayElements : UDINT; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalFltBufEx1_t : 	STRUCT 
		state : INT; (*Data for internal use.*)
		fubFltRead : fltRead; (*Data for internal use.*)
		fubFltWrite : fltWrite; (*Data for internal use.*)
		scalingYaxis : REAL; (*Data for internal use.*)
		scalingXaxis : REAL; (*Data for internal use.*)
		sendBufferRequest : ARRAY[0..2]OF USINT; (*Data for internal use.*)
		sendBufferEmpty : ARRAY[0..0]OF USINT; (*Data for internal use.*)
		receiveQueue : vbioInternalFltReceiveQueue_t; (*Data for internal use.*)
		uploadBufferOld : BOOL; (*Data for internal use.*)
		cancelBufferUploadOld : BOOL; (*Data for internal use.*)
		cancelCause : USINT; (*Data for internal use.*)
		moduleBuffer : UINT; (*Data for internal use.*)
		nrArrayElements : UDINT; (*Data for internal use.*)
		flags : UDINT;
		mode : USINT;
	END_STRUCT;
	vbioInternalModuleCfgBuf_t : 	STRUCT 
		highFrequencyConfig : REAL; (*Data for internal use.*)
		channel : ARRAY[0..3]OF vbioChannelCfg_t; (*Data for internal use.*)
		frequencyBand : ARRAY[0..31]OF vbioFrequencyBandCfg_t; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalModuleCfgBufEx1_t : 	STRUCT 
		highFrequencyConfig : REAL; (*Data for internal use.*)
		channel : ARRAY[0..3]OF vbioChannelCfgEx1_t; (*Data for internal use.*)
		frequencyBand : ARRAY[0..31]OF vbioFrequencyBandCfg_t; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalModuleCfg_t : 	STRUCT 
		state : UINT; (*Data for internal use.*)
		fubAccRead : vbioInternalAccRead_t; (*Data for internal use.*)
		cntFrequencyBand : USINT; (*Data for internal use.*)
		uploadModuleCfg : BOOL; (*Data for internal use.*)
		uploadModuleCfgOld : BOOL; (*Data for internal use.*)
		moduleCfgUploadStartup : BOOL; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalAi_t : 	STRUCT 
		aiScalingCorrIndex : ARRAY[0..3]OF USINT; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalStartup_t : 	STRUCT 
		state : INT; (*Data for internal use.*)
		moduleCfgUploadDoneOnce : BOOL; (*Data for internal use.*)
		redundance : UDINT; (*Data for internal use.*)
		paraModulePathValid : BOOL; (*Data for internal use.*)
		initDone : BOOL; (*Data for internal use.*)
	END_STRUCT;
	vbioInternal_t : 	STRUCT 
		statusTxt : STRING[200]; (*Function block status message as message text.*)
		paramMain : vbioInternalParamMain_t; (*Data for internal use.*)
		moduleCfgOutBuf : vbioInternalModuleCfgBuf_t; (*Data for internal use.*)
		startup : vbioInternalStartup_t; (*Data for internal use.*)
		fltBuf : vbioInternalFltBuf_t; (*Data for internal use.*)
		moduleCfg : vbioInternalModuleCfg_t; (*Data for internal use.*)
		bufferUploadLength : UDINT; (*Data for internal use.*)
		bufferUploadDone : BOOL; (*Data for internal use.*)
		moduleCfgUploadDone : BOOL; (*Data for internal use.*)
		status : UINT; (*Data for internal use.*)
		bufferLockValidOld : BOOL; (*Data for internal use.*)
		enableOld : BOOL; (*Data for internal use.*)
		acknowledgeErrorOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalEx1_t : 	STRUCT 
		statusTxt : STRING[200]; (*Function block status message as message text.*)
		paramMain : vbioInternalParamMain_t; (*Data for internal use.*)
		moduleCfgOutBuf : vbioInternalModuleCfgBufEx1_t; (*Data for internal use.*)
		startup : vbioInternalStartup_t; (*Data for internal use.*)
		fltBuf : vbioInternalFltBufEx1_t; (*Data for internal use.*)
		moduleCfg : vbioInternalModuleCfg_t; (*Data for internal use.*)
		bufferUploadLength : UDINT; (*Data for internal use.*)
		bufferUploadDone : BOOL; (*Data for internal use.*)
		cancelBufferUploadDone : BOOL; (*Data for internal use.*)
		moduleCfgUploadDone : BOOL; (*Data for internal use.*)
		status : UINT; (*Data for internal use.*)
		bufferLockValidOld : BOOL; (*Data for internal use.*)
		enableOld : BOOL; (*Data for internal use.*)
		acknowledgeErrorOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalAccRead_t : 	STRUCT 
		enable : BOOL; (*Data for internal use.*)
		status : UINT; (*Data for internal use.*)
		value : UDINT; (*Data for internal use.*)
		pChannelName : UDINT; (*Data for internal use.*)
		pDeviceName : UDINT; (*Data for internal use.*)
		nodeNr : USINT; (*Data for internal use.*)
		registerNr : UINT; (*Data for internal use.*)
		size : USINT; (*Data for internal use.*)
		fubAccReadSG4SGC : ARRAY[0..63]OF USINT; (*Data for internal use.*)
	END_STRUCT;
	vbioInternalFltReceiveQueue_t : 	STRUCT 
		receiveBuffer : ARRAY[0..127]OF USINT; (*Data for internal use.*)
		bufferNextReadIndex : INT; (*Data for internal use.*)
		dataSize : USINT; (*Data for internal use.*)
		dequeuedElemCnt : UDINT; (*Data for internal use.*)
		pFltRead : UDINT; (*Data for internal use.*)
	END_STRUCT;
END_TYPE
