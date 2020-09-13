load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@com_github_jupp0r_prometheus_cpp//bazel:repositories.bzl", "prometheus_cpp_repositories")
load("@com_github_checkstyle_java//:repo.bzl", "checkstyle_deps")
load("@com_github_grpc_grpc//third_party/py:python_configure.bzl", "python_configure")
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains")
load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")


load("//thirdparty/opencl_headers:workspace.bzl", opencl_headers = "repo")
load("//thirdparty/toolchains/cpus/arm:arm_compiler_configure.bzl", "arm_compiler_configure")
load("//thirdparty/toolchains/embedded/arm-linux:arm_linux_toolchain_configure.bzl", "arm_linux_toolchain_configure")
load("@bazel_br_toolchain//:deps.bzl", "bazel_br_toolchain_deps")


# Sanitize a dependency so that it works correctly from code that includes
# TensorFlow as a submodule.
def clean_dep(dep):
    return str(Label(dep))

def anbox_deps_build_all():
  bazel_skylib_workspace()
  checkstyle_deps()
  boost_deps()
  prometheus_cpp_repositories()
  python_configure(name = "local_config_python")
  grpc_deps()
  rules_proto_grpc_toolchains()
  opencl_headers()
  rules_foreign_cc_dependencies()
  bazel_br_toolchain_deps()

  # Point //external/local_config_arm_compiler to //external/arm_compiler
  arm_compiler_configure(
        name = "local_config_arm_compiler",
        build_file = clean_dep("//thirdparty/toolchains/cpus/arm:BUILD"),
        remote_config_repo_arm = "../arm_compiler",
        remote_config_repo_aarch64 = "../aarch64_compiler",
  )

  # TFLite crossbuild toolchain for embeddeds Linux
  arm_linux_toolchain_configure(
        name = "local_config_embedded_arm",
        build_file = clean_dep("//thirdparty/toolchains/embedded/arm-linux:BUILD"),
        aarch64_repo = "../aarch64_linux_toolchain",
        armhf_repo = "../armhf_linux_toolchain",
  )

