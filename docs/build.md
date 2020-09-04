## Build from source

### Requirements

To build the Anbox runtime itself there is nothing special to know. We're using
cmake as build system. A few build dependencies need to be present on your host
system:

 * libdbus
 * google-mock
 * google-test
 * libboost
 * libboost-filesystem
 * libboost-log
 * libboost-iostreams
 * libboost-program-options
 * libboost-system
 * libboost-test
 * libboost-thread
 * libcap
 * libsystemd
 * mesa (libegl1, libgles2)
 * libglm
 * libsdl2
 * libprotobuf
 * protobuf-compiler
 * python2
 * lxc (>= 3.0)

On an Ubuntu system you can install all build dependencies with the following
command:

```
$ sudo apt install build-essential cmake cmake-data debhelper dbus google-mock \
    libboost-dev libboost-filesystem-dev libboost-log-dev libboost-iostreams-dev \
    libboost-program-options-dev libboost-system-dev libboost-test-dev \
    libboost-thread-dev libcap-dev libsystemd-dev libegl1-mesa-dev \
    libgles2-mesa-dev libglm-dev libgtest-dev liblxc1 \
    libproperties-cpp-dev libprotobuf-dev libsdl2-dev libsdl2-image-dev lxc-dev \
    pkg-config protobuf-compiler python-minimal
```
We recommend Ubuntu 18.04 (bionic) with **GCC 7.x** as your build environment.


### Build

Afterwards you can build Anbox with

```
$ git clone https://github.com/anbox/anbox.git
$ cd anbox
$ mkdir build
$ cd build
$ cmake ..
$ make
```

A simple

```
$ sudo make install
```

will install the necessary bits into your system.

If you want to build the anbox snap instead you can do this with the following
steps:

```
$ mkdir android-images
$ cp /path/to/android.img android-images/android.img
$ snapcraft
```

The result will be a .snap file you can install on a system supporting snaps

```
$ snap install --dangerous --devmode anbox_1_amd64.snap
```