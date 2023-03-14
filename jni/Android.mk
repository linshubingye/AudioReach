
SRC_DIR=tinyalsa
LOCAL_PATH := $(call my-dir)/..

include $(CLEAR_VARS)


LOCAL_MODULE := libqti-tinyalsa

LOCAL_SRC_FILES :=	\
		$(SRC_DIR)/mixer.c \
		$(SRC_DIR)/mixer_hw.c \
		$(SRC_DIR)/mixer_plugin.c \
		$(SRC_DIR)/pcm.c \
		$(SRC_DIR)/pcm_hw.c \
		$(SRC_DIR)/pcm_plugin.c \
		$(SRC_DIR)/snd_utils.c 
		
LOCAL_CFLAGS += -fPIC -Wall -O3 -D_ANDROID_
LOCAL_CFLAGS += -I ./tinyalsa/include/  
$(warning $(pwd))
$(warning $(LOCAL_CFLAGS))
LOCAL_LDLIBS += -llog

include $(BUILD_SHARED_LIBRARY)



include $(CLEAR_VARS)

#LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinyalsa/include
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/acdbdata/
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-result

LOCAL_SRC_FILES := ./test/agmmixer.c

LOCAL_MODULE := libagmmixer
LOCAL_MODULE_OWNER         := qti
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -I ./tinyalsa/include/   -I ./tinyalsa/include/ 
LOCAL_LDFLAGS :=  $(LOCAL_PATH)/lib/libqti-tinyalsa.so
LOCAL_LDFLAGS +=  $(LOCAL_PATH)/lib/libexpat.so
#LOCAL_LDLIBS := \
#        libqti-tinyalsa \
       

#LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

#LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinyalsa/include
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/acdbdata/
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-result
LOCAL_CFLAGS += -DBACKEND_CONF_FILE=\"/vendor/etc/backend_conf.xml\"
LOCAL_CFLAGS += -I ./tinyalsa/include/  
LOCAL_SRC_FILES := ./test/agmplay.c

LOCAL_MODULE := agmplay
LOCAL_MODULE_OWNER         := qti
LOCAL_MODULE_TAGS := optional

LOCAL_LDFLAGS :=  $(LOCAL_PATH)/lib/libqti-tinyalsa.so
LOCAL_LDFLAGS +=  $(LOCAL_PATH)/lib/libexpat.so
LOCAL_LDFLAGS +=  $(LOCAL_PATH)/lib/libagmmixer.so
#LOCAL_SHARED_LIBRARIES := \
#        libqti-tinyalsa\
#        libagmmixer

LOCAL_VENDOR_MODULE := true
include $(BUILD_EXECUTABLE)