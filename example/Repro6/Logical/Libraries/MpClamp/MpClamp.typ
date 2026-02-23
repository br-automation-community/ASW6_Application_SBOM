(**********************************************************)
(********************** Enumerators ********************)
(**********************************************************)

TYPE
	MpClampLocationEnum : 
		( (*Location selection enumerator*)
		mpCLAMP_LOCATION_PISTON := 0, (*Position sensor is mounted at the piston*)
		mpCLAMP_LOCATION_PLATE := 1 (*Position sensor is mounted at the moving plate*)
		);
	MpClampToggleTypeEnum : 
		( (*Toggle types*)
		mpCLAMP_TOGGLE_TYPE_NO_TOGGLE := 0, (*No toggle used*)
		mpCLAMP_5_POINT_TOGGLE := 1, (*5 point toggle*)
		mpCLAMP_LINEARIZATION_TABLE := 2 (*Toggle geometry is handled by a linearization table*)
		);
	MpClampMechanicalTypeEnum : 
		( (*Mechanical types for axes*)
		mpCLAMP_MECH_TYPE_HYDRAULIC := 0, (*Axis is an hydraulic piston*)
		mpCLAMP_MECH_TYPE_ELECTRIC := 1 (*Axis is an electric servomotor*)
		);
	MpClampMoveTypeEnum : 
		( (*Movement types for axes*)
		mpCLAMP_MOVE_TYPE_SETUP := 0, (*Movement in setup mode (axis will use the defined speed and force)*)
		mpCLAMP_MOVE_TYPE_NORMAL := 1, (*Movement in manual or (semi-)automatic mode (axis will follow the profile)*)
		mpCLAMP_MOVE_TYPE_MOLD_HEIGHT := 2 (*Movement in mold height adjustment mode (axis will use movement parameters from configuration)*)
		);
	MpClampStateEnum : 
		( (*State information*)
		mpCLAMP_STATE_UNDEFINED := 0, (*Axis status is not defined *)
		mpCLAMP_STATE_CLOSE_END_POSITION := 1, (*Axis is in negative end position *)
		mpCLAMP_STATE_CLOSE_STP_POSITION := 2, (*Axis is in negative stop position *)
		mpCLAMP_STATE_CLOSE_MOVEMENT := 3, (*Axis moves in negative direction *)
		mpCLAMP_STATE_OPEN_END_POSITION := 4, (*Axis is in positive end position *)
		mpCLAMP_STATE_OPEN_STP_POSITION := 5, (*Axis is in positive stop position *)
		mpCLAMP_STATE_OPEN_MOVEMENT := 6 (*Axis moves in positive direction *)
		);
	MpClampConditionEnum : 
		( (*Unlock end condition types*)
		mpCLAMP_CONDITION_FORCE := 0, (*Force based end*)
		mpCLAMP_CONDITION_POSITION := 1, (*Position based end*)
		mpCLAMP_CONDITION_SWITCH := 2 (*End based on unlocked input signal*)
		);
	MpClampLockConditionEnum : 
		( (*Unlock end condition types*)
		mpCLAMP_LOCKCOND_FORCE := 0, (*Force based end*)
		mpCLAMP_LOCKCOND_SWITCH := 1 (*End based on locked input signal*)
		);
END_TYPE

(**********************************************************)
(*Electric*)

TYPE
	MpClampMotionSystemTypeEnum : 
		( (*Type of the motion system*)
		mpCLAMP_MOTION_SYS_MAPP := 0 (*Motion system used is mappMotion*)
		);
	MpClampAxisHomingTypeEnum : 
		( (*Homing type*)
		mpCLAMP_HOME_NOT_USED := 0, (*Homing not used*)
		mpCLAMP_HOME_ABS_CORRECTION := 1, (*Homing by setting the homing position as offset for an absolute encoder with counter range correction*)
		mpCLAMP_HOME_DIRECT := 2 (*Direct homing. Homing position is used directly as the new axis position.*)
		);
END_TYPE

(**********************************************************)
(*Hydraulic*)

TYPE
	MpClampValveTypeEnum : 
		( (*Valve types*)
		mpCLAMP_VALVE_TYPE_DIRECT := 0, (*Directional valves*)
		mpCLAMP_VALVE_TYPE_SERVO := 1, (*Servo valve*)
		mpCLAMP_VALVE_TYPE_PROP := 2 (*Proportional valve*)
		);
END_TYPE

(**********************************************************)
(*************** Configuration structure ***************)
(**********************************************************)
(*Common*)

TYPE
	MpClampEToggleSettingsType : 	STRUCT  (*Toggle usage settings*)
		PositionInput : MpClampLocationEnum := mpCLAMP_LOCATION_PISTON; (*Position input source from visualization*)
		ToggleMechanics : MpClampToggleMechanicsType; (*Toggle linearization data*)
	END_STRUCT;
	MpClampToggleSettingsType : 	STRUCT  (*Toggle usage settings*)
		PositionMeasurement : MpClampLocationEnum := mpCLAMP_LOCATION_PISTON; (*Position source of input signal (mounting point of measurement system)*)
		PositionInput : MpClampLocationEnum := mpCLAMP_LOCATION_PISTON; (*Position input source from visualization*)
		ToggleMechanics : MpClampToggleMechanicsType; (*Toggle linearization data*)
	END_STRUCT;
	MpClampToggleMechanicsType : 	STRUCT  (*Toggle mechanical parameters*)
		Type : MpClampToggleTypeEnum := mpCLAMP_5_POINT_TOGGLE; (*Toggle Type*)
		FivePointToggle : MpClamp5PointToggleType; (*Five point toggle geometric data*)
		LinearTable : MpClampToggleLinTableType; (*Lookup table data*)
	END_STRUCT;
	MpClampToggleLinTableType : 	STRUCT  (*5 point toggle geometric data*)
		PistonPosition : ARRAY[0..199]OF REAL := [200(0)]; (*ToggleGeometry A [mm]*)
		PlatePosition : ARRAY[0..199]OF REAL := [200(0)]; (*ToggleGeometry B [mm]*)
		NumberOfNodes : UINT := 5; (*Number of used nodes*)
	END_STRUCT;
	MpClamp5PointToggleType : 	STRUCT  (*5 point toggle geometric data*)
		A : REAL := 167.3; (*ToggleGeometry A [mm]*)
		B : REAL := 198.86; (*ToggleGeometry B [mm]*)
		H : REAL := 224.4; (*ToggleGeometry H [mm]*)
		L1 : REAL := 351; (*ToggleGeometry L1 [mm]*)
		L : REAL := 468; (*ToggleGeometry L [mm]*)
		D : REAL := 77.5; (*ToggleGeometry D [mm]*)
		Beta : REAL := 0.19739; (*ToggleGeometry Beta [mm]*)
	END_STRUCT;
	MpClampCloseVelocityType : 	STRUCT  (*Toggle Close Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s]*)
		ProtectMaximum : REAL := 50; (*Max. velocity for mold protection [mm/s]*)
		LockMaximum : REAL := 100; (*Max. velocity mold locking [mm/s]*)
		MoldHeightAdjust : REAL := 20; (*Velocity for mold height adjustment (Tonnage Search) [mm/s]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		EndDeceleration : REAL := 2000.0; (*Flow end deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
	MpClampOpenVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode velocity [mm/s]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		EndDeceleration : REAL := 2000.0; (*Flow end deceleration [mm/s²]*)
		DeadTimeCompensation : REAL := 0; (*Dead time compensation [s]*)
		JoltTime : REAL := 0.0; (*Jolt time for profile generator [s]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Electric*)

TYPE
	MpClampBasicEConfigType : 	STRUCT  (*Clamp configuration parameters*)
		MechanicalType : MpClampMechanicalTypeEnum := mpCLAMP_MECH_TYPE_HYDRAULIC;
		MotionSystem : MpClampMotionSystemType; (*Type of the motion system*)
		InputSignals : MpClampEInputSignalsType; (*Input signal variables*)
		OutputSignals : MpClampEOutputSignalsType; (*Output signal variables*)
		MaxPosition : REAL := 200; (*Maximum stroke of axis [mm]*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		MoldLockedTimeout : REAL := 0.0; (*Mold locked monitoring time [s], disabled if 0*)
		ToggleClamp : BOOL := TRUE; (*Clamp has toggle mechanics*)
		ToggleSettings : MpClampToggleSettingsType; (*Toggle usage settings*)
		Open : MpClampEOpenConfigType; (*Configuration parameters for open (positive) direction movement*)
		Close : MpClampECloseConfigType; (*Configuration parameters for close (negative) direction movement*)
		Lock : MpClampLockConfigType; (*Configuration parameters for lock movement*)
		Unlock : MpClampUnlockConfigType; (*Configuration parameters for unlock movement*)
		PostUnlock : MpClampPostUnlockCfgType; (*Configuration parameters for postlock movement*)
		PreLock : MpClampPreLockConfigType; (*Configuration parameters for prelock movement*)
	END_STRUCT;
	MpClampEInputSignalsType : 	STRUCT  (*Clamp input signals*)
		PrepareAxis : STRING[255]; (*String with name of process variable to power on the axis*)
		HomingPosition : STRING[255]; (*String with name of process variable to define the absolute correction homing offset or direct homing position*)
		CurrentForce : STRING[255]; (*Datapoint containing current force*)
		CurrentLockingPosition : STRING[255]; (*Datapoint containing current locking position (for direct hybrid clamp)*)
		Unlocked : STRING[255]; (*Datapoint connected to unlocked state (for direct hybrid clamp)*)
		Locked : STRING[255]; (*Datapoint connected to locked state (for direct hybrid clamp)*)
		PreLockEnd : STRING[255]; (*Datapoint connected to PreLock final position state (for direct hybrid clamp)*)
		PostUnlockEnd : STRING[255]; (*Datapoint connected to PostUnlock final position state (for direct hybrid clamp)*)
	END_STRUCT;
	MpClampEOutputSignalsType : 	STRUCT  (*Clamp output signals*)
		AxisReady : STRING[255]; (*String with name of process varialbe to get the axis ready status*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity (for direct hybrid clamp)*)
		SetForce : STRING[255]; (*Datapoint that gets the set force (for direct hybrid clamp)*)
		LockValve : STRING[255]; (*Datapoint for lock valve signal (for direct hybrid clamp)*)
		UnLockValve : STRING[255]; (*Datapoint for unlock valve signal (for direct hybrid clamp)*)
		PreLockValve : STRING[255]; (*Datapoint for pre lock valve signal (for direct hybrid clamp)*)
		PostUnLockValve : STRING[255]; (*Datapoint for post unlock valve signal (for direct hybrid clamp)*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set (for direct hybrid clamp)*)
	END_STRUCT;
	MpClampEOpenConfigType : 	STRUCT  (*Clamp configuration parameters for positive direction*)
		VelocityProfileLimits : MpClampOpenVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampEOpenForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]. In case of a toggle clamp, coordinate system of selected 'Position measurement' source is used*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
	END_STRUCT;
	MpClampEOpenForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [Nm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [Nm]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [Nm/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [Nm/s]*)
	END_STRUCT;
	MpClampECloseForceType : 	STRUCT  (*Toggle Close Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force of axis [Nm]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [Nm]*)
		ProtectMaximum : REAL := 50; (*Max. force for mold protection [Nm]*)
		LockMaximum : REAL := 100; (*Max. force mold locking [Nm]*)
		MoldHeightAdjust : REAL := 20; (*Force for mold height adjustment - Zero Point Tonnage Search [Nm]*)
		Acceleration : REAL := 2000.0; (*Force acceleration [Nm/s]*)
		Deceleration : REAL := 2000.0; (*Force deceleration [Nm/s]*)
	END_STRUCT;
	MpClampECloseConfigType : 	STRUCT  (*Clamp configuration parameters for negative direction*)
		VelocityProfileLimits : MpClampCloseVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampECloseForceType; (*Force settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]. In case of a toggle clamp, coordinate system of selected 'Position measurement' source is used*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		UseLockedSwitch : BOOL := FALSE; (*Enable the usage of the locked input signal for the close direction of the toggle clamp*)
	END_STRUCT;
	MpClampMotionSystemType : 	STRUCT  (*Motion type definition*)
		Type : MpClampMotionSystemTypeEnum := mpCLAMP_MOTION_SYS_MAPP; (*Type of the motion system used*)
		AxisReference : STRING[255]; (*String with axis  name*)
		AxisPreparation : MpClampAxisPreparationType; (*Settings for the axis preparation*)
	END_STRUCT;
	MpClampAxisPreparationType : 	STRUCT  (*Settings for the axis preparation*)
		Power : MpClampAxisPrepPowerType; (*Settings for powering the axis during preparation*)
		Home : MpClampAxisPrepHomeType; (*Settings for homing the axis during preparation*)
	END_STRUCT;
	MpClampAxisPrepPowerType : 	STRUCT  (*Power the axis during preparation*)
		Enable : BOOL := TRUE; (*Enable powering the axis during preparation*)
	END_STRUCT;
	MpClampAxisPrepHomeType : 	STRUCT  (*Home the axis during preparation*)
		Type : MpClampAxisHomingTypeEnum := mpCLAMP_HOME_ABS_CORRECTION; (*Select type of homing during preparation*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(*Hydraulic*)

TYPE
	MpClampBasicHConfigType : 	STRUCT  (*Direct Clamp configuration parameters*)
		MaxPosition : REAL := 200; (*Maximum stroke of axis [mm]*)
		VelocityFilterTime : REAL := 0.01; (*Velocity filter time [s]*)
		MoldLockedTimeout : REAL := 0.0; (*Mold locked monitoring time [s], disabled if 0*)
		EnableAccelerationOverride : BOOL := FALSE; (*Enable the usage of the acceleration override*)
		InputSignals : MpClampInputSignalsType; (*Input signal variables*)
		OutputSignals : MpClampOutputSignalsType; (*Output signal variables*)
		ValveSettings : MpClampValveSettingsType; (*Valve settings and linearization*)
		ToggleClamp : BOOL := TRUE; (*Clamp has toggle mechanics*)
		ToggleSettings : MpClampToggleSettingsType; (*Toggle usage settings*)
		Open : MpClampOpenConfigType; (*Configuration parameters for open (positive) direction movement*)
		Close : MpClampCloseConfigType; (*Configuration parameters for close (negative) direction movement*)
		Lock : MpClampLockConfigType; (*Configuration parameters for lock movement*)
		Unlock : MpClampUnlockConfigType; (*Configuration parameters for unlock movement*)
		PostUnlock : MpClampPostUnlockCfgType; (*Configuration parameters for postlock movement*)
		PreLock : MpClampPreLockConfigType; (*Configuration parameters for prelock movement*)
		MechanicalType : MpClampMechanicalTypeEnum := mpCLAMP_MECH_TYPE_HYDRAULIC;
	END_STRUCT;
	MpClampCloseForceType : 	STRUCT  (*Toggle Close Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force of axis [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		ProtectMaximum : REAL := 50; (*Max. force for mold protection [bar]*)
		LockMaximum : REAL := 100; (*Max. force mold locking [bar]*)
		MoldHeightAdjust : REAL := 20; (*Force for mold height adjustment - Zero Point Tonnage Search [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 2000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 2000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpClampOpenForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		SetupModeMaximum : REAL := 50; (*Maximum setting mode force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
	MpClampInputSignalsType : 	STRUCT  (*Input signal variables*)
		CurrentPosition : STRING[255]; (*Datapoint containing current position*)
		CurrentForce : STRING[255]; (*Datapoint containing current force*)
		CurrentLockingPosition : STRING[255]; (*Datapoint containing current locking position*)
		Unlocked : STRING[255]; (*Datapoint connected to unlocked state*)
		Locked : STRING[255]; (*Datapoint connected to locked state*)
		PreLockEnd : STRING[255]; (*Datapoint connected to PreLock final position state*)
		PostUnlockEnd : STRING[255]; (*Datapoint connected to PostUnlock final position state*)
	END_STRUCT;
	MpClampOutputSignalsType : 	STRUCT  (*Output signal variables*)
		SetVelocity : STRING[255]; (*Datapoint that gets the set velocity*)
		SetForce : STRING[255]; (*Datapoint that gets the set force*)
		OpenValve : STRING[255]; (*Datapoint for open valve signal*)
		CloseValve : STRING[255]; (*Datapoint for close valve signal*)
		LockValve : STRING[255]; (*Datapoint for lock valve signal*)
		UnLockValve : STRING[255]; (*Datapoint for unlock valve signal*)
		PreLockValve : STRING[255]; (*Datapoint for pre lock valve signal*)
		PostUnLockValve : STRING[255]; (*Datapoint for post unlock valve signal*)
		OpenFastValve : STRING[255]; (*Datapoint for open fast valve signal*)
		CloseFastValve : STRING[255]; (*Datapoint for close fast valve signal*)
		ValveSignal : STRING[255]; (*Datapoint for proportional / servo valve valve signal*)
		OpenBackForceValve : STRING[255]; (*Datapoint for open backforce valve signal*)
		ServoPumpParameterSet : STRING[255]; (*Datapoint for servo pump parameter set*)
	END_STRUCT;
	MpClampValveSettingsType : 	STRUCT  (*Valve settings*)
		ValveType : MpClampValveTypeEnum := mpCLAMP_VALVE_TYPE_PROP; (*Valve type (e.g. digital, proportional, ...)*)
		ValveLinearization : MpClampValveLinearizationType; (*Valve linearization data*)
	END_STRUCT;
	MpClampValveLinearizationType : 	STRUCT  (*Valve linearization data*)
		ValveSignals : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Valve signal (output) [%]*)
		CylinderVelocities : ARRAY[0..49]OF REAL := [-100,0,100,47(0.0)]; (*Cylinder velocities (input) [mm/s]*)
		NumberOfNodes : USINT := 3; (*Number of used nodes*)
	END_STRUCT;
	MpClampCloseConfigType : 	STRUCT  (*Clamp configuration parameters for negative direction*)
		VelocityProfileLimits : MpClampCloseVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampCloseForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		FastValve : MpClampValveType; (*Fast movement (differential) valve settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]. In case of a toggle clamp, coordinate system of selected 'Position measurement' source is used*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
		UseLockedSwitch : BOOL := FALSE; (*Enable the usage of the locked input signal for the close direction of the toggle clamp*)
	END_STRUCT;
	MpClampUnlockConfigType : 	STRUCT 
		Enable : BOOL := FALSE; (*Stands if this functionality is enabled*)
		VelocityProfileLimits : MpClampVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpClampPostUnlockCfgType : 	STRUCT 
		Enable : BOOL := FALSE; (*Stands if this functionality is enabled*)
		VelocityProfileLimits : MpClampVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpClampPreLockConfigType : 	STRUCT 
		Enable : BOOL := FALSE; (*Stands if this functionality is enabled*)
		VelocityProfileLimits : MpClampVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpClampLockConfigType : 	STRUCT 
		Enable : BOOL := FALSE; (*Stands if this functionality is enabled*)
		VelocityProfileLimits : MpClampVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpClampOpenConfigType : 	STRUCT  (*Clamp configuration parameters for positive direction*)
		VelocityProfileLimits : MpClampOpenVelocityType; (*Velocity settings*)
		ForceProfileLimits : MpClampOpenForceType; (*Force settings*)
		ServoPumpParameterSet : USINT := 0; (*Servo Pump controller parameter set selection [0..9]*)
		FastValve : MpClampValveType; (*Fast movement (differential) valve settings*)
		BackForceValve : MpClampValveType; (*Back force valve settings*)
		PositionTolerance : REAL := 0; (*Position tolerance for end detection [mm]. In case of a toggle clamp, coordinate system of selected 'Position measurement' source is used*)
		TimeTolerance : REAL := 0.0; (*Time tolerance [s]*)
		Delay : MpClampDelayType; (*Hydraulic delay settings*)
	END_STRUCT;
	MpClampValveType : 	STRUCT  (*Valve configuration settings*)
		Enable : BOOL := FALSE; (*Valve enable settings*)
		SwitchOn : MpClampValveSwitchType; (*Valve On criteria settings*)
		SwitchOff : MpClampValveSwitchType; (*Valve Off criteria settings*)
	END_STRUCT;
	MpClampValveSwitchType : 	STRUCT  (*Valve criteria settings*)
		ProfileStep : USINT := 0; (*Profile step index*)
		DelayTime : REAL := 0.0; (*Delay time [s]*)
	END_STRUCT;
	MpClampDelayType : 	STRUCT  (*Hydraulic delay settings*)
		ValveOn : REAL := 0.0; (*Valve on delay time [s]*)
		Velocity : REAL := 0.0; (*Velocity (flow) delay time [s]*)
		Force : REAL := 0.0; (*Force delay time [s]*)
		ValveOff : REAL := 0.0; (*Valve off delay time [s]*)
		AfterMove : REAL := 0.0; (*Delay time to end the movement [s]*)
		VelocityDuringDelay : REAL := 0; (*Velocity during velocity delay [mm/s]*)
		ForceDuringDelay : REAL := 0; (*Force during force delay [bar]*)
	END_STRUCT;
	MpClampVelocityType : 	STRUCT  (*Velocity configuration settings*)
		Maximum : REAL := 100; (*Maximum velocity of axis [mm/s]*)
		Acceleration : REAL := 2000.0; (*Flow acceleration [mm/s²]*)
		Deceleration : REAL := 2000.0; (*Flow deceleration [mm/s²]*)
		JoltTime : REAL := 0.0; (*Jolt time for the movement profile [s]*)
	END_STRUCT;
	MpClampForceType : 	STRUCT  (*Force configuration settings*)
		Maximum : REAL := 100; (*Maximum force [bar]*)
		PumpForceOffset : REAL := 0; (*Pump force offset [bar]*)
		Acceleration : REAL := 5000.0; (*Force acceleration [bar/s]*)
		Deceleration : REAL := 5000.0; (*Force deceleration [bar/s]*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(******************* Parameter structure **************)
(**********************************************************)

TYPE
	MpClampBasicParType : 	STRUCT  (*Direct clamp parameters*)
		OpenProfile : MpClampMoveProfileType := (Position:=[200,9(0.0)]); (*Positive direction movement profile parameters*)
		CloseProfile : MpClampMoveProfileType; (*Negative direction movement profile parameters*)
		ProtectProfile : MpClampProtectProfileType; (*Mold protection movement profile parameters*)
		PostUnlockProfile : MpClampPreLockProfileType; (*Mold postlock movement profile parameters*)
		PreLockProfile : MpClampPreLockProfileType; (*Mold prelock movement profile parameters*)
		UnlockProfile : MpClampUnlockProfileType; (*Mold unlock movement profile parameters*)
		LockProfile : MpClampLockProfileType; (*Mold lock movement profile parameters*)
		SetupMode : MpClampSetupModeType; (*Setup mode parameters*)
	END_STRUCT;
	MpClampProtectProfileType : 	STRUCT  (*Mold protection parameters*)
		Timeout : REAL := 0.0; (*Timeout for mold protection step [s]*)
		Velocity : REAL := 20; (*Set Velocity for mold protection [mm/s]*)
		Force : REAL := 20; (*Set Force for mold protection [bar / Nm]*)
		Position : REAL := 20; (*Set Position for mold protection end [mm]*)
	END_STRUCT;
	MpClampPreLockProfileType : 	STRUCT  (*Mold lock parameters*)
		Velocity : REAL := 100; (*Set Velocity for mold movement [mm/s]*)
		Force : REAL := 100; (*Set Force for mold movement [bar]*)
		Timeout : REAL := 0.0; (*Step timeout, after this time movement will stop [s]*)
		AccelerationOverride : REAL := 100; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpClampUnlockProfileType : 	STRUCT  (*Mold lock parameters*)
		UnlockCondition : MpClampConditionEnum := mpCLAMP_CONDITION_FORCE; (*Unlock end condition*)
		Velocity : REAL := 100; (*Set Velocity for mold unlock [mm/s]*)
		Force : REAL := 100; (*Set Force for mold unlock [bar]*)
		ForceLimit : REAL := 10; (*Force limit point, after reaching this point unlocking movement ends (if selected in configuration) [bar]*)
		Position : REAL := 100; (*End position point, after reaching this point unlocking movement ends  (if selected in configuration) [mm]*)
		AccelerationOverride : REAL := 100; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpClampLockProfileType : 	STRUCT  (*Mold lock parameters*)
		Velocity : REAL := 100; (*Set Velocity for mold lock [mm/s]*)
		Force : REAL := 100; (*Set Force for mold lock [bar / Nm]*)
		ForceHoldOnTime : REAL := 0.0; (*Force hold on time [s], for this time current force needs to be above force limit*)
		ForceLimit : REAL := 99; (*Clamp locking force limit point, after reaching this point hold on timer starts*)
		Position : REAL := 0; (*Set Position for mold lock end [mm]*)
		AccelerationOverride : REAL := 100; (*Override for acceleration / deceleration [%]*)
		LockCondition : MpClampLockConditionEnum := (0); (*Lock end condition*)
	END_STRUCT;
	MpClampMoveProfileType : 	STRUCT  (*Profile settings for each direction*)
		Velocity : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set Velocity for each direction, profile steps [mm/s]*)
		Force : ARRAY[0..9]OF REAL := [50,9(0.0)]; (*Set Force for each direction, profile steps [bar / Nm]*)
		Position : ARRAY[0..9]OF REAL; (*Set Position for profile steps in each direction [mm]*)
		AccelerationOverride : ARRAY[0..9]OF REAL := [10(100)]; (*Override for acceleration / deceleration [%]*)
	END_STRUCT;
	MpClampSetupModeMoveProfileType : 	STRUCT  (*Profile settings for each direction in setting mode*)
		Velocity : REAL := 20; (*Setting mode velocity for each direction [mm/s]*)
		Force : REAL := 20; (*Setting mode force for each direction [bar / Nm]*)
	END_STRUCT;
	MpClampSetupModeType : 	STRUCT  (*Setting mode parameters*)
		OpenProfile : MpClampSetupModeMoveProfileType; (*Settings for setting mode positive direction*)
		CloseProfile : MpClampSetupModeMoveProfileType; (*Settings for setting mode negative direction*)
	END_STRUCT;
END_TYPE

(**********************************************************)
(********************** Info structure *******************)
(**********************************************************)

TYPE
	MpClampBasicInfoType : 	STRUCT  (*Toggle clamp info structure*)
		StepOpen : USINT; (*Current profile step in open direction*)
		StepClose : USINT; (*Current profile step in close direction*)
		Cylinder : MpClampMeasurementType; (*Cylinder information*)
		Plate : MpClampMeasurementType; (*Plate information*)
		State : MpClampStateEnum; (*Axis status information*)
		Diag : MpClampDiagType; (*Diagnosis information*)
		Torque : REAL; (*Current axis torque [Nm] (not used in hydraulic mode)*)
		InTorqueLimitation : BOOL; (*The torque limitation is active (not used in hydraulic mode)*)
	END_STRUCT;
	MpClampInfoType : 	STRUCT  (*Toggle clamp config info structure*)
		Diag : MpClampDiagType; (*Diagnosis information*)
	END_STRUCT;
	MpClampMeasurementType : 	STRUCT 
		Position : REAL; (*Current position [mm]*)
		Velocity : REAL; (*Current axis velocity [mm/s]*)
		MinPosition : REAL; (*Minimum position [mm]*)
		MaxPosition : REAL; (*Maximum position [mm]*)
		MaxVelocity : REAL; (*Maximum velocity [mm/s]*)
	END_STRUCT;
	MpClampDiagType : 	STRUCT  (*MpClamp diagnosis information*)
		StatusID : MpClampStatusIDType; (*Segmented StatusID output*)
	END_STRUCT;
	MpClampStatusIDType : 	STRUCT  (*MpClamp status ID information*)
		ID : MpClampErrorEnum; (*StatusID as enumerator*)
		Severity : MpComSeveritiesEnum; (*Severity of the error*)
	END_STRUCT;
END_TYPE
