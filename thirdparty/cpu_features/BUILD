package(default_visibility = ["//visibility:public"])

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")
load("//bazel:anbox.bzl", "COPTS")


cc_library(
    name = "cpu_features",
    srcs = glob([
		  "src/linux_features_aggregator.c",
		  "src/cpuid_x86_clang_gcc.c",
		  "src/cpuid_x86_msvc.c",
		  "src/cpuinfo_aarch64.c",
		  "src/cpuinfo_arm.c",
		  "src/cpuinfo_mips.c",
		  "src/cpuinfo_ppc.c",
		  "src/cpuinfo_x86.c",
		  "src/filesystem.c",
		  "src/hwcaps.c",
		  "src/stack_line_reader.c",
		  "src/string_view.c",
    ]),
    hdrs = glob(
	    include = [
		  "include/cpuinfo_aarch64.h",
		  "include/cpuinfo_arm.h",
		  "include/cpuinfo_mips.h",
		  "include/cpuinfo_ppc.h",
		  "include/cpuinfo_x86.h",
		  "include/cpu_features_macros.h",
		  "include/internal/bit_utils.h",
		  "include/internal/linux_features_aggregator.h",
		  "include/internal/cpuid_x86.h",
		  "include/internal/filesystem.h",
		  "include/internal/hwcaps.h",
		  "include/internal/stack_line_reader.h",
		  "include/internal/string_view.h",
		  "include/cpu_features_macros.h",
	        ],
    ),
    copts = COPTS,
    defines = ["STACK_LINE_READER_BUFFER_SIZE=1024"],
    includes = ["include"],
    strip_include_prefix = "include",
    deps = [
    ],
)
