
TYPE
    MpDatabaseErrorEnum : 
        ( (* Error numbers of library MpDatabase *)
        mpDATABASE_NO_ERROR := 0, (* No error *)
        mpDATABASE_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xC0910001] *)
        mpDATABASE_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xC0910002] *)
        mpDATABASE_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xC0910003] *)
        mpDATABASE_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xC0910004] *)
        mpDATABASE_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xC0910005] *)
        mpDATABASE_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xC0910006] *)
        mpDATABASE_ERR_CONFIG_INVALID := -1064239091, (* Invalid Configuration [Error: 13, 0xC091000D] *)
        mpDATABASE_ERR_SQL_SERVER := -1064167424, (* SQL server error (ErrorNumber: {2:ErrorNumber}) [Error: 6144, 0xC0921800] *)
        mpDATABASE_ERR_HTTP_SERVER := -1064167423, (* HTTP server error (ErrorNumber: {2:ErrorNumber}) [Error: 6145, 0xC0921801] *)
        mpDATABASE_ERR_INVALID_QUERY := -1064167422, (* Query "{2:QueryName}" is not configured [Error: 6146, 0xC0921802] *)
        mpDATABASE_INF_NO_DATA := 1083316227, (* There is either no data in response or all data has been copied to PVs [Informational: 6147, 0x40921803] *)
        mpDATABASE_ERR_INVALID_DATATYPE := -1064167420, (* Data type "{2:TypeName}" is not supported [Error: 6148, 0xC0921804] *)
        mpDATABASE_WRN_QUERY_RESULT := -2137909243, (* When interpreting SQL result, PV "{2:PvName}" was written with a warning {3:ErrorNumber} [Warning: 6149, 0x80921805] *)
        mpDATABASE_ERR_QUERY_RESULT := -1064167418, (* Error when interpreting SQL result, error number: "{2:ErrorNumber}" [Error: 6150, 0xC0921806] *)
        mpDATABASE_ERR_PV_NOT_CONFIGURED := -1064167417, (* PV is not configured in query: "{2:QueryName}" [Error: 6151, 0xC0921807] *)
        mpDATABASE_WRN_CMD_NOT_ALLOWED := -2137909240 (* Command "{2:Command}" not allowed [Warning: 6152, 0x80921808] *)
        );
END_TYPE
