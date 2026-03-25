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
            ]
        ),
    ]
)
