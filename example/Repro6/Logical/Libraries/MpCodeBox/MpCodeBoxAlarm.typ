
TYPE
    MpCodeboxAlarmEnum : 
        ( (* Alarms of MpCodeBox *)
        mpCODEBOX_ALM_IMPORT_FAILED := 0, (* Import of program or macro has failed (invalid signature) *)
        mpCODEBOX_ALM_START_FAILED := 1, (* Starting a program has failed (syntax or runtime error) *)
        mpCODEBOX_ALM_EXECUTION_FAILED := 2 (* Execution of a program failed due to a runtime-error *)
    );
END_TYPE
