#! /bin/sh

echo Fire 5th Generation Root
echo -------------------------------------------------------------
echo
echo Make sure you have ADB enabled!
echo  Pull down menu from top, go to Settings.
echo  Go to Device Options
echo  Tap the Serial Number several times until you see
echo   Developer Options appear.
echo  Go in to Developer Options.
echo  Make sure Enable ADB is selected.
echo  If enabling for the first time, make sure you approve the
echo   USB device. If an approval does not show up after enabling
echo   and you have no previously enabled it, unplug the device
echo   and plug it back in.

echo Rebooting device to bootloader..
echo
adb reboot bootloader
fastboot boot boot.img
echo Starting root process!
echo
echo Booting device...
adb wait-for-device &&

echo Pushing files to device...
adb push files/libsupol.so /data/local/tmp/
adb push files/root_fire.sh /data/local/tmp/
adb push files/su /data/local/tmp/
adb push files/Superuser.apk /data/local/tmp/
adb push files/supolicy /data/local/tmp/

echo
echo Starting root script, be patient!
adb shell chmod 777 /data/local/tmp/root_fire.sh
adb shell /data/local/tmp/root_fire.sh

echo
echo Your device should now be rebooting...
echo

fastboot boot boot.img

adb wait-for-device &&
adb shell /system/xbin/su --install
adb shell rm -r /data/local/tmp/*
adb shell reboot
echo
echo Root complete! Enjoy!
