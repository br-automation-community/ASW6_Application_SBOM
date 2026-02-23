
{REDUND_OK} FUNCTION_BLOCK MTSkewController (*Skew controller for a gantry crane.*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTSkewCtrlParType; (*Controller parameters.*) (* *) (*#PAR#*)
		Update : BOOL; (*The parameters are updated at rising edge of the input.*) (* *) (*#PAR#*)
		Configuration : MTSkewActuatorConfigType; (*Configuration parameters.*) (* *) (*#PAR#*)
		DelayTime : REAL; (*Delay time of actuators. Unit: [s].*) (* *) (*#PAR#OPT#*)
		ActPosition : ARRAY[0..3] OF REAL; (*Actual actuator positions. Unit: [m].*) (* *) (*#CYC#*)
		SetSkewAngle : REAL; (*Set value of skew angle. Unit: [°].*) (* *) (*#CYC#*)
		ActSkewAngle : ARRAY[0..2] OF REAL; (*ActSkewAngle[0]: actual skew angle. Unit: [°]. ActSkewAngle[1]: actual angular velocity of skew. Unit: [°/s]. ActSkewAngle[2]: actual angular acceleration of skew. Unit: [°/s²].*) (* *) (*#CYC#*)
		ActHoistLength : REAL; (*Actual hoist length. Unit: [m].*) (* *) (*#CYC#*)
		Mode : MTSkewCtrlModeEnum; (*Feedback control mode.*) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		SetVelocity : ARRAY[0..3] OF REAL; (*Set velocities for the actuators. Unit: [m/s].*) (* *) (*#CYC#*)
		State : MTSkewCtrlStateEnum; (*State of the controller.*) (* *) (*#CMD#*)
		InLimitation : BOOL; (*Output SetVelocity is limited by the actuator limits.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : MTSkewCtrlIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTSkewIdentification (*Identification for the skew dynamic parameters.*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Configuration : MTSkewActuatorConfigType; (*Configuration parameters.*) (* *) (*#PAR#*)
		ActPosition : ARRAY[0..3] OF REAL; (*Actual actuator positions. Unit: [m].*) (* *) (*#CYC#*)
		ActSkewAngle : REAL; (*Actual skew angle. Unit: [°].*) (* *) (*#CYC#*)
		ActHoistLength : REAL; (*Actual hoist length. Unit: [m].*) (* *) (*#CYC#*)
		MaxSkewAngle : REAL; (*Maximum skew angle for excitation. Unit: [°].*) (* *) (*#CMD#*)
		Mode : MTSkewIdentModeEnum; (*Identification mode.*) (* *) (*#CMD#*)
		Start : BOOL; (*Start the identification on rising edge.*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop the identification on rising edge.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		SetVelocity : ARRAY[0..3] OF REAL; (*Set velocities of actuators. Unit: [m/s].*) (* *) (*#CYC#*)
		SkewSystem : MTSkewSystemType; (*Identified parameters of the skew system.*) (* *) (*#CMD#*)
		InProgress : BOOL; (*Identification is in progress.*) (* *) (*#CMD#*)
		IdentDone : BOOL; (*Identification is successfully done.*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Identification is stopped.*) (* *) (*#CMD#*)
		State : MTSkewIdentStateEnum; (*State of identification process.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : MTSkewIdentInternalType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTSkewObserver (*Kalman filter to estimate the skew angle and skew angular velocity.*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		SkewSystem : MTSkewSystemType; (*Identified parameters of the skew system.*) (* *) (*#PAR#*)
		DynamicFactor : REAL; (*Dynamic factor of the Kalman filter. Valid value range: -3 <= DynamicFactor <= 3.*) (* *) (*#PAR#OPT#*)
		Update : BOOL; (*Updates the parameters listed above on rising edge.*) (* *) (*#PAR#*)
		Configuration : MTSkewActuatorConfigType; (*Configuration parameters.*) (* *) (*#PAR#*)
		ActPosition : ARRAY[0..3] OF REAL; (*Actual actuator positions. Unit: [m].*) (* *) (*#CYC#*)
		ActSkewAngle : REAL; (*Actual skew angle. Unit: [°].*) (* *) (*#CYC#*)
		ActHoistLength : REAL; (*Actual hoist length. Unit: [m].*) (* *) (*#CYC#*)
		InvalidSkewAngle : BOOL; (*Denotes that the skew angle is not reliable.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*FB is busy.*) (* *) (*#PAR#*)
		Active : BOOL; (*FB is active after Kalman filter initialization phase.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		EstSkewAngle : ARRAY[0..2] OF REAL; (*Estimated skew angle. Unit: [°,°/s,°/s²].*) (* *) (*#CYC#*)
		State : MTSkewObserverStateEnum; (*Indicates the state of the skew observer.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : MTSkewObserverIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} FUNCTION_BLOCK MTSkewSimulationModel (*Gantry crane skew simulation model.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTSkewSimModelParType; (*Parameters of simulation model.*) (* *) (*#PAR#*)
		Update : BOOL; (*The parameters are updated at rising edge of the input.*) (* *) (*#PAR#*)
		Configuration : MTSkewSimConfigType; (*Configuration parameters.*) (* *) (*#PAR#*)
		SetVelocity : ARRAY[0..3] OF REAL; (*Set velocities for the actuators. Unit: [m/s].*) (* *) (*#CYC#*)
		ActHoistLength : REAL; (*Actual hoist length. Unit: [m].*) (* *) (*#CYC#*)
		WindTorque : REAL; (*Skewing torque on load due to wind. Unit: [Nm].*) (* *) (*#CYC#OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occured during operation.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		ActPosition : ARRAY[0..3] OF REAL; (*Actual actuator positions. Unit: [m].*) (* *) (*#CYC#*)
		ActSkewAngle : REAL; (*Actual skew angle. Unit: [°].*) (* *) (*#CYC#*)
		ActSkewAngularVelocity : REAL; (*Actual angular velocity of skew. Unit: [°/s].*) (* *) (*#CYC#OPT#*)
		Info : MTSkewSimModelInfoType; (*Simulation information.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : MTSkewSimModelIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
