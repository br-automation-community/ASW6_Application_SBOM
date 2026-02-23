(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: MTSystem
 * File: MTSystem.typ
 * Author: B&R
 * Created: July 2013
 ********************************************************************
 * Data types of library XXTemplate
 ********************************************************************)

TYPE
	MTSystemBodeInternalType : 	STRUCT 
		NbValidExtSystemReferences : USINT; (*Data for internal use.*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		CalcPlotData : BOOL; (*Data for internal use.*)
		CalcPlotDataOld : BOOL; (*Data for internal use.*)
		CalcFrequencyData : BOOL; (*Data for internal use.*)
		CalcFrequencyDataOld : BOOL; (*Data for internal use.*)
		RunCalculation : BOOL; (*Data for internal use.*)
		MinFrequency : REAL; (*Data for internal use.*)
		MaxFrequency : REAL; (*Data for internal use.*)
		Frequency : REAL; (*Data for internal use.*)
	END_STRUCT;
	MTSystemBode2InternalType : 	STRUCT 
		NbValidExtSystemReferences : USINT; (*Data for internal use.*)
		CalcPlotData : BOOL; (*Data for internal use.*)
		CalcPlotDataOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
	END_STRUCT;
	MTSystemTransferFcnInternalType : 	STRUCT 
		CycleTime : REAL; (*Task cycle time. Unit: [s].*)
		UpdateOld : BOOL; (*Data for internal use.*)
		EnableOld : BOOL; (*Data for internal use.*)
		EnableDone : BOOL; (*Data for internal use.*)
		DisabledBusy : USINT; (*Data for internal use.*)
		ParametersValid : BOOL; (*Data for internal use.*)
		SampleTime : REAL; (*Data for internal use.*)
		SysRefParaNew : BOOL; (*Data for internal use.*)
		CounterOld : UDINT; (*Data for internal use.*)
		Order : USINT; (*Data for internal use.*)
		PresetOK : BOOL; (*Data for internal use.*)
		PresetCoefficients : LREAL; (*Data for internal use.*)
		BVector : ARRAY[0..5]OF LREAL; (*Data for internal use.*)
		AVector : ARRAY[0..5]OF LREAL; (*Data for internal use.*)
		XVector : ARRAY[0..4]OF LREAL; (*Data for internal use.*)
		OutPresetValue : REAL; (*Data for internal use.*)
		SetOut : BOOL; (*Data for internal use.*)
		SetOutOld : BOOL; (*Data for internal use.*)
		SystemReference : MTTransferFcnType; (*Data for internal use.*)
	END_STRUCT;
END_TYPE
