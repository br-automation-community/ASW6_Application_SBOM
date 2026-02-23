
TYPE
    MpTempAlarmEnum : 
        ( (* Alarms of MpTemp Library *)
        mpTEMP_ALM_PAR_INVALID := 0, (* The selected parameters are invalid *)
        mpTEMP_ALM_COMMAND_INVALID := 1, (* The command is invalid *)
        mpTEMP_ALM_TUNING_FAILED := 2, (* The tuning failed *)
        mpTEMP_ALM_TUNING_DONE := 3, (* The tuning is completed *)
        mpTEMP_ALM_OUTSIDE_TOLERANCE := 4, (* The actual temperature is outside the tolerance (add. Info: actual temperature) (add. Info: setpoint temperature) *)
        mpTEMP_ALM_AVG_CURRENT_OUTSIDE := 5, (* The measured current lies not within the specified tolerance band *)
        mpTEMP_ALM_MAX_CURRENT_EXCEEDED := 6 (* The measured current exceeded the maximum limit *)
    );
END_TYPE
