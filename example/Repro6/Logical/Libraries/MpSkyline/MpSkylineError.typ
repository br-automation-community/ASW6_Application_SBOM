
TYPE
    MpSkylineErrorEnum : 
        ( (* Error numbers of library MpSkyline *)
        mpSKYLINE_NO_ERROR := 0, (* No error *)
        mpSKYLINE_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xC0910001] *)
        mpSKYLINE_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xC0910002] *)
        mpSKYLINE_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xC0910003] *)
        mpSKYLINE_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xC0910004] *)
        mpSKYLINE_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xC0910005] *)
        mpSKYLINE_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xC0910006] *)
        mpSKYLINE_ERR_PAR_NULL := -1064239097, (* Parameters structure is a null pointer [Error: 7, 0xC0910007] *)
        mpSKYLINE_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xC091000D] *)
        mpSKYLINE_ERR_OPTION_STATE := -1064126464, (* Option state {2} is not existing within option state collection {3} [Error: 47104, 0xC092B800] *)
        mpSKYLINE_ERR_OPTION_COLLECTION := -1064126463, (* Option collection {2} used for module {3} is not existing [Error: 47105, 0xC092B801] *)
        mpSKYLINE_ERR_MISSING_STATE := -1064126462, (* Current state input is not connected [Error: 47106, 0xC092B802] *)
        mpSKYLINE_ERR_SIZE_STATE := -1064126461, (* Current state size is not valid [Error: 47107, 0xC092B803] *)
        mpSKYLINE_ERR_MODULE := -1064126460, (* Module {2} is not existing [Error: 47108, 0xC092B804] *)
        mpSKYLINE_ERR_MODULE_STATE := -1064126459, (* Module state {2} is not existing within module state collection {3} [Error: 47109, 0xC092B805] *)
        mpSKYLINE_ERR_NOTIFICATION := -1064126458, (* Notification {2} is not existing within notification collection {3} [Error: 47110, 0xC092B806] *)
        mpSKYLINE_ERR_MPSERVER_MISSING := -1064126457, (* MpServer could not be found [Error: 47111, 0xC092B807] *)
        mpSKYLINE_WRN_SIZE_TOO_SMALL := -2137868280, (* Current state size is too small to display complete state: {2} shown instead of {3} [Warning: 47112, 0x8092B808] *)
        mpSKYLINE_INF_INITIALIZED := 1083357193, (* Successfully initialized [Informational: 47113, 0x4092B809] *)
        mpSKYLINE_INF_CONFIG_CHANGED := 1083357194 (* Changed configuration succesfully during runtime [Informational: 47114, 0x4092B80A] *)
        );
END_TYPE
