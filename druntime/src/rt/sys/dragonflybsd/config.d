module rt.sys.dragonflybsd.config;

version (DragonFlyBSD):

// This selects the implementation file of the various OS primitives
enum string osMutexImport = "rt.sys.posix.osmutex";
enum string osSemaphoreImport = "rt.sys.posix.ossemaphore";
enum string osConditionImport = "rt.sys.posix.oscondition";
enum string osEventImport = "rt.sys.posix.osevent";
enum string osMemoryImport = "rt.sys.posix.osmemory";
enum string osTimerImport = "rt.sys.posix.ostimer";

// These turns on/off the generic implementations in the POSIX osthread module.
enum bool usePosix_osmemory_isLowOnMem = true;
enum bool usePosix_osmemory_os_physical_mem = true;

/**
* Indicates if an implementation supports fork().
*
* The value shown here is just demostrative, the real value is defined based
* on the OS it's being compiled in.
* enum HaveFork = true;
*/
enum HaveFork = true;
