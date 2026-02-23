#ifdef __cplusplus
extern "C" {
#endif

/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef ETHSOCK_H_
#define ETHSOCK_H_

#include <bur/plctypes.h>
  
#include <runtime.h>

#ifndef _IEC_CONST
#define _IEC_CONST _WEAK const
#endif

/* Constants */
#ifdef _REPLACE_CONST
 #define ETH_AF_NS 6
 #define ERR_ETH_IO 27105U
 #define ERR_SOCKET (-1)
 #define ETH_AF_DLI 13
 #define ETH_AF_ISO 7
 #define ETH_AF_LAT 14
 #define ETH_AF_OSI 7
 #define ETH_AF_PUP 4
 #define ETH_AF_SNA 11
 #define ERR_ETH_DOM 27137U
 #define ERR_ETH_MAX 27181U
 #define ETH_AF_ECMA 8
 #define ETH_AF_INET 2
 #define ETH_AF_UNIX 1
 #define ETH_FIONBIO 16
 #define ETH_ASYNCSEND 2147746319U
 #define ETH_SO_TYPE 4104
 #define ERR_ETH_2BIG 27107U
 #define ERR_ETH_BADF 27109U
 #define ERR_ETH_BASE 27100U
 #define ERR_ETH_BUSY 27116U
 #define ERR_ETH_FBIG 27127U
 #define ERR_ETH_INTR 27104U
 #define ERR_ETH_LOOP 27164U
 #define ERR_ETH_NOSR 27174U
 #define ERR_ETH_NXIO 27106U
 #define ERR_ETH_PERM 27101U
 #define ERR_ETH_PIPE 27132U
 #define ERR_ETH_ROFS 27130U
 #define ERR_ETH_SRCH 27103U
 #define ERR_ETH_TIME 27179U
 #define ERR_ETH_XDEV 27118U
 #define ETH_AF_CCITT 10
 #define ETH_AF_CHAOS 5
 #define ETH_FIONREAD 1
 #define ETH_SOCK_RAW 3
 #define ETH_SOCK_RDM 4
 #define ETH_SO_DEBUG 1
 #define ETH_SO_ERROR 4103
 #define ERR_ETH_AGAIN 27111U
 #define ERR_ETH_CHILD 27110U
 #define ERR_ETH_EXIST 27117U
 #define ERR_ETH_FAULT 27114U
 #define ERR_ETH_INVAL 27122U
 #define ERR_ETH_ISDIR 27121U
 #define ERR_ETH_MFILE 27124U
 #define ERR_ETH_MLINK 27131U
 #define ERR_ETH_NFILE 27123U
 #define ERR_ETH_NODEV 27119U
 #define ERR_ETH_NOENT 27102U
 #define ERR_ETH_NOLCK 27134U
 #define ERR_ETH_NOMEM 27112U
 #define ERR_ETH_NOMGR 27248U
 #define ERR_ETH_NOMSG 27180U
 #define ERR_ETH_NOSPC 27128U
 #define ERR_ETH_NOSTR 27175U
 #define ERR_ETH_NOSYS 27171U
 #define ERR_ETH_NOTTY 27125U
 #define ERR_ETH_PROTO 27176U
 #define ERR_ETH_RANGE 27138U
 #define ERR_ETH_SPIPE 27129U
 #define ETH_AF_DECNET 12
 #define ETH_AF_HYLINK 15
 #define ETH_AF_UNSPEC 0
 #define ETH_SOMAXCONN 5
 #define ETH_SO_LINGER 128
 #define ETH_SO_RCVBUF 4098
 #define ETH_SO_SNDBUF 4097
 #define ERR_ETH_ACCESS 27113U
 #define ERR_ETH_BADMSG 27177U
 #define ERR_ETH_DEADLK 27133U
 #define ERR_ETH_ISCONN 27156U
 #define ERR_ETH_NOBUFS 27155U
 #define ERR_ETH_NODATA 27178U
 #define ERR_ETH_NOEXEC 27108U
 #define ERR_ETH_NOTBLK 27166U
 #define ERR_ETH_NOTDIR 27120U
 #define ERR_ETH_NOTSUP 27135U
 #define ERR_ETH_TXTBSY 27163U
 #define ETH_AF_DATAKIT 9
 #define ETH_AF_IMPLINK 3
 #define ETH_FD_SETSIZE 256
 #define ETH_FD_SETSIZE_NG 2048
 #define ETH_INADDR_ANY 0
 #define ETH_IPPROTO_IP 0
 #define ETH_SOCK_DGRAM 2
 #define ETH_SOL_SOCKET 65535
 #define ERR_ETH_ALREADY 27169U
 #define ERR_ETH_MSGSIZE 27136U
 #define ERR_ETH_NETDOWN 27162U
 #define ERR_ETH_NOTCONN 27157U
 #define ERR_ETH_NOTSOCK 27150U
 #define ERR_ETH_UNKNOWN 27249U
 #define ETH_IPPROTO_GGP 3
 #define ETH_IPPROTO_IDP 17
 #define ETH_IPPROTO_MAX 256
 #define ETH_IPPROTO_PUP 12
 #define ETH_IPPROTO_RAW 255
 #define ETH_IPPROTO_TCP 6
 #define ETH_IPPROTO_UDP 17
 #define ETH_SOCK_STREAM 1
 #define ETH_SO_RCVLOWAT 4100
 #define ETH_SO_RCVTIMEO 4102
 #define ETH_SO_SNDLOWAT 4099
 #define ETH_SO_SNDTIMEO 4101
 #define ERR_ETH_AFNOTSUP 27147U
 #define ERR_ETH_CANCELED 27172U
 #define ERR_ETH_HOSTDOWN 27167U
 #define ERR_ETH_NETRESET 27152U
 #define ERR_ETH_NOTEMPTY 27115U
 #define ERR_ETH_OPNOTSUP 27145U
 #define ERR_ETH_PFNOTSUP 27146U
 #define ERR_ETH_SHUTDOWN 27158U
 #define ERR_ETH_TIMEDOUT 27160U
 #define ETH_AF_APPLETALK 16
 #define ETH_IPPROTO_ICMP 1
 #define ETH_IPPROTO_IGMP 2
 #define ETH_SO_BROADCAST 32
 #define ETH_SO_DONTROUTE 16
 #define ETH_SO_KEEPALIVE 8
 #define ETH_SO_OOBINLINE 256
 #define ETH_SO_REUSEADDR 4
 #define ERR_ETH_ADDRINUSE 27148U
 #define ERR_ETH_CONNRESET 27154U
 #define ERR_ETH_PROTOTYPE 27141U
 #define ETH_INET_ADDR_LEN 18U
 #define ETH_SO_ACCEPTCONN 2
 #define ERR_ETH_FD_SETSIZE 27200U
 #define ERR_ETH_INPROGRESS 27168U
 #define ERR_ETH_NETUNREACH 27151U
 #define ERR_ETH_NOPROTOOPT 27142U
 #define ERR_ETH_SOCKNOTSUP 27144U
 #define ERR_ETH_WOULDBLOCK 27170U
 #define ETH_SOCK_SEQPACKET 5
 #define ERR_ETH_CONNABORTED 27153U
 #define ERR_ETH_CONNREFUSED 27161U
 #define ERR_ETH_DESTADDRREQ 27140U
 #define ERR_ETH_HOSTUNREACH 27165U
 #define ERR_ETH_NAMETOOLONG 27126U
 #define ERR_ETH_PROTONOTSUP 27143U
 #define ERR_ETH_TOOMANYREFS 27159U
 #define ERR_ETH_ADDRNOTAVAIL 27149U
#else
 _IEC_CONST signed long ETH_AF_NS = 6;
 _IEC_CONST unsigned short ERR_ETH_IO = 27105U;
 _IEC_CONST signed long ERR_SOCKET = -1;
 _IEC_CONST signed long ETH_AF_DLI = 13;
 _IEC_CONST signed long ETH_AF_ISO = 7;
 _IEC_CONST signed long ETH_AF_LAT = 14;
 _IEC_CONST signed long ETH_AF_OSI = 7;
 _IEC_CONST signed long ETH_AF_PUP = 4;
 _IEC_CONST signed long ETH_AF_SNA = 11;
 _IEC_CONST unsigned short ERR_ETH_DOM = 27137U;
 _IEC_CONST unsigned short ERR_ETH_MAX = 27181U;
 _IEC_CONST signed long ETH_AF_ECMA = 8;
 _IEC_CONST signed long ETH_AF_INET = 2;
 _IEC_CONST signed long ETH_AF_UNIX = 1;
 _IEC_CONST signed long ETH_FIONBIO = 16;
 _IEC_CONST signed long ETH_ASYNCSEND = 2147746319U;
 _IEC_CONST signed long ETH_SO_TYPE = 4104;
 _IEC_CONST unsigned short ERR_ETH_2BIG = 27107U;
 _IEC_CONST unsigned short ERR_ETH_BADF = 27109U;
 _IEC_CONST unsigned short ERR_ETH_BASE = 27100U;
 _IEC_CONST unsigned short ERR_ETH_BUSY = 27116U;
 _IEC_CONST unsigned short ERR_ETH_FBIG = 27127U;
 _IEC_CONST unsigned short ERR_ETH_INTR = 27104U;
 _IEC_CONST unsigned short ERR_ETH_LOOP = 27164U;
 _IEC_CONST unsigned short ERR_ETH_NOSR = 27174U;
 _IEC_CONST unsigned short ERR_ETH_NXIO = 27106U;
 _IEC_CONST unsigned short ERR_ETH_PERM = 27101U;
 _IEC_CONST unsigned short ERR_ETH_PIPE = 27132U;
 _IEC_CONST unsigned short ERR_ETH_ROFS = 27130U;
 _IEC_CONST unsigned short ERR_ETH_SRCH = 27103U;
 _IEC_CONST unsigned short ERR_ETH_TIME = 27179U;
 _IEC_CONST unsigned short ERR_ETH_XDEV = 27118U;
 _IEC_CONST signed long ETH_AF_CCITT = 10;
 _IEC_CONST signed long ETH_AF_CHAOS = 5;
 _IEC_CONST signed long ETH_FIONREAD = 1;
 _IEC_CONST signed long ETH_SOCK_RAW = 3;
 _IEC_CONST signed long ETH_SOCK_RDM = 4;
 _IEC_CONST signed long ETH_SO_DEBUG = 1;
 _IEC_CONST signed long ETH_SO_ERROR = 4103;
 _IEC_CONST unsigned short ERR_ETH_AGAIN = 27111U;
 _IEC_CONST unsigned short ERR_ETH_CHILD = 27110U;
 _IEC_CONST unsigned short ERR_ETH_EXIST = 27117U;
 _IEC_CONST unsigned short ERR_ETH_FAULT = 27114U;
 _IEC_CONST unsigned short ERR_ETH_INVAL = 27122U;
 _IEC_CONST unsigned short ERR_ETH_ISDIR = 27121U;
 _IEC_CONST unsigned short ERR_ETH_MFILE = 27124U;
 _IEC_CONST unsigned short ERR_ETH_MLINK = 27131U;
 _IEC_CONST unsigned short ERR_ETH_NFILE = 27123U;
 _IEC_CONST unsigned short ERR_ETH_NODEV = 27119U;
 _IEC_CONST unsigned short ERR_ETH_NOENT = 27102U;
 _IEC_CONST unsigned short ERR_ETH_NOLCK = 27134U;
 _IEC_CONST unsigned short ERR_ETH_NOMEM = 27112U;
 _IEC_CONST unsigned short ERR_ETH_NOMGR = 27248U;
 _IEC_CONST unsigned short ERR_ETH_NOMSG = 27180U;
 _IEC_CONST unsigned short ERR_ETH_NOSPC = 27128U;
 _IEC_CONST unsigned short ERR_ETH_NOSTR = 27175U;
 _IEC_CONST unsigned short ERR_ETH_NOSYS = 27171U;
 _IEC_CONST unsigned short ERR_ETH_NOTTY = 27125U;
 _IEC_CONST unsigned short ERR_ETH_PROTO = 27176U;
 _IEC_CONST unsigned short ERR_ETH_RANGE = 27138U;
 _IEC_CONST unsigned short ERR_ETH_SPIPE = 27129U;
 _IEC_CONST signed long ETH_AF_DECNET = 12;
 _IEC_CONST signed long ETH_AF_HYLINK = 15;
 _IEC_CONST signed long ETH_AF_UNSPEC = 0;
 _IEC_CONST signed long ETH_SOMAXCONN = 5;
 _IEC_CONST signed long ETH_SO_LINGER = 128;
 _IEC_CONST signed long ETH_SO_RCVBUF = 4098;
 _IEC_CONST signed long ETH_SO_SNDBUF = 4097;
 _IEC_CONST unsigned short ERR_ETH_ACCESS = 27113U;
 _IEC_CONST unsigned short ERR_ETH_BADMSG = 27177U;
 _IEC_CONST unsigned short ERR_ETH_DEADLK = 27133U;
 _IEC_CONST unsigned short ERR_ETH_ISCONN = 27156U;
 _IEC_CONST unsigned short ERR_ETH_NOBUFS = 27155U;
 _IEC_CONST unsigned short ERR_ETH_NODATA = 27178U;
 _IEC_CONST unsigned short ERR_ETH_NOEXEC = 27108U;
 _IEC_CONST unsigned short ERR_ETH_NOTBLK = 27166U;
 _IEC_CONST unsigned short ERR_ETH_NOTDIR = 27120U;
 _IEC_CONST unsigned short ERR_ETH_NOTSUP = 27135U;
 _IEC_CONST unsigned short ERR_ETH_TXTBSY = 27163U;
 _IEC_CONST signed long ETH_AF_DATAKIT = 9;
 _IEC_CONST signed long ETH_AF_IMPLINK = 3;
 _IEC_CONST signed long ETH_FD_SETSIZE = 256;
 _IEC_CONST signed long ETH_FD_SETSIZE_NG = 2048;
 _IEC_CONST signed long ETH_INADDR_ANY = 0;
 _IEC_CONST signed long ETH_IPPROTO_IP = 0;
 _IEC_CONST signed long ETH_SOCK_DGRAM = 2;
 _IEC_CONST signed long ETH_SOL_SOCKET = 65535;
 _IEC_CONST unsigned short ERR_ETH_ALREADY = 27169U;
 _IEC_CONST unsigned short ERR_ETH_MSGSIZE = 27136U;
 _IEC_CONST unsigned short ERR_ETH_NETDOWN = 27162U;
 _IEC_CONST unsigned short ERR_ETH_NOTCONN = 27157U;
 _IEC_CONST unsigned short ERR_ETH_NOTSOCK = 27150U;
 _IEC_CONST unsigned short ERR_ETH_UNKNOWN = 27249U;
 _IEC_CONST signed long ETH_IPPROTO_GGP = 3;
 _IEC_CONST signed long ETH_IPPROTO_IDP = 17;
 _IEC_CONST signed long ETH_IPPROTO_MAX = 256;
 _IEC_CONST signed long ETH_IPPROTO_PUP = 12;
 _IEC_CONST signed long ETH_IPPROTO_RAW = 255;
 _IEC_CONST signed long ETH_IPPROTO_TCP = 6;
 _IEC_CONST signed long ETH_IPPROTO_UDP = 17;
 _IEC_CONST signed long ETH_SOCK_STREAM = 1;
 _IEC_CONST signed long ETH_SO_RCVLOWAT = 4100;
 _IEC_CONST signed long ETH_SO_RCVTIMEO = 4102;
 _IEC_CONST signed long ETH_SO_SNDLOWAT = 4099;
 _IEC_CONST signed long ETH_SO_SNDTIMEO = 4101;
 _IEC_CONST unsigned short ERR_ETH_AFNOTSUP = 27147U;
 _IEC_CONST unsigned short ERR_ETH_CANCELED = 27172U;
 _IEC_CONST unsigned short ERR_ETH_HOSTDOWN = 27167U;
 _IEC_CONST unsigned short ERR_ETH_NETRESET = 27152U;
 _IEC_CONST unsigned short ERR_ETH_NOTEMPTY = 27115U;
 _IEC_CONST unsigned short ERR_ETH_OPNOTSUP = 27145U;
 _IEC_CONST unsigned short ERR_ETH_PFNOTSUP = 27146U;
 _IEC_CONST unsigned short ERR_ETH_SHUTDOWN = 27158U;
 _IEC_CONST unsigned short ERR_ETH_TIMEDOUT = 27160U;
 _IEC_CONST signed long ETH_AF_APPLETALK = 16;
 _IEC_CONST signed long ETH_IPPROTO_ICMP = 1;
 _IEC_CONST signed long ETH_IPPROTO_IGMP = 2;
 _IEC_CONST signed long ETH_SO_BROADCAST = 32;
 _IEC_CONST signed long ETH_SO_DONTROUTE = 16;
 _IEC_CONST signed long ETH_SO_KEEPALIVE = 8;
 _IEC_CONST signed long ETH_SO_OOBINLINE = 256;
 _IEC_CONST signed long ETH_SO_REUSEADDR = 4;
 _IEC_CONST unsigned short ERR_ETH_ADDRINUSE = 27148U;
 _IEC_CONST unsigned short ERR_ETH_CONNRESET = 27154U;
 _IEC_CONST unsigned short ERR_ETH_PROTOTYPE = 27141U;
 _IEC_CONST unsigned char ETH_INET_ADDR_LEN = 18U;
 _IEC_CONST signed long ETH_SO_ACCEPTCONN = 2;
 _IEC_CONST unsigned short ERR_ETH_FD_SETSIZE = 27200U;
 _IEC_CONST unsigned short ERR_ETH_INPROGRESS = 27168U;
 _IEC_CONST unsigned short ERR_ETH_NETUNREACH = 27151U;
 _IEC_CONST unsigned short ERR_ETH_NOPROTOOPT = 27142U;
 _IEC_CONST unsigned short ERR_ETH_SOCKNOTSUP = 27144U;
 _IEC_CONST unsigned short ERR_ETH_WOULDBLOCK = 27170U;
 _IEC_CONST signed long ETH_SOCK_SEQPACKET = 5;
 _IEC_CONST unsigned short ERR_ETH_CONNABORTED = 27153U;
 _IEC_CONST unsigned short ERR_ETH_CONNREFUSED = 27161U;
 _IEC_CONST unsigned short ERR_ETH_DESTADDRREQ = 27140U;
 _IEC_CONST unsigned short ERR_ETH_HOSTUNREACH = 27165U;
 _IEC_CONST unsigned short ERR_ETH_NAMETOOLONG = 27126U;
 _IEC_CONST unsigned short ERR_ETH_PROTONOTSUP = 27143U;
 _IEC_CONST unsigned short ERR_ETH_TOOMANYREFS = 27159U;
 _IEC_CONST unsigned short ERR_ETH_ADDRNOTAVAIL = 27149U;
#endif

/* Datatypes */
typedef struct ETH_sockaddr_typ
{
	unsigned char	sin_len;
	unsigned char	sin_family;
	unsigned short 	sin_port;
	unsigned long 	sin_addr;
	char	sin_zero[8];
} ETH_sockaddr_typ;

typedef struct ETH_fd_set_typ
{
	signed long fds_bits[64];
} ETH_fd_set_typ;

typedef struct ETH_timeval_typ
{
	signed long tv_sec;
	signed long tv_usec;
} ETH_timeval_typ;



/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned short inet_ntoa_b(unsigned long ipaddr, unsigned long pString);
unsigned long inet_addr(unsigned long pString);
signed long sock_select(signed long width, unsigned long pReadFds, unsigned long pWriteFds, unsigned long pExceptFds, unsigned long pTimeOut);
signed long close(signed long s);
signed long ioctl(signed long s, signed long cmd, unsigned long arg);
signed long shutdown(signed long s, signed long how);
signed long sendto(signed long s, unsigned long buf, signed long buflen, signed long flags, unsigned long to, signed long tolen);
signed long send(signed long s, unsigned long buf, signed long buflen, signed long flags);
signed long recvfrom(signed long s, unsigned long buf, signed long buflen, signed long flags, unsigned long from, unsigned long fromlen);
signed long recv(signed long s, unsigned long buf, signed long buflen, signed long flags);
signed long listen(signed long s, signed long backlog);
signed long getpeername(signed long s, unsigned long name, unsigned long namelen);
signed long getsockname(signed long s, unsigned long name, unsigned long namelen);
signed long setsockopt(signed long s, signed long level, signed long optname, unsigned long optval, signed long optlen);
signed long getsockopt(signed long s, signed long level, signed long optname, unsigned long optval, unsigned long optlen);
signed long connect(signed long s, unsigned long name, signed long namelen);
signed long bind(signed long s, unsigned long name, signed long namelen);
signed long accept(signed long s, unsigned long addr, unsigned long addrlen);
signed long socket(signed long domain, signed long type, signed long protocol);
_BUR_PUBLIC unsigned short EthGetError();
_BUR_PUBLIC unsigned short fd_set(signed long n, unsigned long p);
_BUR_PUBLIC unsigned short fd_clr(signed long n, unsigned long p);
_BUR_PUBLIC unsigned short fd_isset(signed long n, unsigned long p);
_BUR_PUBLIC unsigned short fd_zero(unsigned long p);
_BUR_PUBLIC unsigned short fd_zero_ng(unsigned long p);

/* structure and symbol definitions only for i386-Targets (VxWorks) */


/*
 * An option specification consists of an opthdr, followed by the value of
 * the option.  An options buffer contains one or more options.  The len
 * field of opthdr specifies the length of the option value in bytes.  This
 * length must be a multiple of sizeof (long) (use OPTLEN macro).
 */

struct opthdr {
	long 	level;			/* protocol level affected */
	long	name;			/* option to modify */
	long	len;			/* length of option value */
};

#define OPTLEN(x) ((((x) + sizeof (long) - 1) / sizeof (long)) * sizeof (long))
#define OPTVAL(opt) ((char *)(opt + 1))

/*
 * Structure used for manipulating linger option.
 */
struct	linger {
	int	l_onoff;		/* option on/off */
	int	l_linger;		/* linger time */
};

#define	MSG_OOB			0x1			/* process out-of-band data */
#define	MSG_PEEK		0x2			/* peek at incoming message */
#define	MSG_DONTROUTE	0x4			/* send without using routing tables */
#define MSG_NO_UIO		0x8			/* for system use only */
#define	MSG_EOR			0x8			/* data completes record */
#define	MSG_TRUNC		0x10		/* data discarded before delivery */
#define	MSG_CTRUNC		0x20		/* control data lost before delivery */
#define	MSG_WAITALL		0x40		/* wait for full request or error */
#define	MSG_DONTWAIT	0x80		/* this message should be nonblocking */
#define MSG_MBUF		0x10000		/* mbuf interface - WRS ext. */
#define MSG_IGNORE_SB	0x20000		/* ignore socket write buf - WRS ext. */

#define	MSG_MAXIOVLEN	16

#define	NBBY	8		/* number of bits in a byte */
typedef long	fd_mask;
#define NFDBITS	(sizeof(fd_mask) * NBBY)	/* bits per mask */



/* IOCTL types: */
#define VX_IOC_VOID  0x20000000
#define VX_IOC_OUT   0x40000000
#define VX_IOC_IN    0x80000000
#define VX_IOC_INOUT (VX_IOC_IN | VX_IOC_OUT)
#define VX_IOC_READ(a) (((0x40 << 24) & (a)) == VX_IOC_OUT)
#define VX_IOC_WRITE(a) (((0x80 << 24) & (a)) == VX_IOC_IN)
#define VX_IOC_RW(a) (((0xc0 << 24) & (a)) == VX_IOC_INOUT)

/* IOCTL size: */
#define VX_IOCPARM_MASK    0x1fff      /* Parameter length 13 bits */
#define VX_IOCPARM_LEN(r)  (VX_IOCPARM_MASK & ((r) >> 16))

/* IOCTL flags. */
#define VX_IOCF_R       0x00000000   /* read. */
#define VX_IOCF_W       0x00001000   /* write bit. */

/* IOCTL groups: */
#define VX_IOC_GROUP(c)  (((c) & 0x00000f00) >> 8)
#define VX_IOCG_BASE        1
#define VX_IOCG_SOCK        2
#define VX_IOCG_NETIF       3
#define VX_IOCG_ARP         4
#define VX_IOCG_INET        5
#define VX_IOCG_INET6       6
#define VX_IOCG_ETH         7
#define VX_IOCG_PPP         8
#define VX_IOCG_WLAN        9
#define VX_IOCG_MCAST       10
#define VX_IOCG_MCAST_IN6   11
#define VX_IOCG_MPLS        12
#define VX_IOCG_RTAB        13
#define VX_IOCG_DS          14
#define VX_IOCG_POLICY_RT   15

#define VX_IOX(g,i,f,t)   (((sizeof(t) & VX_IOCPARM_MASK) << 16) | (VX_IOCF_ ## f) | ((VX_IOCG_ ## g) << 8) | (i & 0xff))

#define VX_IO(g,i,f,t)    (VX_IOC_VOID  | /* no parameter */ \
        (((sizeof(t) & VX_IOCPARM_MASK) << 16) | (VX_IOCF_ ## f) | ((VX_IOCG_ ## g) << 8) | (i & 0xff)))

#define VX_IOR(g,i,f,t)   (VX_IOC_OUT   | /* out-parameter */ \
        (((sizeof(t) & VX_IOCPARM_MASK) << 16) | (VX_IOCF_ ## f) | ((VX_IOCG_ ## g) << 8) | (i & 0xff)))

#define VX_IOW(g,i,f,t)   (VX_IOC_IN    | /* in-parameter */ \
        (((sizeof(t) & VX_IOCPARM_MASK) << 16) | (VX_IOCF_ ## f) | ((VX_IOCG_ ## g) << 8) | (i & 0xff)))

#define VX_IOWR(g,i,f,t)  (VX_IOC_INOUT | /* in- and out-parameter */ \
        (((sizeof(t) & VX_IOCPARM_MASK) << 16) | (VX_IOCF_ ## f) | ((VX_IOCG_ ## g) << 8) | (i & 0xff)))

/* AF_INET ioctls: */
/* Get interface primary address. */
#define SIOCGIFADDR      VX_IOWR(INET,  1, R, struct ifreq)

/* Set interface primary address. */
#define SIOCSIFADDR      VX_IOWR(INET,  2, W, struct ifreq)

/* Get broadcast address. */
#define SIOCGIFBRDADDR   VX_IOWR(INET,  3, R, struct ifreq)

/* Set broadcast address. */
#define SIOCSIFBRDADDR   VX_IOWR(INET,  4, R, struct ifreq)

/* Get (sub)net address mask. */
#define SIOCGIFNETMASK   VX_IOWR(INET,  5, R, struct ifreq)

/* Set (sub)net address mask. */
#define SIOCSIFNETMASK   VX_IOWR(INET,  6, W, struct ifreq)

/* Get point-to-point IPv4 address. */
#define SIOCGIFDSTADDR   VX_IOWR(INET,  7, R, struct ifreq)

/* Set point-to-point IPv4 address. */
#define SIOCSIFDSTADDR   VX_IOWR(INET,  8, W, struct ifreq)

/* Add interface alias/address. */
#define SIOCAIFADDR      VX_IOWR(INET,  9, W, struct in_aliasreq)

/* Delete interface address. */
#define SIOCDIFADDR      VX_IOWR(INET, 10, W, struct ifreq)

/* Deprecated (BSD 4.3 compat): add route. */
#define SIOCADDRT        VX_IOWR(INET, 11, W, struct ortentry)

/* Deprecated (BSD 4.3 compat): remove route. */
#define SIOCDELRT        VX_IOWR(INET, 12, W, struct ortentry)

/* Proprietary (BSD 4.3 compat): get route. */
#define SIOCXGETRT       VX_IOWR(INET, 13, R, struct ortentry)

/* Proprietary AF_INET MIP ioctls */
/* Add a home address */
#define SIOCAHOMEADDR    VX_IOWR(INET,  14, W, struct in_aliasreq)

/* ARP ioctls: */
/* Create/modify ARP entry. */
#define SIOCSARP         VX_IOWR(ARP, 1, W, struct arpreq)

/* Get ARP entry. */
#define SIOCGARP         VX_IOWR(ARP, 2, R, struct arpreq)

/* Delete ARP entry */
#define SIOCDARP         VX_IOWR(ARP, 3, W, struct arpreq)

/* interface ioctls: */
/* Get interface flags. */
#define SIOCGIFFLAGS     VX_IOWR(NETIF,  1, R, struct ifreq)

/* Set interface flags. */
#define SIOCSIFFLAGS     VX_IOWR(NETIF,  2, W, struct ifreq)

/* Get interface MTU. */
#define SIOCGIFMTU       VX_IOWR(NETIF,  3, R, struct ifreq)

/* Set interface MTU. */
#define SIOCSIFMTU       VX_IOWR(NETIF,  4, W, struct ifreq)

/* Get link level address.  */
#define SIOCGIFLLADDR    VX_IOWR(NETIF, 13, R, struct ifreq)

/* Set link level address.  */
#define SIOCSIFLLADDR    VX_IOWR(NETIF, 14, W, struct ifreq)

/* Get interface list. */
#define SIOCGIFCONF      VX_IOWR(NETIF, 21, W, struct ifconf)

/* Get interface index */
#define SIOCGIFINDEX     VX_IOWR(NETIF, 22, R, struct ifreq)

/* Get interface capabilities */
#define SIOCGIFCAP       VX_IOWR(NETIF, 23, R, struct ifreq)

/* proprietary ioctls: */
/* Detach interface. */
#define SIOCXDETACH       VX_IOWR(NETIF, 50, W, struct ifreq)

/* Get DHCP status. */
#define SIOCXGDHCPRUNNING VX_IOWR(NETIF, 52, W, struct ifreq)

/* Enable(1)/Disable(0) DHCP. */
#define SIOCXSDHCPRUNNING VX_IOWR(NETIF, 53, W, struct ifreq)

/* Get private interface data */
#define SIOCGIFPRIVATE    VX_IOWR(NETIF, 54, W, struct ifreq)

/* Set private interface data */
#define SIOCSIFPRIVATE    VX_IOWR(NETIF, 55, W, struct ifreq)

/* Set interface callback. */
#define SIOCXSIFFEVENTCB  VX_IOW(BASE,   74, W, if_eventcb)

/* Delete interface callback. */
#define SIOCXDIFFEVENTCB  VX_IOW(BASE,   75, W, if_eventcb)

/* Pretend to be a TTY. */
#define SIOCBEATTY	  VX_IOW(BASE,   76, W, int)

/* IPSEC ioctls */
#define SIOCXIPSEC_CTL       VX_IOWR(BASE, 55, W, void *)
#define SIOCXIPSEC_SA_CTL    VX_IOWR(BASE, 56, W, void *[2])
#define SIOCXIPSEC_CONF_CTL  VX_IOWR(BASE, 57, W, void *)

/* Multicast ioctls: */
/* get VIF statistics */
#define SIOCGETVIFCNT    VX_IOWR(MCAST,  0, R, struct sioc_vif_req)

/* get mcast route statistics */
#define SIOCGETSGCNT     VX_IOWR(MCAST,  1, R, struct sioc_sg_req)

/* route table ioctls */
/* Add a new virtual router and creates a route table with table ID == 0 */
#define SIOCADDVR        VX_IOWR(RTAB, 0, W, u_int16_t)

/* Delete a virtual router and all tables owned by it */
#define SIOCDELVR        VX_IOWR(RTAB, 1, W, u_int16_t)

/* Add a route table to a (virtual) router */
#define SIOCADDROUTETAB  VX_IOWR(RTAB, 2, W, struct sioc_route_table)

/* Delete a route table to a (virtual) router */
#define SIOCDELROUTETAB  VX_IOWR(RTAB, 3, W, struct sioc_route_table)

/* Get/create a route table by name */
#define SIOCGETROUTETAB  VX_IOWR(RTAB, 4, W, struct sioc_route_table)

/* Set a name for a route table. */
#define SIOCSROUTETABNAME VX_IOWR(RTAB, 5, W, struct sioc_route_table)

/* Mapps a route table name to VR and table ID */
#define SIOCGROUTETABNAME VX_IOWR(RTAB, 6, W, struct sioc_route_table)

/* interface ioctls: */
/* Get interface metric. */
#define SIOCGIFMETRIC    VX_IOWR(NETIF,  5, R, struct ifreq)

/* Set interface metric. */
#define SIOCSIFMETRIC    VX_IOWR(NETIF,  6, W, struct ifreq)

/* Get the route table index for an interface. */
#define SIOCGIFVR        VX_IOWR(NETIF,  7, R, struct ifreq)

/* Set an interface to a specific route table. */
#define SIOCSIFVR        VX_IOWR(NETIF,  8, W, struct ifreq)

/* Get tunnel parameter. */
#define SIOCGETTUNNEL    VX_IOWR(NETIF, 10, R, struct ip_tunnel_param)

/* Change tunnel parameters. */
#define SIOCCHGTUNNEL    VX_IOWR(NETIF, 12, W, struct ip_tunnel_param)

/* Get information about a virtual LAN interface,
 * 'ifru_data' must point to a struct vlanreq
 */
#define SIOCGETVLAN      VX_IOWR(NETIF, 15, R, struct ifreq)

/* Set information about a virtual LAN interface,
 * 'ifru_data' must point to a struct vlanreq
 */
#define SIOCSETVLAN      VX_IOWR(NETIF, 16, W, struct ifreq)

/* Create a pseudo interface (like vlan) */
#define SIOCIFCREATE     VX_IOWR(NETIF, 17, W, struct ifreq)

/* Destroy a pseudo interface (like vlan) */
#define SIOCIFDESTROY    VX_IOWR(NETIF, 18, W, struct ifreq)

/* Set vlan priority for a virtual LAN interface */
#define SIOCSETVLANPRI   VX_IOWR(NETIF, 19, W, struct ifreq)

/* bool: Activate/deactivate promiscuous mode. 'bool'is stored in int. */
#define SIOCXPROMISC     VX_IOW(NETIF, 102, W, int)

/* proprietary ioctls: */
/* Reset interface statistics counter */
#define SIOCXRESETSTAT   VX_IOWR(NETIF, 60, W, struct ifreq)

#endif /* ETHSOCK_H_ */

#ifdef __cplusplus
};
#endif

