
TYPE
    MpSequenceAlarmEnum : 
        ( (* Alarms of MpSequence *)
        mpSEQUENCE_ALM_IMPORT_SEQUENCE := 0, (* Sequence import failed *)
        mpSEQUENCE_ALM_EXPORT_SEQUENCE := 1, (* Sequence export failed *)
        mpSEQUENCE_ALM_TIMEOUT := 2, (* A timeout was triggered during the sequence execution *)
        mpSEQUENCE_ALM_INTERLOCK := 3, (* An interlock condition was not fulfilled *)
        mpSEQUENCE_ALM_ACTUATOR_BLOCKED := 4 (* An actuator is not available due to a parallel movement *)
    );
END_TYPE
