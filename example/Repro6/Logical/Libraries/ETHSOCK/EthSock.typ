TYPE
	ETH_timeval_typ : STRUCT
		tv_sec	: DINT ;
		tv_usec	: DINT ;
	END_STRUCT;
	ETH_fd_set_typ : STRUCT
		fds_bits	: ARRAY[0..7] OF DINT ;
	END_STRUCT;
	ETH_sockaddr_typ : STRUCT
		sin_family	: UINT ;
		sin_port	: UINT ;
		sin_addr	: UDINT ;
		sin_zero	: ARRAY[0..7] OF USINT ;
	END_STRUCT;
END_TYPE
                         
