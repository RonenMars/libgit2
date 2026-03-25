#ifndef INCLUDE_features_h__
#define INCLUDE_features_h__

/* Manually generated for SPM builds — replaces CMake-generated header */

/* Debugging — all off */
/* #define GIT_DEBUG_POOL 1 */
/* #define GIT_DEBUG_STRICT_ALLOC 1 */
/* #define GIT_DEBUG_STRICT_OPEN 1 */

/* Threading — pthreads */
#define GIT_THREADS 1
#define GIT_THREADS_PTHREADS 1

/* SHA1 — builtin SHA1DC */
#define GIT_SHA1_BUILTIN 1

/* SHA256 — builtin */
#define GIT_SHA256_BUILTIN 1

/* Compression — builtin zlib */
#define GIT_COMPRESSION_BUILTIN 1

/* HTTP parser — llhttp (deps/llhttp) */
#define GIT_HTTPPARSER_LLHTTP 1

/* Regex — pcre (deps/pcre) */
#define GIT_REGEX_PCRE 1
#define GIT_REGEX_PCRE_JIT 0

/* HTTPS — disabled */
/* #define GIT_HTTPS 1 */

/* SSH — disabled */
/* #define GIT_SSH 1 */

/* Auth — disabled */
/* #define GIT_AUTH_NTLM 1 */
/* #define GIT_AUTH_NEGOTIATE 1 */

/* Nanosecond timestamps */
#define GIT_NSEC 1
#ifdef __APPLE__
#  define GIT_NSEC_MTIMESPEC 1
#else
#  define GIT_NSEC_MTIM 1
#endif

/* i18n — disabled (avoids iconv linker dependency in SPM builds) */
/* #define GIT_I18N 1 */
/* #define GIT_I18N_ICONV 1 */

/* Architecture */
#if defined(__LP64__) || defined(_WIN64)
#  define GIT_ARCH_64 1
#else
#  define GIT_ARCH_32 1
#endif

/* futimens */
#ifndef _WIN32
#  define GIT_FUTIMENS 1
#endif

/* Randomness — use /dev/urandom fallback (getentropy requires sys/random.h include) */
/* #define GIT_RAND_GETENTROPY 1 */

/* I/O */
#ifndef _WIN32
#  define GIT_IO_SELECT 1
#endif

/* qsort */
#ifdef __APPLE__
#  define GIT_QSORT_BSD 1
#else
#  define GIT_QSORT_GNU 1
#endif

#endif /* INCLUDE_features_h__ */
