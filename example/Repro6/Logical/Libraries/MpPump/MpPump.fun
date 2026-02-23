
FUNCTION_BLOCK MpPumpBasic (*Control for a generic pump*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		CurrentPressure : REAL; (*Optional: Input current pressure for measurement*) (* *) (*#CYC#OPT#;*)
		CurrentFlow : REAL; (*Optional: Input current flow for measurement*) (* *) (*#CYC#OPT#;*)
		Pressure : REAL; (*Input set pressure*) (* *) (*#CYC#*)
		Flow : REAL; (*Input set flow*) (* *) (*#CYC#*)
		MeasurePressure : BOOL; (*Optional: Automatic pressure measurement start command.*) (* *) (*#CMD#OPT#;*)
		MeasureFlow : BOOL; (*Optional: Automatic flow measurement start command.*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active *) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		PressureSignal : INT; (*Analog output value of set pressure (-32768..32767)*) (* *) (*#CYC#*)
		FlowSignal : INT; (*Analog output value of set flow (-32768..32767)*) (* *) (*#CYC#*)
		MeasurementActive : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		MeasurementDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#OPT#;*)
		Info : MpPumpBasicInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpPumpBasicConfig (*Configuration for generic pump*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle *) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors *) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpPumpBasicConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is Active *) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpPumpInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
