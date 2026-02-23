
TYPE
    MpInjUnitErrorEnum : 
        ( (* Error numbers of library MpInjUnit *)
        mpINJUNIT_NO_ERROR := 0, (* No error *)
        mpINJUNIT_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpINJUNIT_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpINJUNIT_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpINJUNIT_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpINJUNIT_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpINJUNIT_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpINJUNIT_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpINJUNIT_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpINJUNIT_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpINJUNIT_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpINJUNIT_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpINJUNIT_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpINJUNIT_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpINJUNIT_WRN_PARAMETER_LIMITED := -2137775104, (* The movement parameters have been limited due to configuration settings [Warning: 9216, 0x80942400] *)
        mpINJUNIT_WRN_CONFIG_WAIT_IDLE := -2137775103, (* The configuration values will be updated as soon as no movement is active [Warning: 9217, 0x80942401] *)
        mpINJUNIT_WRN_PAR_WAIT_IDLE := -2137775102, (* The parameters will be updated as soon as no movement is active [Warning: 9218, 0x80942402] *)
        mpINJUNIT_ERR_PROTECT_TIMEOUT := -1064033277 (* The nozzle protection phase has timed out ({2:Timeout} s) [Error: 9219, 0xc0942403] *)
        );
END_TYPE
