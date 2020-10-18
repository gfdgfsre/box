package(default_visibility = [//visibility:public])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

# android intent support
cc_library(
    name = "anbox_android_header",
    hdrs = [
        "anbox/android/intent.h",
        "anbox/android/ip_config_builder.h",
    ],
    strip_include_prefix = "anbox/android",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
    ],
)

cc_library(
    name = "anbox_android_lib",
    srcs = [
        "anbox/android/intent.cpp",
        "anbox/android/ip_config_builder.cpp",
    ],
    hdrs = [
        ":anbox_android_header",
    ],
    strip_include_prefix = "anbox/android",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
        ":anbox_android_header"
    ],
)

# android application support
cc_library(
    name = "anbox_application_header",
    hdrs = [
        "anbox/application/database.h",
        "anbox/application/launcher_storage.h",
        "anbox/application/manager.h"
    ],
    strip_include_prefix = "anbox/application",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
    ],
)

cc_library(
    name = "anbox_application_lib",
    srcs = [
        "anbox/application/database.cpp",
        "anbox/application/launcher_storage.cpp",
    ],
    hdrs = [
        ":anbox_application_header",
    ],
    strip_include_prefix = "anbox/application",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
        ":anbox_application_header"
    ],
)

# audio support
cc_library(
    name = "anbox_audio_header",
    hdrs = [
        "anbox/audio/client_info.h",
        "anbox/audio/server.h",
        "anbox/audio/sink.h",
        "anbox/audio/source.h",
    ],
    strip_include_prefix = "anbox/audio",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
    ],
)


cc_library(
    name = "anbox_audio_lib",
    srcs = [
        "anbox/audio/server.cpp",
    ],
    hdrs = [
        ":anbox_audio_header",
    ],
    strip_include_prefix = "anbox/audio",
    copts = [],
    linkopts = [],
    deps = [
        "@boost//:asio",
        ":anbox_audio_header"
    ],
)

