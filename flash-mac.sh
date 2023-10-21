#!/bin/bash

echo "Flashing boot.img, dtbo.img, and vendor_boot.img using fastboot..."

# Get the path of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Set the paths to the fastboot executable and image files
FASTBOOT="$SCRIPT_DIR/mac/fastboot"
BOOT_IMG="$SCRIPT_DIR/boot.img"
DTBO_IMG="$SCRIPT_DIR/dtbo.img"
VENDOR_BOOT_IMG="$SCRIPT_DIR/vendor_boot.img"

# Check if fastboot executable exists
if [ ! -f "$FASTBOOT" ]; then
    echo "Error: fastboot not found at $FASTBOOT"
    exit 1
fi

# Check if image files exist
if [ ! -f "$BOOT_IMG" ]; then
    echo "Error: boot.img not found at $BOOT_IMG"
    exit 1
fi

if [ ! -f "$DTBO_IMG" ]; then
    echo "Error: dtbo.img not found at $DTBO_IMG"
    exit 1
fi

if [ ! -f "$VENDOR_BOOT_IMG" ]; then
    echo "Error: vendor_boot.img not found at $VENDOR_BOOT_IMG"
    exit 1
fi

# Flash the image files using fastboot
"$FASTBOOT" flash boot "$BOOT_IMG"
if [ $? -ne 0 ]; then
    echo "Error: Failed to flash boot.img"
    exit 1
fi

"$FASTBOOT" flash dtbo "$DTBO_IMG"
if [ $? -ne 0 ]; then
    echo "Error: Failed to flash dtbo.img"
    exit 1
fi

"$FASTBOOT" flash vendor_boot "$VENDOR_BOOT_IMG"
if [ $? -ne 0 ]; then
    echo "Error: Failed to flash vendor_boot.img"
    exit 1
fi

echo "Flashing completed successfully."