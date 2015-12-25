fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
adb wait-for-device && adb shell
