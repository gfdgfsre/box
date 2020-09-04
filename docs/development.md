## Detail

For more details have a look at the following documentation pages:

 * [Android Hardware OpenGL ES emulation design overview](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/android-emugl/DESIGN)
 * [Android QEMU fast pipes](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMU-PIPE.TXT)
 * [The Android "qemud" multiplexing daemon](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMUD.TXT)
 * [Android qemud services](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android/docs/ANDROID-QEMUD-SERVICES.TXT)

Anbox is currently suited for the desktop use case but can be used on
mobile operating systems like Ubuntu Touch, Sailfish OS or Lune OS too.
However as the mapping of Android applications is currently desktop specific
this needs additional work to supported stacked window user interfaces too.

The Android runtime environment ships with a minimal customized Android system
image based on the [Android Open Source Project](https://source.android.com/).
The used image is currently based on Android 7.1.1
