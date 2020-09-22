package(default_visibility = ["//visibility:public"])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

filegroup(
    name = "lxc.h",
    visibility = ["//visibility:public"],
)

cc_library(
    name = "lxc",
    linkopts = ["-llxc"],
    visibility = ["//visibility:public"],
)
