package(default_visibility = ["//visibility:public"])

load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_proto_library", "cc_test")

proto_library(
    name = "anbox_bridge",
    srcs = ["anbox_bridge.proto"],
)

cc_proto_library(
    name = "anbox_bridge_cc",
    deps = [":anbox_bridge"],
)


proto_library(
    name = "anbox_container",
    srcs = ["anbox_container.proto"],
)

cc_proto_library(
    name = "anbox_container_cc",
    deps = [":anbox_container"],
)

proto_library(
    name = "anbox_rpc",
    srcs = ["anbox_rpc.proto"],
)

cc_proto_library(
    name = "anbox_rpc_cc",
    deps = [":anbox_rpc"],
)
