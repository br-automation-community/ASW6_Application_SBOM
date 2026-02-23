
TYPE
    MpHydAxisAlarmEnum : 
        ( (* Alarms of MpHydAxis Library *)
        mpHYDAXIS_ALM_PAR_INVALID := 0, (* The selected parameters are invalid. *)
        mpHYDAXIS_ALM_ACTUATOR_INACTIVE := 1, (* The actuator '{&Actuator}' is not active. *)
        mpHYDAXIS_ALM_ACTUATOR_ERROR := 2, (* The actuator '{&Actuator}' is in error state. *)
        mpHYDAXIS_ALM_ACTUATOR_EXT_CTRL := 3, (* The actuator '{&Actuator}' is already in external control. *)
        mpHYDAXIS_ALM_CONFIG_NOT_SAVED := 4 (* The configuration parameter '{&ParName}' could not be saved. *)
    );
END_TYPE
