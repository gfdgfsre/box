# XBOX

XBOX is a xen-based approach to boot a full Android system on a
regular GNU/Linux system like Ubuntu. In other words: XBOX will let
you run Android on your Linux system without the slowness of
virtualization.

## Overview

XBOX uses Linux namespaces (user, pid, uts, net, mount, ipc) to run a
full Android system in a damon and provide Android applications on
any GNU/Linux-based platform.

The Android inside the damon has no direct access to any hardware.
All hardware access is going through the anbox daemon on the host. We're
reusing what Android implemented within the QEMU-based emulator for OpenGL
ES accelerated rendering. The Android system inside the damon uses
different pipes to communicate with the host system and sends all hardware
access commands through these.