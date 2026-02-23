
TYPE
    MpEjectorErrorEnum : 
        ( (* Error numbers of library MpEjector *)
        mpEJECTOR_NO_ERROR := 0, (* No error *)
        mpEJECTOR_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpEJECTOR_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpEJECTOR_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpEJECTOR_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpEJECTOR_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpEJECTOR_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpEJECTOR_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpEJECTOR_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpEJECTOR_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpEJECTOR_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpEJECTOR_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpEJECTOR_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpEJECTOR_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpEJECTOR_WRN_PARAMETER_LIMITED := -2137742336, (* The movement parameters have been limited due to configuration settings [Warning: 41984, 0x8094a400] *)
        mpEJECTOR_WRN_CONFIG_WAIT_IDLE := -2137742335, (* The configuration values will be updated as soon as no movement is active [Warning: 41985, 0x8094a401] *)
        mpEJECTOR_WRN_PAR_WAIT_IDLE := -2137742334, (* The parameters will be updated as soon as no movement is active [Warning: 41986, 0x8094a402] *)
        mpEJECTOR_ERR_MOVE_NOT_ENABLED := -1064000509, (* The repetition movement has not been enabled [Error: 41987, 0xc094a403] *)
        mpEJECTOR_ERR_AXIS_ERROR := -1064000508, (* Axis error at {2:AxisName}. (ErrorCause {1:ErrorNumber}). [Error: 41988, 0xc094a404] *)
        mpEJECTOR_ERR_LIBRARY_MISSING := -1064000507, (* Library {2:LibName} is missing an the target. [Error: 41989, 0xc094a405] *)
        mpEJECTOR_ERR_COMMAND_INVALID := -1064000506 (* The selected command {2:Command} is invalid. [Error: 41990, 0xc094a406] *)
        );
END_TYPE
