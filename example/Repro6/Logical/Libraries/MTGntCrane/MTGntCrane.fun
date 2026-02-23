
{REDUND_OK} FUNCTION_BLOCK MTGntCrane2DTrajectory (*Trajectory planning for a gantry crane.*) (*$GROUP=User*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Configuration : MTGntCrane2DConfigurationType; (*Configuration parameters.*) (* *) (*#PAR#*)
		InitialLoadPosition : MTGntCrane2DCoordinatesType; (*Initial load position (x,y).*) (* *) (*#PAR#*)
		Parameters : MTGntCrane2DTrajectoryParType; (*Parameters for trajectory generation.*) (* *) (*#CMD#*)
		StartPosition : MTGntCrane2DCoordinatesType; (*Start position (x,y).*) (* *) (*#CMD#*)
		StartVelocity : MTGntCraneCoordType; (*Start velocity.*) (* *) (*#CMD#OPT#*)
		EndPosition : MTGntCrane2DCoordinatesType; (*End position (x,y).*) (* *) (*#CMD#*)
		EndVelocity : MTGntCraneCoordType; (*End velocity.*) (* *) (*#CMD#OPT#*)
		CalculateInfo : BOOL; (*Calculate trajectory information in advance.*) (* *) (*#CMD#OPT#*)
		Move : BOOL; (*Start trajectory to the end position.*) (* *) (*#CMD#*)
		Stop : BOOL; (*Stop trajectory.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occured during operation.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		SetLoadX : ARRAY[0..4] OF REAL; (*Set value of coordinates of the load on the x-axis.*) (* *) (*#CYC#*)
		SetLoadY : ARRAY[0..4] OF REAL; (*Set value of coordinates of the load on the y-axis.*) (* *) (*#CYC#*)
		SetDeflectionAngleX : REAL; (*Predicted deflection angle in x-direction.*) (* *) (*#CYC#OPT#*)
		Info : MTGntCrane2DTrajectoryInfoType; (*Trajectory information.*) (* *) (*#CMD#*)
		InfoValid : BOOL; (*Trajectory information is valid.*) (* *) (*#CMD#*)
		MoveDone : BOOL; (*End position reached.*) (* *) (*#CMD#*)
		Stopped : BOOL; (*Trajectory stopped.*) (* *) (*#CMD#*)
		ReplanningAllowed : BOOL; (*Replanning of trajectory is allowed.*) (* *) (*#CMD#OPT#*)
		ReplanningActive : BOOL; (*Replanning of trajectory is active.*) (* *) (*#CMD#OPT#*)
		MotionStateX : MTGntCraneMotionStateEnum; (*State of motion of X direction.*) (* *) (*#CMD#OPT#*)
		MotionStateY : MTGntCraneMotionStateEnum; (*State of motion of Y direction.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MTGntCrane2DTrajectoryIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} FUNCTION_BLOCK MTGntCraneController (*Feedback controller to avoid swaying of the load.*) (*$GROUP=User*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTGntCraneControllerParType; (*Controller parameters.*) (* *) (*#PAR#*)
		Update : BOOL; (*The parameters are updated at rising edge of the input.*) (* *) (*#PAR#*)
		Configuration : MTGntCraneConfigurationType; (*Configuration parameters.*) (* *) (*#PAR#*)
		DelayTime : MTGntCraneActuatorsType; (*Delay time of actuators (trolley & hoist). Unit: [s].*) (* *) (*#PAR#OPT#*)
		SetLoadX : ARRAY[0..4] OF REAL; (*Set values of the load in x-direction.*) (* *) (*#CYC#*)
		SetLoadY : ARRAY[0..4] OF REAL; (*Set values of the load in y-direction.*) (* *) (*#CYC#*)
		SetLoadZ : ARRAY[0..4] OF REAL; (*Set values of the load in z-direction.*) (* *) (*#CYC#*)
		ActLoadX : ARRAY[0..2] OF REAL; (*Actual values of the load in x-direction.*) (* *) (*#CYC#*)
		ActLoadY : REAL; (*Actual position of the load in y-direction. Unit: [m].*) (* *) (*#CYC#*)
		ActLoadZ : ARRAY[0..2] OF REAL; (*Actual values of the load in z-direction.*) (* *) (*#CYC#*)
		ActTrolleyPosition : REAL; (*Actual trolley position. Unit: [m].*) (* *) (*#CYC#*)
		ActGantryPosition : REAL; (*Actual gantry position. Unit: [m].*) (* *) (*#CYC#*)
		ModeX : MTGntCraneFeedBackEnum; (*Feedback control mode for x-direction. *) (*#CMD#*)
		ModeZ : MTGntCraneFeedBackEnum; (*Feedback control mode for z-direction. *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occured during operation.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		SetTrolleyPosition : REAL; (*Set value of trolley position. Unit: [m].*) (* *) (*#CYC#*)
		SetHoistPosition : REAL; (*Set value of hoist position. Unit: [m].*) (* *) (*#CYC#*)
		SetGantryPosition : REAL; (*Set value of gantry position. Unit: [m].*) (* *) (*#CYC#*)
		SetTrolleyVelocity : REAL; (*Set value of trolley velocity. Unit: [m/s].*) (* *) (*#CYC#*)
		SetHoistVelocity : REAL; (*Set value of hoist velocity. Unit: [m/s].*) (* *) (*#CYC#OPT#*)
		SetGantryVelocity : REAL; (*Set value of gantry velocity. Unit: [m/s].*) (* *) (*#CYC#*)
		SetTrolleyAcceleration : REAL; (*Set value of trolley acceleration. Unit: [m/s²].*) (* *) (*#CYC#OPT#*)
		SetHoistAcceleration : REAL; (*Set value of hoist acceleration. Unit: [m/s²].*) (* *) (*#CYC#OPT#*)
		SetGantryAcceleration : REAL; (*Set value of trolley acceleration. Unit: [m/s²].*) (* *) (*#CYC#OPT#*)
		StateX : MTGntCraneFeedBackEnum; (*State of the controller for x-direction.*) (* *) (*#CMD#*)
		StateZ : MTGntCraneFeedBackEnum; (*State of the controller for z-direction.*) (* *) (*#CMD#*)
		Info : MTGntCraneControllerInfoType; (*Controller information.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : MTGntCraneCtrlIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTGntCraneLoadObserver (*Load Observer to estimate the position, velocity and acceleration of the load.*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTGntCraneLoadObserverParType; (*Filter parameters.*) (* *) (*#PAR#OPT#*)
		Update : BOOL; (*Updates the parameter listed above on rising edge.*) (* *) (*#PAR#OPT#*)
		Configuration : MTGntCraneConfigurationType; (*Configuration parameters.*) (* *) (*#PAR#*)
		ActTrolleyPosition : REAL; (*Actual trolley position. Unit: [m].*) (* *) (*#CYC#*)
		ActLoadMeasurementX : REAL; (*Actual value of the load measurement in x-direction. Unit: depending on Parameters.LoadMeasurementMode.x*) (* *) (*#CYC#*)
		InvalidMeasurementX : BOOL; (*Denotes that ActLoadMeasurementX is not reliable.*) (* *) (*#CMD#*)
		ActLoadY : REAL; (*Actual y-position of the load. Unit: [m].*) (* *) (*#CYC#*)
		ActGantryPosition : REAL; (*Actual gantry position. Unit: [m].*) (* *) (*#CYC#*)
		ActLoadMeasurementZ : REAL; (*Actual value of the load measurement in z-direction. Unit: depending on Parameters.LoadMeasurementMode.z*) (* *) (*#CYC#*)
		InvalidMeasurementZ : BOOL; (*Denotes that ActLoadMeasurementX is not reliable.*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*FB is busy.*) (* *) (*#PAR#*)
		Active : BOOL; (*FB is active after Observer initialization phase.*) (* *) (*#PAR#*)
		Error : BOOL; (*Indicates an error.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#OPT#*)
		EstLoadX : ARRAY[0..2] OF REAL; (*Estimated load position, velocity and acceleration in the x-direction.*) (* *) (*#CYC#*)
		EstDeflectionAngleX : REAL; (*Estimated angle of deflection in x-direction. Unit: [°].*) (* *) (*#CYC#OPT#*)
		EstDisturbanceX : REAL; (*Estimated difference between TrolleyPosition and LoadPositionX without oscillations. Unit: [m].*) (* *) (*#CYC#OPT#*)
		EstLoadZ : ARRAY[0..2] OF REAL; (*Estimated load position, velocity and acceleration in the z-direction.*) (* *) (*#CYC#*)
		EstDeflectionAngleZ : REAL; (*Estimated angle of deflection in z-direction. Unit: [°].*) (* *) (*#CYC#OPT#*)
		EstDisturbanceZ : REAL; (*Estimated difference between GantryPosition and LoadPositionZ without oscillations. Unit: [m].*) (* *) (*#CYC#OPT#*)
		StateX : MTGntCraneObserverStateEnum; (*Indicates the state of the load observer in x-direction.*) (* *) (*#CMD#*)
		StateZ : MTGntCraneObserverStateEnum; (*Indicates the state of the load observer in z-direction.*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : MTGntCraneLoadObserverIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} FUNCTION_BLOCK MTGntCraneManualTrajectory (*Trajectory planning for a gantry crane.*) (*$GROUP=User*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTGntCraneManualTrajParType; (*Controller parameters.*) (* *) (*#PAR#*)
		Update : BOOL; (*The parameters are updated at rising edge of the input.*) (* *) (*#PAR#*)
		Configuration : MTGntCraneConfigurationType; (*Configuration parameters.*) (* *) (*#PAR#*)
		InitialLoadPosition : MTGntCraneCoordinatesType; (*Initial load position (x,y).*) (* *) (*#PAR#*)
		VelocityX : REAL; (*Desired load velocity in x-direction. Unit: [m/s].*) (* *) (*#CYC#*)
		VelocityY : REAL; (*Desired load velocity in y-direction. Unit: [m/s].*) (* *) (*#CYC#*)
		VelocityZ : REAL; (*Desired load velocity in z-direction. Unit: [m/s].*) (* *) (*#CYC#*)
		StartLoadX : ARRAY[0..4] OF REAL; (*Start values of coordinates of the load on the x-axis.*) (* *) (*#CMD#OPT#*)
		StartLoadY : ARRAY[0..4] OF REAL; (*Start values of coordinates of the load on the y-axis.*) (* *) (*#CMD#OPT#*)
		StartLoadZ : ARRAY[0..4] OF REAL; (*Start values of coordinates of the load on the z-axis.*) (* *) (*#CMD#OPT#*)
		SetStartValues : BOOL; (*Set specific startvalues for set load values.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occured during operation.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		SetLoadX : ARRAY[0..4] OF REAL; (*Set values of coordinates of the load on the x-axis.*) (* *) (*#CYC#*)
		SetLoadY : ARRAY[0..4] OF REAL; (*Set values of coordinates of the load on the y-axis.*) (* *) (*#CYC#*)
		SetLoadZ : ARRAY[0..4] OF REAL; (*Set values of coordinates of the load on the z-axis.*) (* *) (*#CYC#*)
		SetDeflectionAngleX : REAL; (*Predicted deflection angle in x-direction.*) (* *) (*#CYC#OPT#*)
		SetDeflectionAngleZ : REAL; (*Predicted deflection angle in z-direction.*) (* *) (*#CYC#OPT#*)
		MotionStateX : MTGntCraneMotionStateEnum; (*State of motion of x-direction.*) (* *) (*#CMD#OPT#*)
		MotionStateY : MTGntCraneMotionStateEnum; (*State of motion of y-direction.*) (* *) (*#CMD#OPT#*)
		MotionStateZ : MTGntCraneMotionStateEnum; (*State of motion of z-direction.*) (* *) (*#CMD#OPT#*)
		SetDone : BOOL; (*Setting the startvalues was successfully done.*) (* *) (*#CMD#OPT#*)
	END_VAR
	VAR
		Internal : MTGntCraneManualTrajIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} FUNCTION_BLOCK MTGntCraneSimulationModel (*Gantry crane 3D simulation model.*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL; (*FB is active as long as input is set.*) (* *) (*#PAR#*)
		Parameters : MTGntCraneSimModelParType; (*Parameters of simulation model.*) (* *) (*#PAR#*)
		Update : BOOL; (*The parameters are updated at rising edge of the input.*) (* *) (*#PAR#*)
		Configuration : MTGntCraneSimConfigType; (*Configuration parameters.*) (* *) (*#PAR#*)
		SetTrolleyVelocity : REAL; (*Set value of trolley velocity. Unit: [m/s].*) (* *) (*#CYC#*)
		SetTrolleyTorque : REAL; (*Set value of trolley torque (torque = force * 1m). Unit: [Nm].*) (* *) (*#CYC#OPT#*)
		SetHoistVelocity : REAL; (*Set value of hoist velocity. Unit: [m/s].*) (* *) (*#CYC#*)
		SetHoistTorque : REAL; (*Set value of hoist torque (torque = force * 1m). Unit: [Nm].*) (* *) (*#CYC#OPT#*)
		SetGantryVelocity : REAL; (*Set value of gavtry velocity. Unit: [m/s].*) (* *) (*#CYC#*)
		SetGantryTorque : REAL; (*Set value of gantry torque (torque = force * 1m). Unit: [Nm].*) (* *) (*#CYC#OPT#*)
		WindForce : MTGntCraneCoordinatesType; (*Force on load due to wind. Unit: [N].*) (* *) (*#CYC#OPT#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FB is active.*) (* *) (*#PAR#*)
		Error : BOOL; (*Error occured during operation.*) (* *) (*#PAR#*)
		StatusID : DINT; (*Status information.*) (* *) (*#PAR#*)
		UpdateDone : BOOL; (*Update of the parameters is successfully done.*) (* *) (*#PAR#*)
		ActTrolleyPosition : REAL; (*Actual trolley position. Unit: [m].*) (* *) (*#CYC#*)
		ActTrolleyVelocity : REAL; (*Actual trolley velocity. Unit: [m/s].*) (* *) (*#CYC#OPT#*)
		ActHoistLength : REAL; (*Actual hoist length. Unit: [m].*) (* *) (*#CYC#*)
		ActHoistVelocity : REAL; (*Actual hoist velocity. Unit: [m/s].*) (* *) (*#CYC#OPT#*)
		ActGantryPosition : REAL; (*Actual gantry position. Unit: [m].*) (* *) (*#CYC#*)
		ActGantryVelocity : REAL; (*Actual gantry velocity. Unit: [m/s].*) (* *) (*#CYC#OPT#*)
		ActLoadPosition : MTGntCraneCoordinatesType; (*Actual position of the load. Unit: [m].*) (* *) (*#CYC#*)
		ActLoadVelocity : MTGntCraneCoordinatesType; (*Actual velocity of the load. Unit: [m/s].*) (* *) (*#CYC#OPT#*)
	END_VAR
	VAR
		Internal : MTGntCraneSimModelIntType; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
