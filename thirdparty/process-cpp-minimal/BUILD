package(default_visibility = ["//visibility:public"])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")
load("//bazel:anbox.bzl", "COPTS")


cc_library(
    name = "process-cpp",
    srcs = [
    	  "src/core/posix/backtrace.h",
		  "src/core/posix/backtrace.cpp",
		  "src/core/posix/child_process.cpp",
		  "src/core/posix/exec.cpp",
		  "src/core/posix/fork.cpp",
		  "src/core/posix/process.cpp",
		  "src/core/posix/process_group.cpp",
		  "src/core/posix/signal.cpp",
		  "src/core/posix/signalable.cpp",
		  "src/core/posix/standard_stream.cpp",
		  "src/core/posix/wait.cpp",
		  "src/core/posix/this_process.cpp",
		  "src/core/posix/linux/proc/process/oom_adj.cpp",
		  "src/core/posix/linux/proc/process/oom_score.cpp",
		  "src/core/posix/linux/proc/process/oom_score_adj.cpp",
		  "src/core/posix/linux/proc/process/stat.cpp",
		  "src/core/testing/cross_process_sync.cpp",
		  "src/core/testing/fork_and_run.cpp",
    ],
    hdrs = glob(
	    include = [
	        "include/core/*.h",
	        "include/core/posix/*.h",
	        "include/core/posix/linux/**/**/*.h",
	        "include/core/testing/*.h",
	        ],
    ),
    copts = COPTS,
    linkstatic = 1,
    includes = ["include"],
    strip_include_prefix = "include",
    deps = [
    	"@boost//:asio",
    	"@boost//:iostreams",
    ],
)

cc_library(
  name = "posix-process",
  srcs = glob([
  	"src/core/posix/process.cpp",
  	"src/core/posix/process_group.cpp",
	"src/core/posix/signal.cpp",
	"src/core/posix/signalable.cpp",
  	]),
  hdrs = glob([
	        "include/core/*.h",
	        "include/core/posix/*.h",
	        "include/core/posix/linux/**/**/*.h",
	        "include/core/testing/*.h",
  	]),
  copts = COPTS,
  strip_include_prefix = "include",
  deps = [
  ],
)

