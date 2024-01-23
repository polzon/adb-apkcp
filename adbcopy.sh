#!/usr/bin/env bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

# All packages relating to google services
google_services=( \
    com.google.android.gsf \
    com.google.android.gms \
    com.android.vending \
)

# Pulls the package's apk from the device to the local folder
pull_apk() {
    for i in $@; do
        apk_path=$(adb shell pm path $i | cut -f 2 -d ":")
        for j in $apk_path; do
            # will figure out how to do this tomorrow lol
            echo $j | grep -e '(?<=split_).+?(?=.apk)'
        done
    done;
    #adb pull $path "$1.apk"
}

pull_apk ${google_services[*]}
