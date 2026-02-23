
TYPE
    MpHalfNutErrorEnum : 
        ( (* Error numbers of library MpHalfNut *)
        mpHALFNUT_NO_ERROR := 0, (* No error *)
        mpHALFNUT_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpHALFNUT_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpHALFNUT_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpHALFNUT_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpHALFNUT_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpHALFNUT_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpHALFNUT_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpHALFNUT_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpHALFNUT_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpHALFNUT_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpHALFNUT_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpHALFNUT_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpHALFNUT_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpHALFNUT_WRN_PARAMETER_LIMITED := -2137754624, (* Set parameters are not valid [Warning: 29696, 0x80947400] *)
        mpHALFNUT_WRN_CONFIG_WAIT_IDLE := -2137754623, (* The configuration values will be updated as soon as no movement is active [Warning: 29697, 0x80947401] *)
        mpHALFNUT_WRN_PAR_WAIT_IDLE := -2137754622 (* The parameters will be updated as soon as no movement is active [Warning: 29698, 0x80947402] *)
        );
END_TYPE
