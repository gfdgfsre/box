load("@com_github_google_flatbuffers//:build_defs.bzl", "flatbuffer_library_public")
load("@com_github_checkstyle_java//checkstyle:checkstyle.bzl", "checkstyle_test")
load("@bazel_skylib//rules:copy_file.bzl", "copy_file")
load("@bazel_common//tools/maven:pom_file.bzl", "pom_file")

COPTS = ["-DRAY_USE_GLOG"] + select({
    "//:opt": ["-DBAZEL_OPT"],
    "//conditions:default": [],
}) + select({
    "@bazel_tools//src/conditions:windows": [
        # TODO(mehrdadn): (How to) support dynamic linking?
        "-DRAY_STATIC",
    ],
    "//conditions:default": [
    ],
}) + select({
    "//:clang-cl": [
        "-Wno-builtin-macro-redefined",  # To get rid of warnings caused by deterministic build macros (e.g. #define __DATE__ "redacted")
        "-Wno-microsoft-unqualified-friend",  # This shouldn't normally be enabled, but otherwise we get: google/protobuf/map_field.h: warning: unqualified friend declaration referring to type outside of the nearest enclosing namespace is a Microsoft extension; add a nested name specifier (for: friend class DynamicMessage)
    ],
    "//conditions:default": [
    ],
})

PYX_COPTS = select({
    "//:msvc-cl": [
    ],
    "//conditions:default": [
        # Ignore this warning since CPython and Cython have issue removing deprecated tp_print on MacOS
        "-Wno-deprecated-declarations",
    ],
}) + select({
    "@bazel_tools//src/conditions:windows": [
        "/FI" + "src/shims/windows/python-nondebug.h",
    ],
    "//conditions:default": [
    ],
})

PYX_SRCS = [] + select({
    "@bazel_tools//src/conditions:windows": [
        "src/shims/windows/python-nondebug.h",
    ],
    "//conditions:default": [
    ],
})

