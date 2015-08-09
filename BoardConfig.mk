#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include device/bq/msm8939-common/BoardConfigCommon.mk

DEVICE_PATH := device/bq/piccolo

# Assert
TARGET_OTA_ASSERT_DEVICE := piccolo,aquarism5

# Kernel
TARGET_KERNEL_SOURCE := kernel/bq/piccolo
TARGET_KERNEL_CONFIG := cyanogenmod_piccolo_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432    # 32MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # 32MB
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432    # 32MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1610612736  # 1536MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13363018752 # 12744MB (BOARD_USERDATAIMAGE_PARTITION_SIZE - 16384 for crypto footer)
BOARD_CACHEIMAGE_PARTITION_SIZE    := 419430400   # 400MB
BOARD_FLASH_BLOCK_SIZE             := 131072      # (BOARD_KERNEL_PAGESIZE * 64)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_DENSITY := xhdpi

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/bq/piccolo/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    system.te \
    system_server.te \
    wcnss_service.te

# inherit from the proprietary version
-include vendor/bq/piccolo/BoardConfigVendor.mk
