LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libprocess-cpp-minimal
LOCAL_SRC_FILES := \
    thirdparty/process-cpp-minimal/src/core/posix/process.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/process_group.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/signal.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/signalable.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/standard_stream.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/wait.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/fork.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/exec.cpp \
    thirdparty/process-cpp-minimal/src/core/posix/child_process.cpp
LOCAL_CFLAGS := \
    -DANDROID \
    -fexceptions
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/thirdparty/process-cpp-minimal/include
include $(BUILD_STATIC_LIBRARY)

#########################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE := anboxd
LOCAL_INIT_RC := android/device/anbox/anboxd.rc
LOCAL_SRC_FILES := \
    android/hardware/anbox/service/main.cpp \
    android/hardware/anbox/service/daemon.cpp \
    android/hardware/anbox/service/host_connector.cpp \
    android/hardware/anbox/service/local_socket_connection.cpp \
    android/hardware/anbox/service/message_processor.cpp \
    android/hardware/anbox/service/activity_manager_interface.cpp \
    android/hardware/anbox/service/android_api_skeleton.cpp \
    android/hardware/anbox/service/platform_service_interface.cpp \
    android/hardware/anbox/service/platform_service.cpp \
    android/hardware/anbox/service/platform_api_stub.cpp \
    src/anbox/common/fd.cpp \
    src/anbox/common/wait_handle.cpp \
    src/anbox/rpc/message_processor.cpp \
    src/anbox/rpc/pending_call_cache.cpp \
    src/anbox/rpc/channel.cpp \
    src/anbox/protobuf/anbox_rpc.proto \
    src/anbox/protobuf/anbox_bridge.proto
proto_header_dir := $(call local-generated-sources-dir)/proto/$(LOCAL_PATH)/src/anbox/protobuf
LOCAL_C_INCLUDES += \
    $(proto_header_dir) \
    $(LOCAL_PATH)/thirdparty/process-cpp-minimal/include \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/android/hardware/anbox/service
LOCAL_EXPORT_C_INCLUDE_DIRS += $(proto_header_dir)
LOCAL_STATIC_LIBRARIES := \
    libprocess-cpp-minimal
LOCAL_SHARED_LIBRARIES := \
    liblog \
    libprotobuf-cpp-lite \
    libsysutils \
    libbinder \
    libcutils \
    libutils
LOCAL_CFLAGS := \
    -fexceptions \
    -std=c++1y
include $(BUILD_EXECUTABLE)

#########################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := \
    liblog \
    lib_renderControl_enc \
    libOpenglSystemCommon
LOCAL_SRC_FILES := \
    android/hardware/anbox/hwcomposer/hwcomposer.cpp
LOCAL_MODULE := hwcomposer.anbox.alt
LOCAL_CFLAGS:= -DLOG_TAG=\"hwcomposer\"
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/android/hardware/anbox/opengl/host/include/libOpenglRender \
    $(LOCAL_PATH)/android/hardware/anbox/opengl/shared/OpenglCodecCommon \
    $(LOCAL_PATH)/android/hardware/anbox/opengl/system/renderControl_enc \
    $(LOCAL_PATH)/android/hardware/anbox/opengl/system/OpenglSystemCommon
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

#########################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio.primary.anbox
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_SRC_FILES := \
    android/hardware/anbox/audio/audio_hw.cpp
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src
LOCAL_SHARED_LIBRARIES += libdl
LOCAL_CFLAGS := -Wno-unused-parameter

include $(BUILD_SHARED_LIBRARY)
