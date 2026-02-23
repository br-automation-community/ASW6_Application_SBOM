/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARSSL_
#define _ARSSL_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum ArSslCipherVersionEnum
{	arSSL_TLS_1_2 = 1,
	arSSL_TLS_1_3 = 2
} ArSslCipherVersionEnum;

typedef struct ArSslCfgOwnCertificateType
{	plcstring Certificate[256];
	plcstring PrivateKey[256];
	plcstring Password[256];
} ArSslCfgOwnCertificateType;

typedef struct ArSslCfgOwnCertDetailsType
{	plcstring Certificate[256];
	plcstring PrivateKey[256];
} ArSslCfgOwnCertDetailsType;

typedef struct ArSslCfgType
{	struct ArSslCfgOwnCertificateType OwnCertificate;
	enum ArSslCipherVersionEnum SslVersion;
	unsigned long TrustedCertificates;
	unsigned long TrustedCertificateCount;
	unsigned long CRLs;
	unsigned long CRLCount;
} ArSslCfgType;

typedef struct ArSslCfgDetailsType
{	plcstring Name[256];
	struct ArSslCfgOwnCertDetailsType OwnCertificate;
	enum ArSslCipherVersionEnum SslVersion;
	unsigned long CipherCount;
	unsigned long TrustedCertificateCount;
	unsigned long CRLCount;
} ArSslCfgDetailsType;

typedef struct ArSslAsyncInternalType
{	struct ArFBStateInternalType FBStateCtx;
	struct ArFBAsyFuMaInternalType AsyFuMaCtx;
} ArSslAsyncInternalType;

typedef struct ArSslCreateCfg
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	struct ArSslCfgType Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslCreateCfg_typ;

typedef struct ArSslDeleteCfg
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslDeleteCfg_typ;

typedef struct ArSslOpen
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	unsigned long Ident;
	signed long StatusID;
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslOpen_typ;

typedef struct ArSslClose
{
	/* VAR_INPUT (analog) */
	unsigned long Ident;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslClose_typ;

typedef struct ArSslGetCfgDetails
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArSslCfgDetailsType Details;
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslGetCfgDetails_typ;

typedef struct ArSslGetCipher
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring Cipher[64];
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslGetCipher_typ;

typedef struct ArSslGetCertificate
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring TrustedCertificate[256];
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslGetCertificate_typ;

typedef struct ArSslGetCRL
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring CRL[256];
	/* VAR (analog) */
	struct ArSslAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSslGetCRL_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArSslCreateCfg(struct ArSslCreateCfg* inst);
_BUR_PUBLIC void ArSslDeleteCfg(struct ArSslDeleteCfg* inst);
_BUR_PUBLIC void ArSslOpen(struct ArSslOpen* inst);
_BUR_PUBLIC void ArSslClose(struct ArSslClose* inst);
_BUR_PUBLIC void ArSslGetCfgDetails(struct ArSslGetCfgDetails* inst);
_BUR_PUBLIC void ArSslGetCipher(struct ArSslGetCipher* inst);
_BUR_PUBLIC void ArSslGetCertificate(struct ArSslGetCertificate* inst);
_BUR_PUBLIC void ArSslGetCRL(struct ArSslGetCRL* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arSSL_ERR_CRLCOUNT_INVALID (-1070585980)
 #define arSSL_ERR_CRLS_DATA_INVALID (-1070585981)
 #define arSSL_ERR_TRUSTEDCOUNT_INVALID (-1070585982)
 #define arSSL_ERR_TRUSTED_DATA_INVALID (-1070585983)
 #define arSSL_ERR_SSL_VERSION_INVALID (-1070585984)
 #define arSSL_ERR_PRIVATE_KEY_INVALID (-1070585985)
 #define arSSL_ERR_OWN_CERT_INVALID (-1070585986)
 #define arSSL_ERR_NAME_INVALID (-1070585987)
 #define arSSL_ERR_CFG_ALREADY_EXISTS (-1070585988)
 #define arSSL_ERR_INDEX_OUT_OF_RANGE (-1070585989)
 #define arSSL_ERR_INTERNAL (-1070585990)
 #define arSSL_ERR_PASSWORD_INVALID (-1070585991)
 #define arSSL_ERR_PRIVATE_KEY_NOT_FOUND (-1070585992)
 #define arSSL_ERR_CERTIFICATE_INVALID (-1070585993)
 #define arSSL_ERR_SSL_CFG_NOT_FOUND (-1070585994)
 #define arSSL_ERR_IDENT_INVALID (-1070585995)
 #define arSSL_ERR_CRLS_INVALID (-1070585996)
#else
 _GLOBAL_CONST signed long arSSL_ERR_CRLCOUNT_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_CRLS_DATA_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_TRUSTEDCOUNT_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_TRUSTED_DATA_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_SSL_VERSION_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_PRIVATE_KEY_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_OWN_CERT_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_NAME_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_CFG_ALREADY_EXISTS;
 _GLOBAL_CONST signed long arSSL_ERR_INDEX_OUT_OF_RANGE;
 _GLOBAL_CONST signed long arSSL_ERR_INTERNAL;
 _GLOBAL_CONST signed long arSSL_ERR_PASSWORD_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_PRIVATE_KEY_NOT_FOUND;
 _GLOBAL_CONST signed long arSSL_ERR_CERTIFICATE_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_SSL_CFG_NOT_FOUND;
 _GLOBAL_CONST signed long arSSL_ERR_IDENT_INVALID;
 _GLOBAL_CONST signed long arSSL_ERR_CRLS_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARSSL_ */

