package(default_visibility = ["//visibility:public"])
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")

cc_binary(
    name = "emugen",
    srcs = [
       	"host/tools/emugen/main.cpp",
    	"host/tools/emugen/ApiGen.cpp",
    	"host/tools/emugen/EntryPoint.cpp",
    	"host/tools/emugen/main.cpp",
    	"host/tools/emugen/Parser.cpp",
    	"host/tools/emugen/strUtils.cpp",
    	"host/tools/emugen/TypeFactory.cpp",
    ],
    hdrs = glob([
        "host/tools/emugen/*.h",
    ]),
    copts = [],
    linkopts = [],
    strip_include_prefix = "host/tools/emugen",
    deps = [],
)

# add_library(OpenglCodecCommon STATIC ${SOURCES})
cc_library(
  name = "OpenglCodecCommon",
  srcs = [
    "shared/OpenglCodecCommon/ChecksumCalculator.cpp",
    "shared/OpenglCodecCommon/ChecksumCalculatorThreadInfo.cpp",
    "shared/OpenglCodecCommon/glUtils.cpp",
  ],
  hdrs = glob([
  	"shared/OpenglCodecCommon/*.h"
  ]),
  strip_include_prefix = "shared/OpenglCodecCommon",
  copts = [],
  linkopts = [],
  linkstatic = 1,
  deps = [""]
)


# add_library(emugl_common STATIC ${COMMON_SOURCES})
# target_link_libraries(emugl_common dl pthread)
cc_library(
  name = "emugl_common",
  srcs = [
    "shared/emugl/common/crash_reporter.cpp",
    "shared/emugl/common/id_to_object_map.cpp",
    "shared/emugl/common/lazy_instance.cpp",
    "shared/emugl/common/logging.cpp",
    "shared/emugl/common/message_channel.cpp",
    "shared/emugl/common/mutex_unittest.cpp",
    "shared/emugl/common/pod_vector.cpp",
    "shared/emugl/common/shared_library.cpp",
    "shared/emugl/common/smart_ptr.cpp",
    "shared/emugl/common/sockets.cpp",
    "shared/emugl/common/thread_pthread.cpp",
    "shared/emugl/common/thread_store.cpp",
    "shared/emugl/common/thread_unittest.cpp",
  ],
  hdrs = glob([
  	"shared/emugl/common/*.h"
  ]),
  strip_include_prefix = "shared/emugl/common",
  copts = [],
  linkopts = ["-ldl, -lpthread"],
  linkstatic = 1,
  deps = [""]
)

