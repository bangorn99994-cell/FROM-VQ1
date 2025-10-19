LOCAL_PATH := $(call my-dir)
MAIN_LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE           := ffutil
#LOCAL_MODULE_FILENAME  := $(TARGET_ARCH_ABI)
LOCAL_CFLAGS           := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w
LOCAL_CFLAGS           += -fno-rtti -fno-exceptions -fpermissive
LOCAL_CPPFLAGS         := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w -Werror -s -std=c++17
LOCAL_CPPFLAGS         += -Wno-error=c++11-narrowing -fms-extensions -fno-rtti -fno-exceptions -fpermissive
LOCAL_LDFLAGS          += -Wl,--gc-sections,--strip-all, -llog
LOCAL_ARM_MODE         := arm
LOCAL_LDLIBS           := -llog -landroid -lEGL -lGLESv3 -lGLESv2 -lGLESv1_CM -lz

LOCAL_C_INCLUDES       += $(LOCAL_PATH)
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/gsmodz
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/zygisk
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/imagens
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/unity
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/update/xdl/include
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/update
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/update/xdl
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/imgui
LOCAL_C_INCLUDES       += $(LOCAL_PATH)/others/imgui/fonts

FILE_LIST               += $(wildcard $(LOCAL_PATH)/others/imgui/*.c*)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/others/update/*.c*)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/others/update/xdl/*.c*)
FILE_LIST               += $(wildcard $(LOCAL_PATH)/zygisk/*.c*)
LOCAL_SRC_FILES        := $(FILE_LIST:$(LOCAL_PATH)/%=%)


include $(BUILD_SHARED_LIBRARY)

