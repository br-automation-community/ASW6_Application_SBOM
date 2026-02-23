(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: MTAdvanced
 * File: MTAdvanced.fun
 * Author: B&R
 ********************************************************************
 * Functions and function blocks of library MTAdvanced
 ********************************************************************)

FUNCTION_BLOCK MTAdvancedLoopShaping (*This function block calculates the PID parameter using the identified system and two optional filters to satisfy the requirements of the closed loop.*)
	VAR_INPUT
		Enable : BOOL; (*Enable function block.*) (* *) (*#PAR#;*)
		SystemReference : ARRAY[0..2] OF UDINT; (*System 1, 2 and 3.*) (* *) (*#CMD#;*)
		RiseTime : REAL; (*Rise time in s of the closed loop.*) (* *) (*#CMD#;*)
		OverShoot : REAL; (*Overshoot of closed loop in % [-20..50].*) (* *) (*#CMD#;*)
		MinFrequency : REAL; (*Minimum frequency in Hz.*) (* *) (*#CMD#OPT#;*)
		SampleTimeController : REAL; (*Sampling time of controller in s (0 means time continuous). *) (* *) (*#CMD#OPT#;*)
		ControllerType : MTAdvancedControllerEnum; (*Controller typ.*) (* *) (*#CMD#;*)
		CalculateController : BOOL; (*Calculates controlller parameter(s).*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#;*)
		PlotDataOpenLoop : MTBodeType; (*Plot data of Bode diagram.*) (* *) (*#CMD#;*)
		CalculationDone : BOOL; (*Calculation of controller parameter(s) done.*) (* *) (*#CMD#;*)
		Gain : REAL; (*Proportional part.*) (* *) (*#CMD#;*)
		IntegrationTime : REAL; (*Integration time in s.*) (* *) (*#CMD#;*)
		CrossOverFrequency : REAL; (*Crossover frequency in Hz.*) (* *) (*#CMD#OPT#;*)
		PhaseMargin : REAL; (*Phase margin in °.*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR
		Internal : MTAdvancedLoopShapingIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
