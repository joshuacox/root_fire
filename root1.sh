adb remount
adb push files/libsupol.so /data/local/tmp/
adb push files/root_fire.sh /data/local/tmp/
adb push files/su /data/local/tmp/
adb push files/Superuser.apk /data/local/tmp/
adb push files/supolicy /data/local/tmp/
adb shell chmod 777 /data/local/tmp/root_fire.sh
adb shell /data/local/tmp/root_fire.sh
# This Part reopened fastboot and I just re-ran the cmds from the first post in this thread #

fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
