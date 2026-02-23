
TYPE
    MpMHeightErrorEnum : 
        ( (* Error numbers of library MpMHeight *)
        mpMHEIGHT_NO_ERROR := 0, (* No error *)
        mpMHEIGHT_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
        mpMHEIGHT_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
        mpMHEIGHT_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
        mpMHEIGHT_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
        mpMHEIGHT_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
        mpMHEIGHT_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
        mpMHEIGHT_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xc0910007] *)
        mpMHEIGHT_ERR_CONFIG_NULL := -1064239096, (* Configuration structure is null pointer [Error: 8, 0xc0910008] *)
        mpMHEIGHT_ERR_CONFIG_NO_PV := -1064239095, (* Configuration pointer not PV [Error: 9, 0xc0910009] *)
        mpMHEIGHT_ERR_CONFIG_LOAD := -1064239094, (* Error loading configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 10, 0xc091000a] *)
        mpMHEIGHT_WRN_CONFIG_LOAD := -2137980917, (* Warning loading configuration [Warning: 11, 0x8091000b] *)
        mpMHEIGHT_ERR_CONFIG_SAVE := -1064239092, (* Error saving configuration {2:ConfigName} (ErrorCause: {1:ErrorNumber}) [Error: 12, 0xc091000c] *)
        mpMHEIGHT_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xc091000d] *)
        mpMHEIGHT_WRN_PARAMETER_LIMITED := -2137762816, (* The movement parameters have been limited due to configuration settings [Warning: 21504, 0x80945400] *)
        mpMHEIGHT_WRN_CONFIG_WAIT_IDLE := -2137762815, (* The configuration values will be updated as soon as no movement is active [Warning: 21505, 0x80945401] *)
        mpMHEIGHT_WRN_PAR_WAIT_IDLE := -2137762814, (* The parameters will be updated as soon as no movement is active [Warning: 21506, 0x80945402] *)
        mpMHEIGHT_ERR_POS_MOVE_TIMEOUT := -1064020989, (* The positive position-based movement timeout. [Error: 21507, 0xc0945403] *)
        mpMHEIGHT_ERR_NEG_MOVE_TIMEOUT := -1064020988 (* The negative position-based movement timeout. [Error: 21508, 0xc0945404] *)
        );
END_TYPE
