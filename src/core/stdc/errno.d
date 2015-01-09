/**
 * D header file for C99.
 *
 * This contains bindings to selected types and functions from the standard C
 * header $(LINK2 http://pubs.opengroup.org/onlinepubs/009695399/basedefs/errno.h.html, <errno.h>). Note
 * that this is not automatically generated, and may omit some types/functions
 * from the original C header.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License: Distributed under the
 *      $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
 *    (See accompanying file LICENSE)
 * Authors:   Sean Kelly, Alex Rønne Petersen
 * Source:    $(DRUNTIMESRC core/stdc/_errno.d)
 * Standards: ISO/IEC 9899:1999 (E)
 */

module core.stdc.errno;

@trusted: // Only manipulates errno.
nothrow:
@nogc:

///
@property int errno() { return getErrno(); }
///
@property int errno(int n) { return setErrno(n); }

extern (C):

private extern (C) int getErrno();      // for internal use
private extern (C) int setErrno(int);   // for internal use

version( Windows )
{
    enum EPERM              = 1;        /// Operation not permitted
    enum ENOENT             = 2;        /// No such file or directory
    enum ESRCH              = 3;        /// No such process
    enum EINTR              = 4;        /// Interrupted system call
    enum EIO                = 5;        /// I/O error
    enum ENXIO              = 6;        /// No such device or address
    enum E2BIG              = 7;        /// Argument list too long
    enum ENOEXEC            = 8;        /// Exec format error
    enum EBADF              = 9;        /// Bad file number
    enum ECHILD             = 10;       /// No child processes
    enum EAGAIN             = 11;       /// Try again
    enum ENOMEM             = 12;       /// Out of memory
    enum EACCES             = 13;       /// Permission denied
    enum EFAULT             = 14;       /// Bad address
    enum EBUSY              = 16;       /// Device or resource busy
    enum EEXIST             = 17;       /// File exists
    enum EXDEV              = 18;       /// Cross-device link
    enum ENODEV             = 19;       /// No such device
    enum ENOTDIR            = 20;       /// Not a directory
    enum EISDIR             = 21;       /// Is a directory
    enum EINVAL             = 22;       /// Invalid argument
    enum ENFILE             = 23;       /// File table overflow
    enum EMFILE             = 24;       /// Too many open files
    enum ENOTTY             = 25;       /// Not a typewriter
    enum EFBIG              = 27;       /// File too large
    enum ENOSPC             = 28;       /// No space left on device
    enum ESPIPE             = 29;       /// Illegal seek
    enum EROFS              = 30;       /// Read-only file system
    enum EMLINK             = 31;       /// Too many links
    enum EPIPE              = 32;       /// Broken pipe
    enum EDOM               = 33;       /// Math argument out of domain of func
    enum ERANGE             = 34;       /// Math result not representable
    enum EDEADLK            = 36;       /// Resource deadlock would occur
    enum ENAMETOOLONG       = 38;       /// File name too long
    enum ENOLCK             = 39;       /// No record locks available
    enum ENOSYS             = 40;       /// Function not implemented
    enum ENOTEMPTY          = 41;       /// Directory not empty
    enum EILSEQ             = 42;       /// Illegal byte sequence
    enum EDEADLOCK          = EDEADLK;  /// Resource deadlock would occur
}
else version( linux )
{
    enum EPERM              = 1;        /// Operation not permitted
    enum ENOENT             = 2;        /// No such file or directory
    enum ESRCH              = 3;        /// No such process
    enum EINTR              = 4;        /// Interrupted system call
    enum EIO                = 5;        /// I/O error
    enum ENXIO              = 6;        /// No such device or address
    enum E2BIG              = 7;        /// Argument list too long
    enum ENOEXEC            = 8;        /// Exec format error
    enum EBADF              = 9;        /// Bad file number
    enum ECHILD             = 10;       /// No child processes
    enum EAGAIN             = 11;       /// Try again
    enum ENOMEM             = 12;       /// Out of memory
    enum EACCES             = 13;       /// Permission denied
    enum EFAULT             = 14;       /// Bad address
    enum ENOTBLK            = 15;       /// Block device required
    enum EBUSY              = 16;       /// Device or resource busy
    enum EEXIST             = 17;       /// File exists
    enum EXDEV              = 18;       /// Cross-device link
    enum ENODEV             = 19;       /// No such device
    enum ENOTDIR            = 20;       /// Not a directory
    enum EISDIR             = 21;       /// Is a directory
    enum EINVAL             = 22;       /// Invalid argument
    enum ENFILE             = 23;       /// File table overflow
    enum EMFILE             = 24;       /// Too many open files
    enum ENOTTY             = 25;       /// Not a typewriter
    enum ETXTBSY            = 26;       /// Text file busy
    enum EFBIG              = 27;       /// File too large
    enum ENOSPC             = 28;       /// No space left on device
    enum ESPIPE             = 29;       /// Illegal seek
    enum EROFS              = 30;       /// Read-only file system
    enum EMLINK             = 31;       /// Too many links
    enum EPIPE              = 32;       /// Broken pipe
    enum EDOM               = 33;       /// Math argument out of domain of func
    enum ERANGE             = 34;       /// Math result not representable
    enum EDEADLK            = 35;       /// Resource deadlock would occur
    enum ENAMETOOLONG       = 36;       /// File name too long
    enum ENOLCK             = 37;       /// No record locks available
    enum ENOSYS             = 38;       /// Function not implemented
    enum ENOTEMPTY          = 39;       /// Directory not empty
    enum ELOOP              = 40;       /// Too many symbolic links encountered
    enum EWOULDBLOCK        = EAGAIN;   /// Operation would block
    enum ENOMSG             = 42;       /// No message of desired type
    enum EIDRM              = 43;       /// Identifier removed
    enum ECHRNG             = 44;       /// Channel number out of range
    enum EL2NSYNC           = 45;       /// Level 2 not synchronized
    enum EL3HLT             = 46;       /// Level 3 halted
    enum EL3RST             = 47;       /// Level 3 reset
    enum ELNRNG             = 48;       /// Link number out of range
    enum EUNATCH            = 49;       /// Protocol driver not attached
    enum ENOCSI             = 50;       /// No CSI structure available
    enum EL2HLT             = 51;       /// Level 2 halted
    enum EBADE              = 52;       /// Invalid exchange
    enum EBADR              = 53;       /// Invalid request descriptor
    enum EXFULL             = 54;       /// Exchange full
    enum ENOANO             = 55;       /// No anode
    enum EBADRQC            = 56;       /// Invalid request code
    enum EBADSLT            = 57;       /// Invalid slot
    enum EDEADLOCK          = EDEADLK;  /// Resource deadlock would occur
    enum EBFONT             = 59;       /// Bad font file format
    enum ENOSTR             = 60;       /// Device not a stream
    enum ENODATA            = 61;       /// No data available
    enum ETIME              = 62;       /// Timer expired
    enum ENOSR              = 63;       /// Out of streams resources
    enum ENONET             = 64;       /// Machine is not on the network
    enum ENOPKG             = 65;       /// Package not installed
    enum EREMOTE            = 66;       /// Object is remote
    enum ENOLINK            = 67;       /// Link has been severed
    enum EADV               = 68;       /// Advertise error
    enum ESRMNT             = 69;       /// Srmount error
    enum ECOMM              = 70;       /// Communication error on send
    enum EPROTO             = 71;       /// Protocol error
    enum EMULTIHOP          = 72;       /// Multihop attempted
    enum EDOTDOT            = 73;       /// RFS specific error
    enum EBADMSG            = 74;       /// Not a data message
    enum EOVERFLOW          = 75;       /// Value too large for defined data type
    enum ENOTUNIQ           = 76;       /// Name not unique on network
    enum EBADFD             = 77;       /// File descriptor in bad state
    enum EREMCHG            = 78;       /// Remote address changed
    enum ELIBACC            = 79;       /// Can not access a needed shared library
    enum ELIBBAD            = 80;       /// Accessing a corrupted shared library
    enum ELIBSCN            = 81;       /// .lib section in a.out corrupted
    enum ELIBMAX            = 82;       /// Attempting to link in too many shared libraries
    enum ELIBEXEC           = 83;       /// Cannot exec a shared library directly
    enum EILSEQ             = 84;       /// Illegal byte sequence
    enum ERESTART           = 85;       /// Interrupted system call should be restarted
    enum ESTRPIPE           = 86;       /// Streams pipe error
    enum EUSERS             = 87;       /// Too many users
    enum ENOTSOCK           = 88;       /// Socket operation on non-socket
    enum EDESTADDRREQ       = 89;       /// Destination address required
    enum EMSGSIZE           = 90;       /// Message too long
    enum EPROTOTYPE         = 91;       /// Protocol wrong type for socket
    enum ENOPROTOOPT        = 92;       /// Protocol not available
    enum EPROTONOSUPPORT    = 93;       /// Protocol not supported
    enum ESOCKTNOSUPPORT    = 94;       /// Socket type not supported
    enum EOPNOTSUPP         = 95;       /// Operation not supported on transport endpoint
    enum ENOTSUP            = EOPNOTSUPP;/// Operation not supported on transport endpoint
    enum EPFNOSUPPORT       = 96;       /// Protocol family not supported
    enum EAFNOSUPPORT       = 97;       /// Address family not supported by protocol
    enum EADDRINUSE         = 98;       /// Address already in use
    enum EADDRNOTAVAIL      = 99;       /// Cannot assign requested address
    enum ENETDOWN           = 100;      /// Network is down
    enum ENETUNREACH        = 101;      /// Network is unreachable
    enum ENETRESET          = 102;      /// Network dropped connection because of reset
    enum ECONNABORTED       = 103;      /// Software caused connection abort
    enum ECONNRESET         = 104;      /// Connection reset by peer
    enum ENOBUFS            = 105;      /// No buffer space available
    enum EISCONN            = 106;      /// Transport endpoint is already connected
    enum ENOTCONN           = 107;      /// Transport endpoint is not connected
    enum ESHUTDOWN          = 108;      /// Cannot send after transport endpoint shutdown
    enum ETOOMANYREFS       = 109;      /// Too many references: cannot splice
    enum ETIMEDOUT          = 110;      /// Connection timed out
    enum ECONNREFUSED       = 111;      /// Connection refused
    enum EHOSTDOWN          = 112;      /// Host is down
    enum EHOSTUNREACH       = 113;      /// No route to host
    enum EALREADY           = 114;      /// Operation already in progress
    enum EINPROGRESS        = 115;      /// Operation now in progress
    enum ESTALE             = 116;      /// Stale NFS file handle
    enum EUCLEAN            = 117;      /// Structure needs cleaning
    enum ENOTNAM            = 118;      /// Not a XENIX named type file
    enum ENAVAIL            = 119;      /// No XENIX semaphores available
    enum EISNAM             = 120;      /// Is a named type file
    enum EREMOTEIO          = 121;      /// Remote I/O error
    enum EDQUOT             = 122;      /// Quota exceeded
    enum ENOMEDIUM          = 123;      /// No medium found
    enum EMEDIUMTYPE        = 124;      /// Wrong medium type
    enum ECANCELED          = 125;      /// Operation Canceled
    enum ENOKEY             = 126;      /// Required key not available
    enum EKEYEXPIRED        = 127;      /// Key has expired
    enum EKEYREVOKED        = 128;      /// Key has been revoked
    enum EKEYREJECTED       = 129;      /// Key was rejected by service
    enum EOWNERDEAD         = 130;      /// Owner died
    enum ENOTRECOVERABLE    = 131;      /// State not recoverable
}
else version( OSX )
{
    enum EPERM              = 1;        /// Operation not permitted
    enum ENOENT             = 2;        /// No such file or directory
    enum ESRCH              = 3;        /// No such process
    enum EINTR              = 4;        /// Interrupted system call
    enum EIO                = 5;        /// Input/output error
    enum ENXIO              = 6;        /// Device not configured
    enum E2BIG              = 7;        /// Argument list too long
    enum ENOEXEC            = 8;        /// Exec format error
    enum EBADF              = 9;        /// Bad file descriptor
    enum ECHILD             = 10;       /// No child processes
    enum EDEADLK            = 11;       /// Resource deadlock avoided
    enum ENOMEM             = 12;       /// Cannot allocate memory
    enum EACCES             = 13;       /// Permission denied
    enum EFAULT             = 14;       /// Bad address
    enum EBUSY              = 16;       /// Device busy
    enum EEXIST             = 17;       /// File exists
    enum EXDEV              = 18;       /// Cross-device link
    enum ENODEV             = 19;       /// Operation not supported by device
    enum ENOTDIR            = 20;       /// Not a directory
    enum EISDIR             = 21;       /// Is a directory
    enum EINVAL             = 22;       /// Invalid argument
    enum ENFILE             = 23;       /// Too many open files in system
    enum EMFILE             = 24;       /// Too many open files
    enum ENOTTY             = 25;       /// Inappropriate ioctl for device
    enum ETXTBSY            = 26;       /// Text file busy
    enum EFBIG              = 27;       /// File too large
    enum ENOSPC             = 28;       /// No space left on device
    enum ESPIPE             = 29;       /// Illegal seek
    enum EROFS              = 30;       /// Read-only file system
    enum EMLINK             = 31;       /// Too many links
    enum EPIPE              = 32;       /// Broken pipe
    enum EDOM               = 33;       /// Numerical argument out of domain
    enum ERANGE             = 34;       /// Result too large
    enum EAGAIN             = 35;       /// Resource temporarily unavailable
    enum EWOULDBLOCK        = EAGAIN;   /// Operation would block
    enum EINPROGRESS        = 36;       /// Operation now in progress
    enum EALREADY           = 37;       /// Operation already in progress
    enum ENOTSOCK           = 38;       /// Socket operation on non-socket
    enum EDESTADDRREQ       = 39;       /// Destination address required
    enum EMSGSIZE           = 40;       /// Message too long
    enum EPROTOTYPE         = 41;       /// Protocol wrong type for socket
    enum ENOPROTOOPT        = 42;       /// Protocol not available
    enum EPROTONOSUPPORT    = 43;       /// Protocol not supported
    enum ENOTSUP            = 45;       /// Operation not supported
    enum EOPNOTSUPP         = ENOTSUP;  /// Operation not supported on socket
    enum EAFNOSUPPORT       = 47;       /// Address family not supported by protocol family
    enum EADDRINUSE         = 48;       /// Address already in use
    enum EADDRNOTAVAIL      = 49;       /// Can't assign requested address
    enum ENETDOWN           = 50;       /// Network is down
    enum ENETUNREACH        = 51;       /// Network is unreachable
    enum ENETRESET          = 52;       /// Network dropped connection on reset
    enum ECONNABORTED       = 53;       /// Software caused connection abort
    enum ECONNRESET         = 54;       /// Connection reset by peer
    enum ENOBUFS            = 55;       /// No buffer space available
    enum EISCONN            = 56;       /// Socket is already connected
    enum ENOTCONN           = 57;       /// Socket is not connected
    enum ETIMEDOUT          = 60;       /// Operation timed out
    enum ECONNREFUSED       = 61;       /// Connection refused
    enum ELOOP              = 62;       /// Too many levels of symbolic links
    enum ENAMETOOLONG       = 63;       /// File name too long
    enum EHOSTUNREACH       = 65;       /// No route to host
    enum ENOTEMPTY          = 66;       /// Directory not empty
    enum EDQUOT             = 69;       /// Disc quota exceeded
    enum ESTALE             = 70;       /// Stale NFS file handle
    enum ENOLCK             = 77;       /// No locks available
    enum ENOSYS             = 78;       /// Function not implemented
    enum EOVERFLOW          = 84;       /// Value too large to be stored in data type
    enum ECANCELED          = 89;       /// Operation canceled
    enum EIDRM              = 90;       /// Identifier removed
    enum ENOMSG             = 91;       /// No message of desired type
    enum EILSEQ             = 92;       /// Illegal byte sequence
    enum EBADMSG            = 94;       /// Bad message
    enum EMULTIHOP          = 95;       /// Reserved
    enum ENODATA            = 96;       /// No message available on STREAM
    enum ENOLINK            = 97;       /// Reserved
    enum ENOSR              = 98;       /// No STREAM resources
    enum ENOSTR             = 99;       /// Not a STREAM
    enum EPROTO             = 100;      /// Protocol error
    enum ETIME              = 101;      /// STREAM ioctl timeout
    enum ELAST              = 101;      /// Must be equal largest errno
}
else version( FreeBSD )
{
    enum EPERM              = 1;        /// Operation not permitted
    enum ENOENT             = 2;        /// No such file or directory
    enum ESRCH              = 3;        /// No such process
    enum EINTR              = 4;        /// Interrupted system call
    enum EIO                = 5;        /// Input/output error
    enum ENXIO              = 6;        /// Device not configured
    enum E2BIG              = 7;        /// Argument list too long
    enum ENOEXEC            = 8;        /// Exec format error
    enum EBADF              = 9;        /// Bad file descriptor
    enum ECHILD             = 10;       /// No child processes
    enum EDEADLK            = 11;       /// Resource deadlock avoided
    enum ENOMEM             = 12;       /// Cannot allocate memory
    enum EACCES             = 13;       /// Permission denied
    enum EFAULT             = 14;       /// Bad address
    enum ENOTBLK            = 15;       /// Block device required
    enum EBUSY              = 16;       /// Device busy
    enum EEXIST             = 17;       /// File exists
    enum EXDEV              = 18;       /// Cross-device link
    enum ENODEV             = 19;       /// Operation not supported by device
    enum ENOTDIR            = 20;       /// Not a directory
    enum EISDIR             = 21;       /// Is a directory
    enum EINVAL             = 22;       /// Invalid argument
    enum ENFILE             = 23;       /// Too many open files in system
    enum EMFILE             = 24;       /// Too many open files
    enum ENOTTY             = 25;       /// Inappropriate ioctl for device
    enum ETXTBSY            = 26;       /// Text file busy
    enum EFBIG              = 27;       /// File too large
    enum ENOSPC             = 28;       /// No space left on device
    enum ESPIPE             = 29;       /// Illegal seek
    enum EROFS              = 30;       /// Read-only file system
    enum EMLINK             = 31;       /// Too many links
    enum EPIPE              = 32;       /// Broken pipe
    enum EDOM               = 33;       /// Numerical argument out of domain
    enum ERANGE             = 34;       /// Result too large
    enum EAGAIN             = 35;       /// Resource temporarily unavailable
    enum EWOULDBLOCK        = EAGAIN;   /// Operation would block
    enum EINPROGRESS        = 36;       /// Operation now in progress
    enum EALREADY           = 37;       /// Operation already in progress
    enum ENOTSOCK           = 38;       /// Socket operation on non-socket
    enum EDESTADDRREQ       = 39;       /// Destination address required
    enum EMSGSIZE           = 40;       /// Message too long
    enum EPROTOTYPE         = 41;       /// Protocol wrong type for socket
    enum ENOPROTOOPT        = 42;       /// Protocol not available
    enum EPROTONOSUPPORT    = 43;       /// Protocol not supported
    enum ENOTSUP            = 45;       /// Operation not supported
    enum EOPNOTSUPP         = ENOTSUP;  /// Operation not supported on socket
    enum EAFNOSUPPORT       = 47;       /// Address family not supported by protocol family
    enum EADDRINUSE         = 48;       /// Address already in use
    enum EADDRNOTAVAIL      = 49;       /// Can't assign requested address
    enum ENETDOWN           = 50;       /// Network is down
    enum ENETUNREACH        = 51;       /// Network is unreachable
    enum ENETRESET          = 52;       /// Network dropped connection on reset
    enum ECONNABORTED       = 53;       /// Software caused connection abort
    enum ECONNRESET         = 54;       /// Connection reset by peer
    enum ENOBUFS            = 55;       /// No buffer space available
    enum EISCONN            = 56;       /// Socket is already connected
    enum ENOTCONN           = 57;       /// Socket is not connected
    enum ESHUTDOWN          = 58;       /// Can't send after socket shutdown
    enum ETOOMANYREFS       = 59;       /// Too many refrences; can't splice
    enum ETIMEDOUT          = 60;       /// Operation timed out
    enum ECONNREFUSED       = 61;       /// Connection refused
    enum ELOOP              = 62;       /// Too many levels of symbolic links
    enum ENAMETOOLONG       = 63;       /// File name too long
    enum EHOSTUNREACH       = 65;       /// No route to host
    enum ENOTEMPTY          = 66;       /// Directory not empty
    enum EPROCLIM           = 67;       /// Too many processes
    enum EUSERS             = 68;       /// Too many users
    enum EDQUOT             = 69;       /// Disc quota exceeded
    enum ESTALE             = 70;       /// Stale NFS file handle
    enum EREMOTE            = 71;       /// Too many levels of remote in path
    enum EBADRPC            = 72;       /// RPC struct is bad
    enum ERPCMISMATCH       = 73;       /// RPC version wrong
    enum EPROGUNAVAIL       = 74;       /// RPC prog. not avail
    enum EPROGMISMATCH      = 75;       /// Program version wrong
    enum EPROCUNAVAIL       = 76;       /// Bad procedure for program
    enum ENOLCK             = 77;       /// No locks available
    enum ENOSYS             = 78;       /// Function not implemented
    enum EFTYPE             = 79;       /// Inappropriate file type or format
    enum EAUTH              = 80;       /// Authentication error
    enum ENEEDAUTH          = 81;       /// Need authenticator
    enum EIDRM              = 82;       /// Itendifier removed
    enum ENOMSG             = 83;       /// No message of desired type
    enum EOVERFLOW          = 84;       /// Value too large to be stored in data type
    enum ECANCELED          = 85;       /// Operation canceled
    enum EILSEQ             = 86;       /// Illegal byte sequence
    enum ENOATTR            = 87;       /// Attribute not found
    enum EDOOFUS            = 88;       /// Programming error
    enum EBADMSG            = 89;       /// Bad message
    enum EMULTIHOP          = 90;       /// Multihop attempted
    enum ENOLINK            = 91;       /// Link has been severed
    enum EPROTO             = 92;       /// Protocol error
    enum ELAST              = 92;       /// Must be equal largest errno
}
else version (Solaris)
{
    enum EPERM =  1       /** Not super-user                       */;
    enum ENOENT = 2       /** No such file or directory            */;
    enum ESRCH =  3       /** No such process                      */;
    enum EINTR =  4       /** interrupted system call              */;
    enum EIO =    5       /** I/O error                            */;
    enum ENXIO =  6       /** No such device or address            */;
    enum E2BIG =  7       /** Arg list too long                    */;
    enum ENOEXEC = 8       /** Exec format error                    */;
    enum EBADF =  9       /** Bad file number                      */;
    enum ECHILD = 10      /** No children                          */;
    enum EAGAIN = 11      /** Resource temporarily unavailable     */;
    enum ENOMEM = 12      /** Not enough core                      */;
    enum EACCES = 13      /** Permission denied                    */;
    enum EFAULT = 14      /** Bad address                          */;
    enum ENOTBLK = 15      /** Block device required                */;
    enum EBUSY =  16      /** Mount device busy                    */;
    enum EEXIST = 17      /** File exists                          */;
    enum EXDEV =  18      /** Cross-device link                    */;
    enum ENODEV = 19      /** No such device                       */;
    enum ENOTDIR = 20      /** Not a directory                      */;
    enum EISDIR = 21      /** Is a directory                       */;
    enum EINVAL = 22      /** Invalid argument                     */;
    enum ENFILE = 23      /** File table overflow                  */;
    enum EMFILE = 24      /** Too many open files                  */;
    enum ENOTTY = 25      /** Inappropriate ioctl for device       */;
    enum ETXTBSY = 26      /** Text file busy                       */;
    enum EFBIG =  27      /** File too large                       */;
    enum ENOSPC = 28      /** No space left on device              */;
    enum ESPIPE = 29      /** Illegal seek                         */;
    enum EROFS =  30      /** Read only file system                */;
    enum EMLINK = 31      /** Too many links                       */;
    enum EPIPE =  32      /** Broken pipe                          */;
    enum EDOM =   33      /** Math arg out of domain of func       */;
    enum ERANGE = 34      /** Math result not representable        */;
    enum ENOMSG = 35      /** No message of desired type           */;
    enum EIDRM =  36      /** Identifier removed                   */;
    enum ECHRNG = 37      /** Channel number out of range          */;
    enum EL2NSYNC = 38     /** Level 2 not synchronized             */;
    enum EL3HLT = 39      /** Level 3 halted                       */;
    enum EL3RST = 40      /** Level 3 reset                        */;
    enum ELNRNG = 41      /** Link number out of range             */;
    enum EUNATCH = 42      /** Protocol driver not attached         */;
    enum ENOCSI = 43      /** No CSI structure available           */;
    enum EL2HLT = 44      /** Level 2 halted                       */;
    enum EDEADLK = 45      /** Deadlock condition.                  */;
    enum ENOLCK = 46      /** No record locks available.           */;
    enum ECANCELED = 47    /** Operation canceled                   */;
    enum ENOTSUP = 48      /** Operation not supported              */;
    enum EDQUOT = 49      /** Disc quota exceeded                  */;
    enum EBADE =  50      /** invalid exchange                     */;
    enum EBADR =  51      /** invalid request descriptor           */;
    enum EXFULL = 52      /** exchange full                        */;
    enum ENOANO = 53      /** no anode                             */;
    enum EBADRQC = 54      /** invalid request code                 */;
    enum EBADSLT = 55      /** invalid slot                         */;
    enum EDEADLOCK = 56    /** file locking deadlock error          */;
    enum EBFONT = 57      /** bad font file fmt                    */;
    enum EOWNERDEAD =     58      /** process died with the lock */;
    enum ENOTRECOVERABLE = 59      /** lock is not recoverable */;
    enum ENOSTR = 60      /** Device not a stream                  */;
    enum ENODATA = 61      /** no data (for no delay io)            */;
    enum ETIME =  62      /** timer expired                        */;
    enum ENOSR =  63      /** out of streams resources             */;
    enum ENONET = 64      /** Machine is not on the network        */;
    enum ENOPKG = 65      /** Package not installed                */;
    enum EREMOTE = 66      /** The object is remote                 */;
    enum ENOLINK = 67      /** the link has been severed            */;
    enum EADV =   68      /** advertise error                      */;
    enum ESRMNT = 69      /** srmount error                        */;
    enum ECOMM =  70      /** Communication error on send          */;
    enum EPROTO = 71      /** Protocol error                       */;
    enum ELOCKUNMAPPED =  72      /** locked lock was unmapped */;
    enum ENOTACTIVE = 73   /** Facility is not active               */;
    enum EMULTIHOP = 74    /** multihop attempted                   */;
    enum EBADMSG = 77      /** trying to read unreadable message    */;
    enum ENAMETOOLONG = 78 /** path name is too long                */;
    enum EOVERFLOW = 79    /** value too large to be stored in data type */;
    enum ENOTUNIQ = 80     /** given log. name not unique           */;
    enum EBADFD =  81      /** f.d. invalid for this operation      */;
    enum EREMCHG = 82      /** Remote address changed               */;
    enum ELIBACC = 83      /** Can't access a needed shared lib.    */;
    enum ELIBBAD = 84      /** Accessing a corrupted shared lib.    */;
    enum ELIBSCN = 85      /** .lib section in a.out corrupted.     */;
    enum ELIBMAX = 86      /** Attempting to link in too many libs. */;
    enum ELIBEXEC = 87     /** Attempting to exec a shared library. */;
    enum EILSEQ = 88      /** Illegal byte sequence.               */;
    enum ENOSYS = 89      /** Unsupported file system operation    */;
    enum ELOOP =  90      /** Symbolic link loop                   */;
    enum ERESTART = 91     /** Restartable system call              */;
    enum ESTRPIPE = 92     /** if pipe/FIFO, don't sleep in stream head */;
    enum ENOTEMPTY = 93    /** directory not empty                  */;
    enum EUSERS = 94      /** Too many users (for UFS)             */;
    enum ENOTSOCK =       95      /** Socket operation on non-socket */;
    enum EDESTADDRREQ =   96      /** Destination address required */;
    enum EMSGSIZE =       97      /** Message too long */;
    enum EPROTOTYPE =     98      /** Protocol wrong type for socket */;
    enum ENOPROTOOPT =    99      /** Protocol not available */;
    enum EPROTONOSUPPORT = 120     /** Protocol not supported */;
    enum ESOCKTNOSUPPORT = 121     /** Socket type not supported */;
    enum EOPNOTSUPP =     122     /** Operation not supported on socket */;
    enum EPFNOSUPPORT =   123     /** Protocol family not supported */;
    enum EAFNOSUPPORT =   124     /** Address family not supported by the protocol family */;
    enum EADDRINUSE =     125     /** Address already in use */;
    enum EADDRNOTAVAIL =   126     /** Can't assign requested address */;
    enum ENETDOWN =       127     /** Network is down */;
    enum ENETUNREACH =    128     /** Network is unreachable */;
    enum ENETRESET =      129     /** Network dropped connection because of reset */;
    enum ECONNABORTED =   130     /** Software caused connection abort */;
    enum ECONNRESET =     131     /** Connection reset by peer */;
    enum ENOBUFS =        132     /** No buffer space available */;
    enum EISCONN =        133     /** Socket is already connected */;
    enum ENOTCONN =       134     /** Socket is not connected */;
    enum ESHUTDOWN =      143     /** Can't send after socket shutdown */;
    enum ETOOMANYREFS =   144     /** Too many references: can't splice */;
    enum ETIMEDOUT =      145     /** Connection timed out */;
    enum ECONNREFUSED =   146     /** Connection refused */;
    enum EHOSTDOWN =      147     /** Host is down */;
    enum EHOSTUNREACH =   148     /** No route to host */;
    enum EWOULDBLOCK =    EAGAIN;      /** Resource temporarily unavailable     */;
    enum EALREADY =       149     /** operation already in progress */;
    enum EINPROGRESS =    150     /** operation now in progress */;
    enum ESTALE =         151     /** Stale NFS file handle */;
}
else version( Android )
{
    version(X86)
    {
        enum EPERM              = 1; ///
        enum ENOENT             = 2; ///
        enum ESRCH              = 3; ///
        enum EINTR              = 4; ///
        enum EIO                = 5; ///
        enum ENXIO              = 6; ///
        enum E2BIG              = 7; ///
        enum ENOEXEC            = 8; ///
        enum EBADF              = 9; ///
        enum ECHILD             = 10; ///
        enum EAGAIN             = 11; ///
        enum ENOMEM             = 12; ///
        enum EACCES             = 13; ///
        enum EFAULT             = 14; ///
        enum ENOTBLK            = 15; ///
        enum EBUSY              = 16; ///
        enum EEXIST             = 17; ///
        enum EXDEV              = 18; ///
        enum ENODEV             = 19; ///
        enum ENOTDIR            = 20; ///
        enum EISDIR             = 21; ///
        enum EINVAL             = 22; ///
        enum ENFILE             = 23; ///
        enum EMFILE             = 24; ///
        enum ENOTTY             = 25; ///
        enum ETXTBSY            = 26; ///
        enum EFBIG              = 27; ///
        enum ENOSPC             = 28; ///
        enum ESPIPE             = 29; ///
        enum EROFS              = 30; ///
        enum EMLINK             = 31; ///
        enum EPIPE              = 32; ///
        enum EDOM               = 33; ///
        enum ERANGE             = 34; ///
        enum EDEADLK            = 35; ///
        enum ENAMETOOLONG       = 36; ///
        enum ENOLCK             = 37; ///
        enum ENOSYS             = 38; ///
        enum ENOTEMPTY          = 39; ///
        enum ELOOP              = 40; ///
        enum ENOMSG             = 42; ///
        enum EIDRM              = 43; ///
        enum ECHRNG             = 44; ///
        enum EL2NSYNC           = 45; ///
        enum EL3HLT             = 46; ///
        enum EL3RST             = 47; ///
        enum ELNRNG             = 48; ///
        enum EUNATCH            = 49; ///
        enum ENOCSI             = 50; ///
        enum EL2HLT             = 51; ///
        enum EBADE              = 52; ///
        enum EBADR              = 53; ///
        enum EXFULL             = 54; ///
        enum ENOANO             = 55; ///
        enum EBADRQC            = 56; ///
        enum EBADSLT            = 57; ///
        enum EBFONT             = 59; ///
        enum ENOSTR             = 60; ///
        enum ENODATA            = 61; ///
        enum ETIME              = 62; ///
        enum ENOSR              = 63; ///
        enum ENONET             = 64; ///
        enum ENOPKG             = 65; ///
        enum EREMOTE            = 66; ///
        enum ENOLINK            = 67; ///
        enum EADV               = 68; ///
        enum ESRMNT             = 69; ///
        enum ECOMM              = 70; ///
        enum EPROTO             = 71; ///
        enum EMULTIHOP          = 72; ///
        enum EDOTDOT            = 73; ///
        enum EBADMSG            = 74; ///
        enum EOVERFLOW          = 75; ///
        enum ENOTUNIQ           = 76; ///
        enum EBADFD             = 77; ///
        enum EREMCHG            = 78; ///
        enum ELIBACC            = 79; ///
        enum ELIBBAD            = 80; ///
        enum ELIBSCN            = 81; ///
        enum ELIBMAX            = 82; ///
        enum ELIBEXEC           = 83; ///
        enum EILSEQ             = 84; ///
        enum ERESTART           = 85; ///
        enum ESTRPIPE           = 86; ///
        enum EUSERS             = 87; ///
        enum ENOTSOCK           = 88; ///
        enum EDESTADDRREQ       = 89; ///
        enum EMSGSIZE           = 90; ///
        enum EPROTOTYPE         = 91; ///
        enum ENOPROTOOPT        = 92; ///
        enum EPROTONOSUPPORT    = 93; ///
        enum ESOCKTNOSUPPORT    = 94; ///
        enum EOPNOTSUPP         = 95; ///
        enum EPFNOSUPPORT       = 96; ///
        enum EAFNOSUPPORT       = 97; ///
        enum EADDRINUSE         = 98; ///
        enum EADDRNOTAVAIL      = 99; ///
        enum ENETDOWN           = 100; ///
        enum ENETUNREACH        = 101; ///
        enum ENETRESET          = 102; ///
        enum ECONNABORTED       = 103; ///
        enum ECONNRESET         = 104; ///
        enum ENOBUFS            = 105; ///
        enum EISCONN            = 106; ///
        enum ENOTCONN           = 107; ///
        enum ESHUTDOWN          = 108; ///
        enum ETOOMANYREFS       = 109; ///
        enum ETIMEDOUT          = 110; ///
        enum ECONNREFUSED       = 111; ///
        enum EHOSTDOWN          = 112; ///
        enum EHOSTUNREACH       = 113; ///
        enum EALREADY           = 114; ///
        enum EINPROGRESS        = 115; ///
        enum ESTALE             = 116; ///
        enum EUCLEAN            = 117; ///
        enum ENOTNAM            = 118; ///
        enum ENAVAIL            = 119; ///
        enum EISNAM             = 120; ///
        enum EREMOTEIO          = 121; ///
        enum EDQUOT             = 122; ///
        enum ENOMEDIUM          = 123; ///
        enum EMEDIUMTYPE        = 124; ///
        enum ECANCELED          = 125; ///
        enum ENOKEY             = 126; ///
        enum EKEYEXPIRED        = 127; ///
        enum EKEYREVOKED        = 128; ///
        enum EKEYREJECTED       = 129; ///
        enum EOWNERDEAD         = 130; ///
        enum ENOTRECOVERABLE    = 131; ///
    }
    else
    {
        static assert(false, "Architecture not supported.");
    }
}
else
{
    static assert(false, "Unsupported platform");
}
