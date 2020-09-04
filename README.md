# Anbox

Anbox is a container-based approach to boot a full Android system on a
regular GNU/Linux system like Ubuntu. In other words: Anbox will let
you run Android on your Linux system without the slowness of
virtualization.

## Overview

Anbox uses Linux namespaces (user, pid, uts, net, mount, ipc) to run a
full Android system in a container and provide Android applications on
any GNU/Linux-based platform.

The Android inside the container has no direct access to any hardware.
All hardware access is going through the anbox daemon on the host. We're
reusing what Android implemented within the QEMU-based emulator for OpenGL
ES accelerated rendering. The Android system inside the container uses
different pipes to communicate with the host system and sends all hardware
access commands through these.

## Installation

See our [installation instructions](docs/install.md) for details.

## Supported Linux Distributions

At the moment we officially support the following Linux distributions:

 * Ubuntu 16.04 (xenial)
 * Ubuntu 18.04 (bionic)

However all other distributions supporting snap packages should work as
well as long as they provide the mandatory kernel modules (see kernel/).

## Run Anbox

Running Anbox from a local build requires a few more things you need to know
about. Please have a look at the ["Runtime Setup"](docs/runtime-setup.md)
documentation.

## Documentation

You will find additional documentation for Anbox in the *docs* subdirectory
of the project source.

Interesting things to have a look at

 * [Runtime Setup](docs/runtime-setup.md)
 * [Build Android image](docs/build-android.md)
 * [Generate Android emugl source](docs/generate-emugl-source.md)

## Reporting bugs

If you have found an issue with Anbox, please [file a bug](https://github.com/anbox/anbox/issues/new).

## Get in Touch

If you want to get in contact with the developers please feel free to join the
*#anbox* IRC channel on [Freenode](https://freenode.net/).

## Copyright and Licensing

Anbox reuses code from other projects like the Android QEMU emulator. These
projects are available in the external/ subdirectory with the licensing terms
included.

The Anbox source itself, if not stated differently in the relevant source files,
is licensed under the terms of the GPLv3 license.
