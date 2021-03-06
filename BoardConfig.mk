# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

SHOLEST_BUILD_USB_APK = false
SHOLEST_BUILD_OMX = false
SHOLEST_KOREAN_IME = false

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/motorola/sholest/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := omap3

TARGET_OTA_NO_KERNEL := true
TARGET_OTA_EXTRA_ARGS := -e device/motorola/sholest/install-orbootstrap --no_kernel true --no_recovery true --backup false --override_device sholest

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

TARGET_BOOTLOADER_BOARD_NAME := sholes

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := tiwlan0
# BOARD_SOFTAP_DEVICE         := tiwlan0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_ECLAIR_LIBCAMERA := true
BOARD_USES_ECLAIR_LIBAUDIO := true
#BOARD_HAVE_BAD_FMRADIO := true

ifneq ($(SHOLEST_BUILD_OMX),true)
HARDWARE_OMX := true
BUILD_WITH_TI_AUDIO := 1
BUILD_PV_VIDEO_ENCODERS := 1
BUILD_JPEG_DECODER := 1
BUILD_JPEG_ENCODER := 1
endif

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_EGL_CFG := device/motorola/sholest/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0afa0000   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0c520000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_SMALL_RECOVERY := true

#TARGET_RECOVERY_UI_LIB := librecovery_ui_sholes librecovery_ui_generic

#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

USE_SHOLES_PROPERTY := true

# Override cyanogen squisher to customize our update zip package
TARGET_CUSTOM_RELEASETOOL := ./device/motorola/sholest/releasetools/squisher
