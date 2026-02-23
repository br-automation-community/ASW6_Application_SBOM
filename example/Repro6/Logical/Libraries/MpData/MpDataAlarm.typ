
TYPE
    MpDataRecorderAlarmEnum : 
        ( (* Alarms of MpData *)
        mpDATA_ALM_RECORDING_ABORTED := 0, (* Recording has been aborted due to error in data recorder *)
        mpDATA_ALM_LIMIT_VIOLATED := 1 (* Value of a registered PV has violated limits *)
    );
END_TYPE
