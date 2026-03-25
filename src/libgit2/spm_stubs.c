/*
 * spm_stubs.c — no-op stubs for disabled backends (mbedtls, openssl, libssh2).
 *
 * libgit2.c unconditionally references these init functions in its init_fns[].
 * When building via SPM with HTTPS and SSH disabled the corresponding .c files
 * are excluded from the build, so we provide harmless stubs here instead.
 */

int git_mbedtls_stream_global_init(void) { return 0; }
int git_openssl_stream_global_init(void)  { return 0; }
int git_transport_ssh_libssh2_global_init(void) { return 0; }
