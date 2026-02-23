
FUNCTION_BLOCK MpTempController (*mapp component to tune and control temperature systems.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp.*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpTempControllerParType; (*Function block parameters.*) (* *) (*#PAR#; *)
		Update : BOOL; (*Applies changed parameters.*) (* *) (*#PAR#; *)
		SetTemperature : REAL; (*Set temperature. Unit: [°C].*) (* *) (*#CYC#; *)
		ActualTemperature : REAL; (*Measured temperature. Unit: [°C].*) (* *) (*#CYC#; *)
		Control : BOOL; (*Command to start and stop control.*) (* *) (*#CMD#; *)
		Tune : BOOL; (*Command to start and stop tuning.*) (* *) (*#CMD#OPT#; *)
		Simulate : BOOL; (*Command to start and stop simulation.*) (* *) (*#CMD#OPT#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly. *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block.*) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#; *)
		Heat : BOOL; (*Heating output pulse of the pwm.*) (* *) (*#CYC#;*)
		Cool : BOOL; (*Cooling output pulse of the pwm.*) (* *) (*#CYC#;*)
		HeatValue : REAL; (*Manipulated variable for heating. Unit: [%].*) (* *) (*#CYC#OPT#;*)
		CoolValue : REAL; (*Manipulated variable for cooling. Unit: [%].*) (* *) (*#CYC#OPT#;*)
		ControlActive : BOOL; (*Controller is active.*) (* *) (*#CMD#*)
		TuningActive : BOOL; (*Tuning procedure is active.*) (* *) (*#CMD#OPT#*)
		TuningDone : BOOL; (*Tuning is completed.*) (* *) (*#CMD#OPT#*)
		Simulation : BOOL; (*Simulation is active.*) (* *) (*#CMD#OPT#*)
		Info : MpTempControllerInfoType; (*Additional information about the component.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTempControllerConfig (*mapp component to configure a MpTempController FB.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface).*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface).*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTempControllerConfigType; (*Configuration parameters (mapp standard interface).*) (* *) (*#PAR#; *)
		Load : BOOL; (*Read configuration.*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface).*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface).*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface).*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpTempInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTempGroup (*mapp component to control all linked components of a temperature group.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp.*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		Parameters : REFERENCE TO MpTempGroupParType; (*Function block parameters.*) (* *) (*#PAR#; *)
		Update : BOOL; (*Applies changed parameters.*) (* *) (*#PAR#; *)
		Control : BOOL; (*Command to start and stop control for the group.*) (* *) (*#CMD#; *)
		Tune : BOOL; (*Command to start and stop tuning for the group.*) (* *) (*#CMD#OPT#; *)
		LimitPower : BOOL; (*Command to start and stop power limitation for the group.*) (* *) (*#CMD#OPT#; *)
		Simulate : BOOL; (*Command to start and stop simulation for the group.*) (* *) (*#CMD#OPT#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly. *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block.*) (* *) (*#PAR#; *)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#; *)
		ControlActive : BOOL; (*Controller is active.*) (* *) (*#CMD#*)
		TuningActive : BOOL; (*Tuning procedure is active.*) (* *) (*#CMD#OPT#*)
		TuningDone : BOOL; (*Tuning is completed.*) (* *) (*#CMD#OPT#*)
		PowerLimitationActive : BOOL; (*Power limitation is active.*) (* *) (*#CMD#OPT#*)
		Simulation : BOOL; (*Simulation is active.*) (* *) (*#CMD#OPT#*)
		Info : MpTempGroupInfoType; (*Additional information about the component.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTempGroupConfig (*mapp component to configure a MpTempGroup FB.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface).*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface).*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTempGroupConfigType; (*Configuration parameters (mapp standard interface).*) (* *) (*#PAR#; *)
		Load : BOOL; (*Read configuration.*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface).*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface).*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface).*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpTempInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTempHCM (*mapp component to execute heat current monitoring of a temperature system.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp.*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block.*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors.*) (* *) (*#PAR#;*)
		CurrentL1 : REAL; (*Current L1. Unit: [A].*) (* *) (*#CYC#; *)
		CurrentL2 : REAL; (*Current L2. Unit: [A].*) (* *) (*#CYC#; *)
		CurrentL3 : REAL; (*Current L3. Unit: [A].*) (* *) (*#CYC#; *)
		Monitor : BOOL; (*Starts the heat current monitoring according the chosen operation mode.*) (* *) (*#CMD#; *)
		AutoDetect : BOOL; (*Starts the detection of currents.*) (* *) (*#CMD#OPT#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active.*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly. *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block.*) (* *) (*#PAR#; *)
		MonitoringActive : BOOL; (*Identification  of heating current measurement is active.*) (* *) (*#CMD#; *)
		MonitoringDone : BOOL; (*Identification  of heating current measurement is complete.*) (* *) (*#CMD#; *)
		DetectionActive : BOOL; (*Identification of reference currents is active.*) (* *) (*#CMD#OPT#; *)
		DetectionDone : BOOL; (*Identification of reference currents is complete*) (* *) (*#CMD#OPT#; *)
		Info : MpTempHCMInfoType; (*Additional information about the component.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpTempHCMConfig (*mapp component to configure a MpTempHCM FB.*) (* $GROUP=mapp Control,$CAT=Temperature,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpTemperature.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (mapp standard interface).*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface).*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface).*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpTempHCMConfigType; (*Configuration parameters (mapp standard interface).*) (* *) (*#PAR#; *)
		Load : BOOL; (*Read configuration.*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface).*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface).*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface).*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpTempHCMInfoType; (*Additional information.*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data.*)
	END_VAR
END_FUNCTION_BLOCK
