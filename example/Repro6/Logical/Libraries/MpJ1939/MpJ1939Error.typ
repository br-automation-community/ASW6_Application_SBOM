
TYPE
    MpJ1939ErrorEnum : 
        ( (* Error numbers of library MpJ1939 *)
        mpJ1939_NO_ERROR := 0, (* No error *)
        mpJ1939_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xC0910001] *)
        mpJ1939_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xC0910002] *)
        mpJ1939_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xC0910003] *)
        mpJ1939_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xC0910004] *)
        mpJ1939_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xC0910005] *)
        mpJ1939_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xC0910006] *)
        mpJ1939_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xC091000D] *)
        mpJ1939_ERR_LIMITS := -1064171520, (* Value out of boundaries [Error: 2048, 0xC0920800] *)
        mpJ1939_ERR_INVALID_CAN_IF := -1064171519, (* Error when trying to open the CAN interface [Error: 2049, 0xC0920801] *)
        mpJ1939_ERR_ARSIM_NOT_ALLOWED := -1064171518, (* The component cannot run in a simulated runtime [Error: 2050, 0xC0920802] *)
        mpJ1939_ERR_COMMUNICATION := -1064171517, (* J1939 communication failed [Error: 2051, 0xC0920803] *)
        mpJ1939_ERR_INVALID_DATA_BUFFER := -1064171516 (* Pointer to data buffer is null [Error: 2052, 0xC0920804] *)
        );
END_TYPE
