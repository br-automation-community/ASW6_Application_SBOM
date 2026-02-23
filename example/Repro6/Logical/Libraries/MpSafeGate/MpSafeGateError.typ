
TYPE
    MpSafeGateErrorEnum : 
        ( (* Error numbers of library MpSafeGate *)
        mpSAFEGATE_NO_ERROR := 0, (* No error *)
        mpSAFEGATE_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpSAFEGATE_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpSAFEGATE_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpSAFEGATE_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpSAFEGATE_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpSAFEGATE_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpSAFEGATE_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpSAFEGATE_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpSAFEGATE_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpSAFEGATE_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpSAFEGATE_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpSAFEGATE_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpSAFEGATE_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpSAFEGATE_WRN_OPEN_TIMEOUT := -2137730048, (* The open movement timed out [Warning: 54272, 0x8094d400] *)
        mpSAFEGATE_WRN_CLOSE_TIMEOUT := -2137730047 (* The close movement timed out [Warning: 54273, 0x8094d401] *)
        );
END_TYPE
