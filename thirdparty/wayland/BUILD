package( default_visibility = ["//visibility:public"], )

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

filegroup(
    name = "wayland_headers",
    visibility = ["//visibility:public"],
)

cc_library(
    name = "wayland",
    linkopts = ["-lwayland"],
    visibility = ["//visibility:public"],
)
