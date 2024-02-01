# Personal research of adb commands

``` bash
# Find all installed packages:
adb shell cmd package list packages
adb shell cmd package list packages -3 | cut -f 2 -d ":"

# Find list of users on device:
adb shell pm list users

# Install packages
adb install --user USER_ID APK_ID
```

``` bash
# Packages names
GmsCompatConfig: app.grapheneos.gmscompat.config
Google Services Framework: com.google.android.gsf
Google Play services: com.google.android.gms
Google Play Store: com.android.vending
```

``` bash
# Interesting tid bits:
adb push android.apk /data/local/tmp
adb shell pm install --user 12 /data/local/tmp/android.apk
devicePolicyManager.clearUserRestriction(componentName,UserManager.DISALLOW_DEBUGGING_FEATURES
adb shell pm path com.example.someapp
```

``` bash
# Get apk location of a package:
adb shell pm path com.google.android.gsf

# Output:
/data/app/~~Rzvr98rw48S8wStPoFOUQA==/com.google.android.gsf-EtoE-ObbZcesGU4kvK1M0g==/base.apk
```

``` bash
# Pull apk from device to computer:
adb pull /data/app/~~Rzvr98rw48S8wStPoFOUQA==/com.google.android.gsf-EtoE-ObbZcesGU4kvK1M0g==/base.apk com.google.android.gsf.apk

# Install to work profile:
adb shell pm install --user 15 com.google.android.gsf
```

* Current task: copy package from user profile and install into work profile user.
