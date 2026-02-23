                                                                      
TYPE
	RT_I_TYPE : STRUCT			(*internal use*)
		init	  : UDINT ;
		hdl	      : UDINT ;
		state     : UDINT ;
		errNo     : UDINT ;
		dev       : STRING[80] ;
		brModule  : STRING[80] ;
		stationNo : USINT ;
		tid	      : UDINT ;
		res1   	  : UDINT ;
		res2   	  : UDINT ;
		res3   	  : UDINT ;
		res4   	  : UDINT ;
	END_STRUCT;
END_TYPE
