
TYPE
    MpScaleErrorEnum : 
        ( (* Error numbers of library MpScale *)
        mpSCALE_NO_ERROR := 0, (* No error *)
        mpSCALE_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpSCALE_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpSCALE_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpSCALE_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpSCALE_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpSCALE_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpSCALE_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpSCALE_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpSCALE_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpSCALE_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpSCALE_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpSCALE_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpSCALE_WRN_PARAMETER_LIMITED := -2137758720, (* The scaling parameters have been limited [Warning: 25600, 0x80946400] *)
        mpSCALE_WRN_POS_LIMITED_MAX := -2137758719, (* The scaled position is limited to maximum [Warning: 25601, 0x80946401] *)
        mpSCALE_WRN_POS_LIMITED_MIN := -2137758718 (* The scaled position is limited to minimum [Warning: 25602, 0x80946402] *)
        );
END_TYPE
