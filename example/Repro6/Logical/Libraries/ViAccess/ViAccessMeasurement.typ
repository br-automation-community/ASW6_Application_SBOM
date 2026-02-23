(*Models of VF Measurement*)

TYPE
	viVfMMCircleModelType : 	STRUCT  (*VF Measurement circle model*)
		Type : viModelTypeEnum := viVF_MES_CIRCLE_MODEL;
		Completeness : REAL := 0.0;
	END_STRUCT;
	viVfMMEdgeMode1ModelType : 	STRUCT  (*VF Measurement edge model mode 1*)
		Type : viModelTypeEnum := viVF_MES_EDGE_MODEL_MODE_1;
		Completeness : REAL := 0.0;
	END_STRUCT;
	viVfMMEllipseModelType : 	STRUCT  (*VF Measurement ellipse model*)
		Type : viModelTypeEnum := viVF_MES_ELLIPSE_MODEL;
		Completeness : REAL := 0.0;
	END_STRUCT;
	viVfMMRectangleModelType : 	STRUCT  (*VF Measurement rectangle model*)
		Type : viModelTypeEnum := viVF_MES_RECTANGLE_MODEL;
		Completeness : REAL := 0.0;
	END_STRUCT;

	viVfMMOperationTypeEnum : 
		(
		viVF_MES_OP_NO_OPERATION := 0,
		viVF_MES_OP_ORTHOGONAL_DISTANCE := 1, (*VF Measurement Operation 'orthogonal_distance'*)
		viVF_MES_OP_ANGLE := 2, (*VF Measurement Operation 'angle'*)
		viVF_MES_OP_DISTANCE_COG := 3, (*VF Measurement Operation 'distance_cog'*)
		viVF_MES_OP_DISTANCE_MIN := 4, (*VF Measurement Operation 'distance_min'*)
		viVF_MES_OP_DISTANCE_MAX := 5, (*VF Measurement Operation 'distance_max'*)
		viVF_MES_OP_INTERSECTION_X := 6, (*VF Measurement Operation 'intersection_x'*)
		viVF_MES_OP_INTERSECTION_Y := 7, (*VF Measurement Operation 'intersection_y'*)
		viVF_MES_OP_LENGTH := 8, (*VF Measurement Operation 'length'*)
		viVF_MES_OP_ORIENTATION := 9, (*VF Measurement Operation 'orientation'*)
		viVF_MES_OP_POSITION_X := 10, (*VF Measurement Operation 'position_x'*)
		viVF_MES_OP_POSITION_Y := 11, (*VF Measurement Operation 'position_y'*)
		viVF_MES_OP_HALF_AXIS_MIN := 12, (*VF Measurement Operation 'half_axis_min'*)
		viVF_MES_OP_HALF_AXIS_MAX := 13 (*VF Measurement Operation 'half_axis_max'*)
		);

	viVfMMOperationEntryType : STRUCT
		OperationType : viVfMMOperationTypeEnum;
		Reference : USINT;
		Target : USINT;
	END_STRUCT;

END_TYPE