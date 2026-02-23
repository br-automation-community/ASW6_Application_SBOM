
TYPE
    MpInjectErrorEnum : 
        ( (* Error numbers of library MpInject *)
        mpINJECT_NO_ERROR := 0, (* No error *)
        mpINJECT_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpINJECT_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpINJECT_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpINJECT_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpINJECT_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpINJECT_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpINJECT_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpINJECT_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpINJECT_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpINJECT_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpINJECT_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpINJECT_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpINJECT_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpINJECT_WRN_PARAMETER_LIMITED := -2137734144, (* The movement parameters have been limited due to configuration settings [Warning: 50176, 0x8094c400] *)
        mpINJECT_WRN_CONFIG_WAIT_IDLE := -2137734143, (* The configuration values will be updated as soon as no movement is active [Warning: 50177, 0x8094c401] *)
        mpINJECT_WRN_PAR_WAIT_IDLE := -2137734142, (* The parameters will be updated as soon as no movement is active [Warning: 50178, 0x8094c402] *)
        mpINJECT_INF_WAIT_INJECT_FB := 1083491331, (* The component is waiting for an injection block to become active [Informational: 50179, 0x4094c403] *)
        mpINJECT_WRN_MOVEMENT_ACTIVE := -2137734139, (* Another movement is currently active [Warning: 50180, 0x8094c404] *)
        mpINJECT_ERR_AXIS_ERROR := -1063992314, (* Axis error at {2:AxisName}. (ErrorCause {1:ErrorNumber}). [Error: 50181, 0xc094c405] *)
        mpINJECT_ERR_CONTROLLER := -1063992313, (* The pressure/speed controller has an error. [Error: 50182, 0xc094c406] *)
        mpINJECT_ERR_LIBRARY_MISSING := -1063992312, (* Library {2:LibName} is missing an the target. [Error: 50183, 0xc094c407] *)
        mpINJECT_ERR_COMMAND_INVALID := -1063992311 (* The selected command {2:Command} is invalid. [Error: 50184, 0xc094c408] *)
        );
END_TYPE
