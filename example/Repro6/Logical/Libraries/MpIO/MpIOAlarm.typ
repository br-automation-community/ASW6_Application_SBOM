
TYPE
    MpIOAlarmEnum : 
        ( (* Alarms of MpIO *)
        mpIO_ALM_IMPORT_FAILED := 0, (* Importing hardware-configuration has failed *)
        mpIO_ALM_IMPORT_DONE := 1, (* New hardware-configuration was imported *)
        mpIO_ALM_CONFIG_CHANGED := 2 (* (Externally) Changed hardware-configuration detected *)
    );
END_TYPE
