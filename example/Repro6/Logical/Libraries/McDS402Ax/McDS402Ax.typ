TYPE
   McDS402AxHomingParType : STRUCT
        HomingMode : McHomingModeEnum; (*The following homing modes are supported:*)
        Position : LREAL; (*Absolute position or homing offset when homing signal [Measurement units] occurs*)
        StartVelocity : REAL; (*Velocity for reference switch search [Measurement units/s]*)
        HomingVelocity : REAL; (*Velocity (after reaching reference switch) [Measurement units/s]*)
        Acceleration : REAL; (*Maximum acceleration [Measurement units/s]*)
        SwitchEdge : McDirectionEnum; (*Edge of reference switch*)
        StartDirection : McDirectionEnum; (*Start direction for searching the reference edge*)
        HomingDirection : McDirectionEnum; (*Direction for homing (after reaching reference switch) *)
        ReferencePulse : McSwitchEnum; (*The encoder's reference pulse is used for homing*)
        DriveSpecificHoming : McSwitchEnum; (*The drive-specific homing method entered on input "DriveSpecificHomingMode" is used*)
        DriveSpecificHomingMode : SINT; (*Used for selecting the drive-specific homing method*)
    END_STRUCT;

END_TYPE
