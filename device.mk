#
# Copyright (C) 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#initrc files
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/init.rc/init.odroidc4.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroid.board.rc \
    device/hardkernel/odroidc4/init.rc/init.odroidc4.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroid.media.rc \
    device/hardkernel/odroidc4/init.rc/init.odroidc4.system.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroidc4.rc \
    device/hardkernel/odroidc4/init.rc/init.odroidc4.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.odroid.usb.rc

ifneq ($(BOARD_USES_RECOVERY_AS_BOOT), true)
PRODUCT_COPY_FILES += \
    device/hardkernel/common/products/mbox/ueventd.odroid.rc:root/ueventd.odroidc4.rc
else
PRODUCT_COPY_FILES += \
    device/hardkernel/common/products/mbox/ueventd.odroid.rc:recovery/root/ueventd.odroidc4.rc
endif

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl:32 \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.1-service.widevine \
    android.hardware.drm@1.1-service.clearkey \
    move_widevine_data.sh

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/hardkernel/odroidc4/files/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
    device/hardkernel/odroidc4/files/media_profiles_V1_0_hevc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0_hevc.xml \
    device/hardkernel/odroidc4/files/media_profiles_V1_0_h264.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0_h264.xml \
    device/hardkernel/odroidc4/files/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    device/hardkernel/odroidc4/files/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/hardkernel/odroidc4/files/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/hardkernel/odroidc4/files/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/hardkernel/odroidc4/files/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg \
    device/hardkernel/odroidc4/files/remote.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/remote.cfg \
    device/hardkernel/odroidc4/files/remote.tab1:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab1 \
    device/hardkernel/odroidc4/files/remote.tab2:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab2 \
    device/hardkernel/odroidc4/files/remote.tab3:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab3 \
    device/hardkernel/odroidc4/files/PQ/pq.db:$(TARGET_COPY_OUT_VENDOR)/etc/tvconfig/pq/pq.db \
    device/hardkernel/odroidc4/files/PQ/pq_default.ini:$(TARGET_COPY_OUT_VENDOR)/etc/tvconfig/pq/pq_default.ini

ifeq ($(USE_XML_AUDIO_POLICY_CONF), 1)
ifneq ($(TARGET_BUILD_LIVETV),true)
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/hardkernel/odroidc4/files/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/hardkernel/odroidc4/files/audio_policy_configuration_dolby_ms12.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_dolby_ms12.xml
else
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/audio_policy_configuration_livetv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/hardkernel/odroidc4/files/audio_policy_volumes_livetv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/hardkernel/odroidc4/files/audio_policy_configuration_dolby_ms12.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_dolby_ms12.xml
endif
else
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf
endif

ifeq ($(TARGET_WITH_MEDIA_EXT), true)
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/media_codecs_ext.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ext.xml
endif

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/recovery/init.recovery.odroidc4.rc:root/init.recovery.odroidc4.rc \
    device/hardkernel/odroidc4/recovery/recovery.kl:recovery/root/etc/recovery.kl \
    device/hardkernel/odroidc4/files/mesondisplay.cfg:recovery/root/etc/mesondisplay.cfg \
    device/hardkernel/odroidc4/recovery/remotecfg:recovery/root/sbin/remotecfg \
    device/hardkernel/odroidc4/files/remote.cfg:recovery/root/etc/remote.cfg \
    device/hardkernel/odroidc4/files/remote.tab1:recovery/root/etc/remote.tab1 \
    device/hardkernel/odroidc4/files/remote.tab2:recovery/root/etc/remote.tab2 \
    device/hardkernel/odroidc4/files/remote.tab3:recovery/root/etc/remote.tab3 \
    device/hardkernel/odroidc4/recovery/sh:recovery/root/sbin/sh

# remote IME config file
PRODUCT_COPY_FILES += \
    device/hardkernel/common/products/mbox/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    device/hardkernel/common/products/mbox/Vendor_1915_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1915_Product_0001.kl

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/Generic.kl:/$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl
else
PRODUCT_COPY_FILES += \
    device/hardkernel/common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl
endif

ifeq ($(TARGET_BUILD_GOOGLE_ATV),true)
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi
PRODUCT_CHARACTERISTICS := tv
else
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_CHARACTERISTICS := tablet
endif

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
DEVICE_PACKAGE_OVERLAYS := \
    device/hardkernel/odroidc4/overlay
endif

PRODUCT_TAGS += dalvik.gc.type-precise

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

#To remove healthd from the build
PRODUCT_PACKAGES += android.hardware.health@2.0-service.override
DEVICE_FRAMEWORK_MANIFEST_FILE += \
	system/libhidl/vintfdata/manifest_healthd_exclude.xml

#To keep healthd in the build
PRODUCT_PACKAGES += android.hardware.health@2.0-service

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidc4/files/boot.ini.template:vendor/etc/boot.ini.template \
    device/hardkernel/odroidc4/files/hardkernel-720.bmp.gz:vendor/etc/hardkernel-720.bmp.gz \
    device/hardkernel/odroidc4/files/makebootini:vendor/bin/makebootini \
    device/hardkernel/odroidc4/files/default.prop.template:vendor/etc/default.prop.template \
    device/hardkernel/odroidc4/files/makedefaultprop:vendor/bin/makedefaultprop \
    device/hardkernel/odroidc4/files/env.ini.template:vendor/etc/env.ini.template \
    device/hardkernel/odroidc4/recovery/update_ini.sh:vendor/bin/update_ini.sh \
    device/hardkernel/odroidc4/files/usb_modeswitch.conf.template:vendor/etc/usb_modeswitch.conf.template

# Inherit from my custom product configuration
$(call inherit-product, vendor/secuflag/common.mk)
