workspace(name = "anbox")

load("//bazel:anbox_deps_setup.bzl", "anbox_deps_setup")

anbox_deps_setup()

load("//bazel:anbox_deps_build_all.bzl", "anbox_deps_build_all")

anbox_deps_build_all()

# This needs to be run after grpc_deps() in ray_deps_build_all() to make
# sure all the packages loaded by grpc_deps() are available. However a
# load() statement cannot be in a function so we put it here.
load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()