load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@com_github_jupp0r_prometheus_cpp//bazel:repositories.bzl", "prometheus_cpp_repositories")
load("@com_github_checkstyle_java//:repo.bzl", "checkstyle_deps")
load("@com_github_grpc_grpc//third_party/py:python_configure.bzl", "python_configure")
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains")

load("//bazel:repo.bzl", "tf_http_archive")
load("//thirdparty/opencl_headers:workspace.bzl", opencl_headers = "repo")


load("//thirdparty/toolchains/cpus/arm:arm_compiler_configure.bzl", "arm_compiler_configure")
load("//thirdparty/toolchains/embedded/arm-linux:arm_linux_toolchain_configure.bzl", "arm_linux_toolchain_configure")

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


  tf_http_archive(
        name = "arm_compiler",
        build_file = clean_dep("//thirdparty/toolchains/cpus/arm:arm_compiler.BUILD"),
        sha256 = "b9e7d50ffd9996ed18900d041d362c99473b382c0ae049b2fce3290632d2656f",
        strip_prefix = "rpi-newer-crosstools-eb68350c5c8ec1663b7fe52c742ac4271e3217c5/x64-gcc-6.5.0/arm-rpi-linux-gnueabihf/",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/github.com/rvagg/rpi-newer-crosstools/archive/eb68350c5c8ec1663b7fe52c742ac4271e3217c5.tar.gz",
            "https://github.com/rvagg/rpi-newer-crosstools/archive/eb68350c5c8ec1663b7fe52c742ac4271e3217c5.tar.gz",
        ],
  )

  tf_http_archive(
        # This is the latest `aarch64-none-linux-gnu` compiler provided by ARM
        # See https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
        # The archive contains GCC version 9.2.1
        name = "aarch64_compiler",
        build_file = clean_dep("//thirdparty/toolchains/cpus/arm:arm_compiler.BUILD"),
        sha256 = "8dfe681531f0bd04fb9c53cf3c0a3368c616aa85d48938eebe2b516376e06a66",
        strip_prefix = "gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz",
        ],
  )

  tf_http_archive(
        name = "aarch64_linux_toolchain",
        build_file = clean_dep("//thirdparty/toolchains/embedded/arm-linux:aarch64-linux-toolchain.BUILD"),
        sha256 = "8ce3e7688a47d8cd2d8e8323f147104ae1c8139520eca50ccf8a7fa933002731",
        strip_prefix = "gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz",
        ],
  )

  tf_http_archive(
        name = "armhf_linux_toolchain",
        build_file = clean_dep("//thirdparty/toolchains/embedded/arm-linux:armhf-linux-toolchain.BUILD"),
        sha256 = "d4f6480ecaa99e977e3833cc8a8e1263f9eecd1ce2d022bb548a24c4f32670f5",
        strip_prefix = "gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz",
        ],
  )
