@echo off

echo Fire 5th Generation Root
echo -------------------------------------------------------------
echo Make sure adb.exe and fastboot.exe are in the same directory
echo or in your PATH!
echo.
echo Make sure you have ADB enabled!
echo * Pull down menu from top, go to Settings.
echo * Go to Device Options
echo * Tap the Serial Number several times until you see
echo   Developer Options appear.
echo * Go in to Developer Options.
echo * Make sure Ënable ADB is selected.
echo * If enabling for the first time, make sure you approve the
echo   USB device. If an approval does not show up after enabling
echo   and you have no previously enabled it, unplug the device
echo   and plug it back in.
pause
cls
echo You should see your device here:
echo.
adb devices
echo.
echo If you got an error or the device list is empty, stop this
echo script and make sure you have adb working.
pause
cls
echo Rebooting device to bootloader...
adb reboot bootloader
echo.
echo Once your device is on the FASTBOOT screen, continue
pause
cls
echo Starting root process!
echo.
echo Booting device...
fastboot boot boot.img
echo.
echo When you are at the lock screen,
pause
echo.
echo Pushing files to device...
adb push files\libsupol.so /data/local/tmp/
adb push files\root_fire.sh /data/local/tmp/
adb push files\su /data/local/tmp/
adb push files\Superuser.apk /data/local/tmp/
adb push files\supolicy /data/local/tmp/
echo.
echo Starting root script, this should only take a second!
adb shell chmod 777 /data/local/tmp/root_fire.sh
adb shell /data/local/tmp/root_fire.sh
echo.
echo Your device should now be rebooting. When you see the
echo fastboot screen,
pause
echo.
echo Restarting...
fastboot boot boot.img
echo.
echo When you are at the lock screen once again,
pause
echo Sending off our final commands...
adb shell /system/xbin/su --install
adb reboot
echo.
echo Root complete! Enjoy!
pause