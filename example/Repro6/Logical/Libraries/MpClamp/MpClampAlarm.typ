
TYPE
    MpClampBasicAlarmEnum : 
        ( (* Alarms of MpClamp Basic *)
        mpCLAMP_ALM_PARAMETER_LIMITED := 0, (* The movement parameters have been limited due to configuration settings *)
        mpCLAMP_ALM_PROTECT_TIMEOUT := 1, (* The mold protection phase has timed out ({2:Timeout} s) *)
        mpCLAMP_ALM_PRELOCK_TIMEOUT := 2, (* The mold prelock step has timed out ({2:Timeout} s) (no feedback from ClampPreLocked pin) *)
        mpCLAMP_ALM_POSTUNLOCK_TIMEOUT := 3, (* The mold post unlock step has timed out ({2:Timeout} s) (no feedback from ClampPostUnlocked pin) *)
        mpCLAMP_ALM_MOLD_LOCKED_TIMEOUT := 4 (* The mold is locked *)
    );
END_TYPE
