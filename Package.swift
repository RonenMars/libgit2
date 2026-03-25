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
                "deps/winhttp", "deps/llhttp", "deps/pcre", "deps/pcre2",
                "src/libgit2/git2.rc",
            ],
            sources: [
                "src/libgit2",
                "src/util",
                "deps/http-parser",
                "deps/xdiff",
                "deps/zlib",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src/libgit2"),
                .headerSearchPath("src/util"),
                .headerSearchPath("deps/http-parser"),
                .headerSearchPath("deps/xdiff"),
                .headerSearchPath("deps/zlib"),
                .unsafeFlags([
                    "-Wno-shorten-64-to-32",
                    "-Wno-unused-parameter",
                    "-Wno-sign-compare",
                    "-Wno-missing-field-initializers",
                    "-Wno-deprecated-declarations",
                ]),
            ]
        ),
    ]
)