// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "libgit2",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(name: "libgit2", targets: ["libgit2"]),
    ],
    targets: [
        .target(
            name: "libgit2",
            path: ".",
            exclude: [
                "CMakeLists.txt", "cmake", "ci", "script",
                "docs", "examples", "tests", "fuzzers", "benchmarks",
                ".github", ".devcontainer", ".vscode",
                "src/util/git2_features.h.in",
                "src/util/win32",
                "src/util/hash/win32.c",
                "src/util/hash/win32.h",
                "src/util/hash/openssl.c",
                "src/util/hash/openssl.h",
                "src/util/hash/mbedtls.c",
                "src/util/hash/mbedtls.h",
                "src/util/hash/common_crypto.c",
                "src/util/hash/common_crypto.h",
                "deps/clar",
                "deps/winhttp", "deps/ntlmclient",
                "src/libgit2/git2.rc",
            ],
            sources: [
                "src/libgit2",
                "src/util",
                "deps/llhttp",
                "deps/pcre",
                "deps/xdiff",
                "deps/zlib",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src/libgit2"),
                .headerSearchPath("src/util"),
                .headerSearchPath("deps/llhttp"),
                .headerSearchPath("deps/pcre"),
                .headerSearchPath("deps/xdiff"),
                .headerSearchPath("deps/zlib"),
                // PCRE configuration (replaces cmake-generated config.h)
                .define("LINK_SIZE", to: "2"),
                .define("SUPPORT_PCRE8", to: "1"),
                .define("PARENS_NEST_LIMIT", to: "250"),
                .define("MATCH_LIMIT", to: "10000000"),
                .define("MATCH_LIMIT_RECURSION", to: "10000000"),
                .define("NEWLINE", to: "10"),
                .define("NO_RECURSE", to: "1"),
                .define("POSIX_MALLOC_THRESHOLD", to: "10"),
                .define("BSR_ANYCRLF", to: "0"),
                .define("MAX_NAME_SIZE", to: "32"),
                .define("MAX_NAME_COUNT", to: "10000"),
                .define("HAVE_MEMMOVE", to: "1"),
                .define("HAVE_STRERROR", to: "1"),
                .define("HAVE_STRTOLL", to: "1"),
                .define("HAVE_LONG_LONG", to: "1"),
                .define("HAVE_UNSIGNED_LONG_LONG", to: "1"),
            ]
        ),
    ]
)
