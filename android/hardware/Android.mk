LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Include the Android.mk files below will override LOCAL_PATH so we
# have to take a copy of it here.
TMP_PATH := $(LOCAL_PATH)

include $(TMP_PATH)/anbox/appmgr/Android.mk
include $(TMP_PATH)/anbox/fingerprint/Android.mk
include $(TMP_PATH)/anbox/power/Android.mk
include $(TMP_PATH)/anbox/qemu-props/Android.mk
include $(TMP_PATH)/anbox/qemud/Android.mk
include $(TMP_PATH)/anbox/sensors/Android.mk
include $(TMP_PATH)/anbox/opengl/Android.mk
include $(TMP_PATH)/anbox/gps/Android.mk
include $(TMP_PATH)/anbox/lights/Android.mk
include $(TMP_PATH)/anbox/camera/Android.mk
#include $(TMP_PATH)/anbox/vibrator/Android.mk