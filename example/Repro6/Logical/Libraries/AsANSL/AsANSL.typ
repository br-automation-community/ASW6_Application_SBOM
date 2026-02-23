                                                                      
TYPE
	AsANSLTimeStampType : STRUCT		(*timestamp structure*)
		timeStampSec	: UDINT;		(*seconds since 01.01.1970*)
		timeStampNsec	: UDINT;		(*nanoseconds*)
	END_STRUCT;

	AsANSLClientDiagInfoType : STRUCT					(*client diagnose structure*)
		clientDataObjName	: STRING[256];				(*name of the data object*)
		clientTimeStamp 	: AsANSLTimeStampType;		(*timestamp of last update*)
		clientConn			: UDINT;					(*number of the connections*)
		clientConnErr		: UDINT;					(*number of the connections with error*)
	END_STRUCT;
	
	AsANSLClientDiagConnInfoType : STRUCT				(*client connection diagnose structure*)
		connName			: STRING[64];				(*name of the connection*)
		connTargetAddr		: STRING[64];				(*address/hostname of the target*)
		connTimeStamp 		: AsANSLTimeStampType;		(*timestamp of last update*)
		connStatus			: UDINT;					(*state of the connection*)
		connError			: UDINT;					(*error of the connection*)
		connPvRead			: UDINT;					(*number of read pv*)
		connPvReadErr		: UDINT;					(*number of read pv with error*)
		connPvWrite			: UDINT;					(*number of write pv*)
		connPvWriteErr		: UDINT;					(*number of write pv with error*)
		connNumReadJobs		: UDINT;					(*read jobs since last initialization*)
		connNumSendJobs		: UDINT;					(*send jobs since last initialization*)
		connNumErr			: UDINT;					(*number of connection error since last initialization*)
	END_STRUCT;
	
	AsANSLClientDiagRedConnInfoType : STRUCT			(*client redundancy connection diagnose structure*)
		redConnActIpAddr	: STRING[64];				(*ip address of the active used connection*)
		redConnAct 			: UDINT;					(*identify the active used connection*)
		redConnStatus		: UDINT;					(*state of the redundancy connection*)
		redConnCluError		: UDINT;					(*error of the cluster connection*)
		redConnPriError		: UDINT;					(*error of the primary connection*)
		redConnSecError		: UDINT;					(*error of the secondary connection*)
		redConnRRPrio		: UDINT;					(*priority of redundancy relevant connection*)
	END_STRUCT;

	AsANSLClientDiagPvInfoType : STRUCT					(*pv connection diagnose structure*)
		pvNameLocal			: STRING[512];				(*name of the local pv*)
		pvNameRemote		: STRING[512];				(*name of the remote pv*)
		pvTimeStamp 		: AsANSLTimeStampType;		(*timestamp of last update*)
		pvStatus			: UDINT;					(*state of the pv connection*)
		pvError				: UDINT;					(*error of the pv connection*)
		pvDirection			: UDINT;					(*direction of pv - read/write*)
	END_STRUCT;
	
	AsANSLServerDiagConnInfoType : STRUCT					(*server connection diagnose structure*)
		connClientIpAddr			: STRING[64];			(*ip address of client station*)
		connServerIpAddr			: STRING[64];			(*ip address of used server interface*)
		connTimeStamp				: AsANSLTimeStampType;	(*timestamp when the connetion got established*)
		connTimeout					: UDINT;				(*connection timeout*)
		connSendDelay				: UDINT;				(*connetion send delay*)
		connPort					: UDINT;				(*connection port*)
		connBufferSize				: UDINT;				(*connection buffer size*)
		connServiceObjects			: UDINT;				(*number of registered ANSL service objects*)
		connBytesRecv				: UDINT;				(*number of received bytes*)
		connBytesSent				: UDINT;				(*number of sent bytes*)
		connRequestsRecv			: UDINT;				(*number of received requests*)
		connEventsSent				: UDINT;				(*number of sent events*)
		connResponsesSent			: UDINT;				(*number of sent responses*)
		connEventPvs				: UDINT;				(*number of registered event pvs*)
		connEventPvProcessing 		: BOOL;					(*event processing flag (activated/deactivated)*)
		connEventPvRate				: UDINT;				(*number of event pvs checked per block*)
		connEventPvTime				: UDINT;				(*time to wait between two blocks*)
		connEventPvsChangedBlock	: UDINT;				(*number of pvs changed last block*)
		connEventPvsChangedAll		: UDINT;				(*number of pvs changed overall*)
		connRRPrio					: UDINT;				(*priority of redundancy relevant connection*)
		connRRName					: STRING[64];			(*name of redundancy relevant connection*)
	END_STRUCT;
	
END_TYPE
