bat
@echo off

echo Flashing boot.img, dtbo.img, vendor_boot.img and vendor_dlkm.img using Fastboot...

set script_path=%~dp0
set fastboot_path=%script_path%windows\fastboot.exe
set boot_img_path=%script_path%boot.img
set dtbo_img_path=%script_path%dtbo.img
set vendor_boot_img_path=%script_path%vendor_boot.img
set vendor_dlkm_img_path=%script_path%vendor_dlkm.img

rem Check if fastboot executable exists
if not exist "%fastboot_path%" (
    echo Error: Fastboot not found at %fastboot_path%
    pause
    exit /b
)

rem Check if boot.img file exists
if not exist "%boot_img_path%" (
    echo Error: boot.img file not found at %boot_img_path%
    pause
    exit /b
)

rem Check if dtbo.img file exists
if not exist "%dtbo_img_path%" (
    echo Error: dtbo.img file not found at %dtbo_img_path%
    pause
    exit /b
)

rem Check if vendor_boot.img file exists
if not exist "%vendor_boot_img_path%" (
    echo Error: vendor_boot.img file not found at %vendor_boot_img_path%
    pause
    exit /b
)

rem Check if vendor_dlkm.img file exists
if not exist "%vendor_dlkm_img_path%" (
    echo Error: vendor_dlkm.img file not found at %vendor_dlkm_img_path%
    pause
    exit /b
)

rem Flash boot.img using fastboot
"%fastboot_path%" flasPh boot "%boot_img_path%"
if %errorlevel% neq 0 (
    echo Error: Failed to flash boot.img
    pause
    exit /b
)

rem Flash dtbo.img using fastboot
"%fastboot_path%" flash dtbo "%dtbo_img_path%"
if %errorlevel% neq 0 (
    echo Error: Failed to flash dtbo.img
    pause
    exit /b
)

rem Flash vendor_boot.img using fastboot
"%fastboot_path%" flash vendor_boot "%vendor_boot_img_path%"
if %errorlevel% neq 0 (
    echo Error: Failed to flash vendor_boot.img
    pause
    exit /b
)

rem Flash vendor_dlkm.img using fastboot
"%fastboot_path%" flash vendor_dlkm "%vendor_dlkm_img_path%"
if %errorlevel% neq 0 (
    echo Error: Failed to flash vendor_dlkm.img
    pause
    exit /b
)


echo Flashing completed successfully.
pause