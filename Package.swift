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
