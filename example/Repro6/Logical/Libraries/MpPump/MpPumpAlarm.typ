
TYPE
    MpPumpBasicAlarmEnum : 
        ( (* Alarms of MpPump Basic *)
        mpPUMP_ALM_MEASUREMENT_TIMEOUT := 0, (* Automatic measurement fail, input value is not stable (Timeout {2: timeout}) *)
        mpPUMP_ALM_MEASUREMENT_FAILED := 1 (* Automatic measurement fail, cannot check input value stability (Error Cause: {1: StatusID}) *)
    );
END_TYPE
