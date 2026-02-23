
TYPE
    MpCorePullErrorEnum : 
        ( (* Error numbers of library MpCorePull *)
        mpCOREPULL_NO_ERROR := 0, (* No error *)
        mpCOREPULL_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpCOREPULL_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpCOREPULL_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpCOREPULL_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpCOREPULL_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpCOREPULL_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpCOREPULL_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpCOREPULL_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpCOREPULL_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpCOREPULL_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpCOREPULL_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpCOREPULL_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpCOREPULL_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpCOREPULL_WRN_PAR_LIMITED := -2137771520, (* The movement parameters have been limited due to configuration settings [Warning: 12800, 0x80943200] *)
        mpCOREPULL_ERR_IN_TIMEOUT := -1064029695, (* The core in movement has timed out ({2:Timeout} s) (no end condition met in time) [Error: 12801, 0xc0943201] *)
        mpCOREPULL_ERR_OUT_TIMEOUT := -1064029694, (* The core out movement has timed out ({2:Timeout} s) (no end condition met in time) [Error: 12802, 0xc0943202] *)
        mpCOREPULL_WRN_CONFIG_WAIT_IDLE := -2137771517, (* The configuration values will be updated as soon as no movement is active [Warning: 12803, 0x80943203] *)
        mpCOREPULL_WRN_PAR_WAIT_IDLE := -2137771516 (* The parameters will be updated as soon as no movement is active [Warning: 12804, 0x80943204] *)
        );
END_TYPE
