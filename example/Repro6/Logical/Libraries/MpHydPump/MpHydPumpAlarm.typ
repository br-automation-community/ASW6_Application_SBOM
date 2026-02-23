
TYPE
    MpHydPumpAlarmEnum : 
        ( (* Alarms of MpHydPump Library *)
        mpHYDPUMP_ALM_PAR_INVALID := 0, (* The selected parameters are invalid. *)
        mpHYDPUMP_ALM_TUNING_FAILED := 1, (* The pressure controller auto tuning failed. *)
        mpHYDPUMP_ALM_TUNING_DONE := 2, (* The auto tuning is completed. *)
        mpHYDPUMP_ALM_PUMP_SWITCHED_OFF := 3, (* The command can not be applied, because '{&Name}' is switched off ! *)
        mpHYDPUMP_ALM_REVERSE_TURN := 4, (* The reverse turn protection of the pump has triggered. *)
        mpHYDPUMP_ALM_DRIVE_PROT := 5, (* The speed or torque of the drive is limited in order to protect it from being switched off prematurely. *)
        mpHYDPUMP_ALM_PUMP_PROT := 6, (* The torque of the drive is limited because the pump temperature is too high. *)
        mpHYDPUMP_ALM_CONFIG_NOT_SAVED := 7, (* Some configuration parameters were not saved. *)
        mpHYDPUMP_ALM_USED_PUMP := 8, (* The used pump '{&PumpName}' is not active. *)
        mpHYDPUMP_ALM_USED_VALVE := 9, (* The used valve '{&ValveName}' is not active. *)
        mpHYDPUMP_ALM_LOW_SPEED := 10, (* The pump has been rotating at low speed and high pressure for too long time. To protect the pump, the drive is powered off. *)
        mpHYDPUMP_ALM_PUMP_IN_EXT_USE := 11, (* The used pump '{&PumpName}' is already in external control. *)
        mpHYDPUMP_ALM_VALVE_IN_EXT_USE := 12 (* The used valve '{&ValveName}' is already in external control. *)
    );
END_TYPE
