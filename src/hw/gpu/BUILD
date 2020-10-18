package(default_visibility = [//visibility:public])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")
load("//bazel:anbox.bzl", "COPTS", "PYX_COPTS", "PYX_SRCS")

cc_binary(
    name = "gpu_entry",
    srcs = [
        "main.cpp",
    ],
    copts = COPTS,
    deps = [
#        "@boost//:asio",
        "@com_github_grpc_grpc//:grpc++",
        "@com_google_protobuf//:protobuf",
    ],
)