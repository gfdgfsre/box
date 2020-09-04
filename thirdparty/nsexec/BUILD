package(default_visibility = ["//visibility:public"])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")
load("//bazel:anbox.bzl", "COPTS")

cc_binary(
    name = "nsexec",
    srcs = glob([
        "uidmapshift.c",
    ]),
    copts = COPTS,
    deps = [
    ],
)
