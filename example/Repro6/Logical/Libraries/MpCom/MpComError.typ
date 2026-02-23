
TYPE
    MpComErrorEnum : 
        ( (* Error numbers of library MpCom *)
        mpCOM_NO_ERROR := 0, (* No error *)
        mpCOM_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xC0910001] *)
        mpCOM_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xC0910002] *)
        mpCOM_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xC0910003] *)
        mpCOM_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xC0910004] *)
        mpCOM_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xC0910005] *)
        mpCOM_ERR_LINK_NOT_POSSIBLE := -1064238848, (* Linking {2} to {3} not possible (ErrorCause: {1}) [Error: 256, 0xC0910100] *)
        mpCOM_ERR_FILE_SYSTEM := -1064238847, (* Error handling file {2} at {3} (ErrorCause: {1}) [Error: 257, 0xC0910101] *)
        mpCOM_ERR_INVALID_FILE_DEV := -1064238846, (* Invalid file device [Error: 258, 0xC0910102] *)
        mpCOM_ERR_INVALID_FILE_NAME := -1064238845, (* Invalid filename [Error: 259, 0xC0910103] *)
        mpCOM_ERR_NO_CONFIG_IMPORT := -1064238844, (* No configuration data was imported [Error: 260, 0xC0910104] *)
        mpCOM_ERR_MISSING_UICONNECT := -1064238843, (* Missing value on UIConnect [Error: 261, 0xC0910105] *)
        mpCOM_ERR_CONFIG_IMPORT_ERR := -1064238842, (* A syntax error was detected in the config-import file [Error: 262, 0xC0910106] *)
        mpCOM_ERR_WRONG_FILTER_STRING := -1064238841, (* Error in the filter string: {2} [Error: 263, 0xC0910107] *)
        mpCOM_ERR_COMPONENT_NOT_FOUND := -1064238840, (* The given mapp-component was not found [Error: 264, 0xC0910108] *)
        mpCOM_ERR_CONFIG_ACCESS_FAILED := -1064238839, (* Access to configuration failed [Error: 265, 0xC0910109] *)
        mpCOM_ERR_CONFIG_READ_FAILED := -1064238838, (* Reading configuration failed [Error: 266, 0xC091010A] *)
        mpCOM_ERR_CONFIG_WRITE_FAILED := -1064238837, (* Writing configuration failed [Error: 267, 0xC091010B] *)
        mpCOM_ERR_CONFIG_NOT_OPEN := -1064238836, (* Configuration is not opened [Error: 268, 0xC091010C] *)
        mpCOM_ERR_CONFIG_COPY_FAILED := -1064238835, (* Copying configuration failed [Error: 269, 0xC091010D] *)
        mpCOM_ERR_CONFIG_INVALID_COPY := -1064238834, (* Invalid parameters for copying given [Error: 270, 0xC091010E] *)
        mpCOM_ERR_CONFIG_INVALID_DATA := -1064238833, (* Invalid data-pointer [Error: 271, 0xC091010F] *)
        mpCOM_WRN_CONFIG_PARAM_ACTIVE := -2137980656 (* Parameterization is active. Write to config has no immediate effect [Warning: 272, 0x80910110] *)
        );
END_TYPE
