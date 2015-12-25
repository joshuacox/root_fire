adb reboot bootloader
fastboot boot boot.img

adb wait-for-device &&

adb push files/libsupol.so /data/local/tmp/
adb push files/root_fire.sh /data/local/tmp/
adb push files/su /data/local/tmp/
adb push files/Superuser.apk /data/local/tmp/
adb push files/supolicy /data/local/tmp/
adb shell chmod 777 /data/local/tmp/root_fire.sh
adb shell /data/local/tmp/root_fire.sh

fastboot boot boot.img

adb wait-for-device &&
adb shell /system/xbin/su --install
adb shell reboot

