(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: MTSystem
 * File: MTSystem.fun
 * Author: B&R
 * Created: July 2013
 ********************************************************************
 * Functions and function blocks of library XXTemplate
 ********************************************************************)

FUNCTION_BLOCK MTSystemTransferFcn (*This function block implements a general continuous transfer function G(s). Optional it is possible to implement a discrete transfer function G(z) with DiscreteSampleTime > 0.*)
	VAR_INPUT
		Enable : BOOL; (*Enable function block.*) (* *) (*#PAR#*)
		Numerator : ARRAY[0..5] OF REAL; (*Coefficients of numerator [b0, b1, b2, ... bn].*) (* *) (*#PAR#*)
		Denominator : ARRAY[0..5] OF REAL; (*Coefficients of denominator [a0, a1, a2, ... an].*) (* *) (*#PAR#*)
		SampleTime : REAL; (*SampleTime = 0 (default) ... continuous transfer function. DiscreteSampleTime > 0 ... discrete transfer function.*) (* *) (*#PAR#*)
		Update : BOOL; (*Parameters update trigger.*) (* *) (*#PAR#*)
		In : REAL; (*Input variable.*) (* *) (*#CYC#*)
		OutPresetValue : REAL; (*Preset value for Out.*) (* *) (*#CMD#OPT#*)
		SetOut : BOOL; (*Sets Out to OutPresetValue on rising edge.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Function block is working.*) (* *) (*#PAR#*)
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update is sucessful.*) (* *) (*#PAR#*)
		Out : REAL; (*Output variable.*) (* *) (*#CYC#*)
		SystemReference : UDINT; (*System reference.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : MTSystemTransferFcnInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MTSystemBode (*This function block gives the amplitude and phase response of a specified system.*)
	VAR_INPUT
		Enable : BOOL; (*Enable/disable function block.*) (* *) (*#PAR#*)
		SystemReference : ARRAY[0..2] OF UDINT; (*System reference.*) (* *) (*#CMD#*)
		MinFrequency : REAL; (*Minimum frequency in Hz.*) (* *) (*#CMD#OPT#*)
		CalcPlotData : BOOL; (*Calculate bode plot data on rising edge.*) (* *) (*#CMD#*)
		Frequency : REAL; (*Frequency at which magnitude and phase response is required in Hz.*) (* *) (*#CMD#OPT#*)
		CalcFrequencyData : BOOL; (*Calculate magnitude and phase on rising edge at specified frequency.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		CalcPlotDataDone : BOOL; (*Calculation of plot data done.*) (* *) (*#CMD#*)
		PlotData : MTBodeType; (*Bode plot data.*) (* *) (*#CMD#*)
		CalcFrequencyDataDone : BOOL; (*Calculation of frequency data done.*) (* *) (*#CMD#OPT#*)
		Magnitude : REAL; (*Magnitude at specified frequency.*) (* *) (*#CMD#OPT#*)
		Phase : REAL; (*Phase at specified frequency.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : MTSystemBodeInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
