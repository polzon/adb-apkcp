#!/usr/bin/env bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

# All packages relating to google services
google_services=( \
    com.google.android.gsf \
    com.google.android.gms \
    com.android.vending
)
other_services=( \
    com.airwatch.browser \
    com.airwatch.tunnel \
    com.microsoft.office.outlook \
)

user='12'
installed_packages=$(adb shell pm list packages | cut -f 2 -d ":")

# Pulls the package's apk from the device to the local folder
copy_apk() {
    if [[ -z $@ ]]; then return 1; fi
    if [[ ! -d $1 ]]; then mkdir $1; fi
    cd $1
    
    paths=$(adb shell pm path "$1" | cut -f 2 -d ":")
    packages=$(echo "$paths" | grep -Po '(?<=split_).+?(?=\.apk)|base')
    
    # Pull apks from devices
    for i in $paths; do adb pull $i; done
    
    # Install packages
    echo "Installing $1"
    adb install-multiple --user $user *.apk
    echo "Installed $1"
    
    # Cleanup
    rm *.apk
    cd ..
    rmdir $1
    
    return
}

# Install defined packages
for i in ${other_services[@]}; do
    #copy_apk $i
    copy_apk com.loudtalks
done
