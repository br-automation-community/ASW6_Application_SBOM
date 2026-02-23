
TYPE
	ArObjDictObjectCodeEnum : 
	(
		arOBJDICT_OBJECT_CODE_ARRAY     	:= 16#08, (* ARRAY. Object with a set of subobjects of same data type. *)
		arOBJDICT_OBJECT_CODE_RECORD    	:= 16#09  (* RECORD. Object with a set of subobjects of any i.e. mixed data type. *)
	);
	ArObjDictDatatypeEnum : 
	(
		arOBJDICT_DATATYPE_BOOL				:= 16#0001,
		arOBJDICT_DATATYPE_INTEGER8			:= 16#0002,
		arOBJDICT_DATATYPE_INTEGER16		:= 16#0003,
		arOBJDICT_DATATYPE_INTEGER32		:= 16#0004,
		arOBJDICT_DATATYPE_UNSIGNED8		:= 16#0005,
		arOBJDICT_DATATYPE_UNSIGNED16		:= 16#0006,
		arOBJDICT_DATATYPE_UNSIGNED32		:= 16#0007,
		arOBJDICT_DATATYPE_REAL				:= 16#0008,
		arOBJDICT_DATATYPE_VISIBLE_STR		:= 16#0009,
		arOBJDICT_DATATYPE_DOMAIN			:= 16#000F
	);
	ArObjDictAccessRightsEnum : 
	(
		arOBJDICT_ACCESS_RIGHTS_RO		:= 16#0001, (* The object is read only. *)
		arOBJDICT_ACCESS_RIGHTS_WO    	:= 16#0002, (* The object is write only. *)
		arOBJDICT_ACCESS_RIGHTS_RW		:= 16#0004  (* The object is readable and writable. *)
	);
END_TYPE
