
TYPE
    MpBackupErrorEnum : 
        ( (* Error numbers of library MpBackup *)
        mpBACKUP_NO_ERROR := 0, (* No error *)
        mpBACKUP_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xC0910001] *)
        mpBACKUP_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xC0910002] *)
        mpBACKUP_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xC0910003] *)
        mpBACKUP_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xC0910004] *)
        mpBACKUP_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xC0910005] *)
        mpBACKUP_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xC0910006] *)
        mpBACKUP_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xC0910008] *)
        mpBACKUP_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xC0910009] *)
        mpBACKUP_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xC091000A] *)
        mpBACKUP_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000B] *)
        mpBACKUP_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xC091000C] *)
        mpBACKUP_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xC091000D] *)
        mpBACKUP_ERR_INSTALL_FAILED := -1064159488, (* Installation of backup/update "{2:Name}" failed (ErrorCause: {1:ErrorNumber}) [Error: 14080, 0xC0923700] *)
        mpBACKUP_ERR_CREATE_FAILED := -1064159487, (* Creation of backup "{2:Name}" failed (ErrorCause: {1:ErrorNumber}) [Error: 14081, 0xC0923701] *)
        mpBACKUP_ERR_REQUEST_INFO_FAILED := -1064159486, (* Getting info of backup/update "{2:Name}" failed (ErrorCause: {1:ErrorNumber}) [Error: 14082, 0xC0923702] *)
        mpBACKUP_WRN_UPDATE_CHECK_FAILED := -2137901309 (* Update check failed (ErrorCause: {1:ErrorNumber}) [Warning: 14083, 0x80923703] *)
        );
END_TYPE
